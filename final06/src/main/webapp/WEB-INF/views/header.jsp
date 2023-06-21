<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang>
<head>
  <title>home_v3.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
    font: 400 15px/1.8 Lato, sans-serif;
    color: #777;
  }
  h3, h4 {
    margin: 10px 0 30px 0;
    letter-spacing: 10px;      
    font-size: 20px;
    color: #111;
  }
  .container {
    padding: 80px 120px;
  }
  .person {
    border: 10px solid transparent;
    margin-bottom: 25px;
    width: 80%;
    height: 80%;
    opacity: 0.7;
  }
  .person:hover {
    border-color: #f1f1f1;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
  }
  .bg-1 {
    background: #2d2d30;
    color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
    border-top-right-radius: 0;
    border-top-left-radius: 0;
  }
  .list-group-item:last-child {
    border-bottom-right-radius: 0;
    border-bottom-left-radius: 0;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail p {
    margin-top: 15px;
    color: #555;
  }
  .btn {
    padding: 10px 20px;
    background-color: #333;
    color: #f1f1f1;
    border-radius: 0;
    transition: .2s;
  }
  .btn:hover, .btn:focus {
    border: 1px solid #333;
    background-color: #fff;
    color: #000;
  }
  .modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
  }
  .modal-header, .modal-body {
    padding: 40px 50px;
  }
  .nav-tabs li a {
    color: #777;
  }
  #googleMap {
    width: 100%;
    height: 400px;
    -webkit-filter: grayscale(100%);
    filter: grayscale(100%);
  }  
  .navbar {
    font-family: Montserrat, sans-serif;
    margin-bottom: 0;
    background-color: #2d2d30;
    border: 0;
    font-size: 11px !important;
    letter-spacing: 4px;
    opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
    color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
    color: #fff !important;
  }
  .navbar-nav li.active a {
    color: #fff !important;
    background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
  }
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
  footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 32px;
  }
  footer a {
    color: #f5f5f5;
  }
  footer a:hover {
    color: #777;
    text-decoration: none;
  }  
  .form-control {
    border-radius: 0;
  }
  textarea {
    resize: none;
  }
  
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<!-- 최상단바 시작 -->
    <div class="container-fluid">
        <div>
            <div>
                <a href="../home.do">
                    <h2 class="text-white fw-bold m-0">어린이문화센터</h2>
                </a>
                <div>
                    <small class="ms-4"><i class="fa fa-map-marker-alt me-3"></i>서울시 송송구 어린이로 123번길</small>
                    <small class="ms-4"><i class="fa fa-envelope me-3"></i>itwill@itwill.com</small>
                    <small class="ms-4"><i class="fa fa-phone-alt me-3"></i>02 1578 1234</small>
                    <div class="ms-3 d-flex">
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-sm-square btn-light text-primary rounded-circle ms-2" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div>
                    	<c:choose>
             
                    		<c:when test="${member_dto == null}">
                        		<a class="btn btn-primary rounded-pill py-2 px-3" href="../member/login.do">로그인</a>
                        		<a class="btn btn-primary rounded-pill py-2 px-3" href="../member/agree.do">회원가입</a>
							</c:when>
							<c:otherwise>
								<div class="login_success_area">
									<span><b>'${member_dto.p_name} (${member_dto.p_id})' 님이 로그인 중입니다.</b></span>
									<a class="nav-item nav-link" href="../member/logout.do">로그아웃</a>
								</div>
							</c:otherwise>
						</c:choose>
                    </div>
            </div>
        </div>
    </div>
    <!-- 최상단바 끝 -->
<nav>
  <div class="container-fluid">
    <div>
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="../home.do">HOME</a>
      
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <!-- 프로그램 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">프로그램
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../program/list.do">프로그램 소개</a></li>
            <li><a href="../teacher/list.do">강사 소개</a></li>
            <li><a href="../tendency/list.do">어린이 성향이란?</a></li> 
            <li><a href="../#">성향테스트하기</a></li> 
          </ul>
        </li>
        <!-- 프로그램 끝 -->
        <!-- 공연 -->
        <li><a href="../performance/list.do">공연</a></li>
        <!-- 공연 끝 -->
        <!-- 예약 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">예약
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../#">프로그램 예약</a></li>
            <li><a href="../#">공연 예매</a></li>
            <li><a href="../rent/create.do">대관 신청</a></li> 
          </ul>
        </li>
        <!-- 예약 끝 -->
        <!-- 소식 -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">소식
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../notice/list.do">공지사항</a></li>
            <li><a href="../#">공간 소개</a></li>
            <li><a href="../#">자주묻는 질문</a></li>
            <li><a href="../#">문의하기</a></li>
          </ul>
        </li>
        <!-- 소식 끝 -->
        <!-- 마이페이지 -->
        <li><a href="../mypage/myList.do">마이페이지</a></li>
        <!-- 마이페이지 끝 -->
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        
      </ul>
    </div>
  </div>
</nav>