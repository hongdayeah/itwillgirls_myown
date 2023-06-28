<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 test -- sungtest.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리아이의 성향은? 테스트하기
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
						<a href="main.do">
							MBTi테스트
						</a>
					</li>
					<li class="">
						테스트하기
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<!--container start-->
<div class="registration-bgtest">
	<div class="container">
		<form class="form-signintest wow fadeInUp" method="POST" action="supdate.do">
			<h2 class="form-signin-headingtest">테스트[1부]</h2>
			<input type="hidden" name="k_no" id="k_no" value="${k_no}">
			<div class="login-wraptest">
				<span>우리 아이는${k_no}</span>
				어쩌구다
				<button class="btn btn-lg btn-login btn-block" type="submit">추가하기</button>
			</div>
		</form>
	</div>
</div>


<!--container end-->

<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
