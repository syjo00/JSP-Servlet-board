<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.memberDAO" %>    
<%@ page import = "kr.co.oraclejava.memberDTO" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session login 처리 - </title>
</head>
<body>
<% 	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="mDto" class="kr.co.oraclejava.memberDTO">
	<jsp:setProperty name="mDto" property="*"/>
</jsp:useBean>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
		
	//data input function
	memberDAO mdao = new memberDAO();
	String pass = mdao.getPassword(id);
		
	//사용자 비번인 password와 DB비번인 pass가 일치하면 
	if(pass.equals(password)){
		//mdao.memberUpdate(mDto);
		
		session.setAttribute("id", id);
		session.setAttribute("password", "password");
		
		//이동
		response.sendRedirect("sessionMain.jsp");
	}else {
%>			
	<script type="text/javascript">
		alert("패스워드가 틀립니다. 확인해 주세요.");
		history.back();	
	</script>		
<%		
	}	
%>	
</body>
</html>