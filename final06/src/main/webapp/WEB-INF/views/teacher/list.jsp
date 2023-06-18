<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- teacher -- list.jsp -->
<button type="button" class="btn btn-outline-primary" onclick="location.href='create.do'">강사 등록</button>
<br>
강사 목록
<table border="1">
<thead>
	<tr>
		<th>이미지</th>
		<th>강사이름</th> 
	</tr>
</thead>				

<c:forEach var="dto" items="${list}">
	<tr>
		<td>
			<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.t_photo}" width="200">
		</td>
		<td>
			<a href="read.do?t_code=${dto.t_code}">${dto.t_name}</a>
		</td>
		<td>
			<input type="button" value="수정" onclick="location.href='update.do?t_code=${dto.t_code}'">
			<input type="button" value="삭제" onclick="return deleteCheck()"> <!-- 확인필요 -->
		</td>
	</tr>
</c:forEach>
</table>
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
   function deleteCheck(){
	if(confirm("내용은 복구되지 않습니다.\n삭제하시겠습니까?")){
		location.href = "delete.do";
	}else{
		return false;
	}
}//product_delete() end

/*
function product_delete() {
	if (confirm("첨부된 파일은 영구히 삭제됩니다.\n진행할까요?")) {
		$.ajax({
			url: "delete.do",
			type: "POST",
			success: function(response) {
			  // 서버 응답에 대한 처리
			  console.log("파일 삭제 요청 성공");
			},
			error: function(xhr, status, error) {
			  // 요청이 실패했을 때 처리
			  console.log("파일 삭제 요청 실패");
			  console.log("Error: " + error);
			}
		});
	}
}
*/
</script>
<%@ include file="../footer.jsp" %>
