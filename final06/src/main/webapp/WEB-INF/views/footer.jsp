<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
						<p><a href="../agree_1">이용 약관</a></p>
						<p><a href="../agree_2">개인정보처리방침</a></p>
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
<script src="../js/jquery.js">
</script>
-->
<script src="../js/jquery-1.8.3.min.js">
</script>
<script src="../js/bootstrap.min.js">
</script>
<script type="text/javascript" src="../js/hover-dropdown.js">
</script>
<script defer src="../js/jquery.flexslider.js">
</script>
<script type="text/javascript" src="../assets/bxslider/jquery.bxslider.js">
</script>

<script type="text/javascript" src="../js/jquery.parallax-1.1.3.js">
</script>
<script src="../js/wow.min.js">
</script>
<script src="../assets/owlcarousel/owl.carousel.js">
</script>

<script src="../js/jquery.easing.min.js">
</script>
<script src="../js/link-hover.js">
</script>
<script src="../js/superfish.js">
</script>
<script type="text/javascript" src="../js/parallax-slider/jquery.cslider.js">
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
<script src="../js/common-scripts.js">
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