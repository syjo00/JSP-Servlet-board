<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지 화면 구성</title>
</head>
<body style="text-align: center;">
	<h2>회원가입 페이지</h2>
	<form method="post" action="memberJoinPro.jsp">
		<table border="1" width="800" align="center" bgcolor="00ff89">
			<tr height="40" align="center">
				<th width="250">아이디</th>
				  <td><input type="text" name="id" size="70" placeholder="ID input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="250">패스워드</th>
				  <td><input type="password" name="passwd1" size="70" placeholder="passwd1 input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="250">패스워드확인</th>
				  <td><input type="password" name="passwd2" size="70" placeholder="passwd2 input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="250">이름</th>
				  <td><input type="text" name="name" size="70" placeholder="name input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="250">전자우편</th>
				  <td><input type="email" name="email" size="70" placeholder="email input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="250">전화번호</th>
				  <td><input type="text" name="phone" size="70" placeholder="telephone input"></td>
			</tr>
			<tr height="40" align="center">
				<th width="250">취미</th>
					<td width="550">
						<input type="checkbox" name="hobby" value="등산"/>등산
						<input type="checkbox" name="hobby" value="영화"/>영화
						<input type="checkbox" name="hobby" value="게임"/>게임
						<input type="checkbox" name="hobby" value="산책"/>산책
						<input type="checkbox" name="hobby" value="웹툰"/>웹툰
						<input type="checkbox" name="hobby" value="투자"/>투자
					</td>
			</tr>
			<tr height="40" align="center">
				<th width="250">직업</th>
					<td width="550">
						<select name="job">
							<option value="교수">교수</option>
							<option value="공무원">공무원</option>
							<option value="프로그래머">프로그래머</option>
							<option value="운동선수">운동선수</option>
							<option value="자영업">자영업</option>
							<option value="서비스">서비스</option>						
						</select>						
					</td>
			</tr>
			<tr height="40" align="center">
				<td width="250">연령대</td>
				<td width="550">
					<input type="radio" name="age" value="10"/>10대
					<input type="radio" name="age" value="20"/>20대
					<input type="radio" name="age" value="30"/>30대
					<input type="radio" name="age" value="40"/>40대
					<input type="radio" name="age" value="50"/>50대
					<input type="radio" name="age" value="60"/>60대	
					<input type="radio" name="age" value="70"/>70대			
				</td>	
			</tr>
			<tr height="40" align="center">
				<td width="250">기타사항</td>
				<td width="550">
					<textarea rows="7" cols="70" name="info"></textarea>
				</td>
			</tr>
			</tr>
			<tr height="40" align="center">
				<td colspan="2">
					<input type="submit" value="회원가입"/>&nbsp;&nbsp;
					<input type="reset" value="가입취소"/>&nbsp;&nbsp;		
					<button type="button" onclick="location.href='memberlist.jsp'">회원목록</button>			
				</td>	
			</tr>	
		</table>	
	</form>
</body>
</html>