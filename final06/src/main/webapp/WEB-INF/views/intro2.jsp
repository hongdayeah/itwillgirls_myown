<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	</style>
</head>
<body>
	<!-- header -->
	<div class="jumbotron text-center" style="margin-bottom:0">
		<h1>어린이 문화센터</h1>

		<!-- 로그인 전 -->
				<c:if test="${SessionScope.id==null}">
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#login">로그인</button>

					<!-- Modal -->
					<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="loginLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h5 class="modal-title" id="loginLabel">로그인/회원가입</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>

								<!-- Modal Body -->
								<div class="modal-body">
									<form action="" class="was-validated">
										<div class="form-group">
											<label for="memberId">ID</label> <input type="text" class="form-control" id="memberId" placeholder="아이디를 입력하세요" name="memberId" required>
											<div class="valid-feedback">확인</div>
											<div class="invalid-feedback">아이디를 입력해주세요</div>
										</div><!-- form-group end -->
										
										<div class="form-group">
											<label for="memberPw">PASSWORD</label>
											<input type="password" class="form-control" id="userPw" placeholder="비밀번호를 입력하세요" name="memberPw" required>
											<div class="valid-feedback">확인</div>
											<div class="invalid-feedback">비밀번호를 입력해주세요</div>
										</div><!-- form-group end -->

										<label><input type="checkbox" name="c_mid" value="SAVE" style="font-size: 5px">&nbsp;&nbsp;ID 저장</label>
										<br><br><br>
										
										<input class="button" type="button" value="ID/Password 찾기" onclick="location.href='#'">
										
										<button type="submit" class="btn btn-primary" style="margin-left: 30%;">로그인</button>
										<button type="button" class="btn btn-secondary" onclick="location.href='/member/join.do'">회원가입</button>

									</form>

								</div><!-- modal-body end -->

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								</div><!-- modal-footer end -->

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
						<a class="dropdown-item" onclick="location.href='/program/list'">프로그램 소개</a>
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
						<a class="dropdown-item" href="/rent/create.do">대관 신청</a>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						소식
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a>
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
<div class="container" style="margin-top:30px">
	<div>
		<span>이미지</span>
	</div>
</div>
<div class="container">
	<span>프로그램 소개</span>
	
<!--  움직이는 상자 시작 -->

 	<div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    
     <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
      </div>
      <div class="item">
        <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
      </div>
      <div class="item">
        <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
      </div>
    </div>
    
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>

<!--  움직이는 상자 끝 -->
    
</div>
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