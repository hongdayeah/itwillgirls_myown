<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<%@ include file="../header.jsp" %>

    <!-- 본문 시작 loginForm.jsp -->
	
	<form id="loginfrm" method="post" action="login.do">
		<table border="1">
			<tr>
			  <td colspan="2" align="center">* 로그인 *</td>
			</tr>
			<tr>
			  <td>아이디</td>
			  <td><input type="text" name="p_id" size="20" value=${cookie.id.value}></td>
			</tr>
			<tr>
			  <td>비밀번호</td>
			  <td><input type="password" name="p_passwd" size="20"></td>
			</tr>
			<tr>
			  <td colspan=2 align=center>
			  <span>
					<c:if test="${result == 0}">
						<div class="login_warn" style="color: red">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div> <!-- 위치 조정 필요함 -->
					</c:if>
				</span>
			    <input type="submit" class="login_button" value="로그인">
			    <input type="reset"  value="취소" onclick="javascript:history.back()">
			  </td>
			</tr>
			<tr>
				<td>
					<label><input type="checkbox" id="rememberId" name="rememberId" ${empty cookie.id.value ? "":"checked"}>ID 저장</label>
					<!-- ID 저장 선택 후 쿠키값에 ID를 저장했다면 다음 로그인 시에도 체크되어있도록 설정 -->
					<input type="button" value="아이디 찾기" onclick=""> <!-- 경로 설정 중입니다~ -->
					<input type="button" value="비밀번호 찾기" onclick=""> <!-- 경로 설정 중입니다~ -->
				</td>
			</tr>
		</table>
	</form>
	
	
<script>
$(".login_button").click(function() {
	//alert("로그인 버튼 작동");
	
	//로그인 메서드 서버 요청
	$("#loginfrm").attr("action", "/member/login.do");
	$("#loginfrm").submit();
});//function() end
</script>

<script>
/*
$(function() {
	//쿠키값 읽어오기
	var c_id = getCookie("c_id");
})//function() end
*/
$(document).ready(function() {
	//저장된 쿠키값을 가져와서 ID 작성 input에 넣어준다. 쿠키값 없으면 공백 저장
	var p_id = getCookie("c_id");
	$("input[name='p_id']").val(c_id);
		
	$(".login_button").click(function() {
			
		let p_id = $("#p_id").val();
		let rememberId = $('#rememberId').is(":checked");
		
		if (rememberId){ //아이디 저장에 체크가 되어있다면
			//쿠키 저장
			setCookie("p_id", p_id, 7);

		} else {
			//쿠키 삭제
			deleteCookie("p_id");
		}//if end
	}//click() end
}//ready() end
</script>

<script>
	//쿠키 저장
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}//setCookie() end
	
	//쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		exdate.setDate(exdpireDate.getDate() - 1);
		document.cookie = cookieName + "=" + "; expires=" + exdate.toGMTString());
	}//deleteCookie() end
	
	//쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + "=";
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = "";
		if(start != -1) { //쿠키가 존재한다면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1) { //쿠키 값의 마지막 위치 인덱스 번호 설정
				end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}//if end
		}//if end
		
		return unescape(cookieValue);
</script>

    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
