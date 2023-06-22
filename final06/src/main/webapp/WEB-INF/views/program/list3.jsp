<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 program -- list.jsp -->

<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리센터 프로그램을 소개합니다
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
							프로그램
						</a>
					</li>
					<li class="">
						프로그램 소개
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<!--container start-->
<div class="container">
	<!-- 리스트 행 개수만큼 출력 -->
	<c:forEach var="dto" items="${list}">
		<div class="row">
			<div class="col-md-6">
				<!-- 왼쪽 -->
				<div class="blog-left wow fadeInLeft">
					<div class="blog-img">
						<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_poster}" alt="${dto.pro_poster}"/>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="blog-two-info">
								<p>
									<!-- 강사님 이름 -->
									<i class="fa fa-user"></i>
									강사
									<a href="#"> John</a>
									
									|
									<!-- 등록일 -->
									<i class="fa fa-calendar"></i>
									Sept 16th, 2012
									|
									<!-- 리뷰 개수 -->
									<i class="fa fa-comment"></i>
									<a href="#">3 Comments</a>
									|
									<!-- 찜 개수? 찜으로 한다면 하트 이미지 쓰기 -->
									<i class="fa fa-share"></i>
									<a href="#">39 Shares</a>
									<br>
									<!-- 해당 프로그램의 성향 타입 개수만큼 -->
									<i class="fa fa-tags"></i>
									성향 :
									<a href="#">
										<span class="label label-info">Snipp </span>
									</a>
									<a href="#">
										<span class="label label-info">Bootstrap </span>
									</a>
									<a href="#">
										<span class="label label-info">Bootstrap </span>
									</a>
									<a href="#">
										<span class="label label-info">Bootstrap </span>
									</a>
								</p>
							</div>
						</div>
					</div>
					<div class="blog-content">
					<!-- 프로그램 사진, 이름, 정원, 접수기간, 수강기간, 금액, 연령 -->
						<h3>
						  프로그램 제목
						</h3>
						<p>
							프로그램 설명
						</p>
					</div>
					<button class="btn btn-primary">
						더보기
					</button>
				</div>
			</div>
			
			<!-- 오른쪽 -->
			<div class="col-md-6">
				<div class="blog-right wow fadeInRight">
					<div class="blog-img">
						<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_poster}" alt="${dto.pro_poster}"/>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="blog-two-info">
								<p>
									<!-- 강사님 이름 -->
									<i class="fa fa-user"></i>
									by
									<a href="#"> John</a>
									
									|
									<!-- 등록일 -->
									<i class="fa fa
									-calendar"></i>
									Sept 16th, 2012
									|
									<!-- 리뷰 개수 -->
									<i class="fa fa-comment"></i>
									<a href="#">3 Comments</a>
									|
									<!-- 찜 개수? 찜으로 한다면 하트 이미지 쓰기 -->
									<i class="fa fa-share"></i>
									<a href="#">39 Shares</a>
									<br>
									<!-- 해당 프로그램의 성향 타입 개수만큼 -->
									<i class="fa fa-tags"></i>
									성향 :
									<a href="#">
										<span class="label label-info">Snipp </span>
									</a>
									<a href="#">
										<span class="label label-info">Bootstrap </span>
									</a>
									<a href="#">
										<span class="label label-info">Bootstrap </span>
									</a>
									<a href="#">
										<span class="label label-info">Bootstrap </span>
									</a>
								</p>
							</div>
						</div>
					</div>
					<div class="blog-content">
					<!-- 프로그램 사진, 이름, 정원, 접수기간, 수강기간, 금액, 연령 -->
						<h3>
						  프로그램 제목
						</h3>
						<p>
							프로그램 설명
						</p>
					</div>
					<button class="btn btn-primary">
						더보기
					</button>
				</div>
			</div>
			<!--blog end-->
		</div>
	</c:forEach>
</div>
<!--container end-->

<script>
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
