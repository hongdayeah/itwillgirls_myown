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
		<td><a href="read.do?q_no=${dto.q_no}">${dto.q_sub}</a></td>
		<td>${dto.p_id}</td>
		<td>${dto.q_regdt}</td>
	</tr>
	</c:forEach>
</table><br><br>
<div class=searchBox">
	<input name="searchKeyword" type="text" size="50" placdholder="검색어를 입력해주세요">
	<button type="button" class="search" onclick="doSearch();">SEARCH</button>
</div>

<button type="button"><a href="/qna/create.do">글쓰기</a></button>
</form>
<%@ include file="../footer.jsp" %>
