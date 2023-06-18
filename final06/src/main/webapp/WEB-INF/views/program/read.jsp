<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 program -- read.jsp -->
프로그램 상세페이지

<input type="button" value="프로그램 목록" onclick="location.href='list.do'">
<br>

<table>
	<tr>
		<td>
		<div>
			<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_poster}">
		</div>
		<div>
			<table>
				<tr>
					<th>프로그램명</th>
					<td>${dto.pro_name}</td>
				</tr>
				<tr>
					<th>대상</th>
					<td>${dto.pro_age}</td>
				</tr>
				<tr>
					<th>수업 성향</th>
					<td>${dto.prochar_no}</td>
				</tr>
				<tr>
					<th>수강기간</th>
					<td>${dto.proper_start} ~ ${dto.proper_end}</td>
				</tr>
				<tr>
					<th>수강요일</th>
					<td>${dto.pro_day}</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>${dto.pro_fee}</td>
				</tr>
				<tr>
					<th>수강 정원</th>
					<td>${dto.pro_limit}명</td>
				</tr>
				<tr>
					<th>접수기간</th>
					<td>${dto.prorec_start} ~ ${dto.prorec_end}</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td>
			<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_img}">
		</td>
	</tr>
</table>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
