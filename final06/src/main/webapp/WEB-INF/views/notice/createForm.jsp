<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 createForm.jsp -->
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
 <form name="noticefrm" id="noticefrm" method="post" action="create.do"  enctype="multipart/form-data" onsubmit="return noticeCheck()">
  <table class="table" align="center" width="98%" height="350px">
  <tr>
  	<td align="center" width="100px">카테고리</td>
  	<td>
  	<select id="not_cate" name="not_cate" required>
  		<option value="N">전체공지</option>
  		<option value="E">이벤트</option>
  	</select>
  	</td>
  </tr>
  <tr>
  	<td align="center">제목</td>
  	<td><input type="text" name="not_sub" id="not_sub" class="form-control" maxlength="100" required></td>
  	</tr>
  <tr>
  	<td align="center">내용</td>
  	<td><textarea cols="150" rows="20" class="form-control" name="not_con" id="not_con"></textarea></td>
  	
  </tr>
  <tr>
 	<td align="center">첨부파일</td>
 	<td><input type="file" name="not_imgMF" size="100"></td>
 </tr>
 </table>
 
<div style="text-align:center;">
 		<input type="submit" value="등록" class="btn btn-success" style="align:center;">&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="reset" value="취소" class="btn btn-danger" style="align:center;">
</div>

<button type="button"><a href="/notice/list.do">목록으로</a></button>
 <br>
  <br>
 </form> 
  
  </body>
<!-- 본문 끝 -->
      
  
  
<%@ include file="../footer.jsp" %>