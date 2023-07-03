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

<div class="btn-position">
<c:if test="${member_dto.p_id == 'webmaster'}">
	<button class="btn btn-primary" onclick="location.href='create.do'">프로그램등록</button>
</c:if>
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
				<div class="blog-left" onclick="location.href='read.do?pro_obj=${dto.pro_obj}'" style="cursor: pointer;">
					<div class="blog-img">
						<img class="grid-image" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_poster}" alt="${dto.pro_poster}"/>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="blog-two-info">
								<p>
									<!-- 등록일 -->
									<i class="fa fa-calendar"></i>
									<span style="font-weight: bold;">수강기간</span>
									<c:set var="proStart" value="${fn:substring(dto.proper_start, 5, 10)}" />
									<c:set var="proEnd" value="${fn:substring(dto.proper_end, 5, 10)}" />
									${proStart} ~ ${proEnd}
									|&nbsp;
									
									<!-- 리뷰 개수 -->
									<!-- 
									<i class="fa fa-comment"></i>
									<span style="font-weight: bold;">후기</span>
									<a href="#">n개</a> --> <!-- 해당 pro_obj의 리뷰 개수 불러오기 -->
									<!-- |&nbsp;  -->
									
									<!-- 찜 개수? 찜으로 한다면 하트 이미지 쓰기 -->
									<i class="fa fa-heart"></i>
									<span style="font-weight: bold;">관심등록</span>
									<a href="#">${likeCnts[status.index]}번</a> <!-- pro_obj의 찜 개수 가져오기 -->
									<br>
									
									<!-- 해당 프로그램의 성향 타입 개수만큼 -->
									<i class="fa fa-tags"></i>
									MBTi :
									<!-- pro_obj의 성향 for문 돌리기 -->
									<c:forEach var="type" items="${dto.prochar_no}">	
										<c:choose>
										<c:when test="${type eq 'pro_II'}">
											<span class="label label-info">늑대</span>
										</c:when>
										<c:when test="${type eq 'pro_EE'}">
											<span class="label label-info">사자</span>
										</c:when>
										<c:when test="${type eq 'pro_IE'}">
											<span class="label label-info">기린</span>
										</c:when>
										<c:otherwise>
											<span class="label label-info">양</span>
										</c:otherwise>
										</c:choose>
									</c:forEach>
								</p>
							</div>
						</div>
					</div>
				<div class="blog-content">
				  <!-- 프로그램 사진, 이름, 정원, 접수기간, 수강기간, 금액, 연령 -->
				 <h3>
				   ${dto.pro_name}
				 </h3>
				 <p>
				   ${dto.pro_exp }
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
