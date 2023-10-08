<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.boardDTO" %>
<%@ page import = "kr.co.oraclejava.boardDAO" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제 처리 -</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int num = Integer.parseInt(request.getParameter("num"));

	boardDAO bdao = new boardDAO();
	boardDTO bDto = bdao.getDeleteBoard(num);
%>
<h2 align="center">게시글 정보 삭제하기</h2> 
	<div align="center">
	<form action="boardDeletePro.jsp" method="post">
		<table border="1" style="width: 800px; text-align:center; bgcolor: pink;">
			<tr style="height:60px; text-align: center;">
				<th width="300" style="background: yellow;">번호</th>
					<td width="500"><%=bDto.getNum() %></td>
					<th width="300">제목</th>
					<td width="500"><%=bDto.getSubject() %></td>	
			</tr>
			<tr height="60" align="center">
				<th width="300">작성자</th>
					<td width="500"><%=bDto.getWriter() %></td>
				<th width="300">작성일자</th>
					<td width="500"><%=bDto.getReg_date() %></td>				
			</tr>		
			<tr height="60" align="center">							
				<th width="400">패스워드</th>
					<td colspan="3">
						<input type="password" name="password" size="90"></td>	
			</tr>
			<tr height="60" align="center">
				<td colspan="4">
					<input type="hidden" name="num" value="<%=bDto.getNum() %>">
					<input type="submit" value="삭제하기">&nbsp;&nbsp;
					<input type="reset" value="삭제취소">&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberlist.jsp'">회원목록</button>&nbsp;&nbsp;		
					<button type="button" onclick="location.href='boardwriteForm.jsp'">게시글쓰기</button>&nbsp;&nbsp;	
					<button type="button" onclick="location.href='boardlist.jsp'">게시글목록</button>&nbsp;&nbsp;		
				</td>	
			</tr>	
		</table>
		</form>
	</div>
</body>
</html>