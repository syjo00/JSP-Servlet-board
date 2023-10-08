<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.memberDAO" %>    
<%@ page import = "kr.co.oraclejava.memberDTO" %>  
<%@ page import = "java.util.Vector" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
<%
	memberDAO mdao = new memberDAO();

	Vector<memberDTO> vec = mdao.allSelectMember();

%>
<h2 align="center">회원정보 목록 보기 화면</h2>
	<hr>
	<table border="1" width="1200" align="center" bgcolor="00ff89">
			<tr height="40" align="center" background="ff0000">
				<td width="70">아이디</td>
				<td width="70">이&nbsp;&nbsp;&nbsp;름</td>
				<td width="80">전자우편</td>
				<td width="70">전화번호</td>
				<td width="120">취&nbsp;&nbsp;&nbsp;미</td>
				<td width="70">직&nbsp;&nbsp;&nbsp;업</td>
				<td width="70">연령대</td>
				<td>기타사항</td>
				<td width="100">가입날짜</td>  
			</tr>
			<%  
				 for(int i=0; i < vec.size(); i++){
						memberDTO mDto = vec.get(i);											 
			 %>						
			<tr height="40" align="center">
				<td><a href="memberDetail.jsp?id=<%=mDto.getId() %>"><%=mDto.getId() %></a></td>
				<td><%=mDto.getName() %></td>
				<td><%=mDto.getEmail() %></td>
				<td><%=mDto.getPhone() %></td>
				<td><%=mDto.getHobby() %></td>
				<td><%=mDto.getJob() %></td>
				<td><%=mDto.getAge() %></td>	
				<td><%=mDto.getInfo() %></td>
				<td><%=mDto.getReg_date() %></td>
			</tr>
			<%
				 } 
			%>
			<tr height="40" align="center">
				<td colspan="9">
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='sessionMain.jsp'">main으로가기</button>&nbsp;&nbsp;									
				</td>	
			</tr>	
		</table>
</body>
</html>