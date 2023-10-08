<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 - </title>
</head>
<body>
<%
	String logout = request.getParameter("logout");

	if(logout != null){
		session.removeAttribute("id");
		session.invalidate();
		
		//response.sendRedirect("sessionloginForm.jsp");
	}
%>
<script type="text/javascript">
	alert("logout이 되었습니다.~");
	location.href="sessionloginForm.jsp";
</script>
</body>
</html>