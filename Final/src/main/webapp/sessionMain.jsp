<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include - main.jsp </title>
</head>
<style>
	body {
		margin: 30px 30px 20px 250px;	
	}
</style>
<body>
<%
	try {
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			response.sendRedirect("sessionloginForm.jsp");			
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<%
	String center = request.getParameter("center");

	if(center == null){
		center = "Center.jsp";//로고를 표시할 예정.
	}
%>
<table border="1" style="align:center; width:1200;">
	<tr height="150" align="center">
		<td align="center" colspan="2">
			<jsp:include page="header.jsp"></jsp:include> 
		</td>
	</tr>
	<tr height="500">
		<td align="center" width="200">
			<jsp:include page="left.jsp"></jsp:include> 
		</td>
		<td align="center" width="1000">
			<jsp:include page="<%=center %>"></jsp:include> 
		</td>
	</tr>

	<tr height="150">
		<td align="center" colspan="2">
			<jsp:include page="footer.jsp"></jsp:include> 
		</td>
	</tr>

</table>
</body>
</html>