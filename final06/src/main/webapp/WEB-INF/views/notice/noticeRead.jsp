<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<table border="1" align="center" style="width: 900px; height: 1200px; text-align:center;">

<tr align="center" style="height: 50px;">
	<td>${dto.not_cate}</td>
	<td>${dto.not_sub}</td>
	<td>${dto.not_regdt}</td>
</tr>
<tr align="center">
	<td colspan="3"><img src="../noticeimg/${dto.not_filename}"width="800"><br>${dto.not_con}</td>
</tr>
</table>
<br><br>
<div align="center">
		<input type="button" value="수정" onclick="location.href='update.do?not_no=${dto.not_no}'">
		<input type="button" value="삭제" onclick="location.href='delete.do?not_no=${dto.not_no}'">
</div>
<br><br>
<%@ include file="../footer.jsp" %>
