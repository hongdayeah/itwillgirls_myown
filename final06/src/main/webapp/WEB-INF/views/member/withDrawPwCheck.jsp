<%@page import="kr.co.itwill.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="content">

	<!-- 본문시작 withDrawPwCheck.jsp-->
	<form id="pwCheckfrm" method="post" action="/member/memberWithdraw.do">
		<table border="1">
			<tr>
				<td colspan="2" align="center">* 비밀번호 확인 *
				
				<input type="hidden" name="p_id" value="${member_dto.p_id}">
				<input type="hidden" name="p_passwd" value="${member_dto.p_passwd}">
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="ck_passwd" name="ck_passwd" size="20">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<div style="color: red;">${msg}</div>
					<span class="pw_input_1">비밀번호가 일치하지 않습니다.</span>
					<span class="pw_input_2">비밀번호가 일치합니다.</span>
					<br>
					<input type="button" class="pwCheck_button" value="탈퇴하기">
					<input type="reset" value="취소" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
	<!-- 본문 끝 -->
</div>

<script>

</script>

<!-- 
<script>
	//비밀번호 일치 확인
	$('#p_passwd').on("propertychange change keyup paste input", function(){
	
		let p_passwd = $('#p_passwd').val();		// input에 입력되는 값
		let data = {p_passwd : p_passwd}				// '컨트롤에 넘길 데이터 이름' : '데이터(input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/pwCheck.do",
			data : data,
			success : function(result){
	
				if(result != 'fail'){ //비밀번호 일치할 때
					$('.pw_input_2').css("display","inline-block");
					$('.pw_input_1').css("display", "none");				
				} else {
					$('.pw_input_1').css("display","inline-block");
					$('.pw_input_2').css("display", "none");
				}//if end
			}// success 종료
		
		}); // ajax 종료	
	
	});// function 종료
</script>
 -->

<%@ include file="../footer.jsp"%>