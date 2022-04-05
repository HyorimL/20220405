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
<h4>${message }</h4><br>
세션값 = ${name }, ${author }, ${id } 
<br>
<br>
<input type="button" value="LOGOUT" onclick="location.href='memberLogout.do'">
<input type="button" value="HOME" onclick="location.href='home.do'">
</div>
</body>
</html>