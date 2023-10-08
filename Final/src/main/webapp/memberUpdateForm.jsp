<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.memberDAO" %>    
<%@ page import = "kr.co.oraclejava.memberDTO" %>     
<%@ page import = "java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정화면</title>
</head>
<body>
<%
	String id = request.getParameter("id");

	memberDAO mdao = new memberDAO();
	memberDTO mDto = mdao.idSelectMember(id);
%>
	<h2 align="center">회원정보 수정 화면</h2>
<form action="memberUpdatePro.jsp" method="post">
	<div align="center">
		<table border="1" style="width: 800px; text-align:center; bgcolor:00ff89;">
			<tr style="height:60px; text-align: center; background: skyblue;">
				<th width="150">아이디</th>
				  <td><%=mDto.getId() %></td>
			</tr>
			<tr style="height:60px; text-align: center; background: pink">
				<th width="150">이름</th>
				  <td><%=mDto.getName() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">전자우편</th>
				  <td><input type="email" name="email" size="80" value="<%=mDto.getEmail() %>"></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">전화번호</th>
				<td><input type="text" name="phone" size="80" value="<%=mDto.getPhone() %>"></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">취미</th>
					<td><input type="text" name="hobby" size="80" value="<%=mDto.getHobby() %>"></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">직업</th>
					<td><input type="text" name="job" size="80" value="<%=mDto.getJob() %>"></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">연령대</th>
				<td><input type="text" name="age" size="80" value="<%=mDto.getAge() %>"></td>	
			</tr>
			<tr height="60" align="center">
				<th width="150">기타사항</th>
				<td><input type="text" name="info" size="80" value="<%=mDto.getInfo() %>"></td>
			</tr>
	<%
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		mDto.setReg_date(reg_date);
	%>					
			<tr height="60" align="center">
				<th width="150">수정일자</th>
				<td><%=mDto.getReg_date() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">패스워드</th>
				<td><input type="password" name="passwd" size="80"></td>
			</tr>
			<tr height="60" align="center">
				<td colspan="2">
					<input type="hidden" name="id" value="<%=mDto.getId()%>">&nbsp;&nbsp;	
					<input type="submit" value="회원정보수정">&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberlist.jsp'">회원목록</button>&nbsp;&nbsp;						
					<button type="button" onclick="location.href='memberDeleteForm.jsp?id=<%=mDto.getId()%>'">정보삭제</button>&nbsp;&nbsp;			
				</td>	
			</tr>	
		</table>
	</div>
</form>	

</body>
</html>