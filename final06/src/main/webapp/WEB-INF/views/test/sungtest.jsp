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
		<form class="form-signintest wow fadeInUp" action="">
			<h2 class="form-signin-headingtest">MBTi 테스트 [1부]</h2>
			<div class="login-wraptest">
				<p>해당되는 곳에 체크해주세요.</p>
				<div>
					<span style="font-weight: bold;">우리아이는 어쩌구다.</span>
				</div>
				<input type="text" class="form-control" placeholder="Full Name" autofocus>
				<input type="text" class="form-control" placeholder="Address" autofocus>
				<input type="text" class="form-control" placeholder="Email" autofocus>
				<input type="text" class="form-control" placeholder="City/Town" autofocus>
				<div class="radios">
					<label class="label_radio col-lg-6 col-sm-6" for="radio">
						<input name="male-radio" id="radio-01" value="1" type="radio" checked=""> Male
					</label>
					<label class="label_radio col-lg-6 col-sm-6" for="radio">
						<input name="female-radio" id="radio-02" value="1" type="radio"> Female
					</label>
				</div>
				
				<p> Enter account details below</p>
				<input type="text" class="form-control" placeholder="User Name" autofocus>
				<input type="password" class="form-control" placeholder="Password">
				<input type="password" class="form-control" placeholder="Re-type Password">
				<label class="checkbox">
					<input type="checkbox" value="agree this condition"> I agree to the Terms of Service and Privacy Policy
				</label>
				<button class="btn btn-lg btn-login btn-block" type="submit">Submit</button>
			</div>
		</form>
	</div>
</div>
<!--container end-->

<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
