<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<h3>대관신청서</h3>
<table align="center" width="98%" height="270px">
 	<thead>
 		<tr>
 			<th>신청날짜</th>
 			<th>단체명</th>
 			<th>담당자</th>
 			<th>대관일자</th>
 			<th>대관목적</th>
 			<th>장소</th>
 		</tr>
 	</thead>
 	
 	<c:forEach var="dto" items="${list}">
 	<tr>
 		<td>${dto.rent_app}</td>
 		<td><a href="read.do?rent_code=${dto.rent_code}">${dto.rent_group}</a></td> 
 		<td>${dto.rent_name}</td>
 		<td>${dto.rent_Date}</td>
 		<td>${dto.rent_per}</td>
 		<td>${dto.class_code}</td>
 	</tr>
 </c:forEach>
 </table>
<%@ include file="../footer.jsp" %>
