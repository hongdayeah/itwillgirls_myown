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
        
<%@ include file="../footer.jsp" %>
