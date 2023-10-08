<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 댓글 쓰기 입력 화면</title>
</head>
<body>
<%
	int num  = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = 	Integer.parseInt(request.getParameter("re_level"));
%>
<div align="center">
	<h2 style="text-align: center;">게시판 댓글쓰기 페이지</h2>
	<form method="post" action="boardRewritePro.jsp">
		<table border="1" style="width: 800px; text-align: center;">
			<tr style="height: 50px; background: yellow;">
			<td width="120">제목</td>
				<td><input type="text" name="subject" size="30" value=[Reply]:></td>	
				<td width="100">작성자</td>
				<td><input type="text" name="writer" size="30"></td>							
			</tr>	
			<tr style="height: 50px; background: yellow;">
				<td width="100">전자우편</td>
				<td><input type="text" name="email" size="30"></td>				
				<td width="120">비밀번호</td>
				<td><input type="password" name="password" size="30"></td>			
			</tr>
			<tr style="height: 50px; background: yellow;">
				<td width="100">내용</td>
				<td colspan="3">
					<textarea rows="5" cols="90" name="content"></textarea></td>						
			</tr>
			<tr height="50" align="center">
				<td colspan="4">
					<input type="hidden" name="ref" value="<%=ref %>">
					<input type="hidden" name="re_step" value="<%=re_step %>">
					<input type="hidden" name="re_level" value="<%=re_level %>">					
					<input type="submit" value="댓글쓰기"/>&nbsp;&nbsp;
					<input type="reset" value="댓글취소"/>&nbsp;&nbsp;		
					<button type="button" onclick="location.href='boardlist.jsp'">글목록보기</button>	
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>				
				</td>	
			</tr>	
		</table>	
	</form>
</div>
</body>
</html>