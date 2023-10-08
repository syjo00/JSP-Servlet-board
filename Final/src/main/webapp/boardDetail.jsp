<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.co.oraclejava.boardDTO" %>
<%@ page import = "kr.co.oraclejava.boardDAO" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	boardDAO bdao = new boardDAO();
	
	//data select 
	boardDTO bDto = bdao.OneSelectBoard(num);
%>
<h2 align="center">게시글 정보 상세보기</h2> 
	<div align="center">
		<table border="1" style="width: 800px; text-align:center; bgcolor: pink;">
			<tr style="height:60px; text-align: center;">
				<th width="150" style="background: yellow;">번호</th>
					<td width="650"><%=bDto.getNum() %></td>
				<th width="150" style="background: red;">조회수</th>
					<td width="650"><%=bDto.getReadCount() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">작성자</th>
					<td><%=bDto.getWriter() %></td>
				<th width="150">전자우편</th>
				 	<td><%=bDto.getEmail() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">작성일자</th>
					<td><%=bDto.getReg_date() %></td>			
				<th width="150">제목</th>
					<td><%=bDto.getSubject() %></td>
			</tr>
			<tr height="60" align="center">
				<th width="150">글 내용</th>
					<td colspan="3"><%=bDto.getContent() %></td>
			</tr>			
			<tr height="60" align="center">
				<td colspan="4">
					<button type="button" onclick="location.href='boardRewriteForm.jsp?num=<%=bDto.getNum()%>&ref=<%=bDto.getRef()%>&re_step=<%=bDto.getRe_step()%>&re_level=<%=bDto.getRe_level()%>'">댓글쓰기</button>&nbsp;&nbsp;	
					<button type="button" onclick="location.href='memberJoinForm.jsp'">회원가입</button>&nbsp;&nbsp;
					<button type="button" onclick="location.href='memberlist.jsp'">회원목록</button>&nbsp;&nbsp;	
					<button type="button" onclick="location.href='boardlist.jsp'">게시판목록</button>&nbsp;&nbsp;	
					<button type="button" onclick="location.href='boardUpdateForm.jsp?num=<%=bDto.getNum()%>'">게시글수정</button>&nbsp;&nbsp;	
					<button type="button" onclick="location.href='boardDeleteForm.jsp?num=<%=bDto.getNum()%>'">게시글삭제</button>&nbsp;&nbsp;			
				</td>	
			</tr>	
		</table>
	</div>
</body>
</html>