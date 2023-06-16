<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<h3>대관신청서</h3>
<form>
<table border="1" align="center" width="98%" height="70px" style="margin:auto; text-align:center;">

 	<thead>
 		<tr align="center">
 			<td><strong>신청날짜<strong></td>
 			<td>단체명</td>
 			<td>담당자</td>
 			<td>대관일자</td>
 			<td>대관목적</td>
 			<td>장소</td>
 		</tr>
 	</thead>
 	
 	<c:forEach var="dto" items="${list}">
 	<tr>
 		<td>${dto.rent_app}</td>
 		<td><a href="read.do?rent_code=${dto.rent_code}">${dto.rent_group}</a></td> 
 		<td>${dto.rent_name}</td>
 		<td>${dto.rent_date}</td>
 		<td>${dto.rent_per}</td>
 		<td>${dto.class_code}</td>
 	</tr>
 </c:forEach>
 </table>
 </form>
<%@ include file="../footer.jsp" %>
