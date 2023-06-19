<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginForm.jsp</title>
</head>
<body>

	<h3>로그인</h3>
	
	<form method="post" action="login.do">
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
			    <input type="submit" value="로그인">
			    <input type="reset"  value="취소" onclick="javascript:history.back()">
			    <c:if test="${msg == 'failure'}">
			    	<div style="color: red">
			    		아이디 또는 비밀번호가 일치하지 않습니다.
			    	</div>
			    </c:if>
			  </td>
			</tr>
		</table>
	</form>
	
</body>
</html>