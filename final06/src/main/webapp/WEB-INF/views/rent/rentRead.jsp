<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<h3>대관신청서 상세보기</h3>

<table>
	<tr>
		<td>${dto.rent_app}</td>
		<td>${dto.rent_code}</td>
		<td>${dto.rent_date}</td>
		<td>${dto.rent_per}</td>
		<td>${dto.rent_group}</td>
		<td>${dto.rent_name}</td>
		<td>${dto.rent_phone}</td>
		<td>${dto.rent_email}</td>
		<td>${dto.class_code}</td>
		<td><img src="/rentFormimg/${dto.rent_form}" width="500"></td>
	</tr>
</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
