<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.memberDAO" %>    
<%@ page import = "kr.co.oraclejava.memberDTO" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제화면</title>
</head>
<body>
	<h2 align="center">회원정보 수정 화면</h2>
<form action="memberDeletePro.jsp" method="post">
	<div align="center">
		<table border="1" style="width: 800px; text-align:center; bgcolor:00ff89;">
			<tr style="height:60px; text-align: center; background: skyblue;">
				<th width="150">아이디</th>
				  <td><%=request.getParameter("id") %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">패스워드</th>
				<td><input type="password" name="passwd" size="80"></td>
			</tr>
			<tr height="60" align="center">
				<td colspan="2">
					<input type="hidden" name="id" value="<%=request.getParameter("id")%>">&nbsp;&nbsp;	
					<input type="submit" value="회원정보삭제">&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberlist.jsp'">회원목록</button>&nbsp;&nbsp;						
				</td>	
			</tr>	
		</table>
	</div>
</form>	

</body>
</html>