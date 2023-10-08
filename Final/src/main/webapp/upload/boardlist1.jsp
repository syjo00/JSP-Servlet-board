<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.boardDTO" %>
<%@ page import = "kr.co.oraclejava.boardDAO" %>    
<%@ page import = "java.util.Vector" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 보기</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8"); 

	int pageSize = 10;

	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){  //처음이면 첫페이지로 설정
		pageNum = "1";
	}

	int count = 0; //전체글의 갯수 저장 변수
	int number = 0;// 페이지 넘버링 변수

	//현재 페이지
	int currentPage = Integer.parseInt(pageNum);

	boardDAO bdao = new boardDAO();
	count = bdao.getAllCount();// 112
	
	//현재 페이지에 보여줄 시작번호와 끝번호 설정
	int startRow = (currentPage - 1) * pageSize + 1;// (1 - 1) * 10 + 1 => 1 
	int endRow = currentPage * pageSize;// 1 * 10 => 10
	
	Vector<boardDTO> vec = bdao.selectBoard(startRow, endRow);
	
	//페이지 번호 표시
	number = count - (currentPage - 1) * pageSize;// 112 - (1 - 1) * 10 => 112
	
%>
<h2 align="center">게시판 글 목록 보기 화면</h2>
	<hr>
	<table border="1" width="1200" align="center" bgcolor="skyblue">
			<tr height="40" align="center">
				<td colspan="9">
					<button type="button" onclick="location.href='boardwriteForm.jsp'">글쓰기</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='sessionMain.jsp'">main으로가기</button>&nbsp;&nbsp;									
				</td>	
			</tr>	
			<tr height="40" align="center" background="ff0000">
				<td width="50">번호</td>
				<td width="70">제목</td>
				<td width="80">작성자</td>
				<td width="70">전자우편</td>
				<td width="120">작성일자</td>
				<td width="70">조회수</td>
				<td width="350">글내용</td>
			</tr>
			<%  
				 for(int i=0; i < vec.size(); i++){
						boardDTO bDto = vec.get(i);											 
			 %>						
			 
			 <%-- 댓글 쓰기에 대한 들여쓰기 처리부분. --%>
			<tr height="40" align="center">
				<td><%= number-- %>
				<td align="left" width="150">
					<a href="boardDetail.jsp?num=<%=bDto.getNum() %>" style="text-decoration: none">
					
					<%
						if(bDto.getRe_step() > 1){
							for(int j=0; j < (bDto.getRe_step() - 1) * 3; j++){
					%>&nbsp;
					<%			
							}
						}					
					%>
					<%=bDto.getSubject() %>
					</a>
				</td>
				<td><%=bDto.getWriter() %></td>
				<td><%=bDto.getEmail() %></td>
				<td><%=bDto.getReg_date() %></td>
				<td><%=bDto.getReadCount() %></td>
				<td><%=bDto.getContent() %></td>	
			</tr>
			<%
				 } 
			%>			
		</table>
	<p align="center">
		<%
			if(count > 0){
				//전체 pageCount  112 / 10 + (112%10) => 11 + 1 => 12
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0:1);
				
				int startPage = 1;
				
				if(currentPage % 10 != 0){
					startPage = (currentPage / 10) * 10 + 1;// 11
				}else {
					startPage = ((currentPage / 10) - 1) * 10 + 1;// 1 => [10]을 누르면 [11][12]...이렇게 나오는 현상을 방지
				}
				
				//한 페이지당 표시 할 번호수
				int pageBlock = 10; 
				
				//화면에 보여줄 마지막 페이지 숫자
				int endPage = startPage + pageBlock - 1; // 1 + 10 - 1 => 10, 11 + 10 - 1 => 20.... 
		
				//이전 페이지 링크 작성
				if(endPage > pageCount) {
						endPage = pageCount;
				}
		
				if(startPage > 10){
	%>	
					<a href="boardlist.jsp?pageNum=<%=startPage - 10%>">[이전 페이지]</a>
				<%
					}
				
					for(int i=startPage; i <= endPage; i++){
				%>
					<left><a href="boardlist.jsp?pageNum=<%=i %>">[<%= i %>]</a></left>
				<%
					} 
					
					//다음 페이지로 이동
					if(endPage < pageCount){
				%>
					<a href="boardlist.jsp?pageNum=<%=startPage + 10 %>">[다음 페이지]</a>	
				<%
						}
					}					
				%>		
	</p>	
		
</body>
</html>