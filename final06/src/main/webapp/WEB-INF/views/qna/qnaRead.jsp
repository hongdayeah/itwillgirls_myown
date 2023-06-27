<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<table border="1" align="center" style="text-align:center; width:700px; height:500px;">
	<tr align="center">
		<th>제목</th>
		<td colspan="3">${dto.q_con}</td>
	</tr>	
	<tr>
		<th>작성자</th>
		<td>${dto.p_id}</td>
		<th>작성일</th>
		<td>${dto.q_regdt}</td>
	</tr>
	<tr>
		<td colspan="4" class="tableTBox">${dto.q_con}</td>
	</tr>
</table>
   <br><br>
<div align="center">
		<input type="button" value="수정" onclick="location.href='update.do?q_no=${dto.q_no}'">
		<input type="button" value="삭제" onclick="location.href='delete.do?q_no=${dto.q_no}'">
</div>
<br><br>     
<%@ include file="../footer.jsp" %>
