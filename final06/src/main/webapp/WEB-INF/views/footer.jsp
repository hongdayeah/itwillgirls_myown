<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<script>
	//로그인 모달창 호출 함수
	function openLoginModal(){
		$('.modal-content').load("/member/memberLoginForm");
	}//openLoginModal() end
	</script>
</body>
</html>