<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 test -- testresult.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					MBTi테스트 결과확인
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
							MBTi테스트
						</a>
					</li>
					<li class="">
						결과확인
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<!-- 이미지 -->
<div class="container">
	<div>
		<h2 style="text-align: center; color: #3A3A3A;">
		${k_name}의 MBTi는 <span style="font-weight: bold; color:#15B285;">${infodto.typeanimal}</span>
		입니다.</h2>
	</div>
	<h5 style="text-align: center;">결과는 자녀정보에서 재확인 가능합니다.</h5>

	<div class="row">
		<div class="col-md-12">
			<div style="display: flex; justify-content: center; align-items: center;">
				<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${infodto.typeimg}" alt="${infodto.typeimg}" height="500">
			</div>
		</div>
	</div>
</div>

<!--container start-->

<div class="container">
	<div class="row">
	    <!--portfolio-single start-->
		<div class="col-lg-9 ">
			<div class="title">
				<h3 style="font-weight: bold;">${infodto.typeanimal}의 특성</h3>
				<hr>
			</div>
			<div class="pf-detail">
				<p style="font-size: '100px'; white-space: pre-line;"> ${infodto.typeexp}
				</p>
			</div>
		</div>
		
		<div class="col-lg-3">
		    <div class="title">
		        <h4>[${infodto.typeanimal}] 타입의 어린이는 이렇습니다!</h4>
		        <hr>
		    </div>
			<ul class="list-unstyled pf-list">
			<c:if test="${not empty infodto.typespec1}">
				<li><i class="fa fa-arrow-circle-right pr-10"></i><span>${infodto.typespec1}</span></li>
			</c:if>
			<c:if test="${not empty infodto.typespec2}">
				<li><i class="fa fa-arrow-circle-right pr-10"></i><span>${infodto.typespec2}</span></li>
			</c:if>
			<c:if test="${not empty infodto.typespec3}">
				<li><i class="fa fa-arrow-circle-right pr-10"></i><span>${infodto.typespec3}</span></li>
			</c:if>
			<c:if test="${not empty infodto.typespec4}">
				<li><i class="fa fa-arrow-circle-right pr-10"></i><span>${infodto.typespec4}</span></li>
			</c:if>
			</ul>
		</div>
	</div>
	<hr>
</div>
<div class="container">
	<!--recent work start-->
	<div class="row">
		<div class="col-lg-12 recent">
			<h3>[${infodto.typeanimal}] 타입 프로그램</h3>
			<p>해당 프로그램은 [${infodto.typeanimal}] 타입의 어린이들에게 추천해요!</p>
			<div id="owl-demo" class="owl-carousel owl-theme wow fadeIn">
			<c:forEach var="i" items="${prolist}">
				<div class="item view view-tenth">
					<img class="grid-image" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${i.pro_poster}" alt="${i.pro_poster}"/>
					<div class="mask">
						<a href="../program/read.do?pro_obj=${i.pro_obj}" class="info" data-toggle="tooltip" data-placement="top" title="${i.pro_name}">
							<i class="fa fa-link"></i>
						</a>
					</div>
				</div>
			</c:forEach>
				<!-- 
				<div class="item view view-tenth">
					<img src="img/works/img9.jpg" alt="work Image">
					<div class="mask">
						<a href="portfolio-single-image.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
						<i class="fa fa-link"></i>
						</a>
					</div>
				</div>
				<div class="item view view-tenth">
					<img src="img/works/img10.jpg" alt="work Image">
					<div class="mask">
						<a href="portfolio-single-image.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
						<i class="fa fa-link"></i>
						</a>
					</div>
				</div>
				<div class="item view view-tenth">
					<img src="img/works/img11.jpg" alt="work Image">
					<div class="mask">
						<a href="portfolio-single-image.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
						<i class="fa fa-link"></i>
						</a>
					</div>
				</div>
				<div class="item view view-tenth">
					<img src="img/works/img12.jpg" alt="work Image">
					<div class="mask">
						<a href="blog_detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
						<i class="fa fa-link"></i>
						</a>
					</div>
				</div>
				<div class="item view view-tenth">
					<img src="img/works/img13.jpg" alt="work Image">
					<div class="mask">
						<a href="blog_detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
						<i class="fa fa-link"></i>
						</a>
					</div>
				</div>
				-->
			</div>
		</div>
	</div>
	<!--recent work end-->
</div>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
