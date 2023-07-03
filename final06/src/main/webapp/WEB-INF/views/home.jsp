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
		도담도담어린이문화센터
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
				<a class="navbar-brand" href="../home.do" style="text-align:center;">도담도담<br>어린이문화센터</span></a>
			</div>
			<div class="navbar-collapse collapse">
				
				<ul class="nav navbar-nav">
				<c:choose>
					<c:when test="${member_dto != null}">
						<div style="text-align:right;">
							<b>반갑습니다, '${member_dto.p_name} (${member_dto.p_id})' 님</b>
						</div>
					</c:when>
				<c:otherwise><div></div></c:otherwise>
				</c:choose>
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
								<a href="../test/main.do">성향테스트하기</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="../performance/list.do">공연  </a>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
						"dropdown" data-toggle="dropdown" href="#">시설 <i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<!-- 
							<li>
								<a href="../#">프로그램 예약</a>
							</li>
							<li>
								<a href="../#">공연 예매</a>
							</li>
							 --><li>
							<a href="../where/classroom.do">공간 소개</a> <!-- where/about.do -->
						</li>
						<li>
							<a href="../rent/info.do">대관 신청</a>
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
								<a href="../faq/list.do">자주 묻는 질문</a>
							</li>
							<li>
								<a href="../qna/list.do">문의하기</a>
							</li>
						</ul>
					</li>
					<li class="dropdown">
					<!-- 마이페이지의 경우 글자에 링크거는것보다 마이페이지 아이콘 이미지에 링크거는것도 좋을것 같음 -->
					<c:choose>
						<c:when test="${member_dto != null}">
							<!-- 관리자에게만 보이는 페이지 -->
							<c:if test="${member_dto.p_id == 'webmaster'}">
							<a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
								"dropdown" data-toggle="dropdown" href="#">관리자페이지 <i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="../member/memberList.do">회원목록</a>
								</li>
								<li>
									<a href="../tendency/adminlist.do">MBTi타입 목록</a>
								</li>
							</ul>
							</c:if>
							
							<!-- 일반 회원에게만 보이는 페이지 -->
							<c:if test="${member_dto.p_id != 'webmaster'}">
							<a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
							"dropdown" data-toggle="dropdown" href="#">마이페이지 <i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu">
								<li>
									<a href="../program/myLikeList.do">나의 관심내역</a>
								</li>
								<li>
									<a href="../cart/list">나의 장바구니</a>
								</li>
								<li>
									<a href="../order/myorderlist">나의 예매내역</a>
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
							</ul>
							</c:if>
						</c:when>
					</c:choose>
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
					<!-- 
					<li><input class="form-control search" placeholder=" Search" type="text" style="cursor:pointer;"></li>  -->
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
              <a href="../test/main.do" class="btn btn-info btn-lg da-link">
                테스트하기
              </a>
              <div class="da-img">
                <img style="width: 400px;" src="img/parallax-slider/images/TEST.png" alt="image01" />
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
          <i>이 달의 추천 공연</i>
        </h2>
        <p>
          <i>2023. 07. 29(토)</i>
          <br>
          <i>17:00</i>
          <br>          
          <i>발레와 국악의 조합 <마블링></i>
        </p>
        <a href="../performance/read.do?per_code=P002" class="btn btn-info btn-lg da-link">
          보러 가기
        </a>
        <div class="da-img">
          <img style="width: 350px;" src="../perstorage/마블링포스터.png" alt="performance" />
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
          <i>시설 대관을 원하시나요?</i>
        </h2>
        <p>
          <i>자세한 사항은 '대관 안내'를 통해 확인하세요.</i>
          <br />
          <i></i>
          <br />
          <i></i>
        </p>
        <a href="../rent/info.do" class="btn btn-info btn-lg da-link">
          대관 안내
        </a>
        <div class="da-img">
          <img style="width: 350px;" src="img/parallax-slider/images/seat_color.png" alt="rent" />
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
      <!--    프로그램   -->
      
    <div class="bg-lg">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 recent">
            <h3 class="recent-work">
              프로그램 | <a href="../approachSelect.do">공연</a>
            </h3>
            <p> <a href="../currentSelect.do">최신순</a> | <a href="../clickSelect.do">조회순</a> | <a href="../likeSelect.do">관심순</a> </p>
            <div id="owl-demo" class="owl-carousel owl-theme wow fadeIn">
            
				<!-- 최신순 시작 -->
				<c:forEach var="current_dto" items="${current}">
	              <div class="item view view-tenth">
	                <img class="grid-image" style="height: 180px; width: 230px;" src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${current_dto.pro_poster}" alt="${current_dto.pro_poster}"/>
	                <div class="mask">
	                  <a href="../program/read.do?pro_obj=${current_dto.pro_obj}" class="info" data-toggle="tooltip" data-placement="top" title="${current_dto.pro_name}">
	                    <i class="fa fa-link">
	                    </i>
	                  </a>
	                </div>
	              </div>
				</c:forEach>
				<!-- 최신순 종료 -->

            </div>
          </div>
        </div>
      </div>
    </div>
    <!--recent work end-->
    

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
						센터 소식
					</h1>
					<address>
						<p><a href="../faq/list.do">자주 묻는 질문</a></p>
					</address>
				</div>
				<div class="col-lg-3 col-sm-3 address wow fadeInUp" data-wow-duration="2s" data-wow-delay=".1s">
					<h1>
						기타 내용
					</h1>
					<address>
						<p><a href="../agree_1.do">이용 약관</a></p>
						<p><a href="../agree_2.do">개인정보처리방침</a></p>
					</address>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer end -->
	
	<!--small footer start -->
	<!-- 
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
	-->
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