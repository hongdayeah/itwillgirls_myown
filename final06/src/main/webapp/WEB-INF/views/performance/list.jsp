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
					우리센터 공연을 소개합니다
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
							공연
						</a>
					</li>
					<li class="">
						공연 소개
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<div class="btn-position">
	<button onclick="location.href='../payment/importTest.jsp'">
	<button class="btn btn-primary" onclick="location.href='create.do'">공연등록</button>
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
				<div class="blog-left" onclick="location.href='read.do?per_code=${dto.per_code}'" style="cursor: pointer;">
					<div class="blog-img">
						<img class="grid-image" src="../perstorage/${dto.per_img}" />
					</div>
					<div class="row">
						<div class="col-md-12"> 
							<div class="blog-two-info">
								<p>
									<!-- 공연날짜 -->
									<i class="fa fa-calendar"></i>
									<span style="font-weight: bold;">공연날짜</span> 
									<var="per_date" value="${dto.per_date}"/>${dto.per_date}
									|
									
									<!-- 공연시간 -->
									<i class="fa fa-calendar"></i>
									<span style="font-weight: bold;">공연시간</span>
									<var="per_time" value="${dto.per_time}"/>${dto.per_time}
								</p>
							</div>
						</div>
					</div>
				<div class="blog-content">
				  <!-- 프로그램 사진, 이름, 정원, 접수기간, 수강기간, 금액, 연령 -->
				 <h3>
					${dto.per_name}
				</h3>
				<p>
				  ${dto.per_exp}
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


       
<%@ include file="../footer.jsp" %>
