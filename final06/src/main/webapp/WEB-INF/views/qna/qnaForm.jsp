<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<h3>글쓰기</h3>
<p><a href='/qna/list.do'>[문의게시판]</a></p>

<form name="qnaForm" id="qnaForm" method="post" action="create.do" onsubmit="return qnaCheck()">
<table class="table" align="center" width="98%" height="350px">
<tr>
	<th class="success">작성자</th>
	<td><input type="text" name="p_id" id="p_id" class="form-control" maxlength="20" required></td>
</tr>
<tr>
	<th class="success">제목</th>
	<td><input type="text" name="q_sub" id="q_sub" class="form-control" maxlength="100" required></td>
</tr>
<tr>
	<th class="success">내용</th>
	<td><textarea row="5" class="form-control" name="q_con" id="q_con"></textarea></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="쓰기" class="btn btn-sucess">
		<input type="reset"  value="취소" class="btn btn-danger">
	</td>
</tr>
</table>
</form>
</body>
        
<%@ include file="../footer.jsp" %>
