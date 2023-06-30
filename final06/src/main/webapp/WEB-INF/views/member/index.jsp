<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
<!-- 아직 구현 관련 공부 중인 페이지 입니다~ -->
	<c:if test="${userId == null}">
		<a href="https://kauth.kakao.com/oauth/authorize
			?client_id=수정중
			&redirect_uri=http://localhost:9095/member/kakao
			&response_type=code">
            <img src="/img/kakao_login_button.png">
        </a>
    </c:if>
    <c:if test="${userId != null}">
        <h1>로그인 성공입니다</h1>
        <input type="button" value="로그아웃" onclick="location.href='/logout'">
    </c:if>

</body>
</html>