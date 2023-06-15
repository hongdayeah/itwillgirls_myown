<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>hello.jsp</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<!-- header -->
	<div class="jumbotron text-center" style="margin-bottom:0">
		<h1>어린이 문화센터</h1>
		<a href="/views/member/MemberJoinForm.jsp">로그인</a>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">CATEGORY</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">프로그램</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">공연</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">예약</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">소식</a>
				</li> 
				<li class="nav-item">
					<a class="nav-link" href="#">마이페이지</a>
				</li>  
			</ul>
		</div>  
	</nav>
	<!-- header end -->
<div class="container" style="margin-top:30px">
	<div>
		<span>이미지</span>
	</div>
</div>
<div class="container">
	<span>프로그램 소개</span>
</div>

<!-- footer -->
	<div class="jumbotron text-center" style="margin-bottom:0">
		<div>
			센터소개 | 이용약관 | 개인정보처리방침 | 오시는길
			<!-- 링크 걸 예정 -->
		</div>
		<br>
		<div>
			12345 서울시 송송구 어린이로 어린이길 123 어린이 문화센터 | 운영시간  평일 9:00 ~ 18:00 | 휴관  매 주 월요일 및 공휴일
			<br>
			TEL  02-1578-1234 | FAX  02-1578-1235
			<br>
			Copyright 2023. All rights Reserved.
			<!-- 링크 걸 예정 -->
		</div>
	</div>
	<!-- footer end -->
</body>
</html>