<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	
	<style>
	.item h4 {
		font-size: 19px;
		line-height: 1.375em;
		font-weight: 400;
		font-style: italic;
		margin: 70px 0;
	}
	.item span {
		font-style: normal;
	}
	.carousel-control.right, .carousel-control.left {
		background-image: none;
		color: #f4511e;
	}
	.carousel-indicators li {
		border-color: #f4511e;
	}
	.carousel-indicators li.active {
		background-color: #f4511e;
	}
	.id_input_re_1{
		color: green;
		display: none;
	}
	.id_input_re_2{
		color: red;
		display: none;
	}
	.dropdown-item{
		cursor: pointer;
	}
	.nav-link{
		cursor: pointer;
	}
	</style>
</head>
<body>
	<!-- header -->
	<div class="jumbotron text-center" style="margin-bottom:0">
		<h1><a href="/home.do">어린이 문화센터</a></h1>

		<!-- 로그인 전 -->
				<c:if test="${SessionScope.id==null}">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login"  onclick="openLoginModal()">로그인/회원가입</button>

					<!-- Modal -->
					<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
 								<!-- 외부 jsp 파일이 들어올 부분 -->
							</div><!-- modal-content end -->
						</div><!-- modal-dialog end -->
					</div><!-- modal fade end -->
					
				</c:if>
				
				<!-- 로그인 후 -->
				<c:if test="${SessionScope.id!=null}">
						ㅇㅇㅇ님 반갑습니다.
				</c:if>
	</div>
		
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">CATEGORY</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<!-- Dropdown -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						프로그램
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" onclick="location.href='/program/list.do'">프로그램 소개</a>
						<a class="dropdown-item" onclick="location.href='/teacher/list.do'">강사 소개</a>
						<a class="dropdown-item" href="#">성향이란?</a>
						<a class="dropdown-item" href="#">성향테스트하기</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" onclick="location.href='/performance/list.do'">공연</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						예약
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">프로그램 예약</a>
						<a class="dropdown-item" href="#">공연 예매</a>
						<a class="dropdown-item" onclick="location.href='/rent/create.do'">대관 신청</a>  
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						소식
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" onclick="location.href='/notice/list.do'">공지사항</a>
						<a class="dropdown-item" href="#">공간 소개</a>
						<a class="dropdown-item" href="#">자주묻는 질문</a>
						<a class="dropdown-item" href="#">문의하기</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">마이페이지</a>
				</li>  
			</ul>
		</div>  
	</nav>
	<!-- header end -->