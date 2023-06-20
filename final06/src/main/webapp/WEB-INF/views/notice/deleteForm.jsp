<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<h3>공연삭제</h3>
<div class="title"> 공지삭제 </div>
<form name="not" method="post" action="delete.do">
	<input type="hidden" name="not_no" value="${requestScope.not_no}">
	<div class="not_con">
		<p>정말로 삭제하시겠습니까?</p>
	</div>
	
	<div clas="bottom">
		<input type="submit" value="삭제진행하겠습니다.">
	</div>
</form>


<%@ include file="../footer.jsp" %>
