<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<h3>FAQ삭제</h3>
<div class="title"> FAQ삭제 </div>
<form name="qna" method="post" action="delete.do">
	<input type="hidden" name="q_no" value="${requestScope.q_no}">
	<div class="f_con">
		<p>정말로 삭제하시겠습니까?</p>
	</div>
	
	<div class="bottom">
		<input type="submit" value="삭제진행">
	</div>
</form>


<%@ include file="../footer.jsp" %>
