<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

 <form name="noticefrm" id="noticefrm" method="post" action="update.do"  enctype="multipart/form-data" onsubmit="return updateCheck()">
 <input type="hidden" name="not_no" id="not_no" value=${requestScope.not_no}>
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
  	<td><input type="text" name="not_sub" value="${dto.not_sub}" id="not_sub" class="form-control" maxlength="100" required></td>

  	</tr>
  <tr>
  	<td align="center">내용</td>
  	<td><textarea style="white-space: pre-line;" rows="10" cols="50" name="not_con" id="not_con" required>${dto.not_con}</textarea></td>
  	
  </tr>
  <tr>
 	<td align="center">첨부파일</td>
 	<td><img src="../noticeimg/${dto.not_filename}" width="350">
 	<input type="file" name="not_filenameMF" size="100"></td> 
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
 
 
 <script>
 	function updateCheck(){
 		let message="기존에 작성한 공지는 삭제됩니다. 수정하시겠습니까?"
 		if(confirm(message)){
 			return true;
 		}else{
 			return false;
 		}//if end
 	}//updateCheck() end
 </script>
<%@ include file="../footer.jsp" %>
