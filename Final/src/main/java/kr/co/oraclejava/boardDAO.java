package kr.co.oraclejava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;

	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, "hyun2", "1234");
			System.out.println("DB 연동에 성공 했습니다.~");

			//Context initctx = new InitialContext();
			//DataSource ds  = (DataSource) initctx.lookup("java:comp/env/jdbc/oraclDB");
			//conn = ds.getconnection();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동에 실패 했습니다.~");
		}
		return conn;
	}

	// 게시글 데이터 입력
	public void insertBoard(boardDTO bDto) {
		
		try { 
				getConnection();
			
				int ref = 0;
				int re_step = 1;
				int re_level = 1;
				
				String sql = "select max(ref) from smartBoard";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					ref = rs.getInt(1) + 1;// ref = 1;
				}
				
				//                                         smartBoard_seq.nextval,
			String sql2  = "insert into smartBoard values((select nvl(max(num), 0) + 1 from smartBoard), "
					+ "?, ?, ?, ?, sysdate, ?, ?, ?, 0, ?)";
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, bDto.getWriter()); 			
			pstmt.setString(2, bDto.getEmail());
			pstmt.setString(3, bDto.getSubject());
			pstmt.setString(4, bDto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bDto.getContent());
					
			pstmt.execute();
			System.out.println("smartBoard 테이블에 잘 저장되었습니다.");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("smartBoard 테이블에 저장을 실패하였습니다.");
		}finally{
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}
		}
		
	
	}
		
	//모든 글 내용 목록 반환하기: getter method
		public Vector<boardDTO> selectBoard() {			
			
			Vector<boardDTO> v = new Vector<>();			
						
			try {
				getConnection();
				
				String sql  = "select * from smartBoard order by ref desc, re_step asc, num desc";
				pstmt = conn.prepareStatement(sql);				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {		
					boardDTO bdto = new boardDTO();
					
					bdto.setNum(rs.getInt("num"));// 1
					bdto.setWriter(rs.getString(2)); // 
					bdto.setEmail(rs.getString(3)); 
					bdto.setSubject(rs.getString(4)); 
					bdto.setPassword(rs.getString(5)); 
					bdto.setReg_date(rs.getString(6)); 
					bdto.setRef(rs.getInt(7));
					bdto.setRe_step(rs.getInt(8));
					bdto.setRe_level(rs.getInt(9));  
					bdto.setReadCount(rs.getInt(10));
					bdto.setContent(rs.getString(11)); 
					
					v.add(bdto);
				}				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null){
					try {
						rs.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(pstmt != null){
					try {
						pstmt.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
					
				}				
				
			}
				
		return v;
	}
		
		
	// num에 해당하는 정보를 반환하는 메소드 호출.
		public boardDTO OneSelectBoard(int num) {
			
			boardDTO bDto = new boardDTO();
			
		try {
			getConnection();
			
			String sql = "update smartBoard set readCount = readCount + 1 where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);			 
			pstmt.execute();
			
			String sql2 = "select * from smartBoard where num = ?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, num);
			 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bDto.setNum(rs.getInt(1));// num
				bDto.setWriter(rs.getString(2));
				bDto.setEmail(rs.getString(3));
				bDto.setSubject(rs.getString(4));  
			//  bDto.setPassword(rs.getString(5)); 생략되었음.	
				bDto.setReg_date(rs.getString(6)); 
				bDto.setRef(rs.getInt(7));
				bDto.setRe_step(rs.getInt(8));
				bDto.setRe_level(rs.getInt(9));
				bDto.setReadCount(rs.getInt(10));
				bDto.setContent(rs.getString(11));  
							
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
				
			}				
					
		}			
			return bDto;
		}

	// 해당 num에 대한 댓글 쓰기 구현
		public void rewriteBoard(boardDTO bDto) {
			
			try {
				getConnection();
				
				int ref = bDto.getRef();// 1
				int re_step = bDto.getRe_step();// 1
				int re_level = bDto.getRe_level();// 1
				
				//기존 참조한 글보다 더 큰 값을 줍니다.
				String sql = "update smartBoard set re_level = re_level + 1 where ref = ? and re_level > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref); 
				pstmt.setInt(2, re_level); 
				
				pstmt.execute();
				
				String sql2  = "insert into smartBoard values((select nvl(max(num), 0) + 1 from smartBoard), "
						+ "?, ?, ?, ?, sysdate, ?, ?, ?, 0, ?)";
				
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setString(1, bDto.getWriter()); 			
				pstmt.setString(2, bDto.getEmail());
				pstmt.setString(3, bDto.getSubject());
				pstmt.setString(4, bDto.getPassword());
				pstmt.setInt(5, ref);
				pstmt.setInt(6, re_step + 1);
				pstmt.setInt(7, re_level + 1);
				pstmt.setString(8, bDto.getContent());
						
				pstmt.execute();
				System.out.println("smartBoard 테이블에 댓글이 잘 저장되었습니다.");			
				
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("smartBoard 테이블에 댓글이 잘못되었습니다.");	
			}finally {
				if(pstmt != null){
					try {
						pstmt.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
					
				}		
			}
						
		}
			
	// num에 해당하는 패스워드를 반환해주는 메소드 호출
		public String getPassword(int num){
			String password = null;
			
			try {
				getConnection();		
				
				String sql = "select password from smartBoard where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					password = rs.getString(1);
				}				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null){
					try {
						rs.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(pstmt != null){
					try {
						pstmt.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}					
				}				
			}
			return password;
		}
	 		
		
		// 해당 num에 대한 게시판을 수정하기 위하여 데이터를 불러오기 
		public boardDTO getUpdateBoard(int num){
			
			boardDTO bDto = new boardDTO();
			
			try {
				getConnection();
				
				String sql  = "select * from smartBoard where num = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num); 
				
				rs = pstmt.executeQuery();
							
				if(rs.next()) {
					
					bDto.setNum(rs.getInt(1));// num
					bDto.setWriter(rs.getString(2));
					bDto.setEmail(rs.getString(3));
					bDto.setSubject(rs.getString(4));  
				    bDto.setPassword(rs.getString(5)); 	
					bDto.setReg_date(rs.getString(6)); 
					bDto.setRef(rs.getInt(7));
					bDto.setRe_step(rs.getInt(8));
					bDto.setRe_level(rs.getInt(9));
					bDto.setReadCount(rs.getInt(10));
					bDto.setContent(rs.getString(11));  													
				}
							
			}catch(Exception e) {
				e.printStackTrace();
			}finally { 
				if(rs != null){
			}
				try {
					rs.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {					
					e.printStackTrace();
				}		
				
			}		
			return bDto;
		}
		
		// num에 해당하는 정보 수정하는 메소드 호출
		public void UpdateBoard(boardDTO bDto) {
			
			try { 
				getConnection();
				
				String sql = "update smartBoard set subject = ?, email = ?, content = ? where num = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, bDto.getSubject());
				pstmt.setString(2, bDto.getEmail());
				pstmt.setString(3, bDto.getContent());
				pstmt.setInt(4, bDto.getNum());
				
				pstmt.execute();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null){
					try {
						pstmt.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}		
					
				}		
				
			}
						
		}
		
	// num에 해당하는 내용을 삭제하려고 DB 내용을 호출(번호, 작성자, 주제, 패스워드, 가입날짜)
		public boardDTO getDeleteBoard(int num) {
			
			boardDTO bDto = new boardDTO();
			
			try {
				getConnection();
				
				String sql = "select * from smartBoard where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					bDto.setNum(rs.getInt("num"));// 1
					bDto.setWriter(rs.getString("writer"));// 2
					bDto.setSubject(rs.getString("subject"));// 4
					bDto.setPassword(rs.getString("password"));// 5	
					bDto.setReg_date(rs.getString("reg_date"));// 6
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null){
				}
					try {
						rs.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(pstmt != null){
					try {
						pstmt.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}	
				}					
			return bDto;
		}
			
	// num에 해당하는 뎅이터 삭제 메소드 호출
	//public void DeleteBoard(boardDTO bDto){
		public void DeleteBoard(int num){
			
			try {
				getConnection();
				
				String sql = "delete from smartBoard where num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				pstmt.execute();
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null){
					try {
						pstmt.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}					
				}		
			}		
		}
		
		// 전체 글의 갯수를 구하여 반환하기
			public int getAllCount() {
				int count = 0;
				
				try {
						getConnection();
						
						String sql = "select count(*) from smartBoard";
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							count = rs.getInt(1);
						}
						System.out.println("글의 갯수 연산이 잘 처리되었습니다.~");
						System.out.println(count);
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						if(rs != null){						
							try {
								rs.close();
								} catch (SQLException e) {					
									e.printStackTrace();
						}
					}
					if(pstmt != null){
						try {
							pstmt.close();
						} catch (SQLException e) {					
							e.printStackTrace();
						}
					}
					if(conn != null){
						try {
							conn.close();
						} catch (SQLException e) {					
							e.printStackTrace();
						}	
					}	
					}
				return count;
				
			}
		
		// 페이지 시작번호로부터 끝번호까지 해당되는 목록을 반환
		public Vector<boardDTO> selectBoard(int startRow, int endRow) {
			
			Vector<boardDTO>  vec = new Vector<boardDTO>();
				
			try {
				getConnection();
				
				// 페이징을 구현하려면 Rownum을 사용하는데, 이는 쿼리 결과가 나오게 되는 각각의 행들에 대한 순서값으로서, 
				// 주로 특정 갯수의 그 이하의 행을 선택할 때 사용합니다.
				// 이때, rowid가 있는데 테이블에 저장된 각각의 행들이 저장된 주소 값을 말합니다. 즉, 각 행들의 고유 주소값입니다.
				String sql = "select * from (select A.*, Rownum Rnum from (select * from smartBoard order by ref desc, re_step asc)A) "
						+ "where rnum >= ? and rnum <= ?"; 
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					boardDTO bDto = new boardDTO();
					
					bDto.setNum(rs.getInt(1));// num
					bDto.setWriter(rs.getString(2));
					bDto.setEmail(rs.getString(3));
					bDto.setSubject(rs.getString(4));  
				    bDto.setPassword(rs.getString(5)); 	
					bDto.setReg_date(rs.getString(6)); 
					bDto.setRef(rs.getInt(7));
					bDto.setRe_step(rs.getInt(8));
					bDto.setRe_level(rs.getInt(9));
					bDto.setReadCount(rs.getInt(10));
					bDto.setContent(rs.getString(11));  
					
					vec.add(bDto);					
				}
				System.out.println("startRow와 endRow 처리가 잘 되었습니다.");				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null){
					try {
						rs.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(pstmt != null){
					try {
						pstmt.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}
				}
				if(conn != null){
					try {
						conn.close();
					} catch (SQLException e) {					
						e.printStackTrace();
					}	
				}		
				
			}
			return vec;
		}
			
		//
		
		
		
}







