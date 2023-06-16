<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!--  jQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>

<script>
function login() {
	var memberId = $('#memberId').val();
	var memberPw = $('#memberPw').val();
	$.ajax({
		url : '/member/memberLoginForm',
		type : "post",
		data : {
			"p_id" : memberId,
			"p_passwd" : memberPw
		},
		dataType : 'text',
		success : function(data) {
			if (data == "fail") {
				$('.loginFail').html('아이디 또는 패스워드가 일치하지 않습니다').css('color', 'red');
			} else {
				if (data == "success") {
					alert('로그인 되었습니다');
					location.href = "/home.do";
				} else if (data == "withdraw") {
					$('.loginFail').html("로그인이 불가한 탈퇴회원입니다").css('color', 'red');
				}//if end
			}//if end
		}//success end
	})//ajax end
}//login end
</script>
 
<body>

	<!-- Modal Header -->
	<div class="modal-header">
		<h5 class="modal-title" id="loginLabel">로그인</h5>
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>

	<!-- Modal Body -->
	<div class="modal-body">
		<form action="" id="loginfrm" method="post" class="was-validated">
			<div class="form-group">
				<label for="memberId">ID</label> <input type="text"
					class="form-control" id="memberId" name="memberID"
					placeholder="아이디를 입력하세요" name="memberId" required>
				<div class="valid-feedback">확인</div>
				<div class="invalid-feedback">아이디를 입력해주세요</div>
			</div>
			<!-- form-group end -->

			<div class="form-group">
				<label for="memberPw">PASSWORD</label> <input type="password"
					class="form-control" id="memberPw" name="memberPw"
					placeholder="비밀번호를 입력하세요" name="memberPw" required>
				<div class="valid-feedback">확인</div>
				<div class="invalid-feedback">비밀번호를 입력해주세요</div>
				<span class="loginFail"></span>
			</div>
			<!-- form-group end -->

			<label><input type="checkbox" name="c_mid" value="SAVE"
				style="font-size: 5px">&nbsp;&nbsp;ID 저장</label> <br> <br>
			<br> <input class="button" type="button" value="ID/Password 찾기"
				onclick="location.href='#'">

			<button type="submit" class="btn btn-primary"
				style="margin-left: 30%;" id="login_button" onclick="login()">로그인</button>
			<button type="button" class="btn btn-secondary"
				onclick="location.href='/member/agree.do'">회원가입</button>

		</form>

	</div>
	<!-- modal-body end -->

	<!-- Modal footer -->
	<div class="modal-footer">
		<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	</div>
	<!-- modal-footer end -->
</body>
</html>