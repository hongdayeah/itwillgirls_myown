<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLoginForm.jsp</title>
</head>
<body>
	<h3>* 로 그 인 *</h3>

	<form name="memberLoginfrm" id="memberLoginfrm" method="post" action="login">
		<div>
			<input type="text" name="id" id="id" placeholder="아이디" autofocus required>
		</div>
		<div>
			<input type="text" name="passwd" id="passwd" placeholder="비밀번호" required>
		</div>
		<div>
		<div>
			<label><input type="checkbox" name="save" id="save" value="SAVE">ID저장</label>
			&nbsp;&nbsp;
			<input type="submit" value="로그인">
	</div>
	</form>
	
	<button type="button" class="btn btn-warning" onclick="location.href='/member/join'">회원가입</button>
	<button type="button" class="btn btn-info" onclick="">아이디/비밀번호 찾기</button>
	
</body>
</html>