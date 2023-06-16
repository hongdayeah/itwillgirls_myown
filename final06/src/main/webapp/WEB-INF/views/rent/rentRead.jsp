<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<h3>대관신청서 상세보기</h3>
<table>
	<tr align="center">
		<td>신청날짜</td>
		<td>${dto.rent_app}</td>
	</tr>
	<tr align="center">
		<td>대관코드</td>
		<td>${dto.rent_code}</td>
	</tr>
	<tr align="center">
		<td>대관일자</td>
		<td>${dto.rent_date}</td>
	</tr>
	<tr align="center">
		<td>대관목적</td>
		<td>${dto.rent_per}</td>
	</tr>
	<tr align="center">
		<td>단체명</td>
		<td>${rent_group}</td>
		</tr>
	<tr align="center">
		<td>담당자 성함</td>
		<td>${dto.rent_name}</td>
	</tr>
	<tr align="center">
		<td>연락처</td>
		<td>${dto.rent_phone}</td>
	</tr>
	<tr align="center">
		<td>이메일 주소</td>
		<td>${dto.rent_email}</td>
	</tr>
	<tr align="center">
		<td>장소</td>
		<td>${dto.class_code}</td>
	</tr>
	<tr align="center">
		<td>대관신청서</td>
		<td><img src="../rentFormimg/${dto.rent_form}" width="500"></td>
	</tr>
</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
