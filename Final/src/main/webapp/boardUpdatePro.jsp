<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.boardDTO" %>
<%@ page import = "kr.co.oraclejava.boardDAO" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>

	<jsp:useBean id="bDto" class="kr.co.oraclejava.boardDTO">
		<jsp:setProperty name="bDto" property="*"/>
	</jsp:useBean>

<%
	String password = request.getParameter("password");

	boardDAO bdao = new boardDAO();
	String DBpass = bdao.getPassword(bDto.getNum()); 
	
	if(password.equals(DBpass)){
		bdao.UpdateBoard(bDto);
		
		response.sendRedirect("boardlist.jsp");
	}else {
%>		
	<script type="text/javascript">
		alert("패스워드가 틀립니다. 확인해 주세요.");
		history.go(-1);
	</script>		
	<%
		}
	%>		
</body>
</html>