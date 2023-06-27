<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<table border="1" align="center" style="text-align:center; width:700px; height:500px;">
	<tr align="center">
	</tr>	
	<tr>
		<th>작성자</th>
		<td>${dto.p_id}</td>
		<th>작성일</th>
		<td>${dto.q_regdt}</td>
	</tr>
		<th>제목</th>
		<td colspan="3">${dto.q_sub}</td>
	<tr>
		<td class="tableTBox">내용</td>
		<td colspan="3" class="tableTBox">${dto.q_con}</td>
	</tr>
</table>
   <br><br>
<div align="center">
		<input type="button" value="답변" onclick="location.href='reply.do?q_no=${dto.q_no}'">
		<input type="button" value="수정" onclick="location.href='update.do?q_no=${dto.q_no}'">
		<input type="button" value="삭제" onclick="location.href='delete.do?q_no=${dto.q_no}'">
</div>
<br><br>     
<%@ include file="../footer.jsp" %>
