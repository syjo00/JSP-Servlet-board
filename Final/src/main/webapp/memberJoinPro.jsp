<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%@ page import = "kr.co.oraclejava.memberDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 구현</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="mDto" class="kr.co.oraclejava.memberDTO">
	<jsp:setProperty name="mDto" property="*"/>
</jsp:useBean>

<%
	String hobby[] = request.getParameterValues("hobby");
	String texthobby  = "";
	
	for(int i=0; i < hobby.length; i++){
		texthobby += hobby[i] + " ";
	}

	mDto.setHobby(texthobby);

	Timestamp reg_date = new Timestamp(System.currentTimeMillis());
	mDto.setReg_date(reg_date);
	
	//data input function
	memberDAO mdao = new memberDAO();
	mdao.insertMember(mDto);
	
	//data select
	response.sendRedirect("memberlist.jsp");
%>	
</body>
</html>