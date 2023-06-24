<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Developed By M Abdur Rokib Promy">
	<meta name="author" content="cosmic">
	<meta name="keywords" content="Bootstrap 3, Template, Theme, Responsive, Corporate, Business">
	<link rel="shortcut icon" href="img/favicon.png">
	
	<title>
		home_v4.jsp
	</title>
	
	<!-- Bootstrap core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/theme.css" rel="stylesheet">
	<link href="css/bootstrap-reset.css" rel="stylesheet">
	<!-- <link href="css/bootstrap.min.css" rel="stylesheet">-->
	
	<!--external css-->
	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/flexslider.css"/>
	<link href="assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="assets/owlcarousel/owl.carousel.css">
	<link rel="stylesheet" href="assets/owlcarousel/owl.theme.css">
	
	<link href="css/superfish.css" rel="stylesheet" media="screen">
	<link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
	<!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'> -->
	
	
	<!-- Custom styles for this template -->
	<link rel="stylesheet" type="text/css" href="css/component.css">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/style-responsive.css" rel="stylesheet" />
	
	<link rel="stylesheet" type="text/css" href="css/parallax-slider/parallax-slider.css" />
	<script type="text/javascript" src="js/parallax-slider/modernizr.custom.28468.js">
	</script>

</head>

	<body>
	<!--header start-->
	<header class="head-section">
		<div class="navbar navbar-default navbar-static-top container">
			<div class="navbar-header">
				<button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../home.do" style="text-align:center;">어린이<br>문화센터</span></a>
			</div>
			<div class="navbar-collapse collapse">
				<c:choose>
					<c:when test="${member_dto != null}">
						<div style="text-align:right;">
							<b>'${member_dto.p_name} (${member_dto.p_id})' 님이 로그인 중입니다.</b>
						</div>
					</c:when>
				<c:otherwise><div></div></c:otherwise>
				</c:choose>
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
						"dropdown" data-toggle="dropdown" href="/">프로그램 <i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="../program/list.do">프로그램 소개</a>
							</li>
							<li>
								<a href="../teacher/list.do">강사 소개</a>
							</li>
							<li>
								<a href="../tendency/list.do">어린이 성향이란?</a>
							</li>
							<li>
								<a href="../#">성향테스트하기</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="../performance/list.do">공연  </a>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
						"dropdown" data-toggle="dropdown" href="#">예약 <i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="../#">프로그램 예약</a>
							</li>
							<li>
								<a href="../#">공연 예매</a>
							</li>
							<li>
								<a href="../rent/create.do">대관 신청</a>
							</li>
						</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
						"dropdown" data-toggle="dropdown" href="#">소식 <i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="../notice/list.do">공지사항</a>
							</li>
							<li>
								<a href="../#">공간 소개</a> <!-- where/about.do -->
							</li>
							<li>
								<a href="../faq/list.do">자주 묻는 질문</a>
							</li>
							<li>
								<a href="../#">문의하기</a>
							</li>
						</ul>
					</li>
					<li class="dropdown">
					<!-- 마이페이지의 경우 글자에 링크거는것보다 마이페이지 아이콘 이미지에 링크거는것도 좋을것 같음 -->
						<a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
						"dropdown" data-toggle="dropdown" href="#">마이페이지 <i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="../#">예매내역</a>
							</li>
							<li>
								<a href="../member_kid/kidList.do">자녀회원 등록/목록</a>
							</li>
							<li>
								<a href="../member/memberModify.do">개인정보 수정</a>
							</li>
							<li>
								<a href="../member/memberWithdraw.do">회원탈퇴</a>
							</li>
							<li>
								<a href="../#">나의 관심내역</a>
							</li>
						</ul>
					</li>
					<li>
						<c:choose>
							<c:when test="${member_dto == null}">
								<a href="../member/login.do">로그인</a>
							</c:when>
							<c:otherwise>
								<a href="../member/logout.do">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</li>
					<li><input class="form-control search" placeholder=" Search" type="text" style="cursor:pointer;"></li>
				</ul>
			</div>
		</div>
	</header>
	<!--header end-->


    <!-- Sequence Modern Slider -->
    <div id="da-slider" class="da-slider">

            <div class="da-slide">
            <div class="container">
              <div class="row">
                <div class="col-md-12">
              <h2>
                <i>우리아이의 성향은?</i>
              </h2>
              <p>
                <i>지금 테스트 해보세요!</i>
              </p>
              <a href="#" class="btn btn-info btn-lg da-link">
                테스트하기
              </a>
              <div class="da-img">
                <img src="img/parallax-slider/images/2.png" alt="image01" />
              </div>
            </div>
          </div>
        </div>
      </div>


            <div class="da-slide">
            <div class="container">
        <div class="row">
          <div class="col-md-12">
        <h2>
          <i>RESPONSIVE VIDEO</i>
            <br />
          <i>SUPPORT AND</i>
            <br />
          <i>MANY MORE</i>
        </h2>
        <p>
          <i>Lorem ipsum dolor amet</i>
            <br />
          <i>tempor incididunt ut</i>
        </p>
        <a href="#" class="btn btn-info btn-lg da-link">
          Read more
        </a>
        <div class="da-img">
          <img src="img/parallax-slider/images/3.png" alt="image01" />
        </div>
      </div>
          </div>
        </div>
      </div>


      <div class="da-slide">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
        <h2>
          <i>USING BEST WEB</i>
            </br>
          <i>SOLUTIONS WITH</i>
            </br>
          <i>HTML5/CSS3</i>
        </h2>
        <p>
          <i>Lorem ipsum dolor amet</i>
          <br />
          <i>tempor incididunt ut</i>
          <br />
          <i>veniam omnis </i>
        </p>
        <a href="#" class="btn btn-info btn-lg da-link">
          Read more
        </a>
        <div class="da-img">
          <img src="img/parallax-slider/images/1.png" alt="image01" />
        </div>
      </div>
      </div>
      </div>
      </div>

      <nav class="da-arrows">
        <span class="da-arrows-prev">
        </span>
        <span class="da-arrows-next">
        </span>
      </nav>
    </div>



      <!--recent work start-->
    <div class="bg-lg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 recent">
            <h3 class="recent-work">
              Recent Work
            </h3>
            <p>Some of our work we have done earlier</p>
            <div id="owl-demo" class="owl-carousel owl-theme wow fadeIn">

              <div class="item view view-tenth">
                <img src="img/works/img8.jpg" alt="work Image">
                <div class="mask">
                  <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                    <i class="fa fa-link">
                    </i>
                  </a>
                </div>
              </div>
              <div class="item view view-tenth">
                <img src="img/works/img9.jpg" alt="work Image">
                <div class="mask">
                  <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                    <i class="fa fa-link">
                    </i>
                  </a>
                </div>
              </div>
              <div class="item view view-tenth">
                <img src="img/works/img10.jpg" alt="work Image">
                <div class="mask">
                  <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                    <i class="fa fa-link">
                    </i>
                  </a>
                </div>
              </div>
              <div class="item view view-tenth">
                <img src="img/works/img11.jpg" alt="work Image">
                <div class="mask">
                  <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                    <i class="fa fa-link">
                    </i>
                  </a>
                </div>
              </div>
              <div class="item view view-tenth">
                <img src="img/works/img12.jpg" alt="work Image">
                <div class="mask">
                  <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                    <i class="fa fa-link">
                    </i>
                  </a>
                </div>
              </div>
              <div class="item view view-tenth">
                <img src="img/works/img13.jpg" alt="work Image">
                <div class="mask">
                  <a href="blog-detail.html" class="info" data-toggle="tooltip" data-placement="top" title="Details">
                    <i class="fa fa-link">
                    </i>
                  </a>
                </div>
              </div>


            </div>
          </div>
        </div>
      </div>
      <!--recent work end-->
    </div>

	<!--footer start-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-sm-3 address wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">
					<h1>
						센터 정보
					</h1>
					<address>
						<p><i class="fa fa-home pr-10"></i>주소: 서울시 송송구 어린이길 어린이로 123번길 </p>
						<p><i class="fa fa-mobile pr-10"></i>전화 : 02-1578-1234 </p>
						<p><i class="fa fa-phone pr-10"></i>팩스 : 02-1578-1235 </p>
						<p><i class="fa fa-envelope pr-10"></i>이메일 :   <a href="javascript:;">support@kidcenter.com</a></p>
					</address>
				</div>
				<div class="col-lg-3 col-sm-3 address wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">
					<h1>
						영업 시간
					</h1>
					<address>
						<p><i></i>영업 : <br>매 주 화 ~ 일요일 09:00 am - 06:00 pm </p>
						<p><i></i>휴관 : <br>매 주 월요일 및 공휴일 </p>
					</address>
				</div>
				<div class="col-lg-3 col-sm-3 address wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">
					<h1>
						소식 받기
					</h1>
					<address>
						<p><i></i>매 달 1일 소식 받기 </p>
						<div>
							<input type="text" placeholder="이메일주소">
							<button type="button">SignUp</button>
						</div>
					</address>
				</div>
				<div class="col-lg-3 col-sm-3 address wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">
					<h1>
						기타 내용
					</h1>
					<address>
						<p><i></i>어쩌구 저쩌구</p>
						<p><i></i>어쩌구 저쩌구</p>
					</address>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer end -->
	
	<!--small footer start -->
	<footer class="footer-small">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-sm-6 pull-right">
					<ul class="social-link-footer list-unstyled">
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".1s"><a href="#"><i class="fa fa-facebook"></i></a></li>
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".2s"><a href="#"><i class="fa fa-google-plus"></i></a></li>
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".3s"><a href="#"><i class="fa fa-dribbble"></i></a></li>
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".4s"><a href="#"><i class="fa fa-linkedin"></i></a></li>
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".5s"><a href="#"><i class="fa fa-twitter"></i></a></li>
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".6s"><a href="#"><i class="fa fa-skype"></i></a></li>
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".7s"><a href="#"><i class="fa fa-github"></i></a></li>
					    <li class="wow flipInX" data-wow-duration="2s" data-wow-delay=".8s"><a href="#"><i class="fa fa-youtube"></i></a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<div class="copyright">
						<p>Shared by <i class="fa fa-love"></i><a href="https://bootstrapthemes.co">BootstrapThemes</a></p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!--small footer end-->

    <!-- js placed at the end of the document so the pages load faster
	<script src="js/jquery.js">
	</script>
	-->
	<script src="js/jquery-1.8.3.min.js">
	</script>
	<script src="js/bootstrap.min.js">
	</script>
	<script type="text/javascript" src="js/hover-dropdown.js">
	</script>
	<script defer src="js/jquery.flexslider.js">
	</script>
	<script type="text/javascript" src="assets/bxslider/jquery.bxslider.js">
	</script>
	
	<script type="text/javascript" src="js/jquery.parallax-1.1.3.js">
	</script>
	<script src="js/wow.min.js">
	</script>
	<script src="assets/owlcarousel/owl.carousel.js">
	</script>
	
	<script src="js/jquery.easing.min.js">
	</script>
	<script src="js/link-hover.js">
	</script>
	<script src="js/superfish.js">
	</script>
	<script type="text/javascript" src="js/parallax-slider/jquery.cslider.js">
	</script>
	<script type="text/javascript">
		$(function() {
			$('#da-slider').cslider({
				autoplay    : true,
				bgincrement : 100
			});
		});
	</script>
	
	<!--common script for all pages-->
	<script src="js/common-scripts.js">
	</script>
	
	<script type="text/javascript">
		jQuery(document).ready(function() {
			$('.bxslider1').bxSlider({
				minSlides: 5,
				maxSlides: 6,
				slideWidth: 360,
				slideMargin: 2,
				moveSlides: 1,
				responsive: true,
				nextSelector: '#slider-next',
				prevSelector: '#slider-prev',
				nextText: 'Onward →',
				prevText: '← Go back'
			});
		});
	</script>
	
	
	<script>
		$('a.info').tooltip();
		
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation: "slide",
				start: function(slider) {
					$('body').removeClass('loading');
				}
			});
		});
		
		$(document).ready(function() {
			$("#owl-demo").owlCarousel({
				items : 4
			});
		});
		
		jQuery(document).ready(function(){
			jQuery('ul.superfish').superfish();
		});
		
		new WOW().init();
	</script>
</body>
</html>