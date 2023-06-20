<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ include file="../header.jsp" %>

    <!-- 본문 시작 loginForm.jsp -->
	
	<form id="loginfrm" method="post" action="login.do">
		<table border="1">
			<tr>
			  <td colspan="2" align="center">* 로그인 *</td>
			</tr>
			<tr>
			  <td>아이디</td>
			  <td><input type="text" name="p_id" size="20"></td>
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
					<label><input type="checkbox" id="saveID" value="saveID">ID 저장</label>
					<input type="button" value="ID/PASSWORD 찾기" onclick=""> <!-- 경로 설정 중입니다~ -->
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
});
</script>

    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
