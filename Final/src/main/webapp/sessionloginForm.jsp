<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session login form</title>
</head>
<style>
	input[type=text]:focus {
		font-size: 130%;
		background: skyblue;
	}

	input:hover {
		background: yellow;
	}
</style>
<body>
	<h2 align="center">회원 로그인 페이지 화면 </h2>
	<form action="sessionloginPro.jsp" method="post" align="center"> 
	 	<table border="1" align="center" width="400">
	 		<tr height="40" algin="center">
	 			<td>아이디(ID)</td>
	 			<td><input type="text" name="id" size="40" required="required"> </td>
	 		</tr>
	 		<tr height="40" algin="center">
	 			<td>패스워드(PW)</td>
	 			<td><input type="password" name="passwd" size="40" required="required"> </td>
	 		</tr>
	 		<tr height="40" algin="center">
	 			<td colspan="2">
	 				<input type="submit" value="login">&nbsp;&nbsp;
	 				<input type="reset" value="cancel">&nbsp;&nbsp;
	 				<input type="button" value="회원가입" onclick="location.href='memberJoinForm.jsp'">
	 			</td>
	 		</tr>
	 	</table>	
	</form>

</body>
</html>