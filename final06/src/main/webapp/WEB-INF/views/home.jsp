<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>home.jsp</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- 구글 웹 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500&family=Roboto:wght@500;700&display=swap"
        rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
    <!-- Login 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	-->
  	<!-- jQuery -->
  	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  	
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner"
        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->


    <!-- 최상단바 시작 -->
    <div class="container-fluid bg-primary text-white d-none d-lg-flex">
        <div class="container py-3">
            <div class="d-flex align-items-center">
                <a href="home.do">
                    <h2 class="text-white fw-bold m-0">어린이문화센터</h2>
                </a>
                <div class="ms-auto d-flex align-items-center">
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
            </div>
        </div>
    </div>
    <!-- 최상단바 끝 -->


    <!-- Navbar 시작 -->
    <div class="container-fluid bg-white sticky-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-white navbar-light p-lg-0">
                <a href="home.do" class="navbar-brand d-lg-none">
                    <h1 class="fw-bold m-0">어린이문화센터</h1>
                </a>
                <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse"
                    data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav">
                        <a href="home.do" class="nav-item nav-link active">Home</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">프로그램</a>
                            <div class="dropdown-menu bg-light rounded-0 rounded-bottom m-0">
                                <a class="dropdown-item" onclick="location.href='/program/list.do'">프로그램 소개</a>
                                <a class="dropdown-item" onclick="location.href='/teacher/list.do'">강사 소개</a>
                                <a class="dropdown-item" onclick="location.href='/tendency/list.do'">어린이 성향이란?</a>
                                <a class="dropdown-item" onclick="location.href='#'">성향테스트하기</a>
                            </div>
                        </div>
                        <a class="nav-item nav-link" onclick="location.href='/performance/list.do'">공연</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">예약</a>
                            <div class="dropdown-menu bg-light rounded-0 rounded-bottom m-0">
                                <a class="dropdown-item" onclick="location.href='#'">프로그램 예약</a>
                                <a class="dropdown-item" onclick="location.href='#'">공연 예매</a>
                                <a class="dropdown-item" onclick="location.href='/rent/create.do'">대관 신청</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">소식</a>
                            <div class="dropdown-menu bg-light rounded-0 rounded-bottom m-0">
                                <a class="dropdown-item" onclick="location.href='/notice/list.do'">공지사항</a>
                                <a class="dropdown-item" onclick="location.href='#'">공간 소개</a>
                                <a class="dropdown-item" onclick="location.href='#'">자주묻는 질문</a>
                                <a class="dropdown-item" onclick="location.href='#'">문의하기</a>
                            </div>
                        </div>
                        <a class="nav-item nav-link" onclick="location.href='/mypage/myList.do'">마이페이지</a>
                    </div>
                    <div class="ms-auto d-none d-lg-block">
                    	<c:choose>
             
                    		<c:when test="${member_dto == null}">
                        		<a class="btn btn-primary rounded-pill py-2 px-3" onclick="location.href='/member/login.do'">로그인</a>
                        		<a class="btn btn-primary rounded-pill py-2 px-3" onclick="location.href='/member/agree.do'">회원가입</a>
							</c:when>
							<c:otherwise>
								<div class="login_success_area">
									<span><b>'${member_dto.p_name} (${member_dto.p_id})' 님이 로그인 중입니다.</b></span>
									<a class="nav-item nav-link" onclick="location.href='/member/logout.do'">로그아웃</a>
								</div>
							</c:otherwise>
						</c:choose>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar 끝 -->


    <!-- Carousel 시작(움직이는 사진) -->
    <div class="container-fluid px-0 mb-5">
        <div id="header-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/main1.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-start">
                                <div class="col-lg-7 text-start">
                                    <p class="fs-4 text-white animated slideInRight">Welcome to
                                        <strong>WOORI CENTER</strong>
                                    </p>
                                    <h1 class="display-1 text-white mb-4 animated slideInRight">우리아이 성향은?</h1>
                                    <a class="btn btn-primary rounded-pill py-3 px-5 animated slideInRight" onclick="location.href='#'">테스트하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/main2.jpg" alt="Image">
                    <div class="carousel-caption">
                        <div class="container">
                            <div class="row justify-content-end">
                                <div class="col-lg-7 text-end">
                                    <p class="fs-4 text-white animated slideInLeft">여기엔 <strong>무슨 내용 넣을까요?</strong>
                                    </p>
                                    <h1 class="display-1 text-white mb-5 animated slideInLeft">추천해주세요</h1>
                                    <a class="btn btn-primary rounded-pill py-3 px-5 animated slideInLeft" onclick="location.href='#'">더보기버튼</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 옆으로 가기 버튼 -->
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
            <!-- 옆으로 가기 버튼 끝 -->
        </div>
    </div>
    <!-- Carousel 끝(움직이는 사진) -->

    <!-- 프로그램 보이기 시작 for문으로 하고싶어!! -->
    <div class="container-xxl pt-5">
        <div class="container">
            <div class="text-center text-md-start pb-5 pb-md-0 wow fadeInUp" data-wow-delay="0.1s"
                style="max-width: 500px;">
                <p class="fs-5 fw-medium text-primary">프로그램</p>
                <h1 class="display-5 mb-5">진행중인 프로그램</h1>
            </div>
            <div class="owl-carousel project-carousel wow fadeInUp" data-wow-delay="0.1s">
                <div class="project-item mb-5">
                    <div class="position-relative">
                        <img class="img-fluid" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/p1.jpg" alt="">
                        <div class="project-overlay">
                            바로가기
                        </div>
                    </div>
                    <div class="p-4">
                        <a class="d-block h5" onclick="location.href='/program/list.do'">지구교실</a>
                        <span>지구교실 어쩌구 저쩌구에 놀러오세요</span>
                    </div>
                </div>
                <div class="project-item mb-5">
                    <div class="position-relative">
                        <img class="img-fluid" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/p2.jpg" alt="">
                        <div class="project-overlay">
                            바로가기
                        </div>
                    </div>
                    <div class="p-4">
                        <a class="d-block h5" href="">코딩교육</a>
                        <span>어린이가 벌써부터 코딩교육을 배워도 되나요?</span>
                    </div>
                </div>
                <div class="project-item mb-5">
                    <div class="position-relative">
                        <img class="img-fluid" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/p3.jpg" alt="">
                        <div class="project-overlay">
                            바로가기
                        </div>
                    </div>
                    <div class="p-4">
                        <a class="d-block h5" href="">체험교육</a>
                        <span>체험해봐용</span>
                    </div>
                </div>
                <div class="project-item mb-5">
                    <div class="position-relative">
                        <img class="img-fluid" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/p4.jpg" alt="">
                        <div class="project-overlay">
                            바로가기
                        </div>
                    </div>
                    <div class="p-4">
                        <a class="d-block h5" href="">체험교육</a>
                        <span>체험해봐용</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 프로그램 보이기 끝 for문으로 하고싶어!! -->

    <!-- Footer 시작 -->
    <div class="container-fluid bg-dark footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
        <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">우리 센터</h4>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>12345 서울시 송송구 어린이로 어린이길 123</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>02 1578 1234</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>itwill@itwill.com</p>
                    <div class="d-flex pt-3">
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-light rounded-circle me-2" href=""><i
                                class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">센터 정보</h4>
                    <a class="btn btn-link" href="">센터 소개</a>
                    <a class="btn btn-link" href="">오시는 길</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">영업 시간</h4>
                    <p class="mb-1">화요일 - 일요일</p>
                    <h6 class="text-light">09:00 am - 06:00 pm</h6>
                    <p class="mb-1">매주 월요일 및 공휴일</p>
                    <h6 class="text-light">휴관</h6>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-4">소식 받기</h4>
                    <p>매 달 1일, 우리 센터의 소식을 받아보세요!</p>
                    <div class="position-relative w-100">
                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text"
                            placeholder="이메일주소">
                        <button type="button"
                            class="btn btn-light py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer 끝 -->


    <!-- Copyright Start -->
    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="fw-medium text-light" href="#">Your Site Name</a>, All Right Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a class="fw-medium text-light" href="https://htmlcodex.com">HTML Codex</a>
                    Distributed By <a class="fw-medium text-light" href="https://themewagon.com">ThemeWagon</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i
            class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    
    <!-- JavaScript Function -->
    <script>
		//로그인 모달창 호출 함수
		function openLoginModal(){
			$('.modal-content').load("/member/memberLoginForm");
		}//openLoginModal() end
	</script>
</body>

</html>