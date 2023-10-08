<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.memberDAO" %>    
<%@ page import = "kr.co.oraclejava.memberDTO" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 상세보기</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	memberDAO mdao = new memberDAO();
	memberDTO mDto = mdao.idSelectMember(id);
%>
	<h2 align="center">회원 정보 상세보기 화면</h2> 
	<div align="center">
		<table border="1" style="width: 800px; text-align:center; bgcolor:00ff89;">
			<tr style="height:60px; text-align: center; background: pink">
				<th width="150">아이디</th>
				<td><%=mDto.getId() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">이름</th>
				<td><%=mDto.getName() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">전자우편</th>
				  <td><%=mDto.getEmail() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">전화번호</th>
				<td><%=mDto.getPhone() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">취미</th>
					<td><%=mDto.getHobby() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">직업</th>
					<td><%=mDto.getJob() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">연령대</th>
				<td><%=mDto.getAge() %></td>	
			</tr>
			<tr height="60" align="center">
				<th width="150">기타사항</th>
				<td><%=mDto.getInfo() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">가입일자</th>
				<td><%=mDto.getReg_date() %></td>
			</tr>
			<tr height="60" align="center">
				<td colspan="2">
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberlist.jsp'">회원목록</button>&nbsp;&nbsp;	
					<button type="button" onclick="location.href='memberUpdateForm.jsp?id=<%=mDto.getId()%>'">정보수정</button>&nbsp;&nbsp;	
					<button type="button" onclick="location.href='memberDeleteForm.jsp?id=<%=mDto.getId()%>'">정보삭제</button>&nbsp;&nbsp;			
				</td>	
			</tr>	
		</table>
	</div>
</body>
</html>