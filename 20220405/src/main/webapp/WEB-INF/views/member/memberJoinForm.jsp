<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
th {
 text-align: right;
 font-weight: normal;
}
</style>
<body>
<div align="center">
	<div><h3>회원가입</h3></div>
	<div>
		<form id="frm" action="memberJoin.do" method="POST">
			<div>
				<table>
					<tr>
						<th width="200">아이디</th>
						<td width="250">
							<input type="email" id="id" name="id">
							<span> <button type="button" onclick="idCheck()">중복체크</button></span>
						</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" id="password" name="password">
						</td>
					</tr>
					<tr>
						<th> 패스워드 확인</th>
						<td>
							<input type="password" id="pwd" name="pwd">
						</td>
					</tr>
					<tr>
						<th> 이  름</th>
						<td>
							<input type="text" id="name" name="name">
						</td>
					</tr>
					<tr>
						<th> 주  소</th>
						<td width="200">
							<input type="text" id="address" name="address">
						</td>
					</tr>
					<tr>
						<th> 전화번호</th>
						<td>
							<input type="text" id="tel" name="tel">
						</td>
					</tr>
				</table>
			</div><br>
			<div>
				<input type="submit" value="회원가입">&nbsp;&nbsp;
				<input type="reset" value="취소">&nbsp;&nbsp;
				<input type="button" value="홈 가기" onclick="location.href='home.do'">
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	function idCheck() {
	
		var id = frm.id.value;
		var data = 'id='+id;
		var url = "ajaxIdCheck.do?id="+id;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(this.readyState == 4 && this.status == 200) {
				if(this.responseText == 'Yes') {
					idCheckSuccess();
				} else {
					idCheckFail();
				}
			}			
		};
		xhr.open('GET', url);
		xhr.send(data);
	}
	
	function idCheckSuccess() {
		alert("이미 사용 중인 아이디입니다.");
		frm.id.focus();
	}
	
	function idCheckFail() {
		alert("사용 가능한 아이디입니다.");
		frm.password.focus();
	}
		
	
	
		/* fetch(url, {
			method : 'POST',
			headers : {
			//	'Content-Type' : 'application/json', json type data 전송
				'Content-Type' : 'application/x-www-form-urlencoded',
			},
			body : 'id='+id
		})
			.then(response => response.text())
			.then(text => alert(text)) */
		
		
		/* const id = frm.id.value;
		var data = new FormData();
		data.append('id', frm.id.value);
		
		const xhttp = new XMLHttpRequest(); //ajax 객체 생성
		xhttp.onreadystatechange = function() { //callback함수. ajax 처리가 성공했을 때 처리하는 함수.
			if(this.readyState == 4 && this.status == 200) {
				alert(this.responseText);
			}
		}
		xhttp.open("POST", "ajaxIdCheck.do", true);
		xhttp.send(data); //<- ajax를 수행하라는 명령어 */
		
	
</script>
</body>
</html>