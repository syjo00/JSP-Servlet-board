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

public class memberDAO {

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

	// 데이터 입력
	public void insertMember(memberDTO mDto) {
		
		try { 
				getConnection();
			
			String sql  = "insert into camping_member values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getId()); 			
			pstmt.setString(2, mDto.getPasswd1());
			pstmt.setString(3, mDto.getName());
			pstmt.setString(4, mDto.getEmail());
			pstmt.setString(5, mDto.getPhone());
			pstmt.setString(6, mDto.getHobby());
			pstmt.setString(7, mDto.getJob());
			pstmt.setString(8, mDto.getAge());
			pstmt.setString(9, mDto.getInfo());
			pstmt.setTimestamp(10, mDto.getReg_date());
			
			pstmt.execute();
			System.out.println("DB에 잘 저장되었습니다.");
			
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("DB에 저장을 실패하였습니다.");
		}finally{
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
	
	//모든 회원정보 목록 반환하기: getter method
		public Vector<memberDTO> allSelectMember() {			
			Vector<memberDTO> v = new Vector<>();			
						
			try {
				getConnection();
				
				String sql  = "select * from camping_member";
				pstmt = conn.prepareStatement(sql);				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {		
					memberDTO mdto = new memberDTO();
					
					mdto.setId(rs.getString("id"));// 1
					mdto.setName(rs.getString("name")); // 4
					mdto.setEmail(rs.getString("email")); 
					mdto.setPhone(rs.getString("phone")); 
					mdto.setHobby(rs.getString("hobby")); 
					mdto.setJob(rs.getString("job")); 
					mdto.setAge(rs.getString("age"));
					mdto.setInfo(rs.getString("info"));
					mdto.setReg_date(rs.getTimestamp("reg_date"));  
				
					v.add(mdto);
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
		
	// id에 해당하는 정보를 반환하는 메소드 호출.
		public memberDTO idSelectMember(String id){
			
			memberDTO mDto = new memberDTO();
			
		try {
			getConnection();
			
			String sql = "select * from camping_member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			 
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mDto.setId(rs.getString(1));// id
				mDto.setPasswd1(rs.getString(2));
				mDto.setName(rs.getString(3));
				mDto.setEmail(rs.getString(4));  
				mDto.setPhone(rs.getString(5)); 
				mDto.setHobby(rs.getString(6));
				mDto.setJob(rs.getString(7));
				mDto.setAge(rs.getString(8));
				mDto.setInfo(rs.getString(9));
				mDto.setReg_date(rs.getTimestamp(10));  
							
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
			return mDto;
		}

	// id에 해당하는 패스워드를 반환해주는 메소드 호출
		public String getPassword(String id){
			String password = null;
			
			try {
				getConnection();				
				String sql = "select passwd1 from camping_member where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id); 				
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
			
	// 데이터 수정 
		public void memberUpdate(memberDTO mDto){
			
			try {
				getConnection();
				
				String sql  = "update camping_member set email = ?, phone = ?, hobby = ?, "
						+ "job = ?, age = ?, info = ?, reg_date = sysdate where id = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mDto.getEmail());
				pstmt.setString(2, mDto.getPhone()); 
				pstmt.setString(3, mDto.getHobby());
				pstmt.setString(4, mDto.getJob()); 
				pstmt.setString(5, mDto.getAge()); 
				pstmt.setString(6, mDto.getInfo()); 
				//pstmt.setTimestamp(7, mDto.getReg_date());   
				pstmt.setString(7, mDto.getId()); 
				
				pstmt.execute();
							
			}catch(Exception e) {
				e.printStackTrace();
			}if(rs != null){
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

	// id에 해당하는 뎅이터 삭제 메소드 호출
		public void memberDelete(String id){
			
			try {
				getConnection();
				
				String sql = "delete from camping_member where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
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
			
			//
			
			
			
		}
		
}
