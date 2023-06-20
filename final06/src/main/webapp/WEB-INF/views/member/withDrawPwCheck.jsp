<%@page import="kr.co.itwill.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="content">

	<!-- 본문시작 withDrawPwCheck.jsp-->
	<form id="pwCheckfrm" method="post" action="/member/memberDelete.do">
		<table border="1">
			<tr>
				<td colspan="2" align="center">* 비밀번호 확인 *</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="p_id" value="${member_dto.p_id}" readonly>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" id="p_passwd" name="p_passwd" size="20">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<c:if test="${msg == false}">
						비밀번호가 일치하지 않습니다.
					</c:if>
				
					<input type="button" class="pwCheck_button" value="탈퇴하기">
					<input type="reset" value="취소" onclick="javascript:history.back()">
				</td>
			</tr>
		</table>
	</form>
	<!-- 본문 끝 -->
</div>

<script>
$(document).ready(function(){

	// 탈퇴
	$(".pwCheck_button").on("click", function(){
		
		if($("#p_passwd").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#p_passwd").focus();
			return false;
		}//if end
		
		var deleteYN = confirm("탈퇴하시겠습니까?");
		if(deleteYN == true){
			$("#pwCheckfrm").attr("action", "/member/memberDelete.do");
			$("#pwCheckfrm").submit();
		}//if end
	});
});
</script>

<%@ include file="../footer.jsp"%>