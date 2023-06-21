<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<%@ include file="../header.jsp" %>

    <!-- 본문 시작 searchIDProc.jsp -->
	<!-- 찾은 ID 화면에 보여주기 -->
	<form id="searchIDProc" method="post" action="login.do">
		<table border="1">
			<tr>
			  <td colspan="2" align="center">* 아이디 찾기 결과 *</td>
			</tr>
			<tr>
			  <td>
			  	<c:choose>
			  		<c:when test="${empty dto}">
			  			<p style="color: red">조회 결과가 없습니다.</p>
			  		</c:when>
			  		<c:otherwise>
			  			<p>${dto.p_id}</p>
			  		</c:otherwise>
			  	</c:choose>
			  </td>
			</tr>
			<tr>
			  <td colspan=2 align=center>
			    <input type="button" class="login_button" onclick="location.href='/member/login.do'" value="로그인 하러가기">
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
var path = "${pageContext.request.contextPath}";

$(document).ready(function() {
	
});//ready() end
</script>

    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
