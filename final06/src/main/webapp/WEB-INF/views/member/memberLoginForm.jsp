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
<form>
<table>
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="id" id="id" placeholder="아이디" autofocus required>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
			<input type="text" name="passwd" id="passwd" placeholder="비밀번호" required>
		</td>
	</tr>
	<tr>
		<label><input type="checkbox" name="save" id="save" value="SAVE">ID저장</label>
	</tr>
	
	<button type="button" class="btn btn-warning" onclick="location.href='memberJoinForm'">회원가입</button>
	<button type="button" class="btn btn-info" onclick="">아이디/비밀번호 찾기</button>
</table>
</form>


			
</body>
</html>