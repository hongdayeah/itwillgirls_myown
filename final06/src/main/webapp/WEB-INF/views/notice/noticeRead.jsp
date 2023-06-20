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
	<td colspan="3"><img src="/noticeimg/${dto.not_img}"width="800"><br>${dto.not_con}</td>
</tr>
        </table>
<%@ include file="../footer.jsp" %>
