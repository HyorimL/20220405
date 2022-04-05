<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<div><h3>회원가입</h3></div>
	<div>
		<form id="frm" action="memberLogin.do" method="post">
			<div>
				<table>
					<tr>
						<th width="150">아이디</th>
						<td width="200">
							<input type="text" id="id" name="id" required="required">
						</td>
					</tr>
					<tr>
						<th width="150">패스워드</th>
						<td width="200">
							<input type="password" id="password" name="password" required="required">
						</td>
					</tr>
				</table>
			</div><br>
			<div>
				<input type="submit" value="로그인">&nbsp;&nbsp;
				<input type="reset" value="취 소">
			</div>
		</form>
	</div>
</div>
</body>
</html>