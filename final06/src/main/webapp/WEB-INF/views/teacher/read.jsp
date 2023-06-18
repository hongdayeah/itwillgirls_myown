<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 teacher -- read.jsp -->
<input type="button" value="목록" onclick="location.href='list.do'">
<br>
강사 상세보기
   	
<table>
	<tr>
		<td><img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.t_photo}" width="400"></td>
		<td>${dto.t_name}</td>
	</tr>
</table>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
