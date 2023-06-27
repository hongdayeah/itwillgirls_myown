<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<form>
<table border="1" align="center" width="98%" style="margin:auto; text-align:center;">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
    </tr>
    <c:forEach var="dto" items="${list}">
        <tr>
            <td>${dto.q_no}</td>
            <td>
                <c:forEach begin="1" end="${dto.q_indent}">
                    &nbsp;&nbsp;&nbsp;
                </c:forEach>
                <a href="read.do?q_no=${dto.q_no}">${dto.q_sub}</a>
            </td>
            <td>${dto.p_id}</td>
            <td>${dto.q_regdt}</td>
        </tr>
        <c:if test="${dto.q_indent > 0}">
            <tr>
                <td colspan="4">
                    <form action="reply.do" method="post">
                        <input type="hidden" name="q_no" value="${dto.q_no}" />
                        <input type="text" name="q_sub" placeholder="답변 제목" /><br />
                        <textarea name="q_con" placeholder="답변 내용" rows="3"></textarea><br />
                        <input type="submit" value="답변 작성" />
                    </form>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>
<br><br>
<div class=searchBox">
	<input name="searchKeyword" type="text" size="50" placdholder="검색어를 입력해주세요">
	<button type="button" class="search" onclick="doSearch();">SEARCH</button>
</div>

<button type="button"><a href="/qna/create.do">글쓰기</a></button>
</form>
<%@ include file="../footer.jsp" %>
