<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginResult.jsp</title>
</head>
<body>

	<h2>로그인 결과</h2>
	
	<!-- session 객체에 값을 넣은 거라 session으로 꺼내오면 입력값 그대로 출력됨 -->
	아이디(세션) : <%=session.getAttribute("p_id")%><br>
	비번(세션)  : <%=session.getAttribute("p_passwd")%><br>
	<hr>

	${message}<br>
	아이디(세션) : ${p_id}<br>
	비번(세션)  : ${p_passwd}<br>
	
</body>
</html>