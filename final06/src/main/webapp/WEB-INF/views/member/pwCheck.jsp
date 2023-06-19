<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwCheck.jsp</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
</script>

</head>
<body>

	<form id="pwCheckfrm" method="post" action="update.do">
		<table border="1">
			<tr>
				<td colspan="2" align="center">* 비밀번호 확인 *</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="check_passwd" name="ck_passwd" size="20"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<span><!-- 수정 중 -->
						<c:if test="${result == 0}">
							<div class="login_warn" style="color: red">비밀번호가 일치하지 않습니다.</div>
						</c:if>
					</span>
					
					<input type="submit" class="pwCheck_button" value="비밀번호 확인">
					<input type="reset" value="취소" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
	
	
<script>
$(".pwCheck_button").click(function() {
	//alert("비밀번호 확인 버튼 작동");
	
	var check_passwd = $('#ck_passwd').val();
	
	if(!check_passwd || check_passwd.trim() === "") { //비밀번호를 입력하지 않았을 때
		alert("비밀번호를 입력하세요.");
	} else {
		$.ajax({
			type: 'GET',
			url: '/member/pwCheck',
			data: {'check_passwd': check_passwd},
			datatype: "text"
		}).done(function(result) {
			console.log(result);
			if(result) {
				console.log("비밀번호 일치");
				window.location.href="/member/memberUpdate.do";
			} else if(!result) {
				console.log("비밀번호 불일치");
				alert("비밀번호가 맞지 않습니다.");
				window.location.reload();
			}//if end
		}).fail(function(error) {
			alert(JSON.stringify(error));
		})//fail end
	}//if end
});//click() end
</script>

</body>
</html>