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
		자녀의 MBTi는 <span style="font-weight: bold; color:#15B285;">사자</span>
		입니다.</h2>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<div style="display: flex; justify-content: center; align-items: center;">
				<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/lion.jpg" alt="" height="500">
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
				<h3 style="font-weight: bold;">사자의 특성</h3>
				<hr>
			</div>
			<div class="pf-detail">
				<p style="font-size: '100px';"> 다른 사람의 주목과 관심을 받는 것을 좋아합니다. 타인에게서의 인정 욕구가 강한 편이고 경쟁하는 것을 좋아합니다.
				<br>반장이나 선생님을 도와주는 주도자의 역할이 어울리고 다양한 경험에서 오는 자극을 좋아하는 편입니다.
				<br>발표나 연극형식의 프로그램이나 신체활동을 많이 필요로 하는 프로그램을 추천합니다.
				<br>
				</p>
			</div>
		</div>
		
		<div class="col-lg-3">
		    <div class="title">
		        <h4>사자형 어린이는 이렇습니다!</h4>
		        <hr>
		    </div>
			<ul class="list-unstyled pf-list">
				<li><i class="fa fa-arrow-circle-right pr-10"></i><b>Client: </b> <span><a href="#">wrapbootstrap</a></span></li>
				<li><i class="fa fa-arrow-circle-right pr-10"></i><b>Skills: </b><span><a href="#">WordPress</a>, <a href="#">HTML5</a></span></li>
				<li><i class="fa fa-arrow-circle-right pr-10"></i><b>Colors: </b><span>blue, gray, purple</span></li>
				<li><i class="fa fa-arrow-circle-right pr-10"></i><b>Release Date: </b><span>06 January, 2014</span></li>
				<li><i class="fa fa-arrow-circle-right pr-10"></i><b>Launch Project: </b><span><a href="www.wrapbootstrap.com">wrapbootstrap</a></span></li>
			</ul>
		</div>
	</div>
	<ul class="pager">
		<li class="previous"><a href="#">&larr; Older</a></li>
		<li class="next"><a href="#">Newer &rarr;</a></li>
	</ul>
	<hr>
</div>
<div class="container">
	<!--recent work start-->
	<div class="row">
		<div class="col-lg-12 recent">
			<h3>Related Work</h3>
			<p>Some of our work we have done earlier</p>
			<div id="owl-demo" class="owl-carousel owl-theme wow fadeIn">
				<div class="item view view-tenth">
					<img src="img/works/img8.jpg" alt="work Image">
					<div class="mask">
						<a href="portfolio-single-image.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
						<i class="fa fa-link"></i>
						</a>
					</div>
				</div>
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
			</div>
		</div>
	</div>
	<!--recent work end-->
</div>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
