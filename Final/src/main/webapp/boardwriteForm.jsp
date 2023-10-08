<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 화면 구성</title>
</head>
<body style="text-align: center;">
	<h2>게시판 글쓰기 페이지</h2>
	<form method="post" action="boardwritePro.jsp">
		<table border="1" width="800" align="center" bgcolor="00ff89">
			<tr height="40" align="center">
				<th width="150">작성자</th>
				  <td><input type="text" name="writer" size="80" placeholder="writer input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="150">전자우편</th>
				  <td><input type="email" name="email" size="80" placeholder="hong@hong.com input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="150">주제</th>
				  <td><input type="text" name="subject" size="80" placeholder="subject input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="150">패스워드</th>
				  <td><input type="password" name="password" size="80" placeholder="password input"></td>
			</tr>			
			<tr height="40" align="center">
				<th width="150">글 내용</th>
				  <td><textarea cols="80" rows="6" name="content" placeholder="content input"></textarea></td>
			</tr>
			<tr height="40" align="center">
				<td colspan="2">
					<input type="submit" value="글쓰기"/>&nbsp;&nbsp;
					<input type="reset" value="쓰기취소"/>&nbsp;&nbsp;		
					<button type="button" onclick="location.href='boardlist.jsp'">글목록보기</button>			
				</td>	
			</tr>	
		</table>	
	</form>
</body>
</html>