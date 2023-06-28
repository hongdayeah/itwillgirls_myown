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
				<p style="font-weight: bold; color: #3A3A3A;">자녀 이름 : ${k_name}</p><br><br>
				<!-- forEach문으로 제어하려고 했는데 그렇게 하면 Controller로 넘길 때 내가 힘들어서.. 바꿈 -->
				<c:set var="name" value="${fn:substring(k_name, 1, 4)}"></c:set>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[0]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-0" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-0" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[1]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-1" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-1" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[2]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-2" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-2" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[3]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-3" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-3" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[4]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-4" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-4" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[5]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-5" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-5" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[6]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-6" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-6" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[7]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-7" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-7" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[8]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-8" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-8" value="0">&nbsp;아니다
				</p>
				<br>
				<p style="color: #4F4F4F;">${name}는(은) ${srandlist[9]}</p>
				<p style="font-weight: bold; color: #545454;">
					<input type="radio" name="sresult-9" value="1">&nbsp;그렇다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="sresult-9" value="0">&nbsp;아니다
				</p>
				<br>
				<button class="btn btn-lg btn-login btn-block" type="submit">다음으로 넘어가기</button>
			</div>
		</form>
	</div>
</div>


<!--container end-->

<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
