<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.boardDTO" %>
<%@ page import = "kr.co.oraclejava.boardDAO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기 처리 - </title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

	<jsp:useBean id="bDto" class="kr.co.oraclejava.boardDTO">
		<jsp:setProperty name="bDto" property="*"/>
	</jsp:useBean>

<%
	boardDAO bdao = new boardDAO();
	bdao.insertBoard(bDto);

	response.sendRedirect("boardlist.jsp");

%>

</body>
</html>