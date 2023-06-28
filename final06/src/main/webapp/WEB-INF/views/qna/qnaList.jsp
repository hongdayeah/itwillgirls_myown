<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<form>
<table border="1" align="center" width="98%" height="70px" style="margin:auto;" text-align:center;">
	<thead>
		<tr align="center">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
		</tr>
	</thead>
	
	<c:forEach var="dto" items="${list}">
	<tr>
		<td>${dto.q_no}</td>
		<td>	<c:if test="${dto.q_indent > 0}">
			<c:forEach begin="1" end="${dto.q_indent}">
			&nbsp;
			</c:forEach>
			<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-arrow-right-10025885.png" width="20px">
		</c:if>
	
		
		<a href="read.do?q_no=${dto.q_no}">${dto.q_sub}</a></td>
		<td>${dto.p_id}</td>
		<td>${dto.q_regdt}</td>
	</tr>
	</c:forEach>
</table><br><br>

<button type="button"><a href="/qna/create.do">글쓰기</a></button>
</form>
<br><br>
<%@ include file="../footer.jsp" %>
