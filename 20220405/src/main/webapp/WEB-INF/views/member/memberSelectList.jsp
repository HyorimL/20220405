<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">

	<div>
		<table>
			<thead>
				<tr>
					<th width="150">ID</th>
					<th width="150">NAME</th>
					<th width="250">ADDRESS</th>
					<th width="150">PHON NUMBER</th>
					<th width="150">AUTHOR</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members }" var="m">
					<tr>
						<td>${m.id }</td>
						<td>${m.name }</td>
						<td>${m.address }</td>
						<td>${m.tel }</td>
						<td>${m.author }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><br>
	<div>
		<button onclick="location.href='home.do'">home</button>
	</div>

</div>
</body>
</html>