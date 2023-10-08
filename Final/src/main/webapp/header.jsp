<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	if(id == null){
		id = "GUEST";
	}
%>
<table bordercolor="green" alifn="center" width="1200">
	<tr height="150" align="center">
		<td>
			<img src="./images/oraclejavalogo.PNG" height="60" alt="오라클자바로고">
		</td>
		<td colspan="3" align="center">
			<font size="18">오라클자바 교육학원</font>
		</td>
		<td align="center" width="200">
	<%
		if(id.equals("GUEST")){
	%>		
		<button onclick="location.href='sessionMain.jsp?center=sessionloginForm.jsp'">로그인</button>	
	<%
		}else {	
	%>		
		<b><%= id %></b>님이 반갑습니다.
		<form action="sessionlogout.jsp">
			<input type="submit" value="로그아웃">
		</form>	
	<%
		}
	%>
		</td>
	</tr>
	<%-- header상의 메뉴 나열하기 --%>
	<tr height="50">
		<td align="center" bgcolor="green" width="400">
			<font><a href="sessionMain.jsp?center=tent.jsp">tent</a>
		</font>
		<td align="center" bgcolor="green" width="400">
			<font><a href="sessionMain.jsp?center=sleep.jsp">sleep</a>
		</font>
		<td align="center" bgcolor="green" width="400">
			<font><a href="sessionMain.jsp?center=chair.jsp">chair</a>
		</font>
		<td align="center" bgcolor="green" width="400">
			<font><a href="sessionMain.jsp?center=table.jsp">table</a>
		</font>
		<td align="center" bgcolor="green" width="400">
			<font><a href="sessionMain.jsp?center=buner.jsp">buner</a>
		</font>
	</tr>	
	
</table>
</body>
</html>