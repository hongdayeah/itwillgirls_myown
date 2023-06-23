<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 teacher -- list.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리센터 강사님을 소개합니다
				</h1>
			</div>
			<div class="col-lg-8 col-sm-8">
				<ol class="breadcrumb pull-right">
					<li>
						<a href="../home.do">
							Home
						</a>
					</li>
					<li>
						<a href="list.do">
							강사
						</a>
					</li>
					<li class="">
						강사소개
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<div class="btn-position">
	<button class="btn btn-primary" onclick="location.href='create.do'">강사등록</button>
	<button class="btn btn-warning" onclick="location.href='update.do?t_code=${dto.t_code}'">강사수정</button>
	<button class="btn btn-danger" onclick="return deleteCheck()">강사삭제</button>
</div>
<br>
<br>
<br>

<!--container start-->
<div class="container">
	<!-- 리스트 행 개수만큼 출력 -->
	<c:forEach var="dto" items="${list}" varStatus="status">
		<c:if test="${status.count % 2 == 1}">
			<div class="row">
		</c:if>
			<div class="col-md-6">
			<!-- 왼쪽 -->
				<div class="blog-left">
					<div class="blog-img">
						<img class="grid-image" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.t_photo}" alt="${dto.t_photo}"/>
					</div>
					
				<div class="blog-content">
				  <!-- 프로그램 사진, 이름, 정원, 접수기간, 수강기간, 금액, 연령 -->
				 <h3>
				   ${dto.t_name}
				 </h3>
				 <p>
				   담당과목 : 뭐뭐뭐
				  </p>
				</div>
				
				</div>
			</div>
			
			<c:if test="${status.count % 2 == 0}">
			</div>
		</c:if>
	</c:forEach>
	</div>
</div>
<!--container end-->
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
/*
   function deleteCheck(){
	if(confirm("내용은 복구되지 않습니다.\n삭제하시겠습니까?")){
		location.href = "delete.do";
	}else{
		return false;
	}
}//product_delete() end
*/
/*
function deleteCheck(t_code) {
	if (confirm("첨부된 파일은 영구히 삭제됩니다.\n진행할까요?")) {
		$.ajax({
			url: "delete.do?t_code=" + t_code,
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
