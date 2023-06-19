<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeList.jsp -->
<form>
<table border="1" align="center" width="98%" height="70px" style="margin:auto; text-align:center;">
	<thead>
		<tr align="center">
			<td>일련번호</td>
			<td>카테고리</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
	</thead>
	
	<c:forEach var=dto" items=${list}">
	<tr>
		<td>${dto.not_no}</td>
		<td>${dto.not_cate}</td>
		<td><a href="read.do?not_no=${dto.not_no}">${dto.not_sub}"></a></td>
		<td>${dto.not_regdt}</td>
	</tr>
	</c:forEach>
</table>
</form>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
