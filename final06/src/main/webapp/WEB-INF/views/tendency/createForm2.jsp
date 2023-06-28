<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 tendency -- createForm.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
   <div class="container">
      <div class="row">
         <div class="col-lg-4 col-sm-4">
            <h1>
               관리자페이지
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
               		관리자페이지
               </li>
               <li class="">
                  MBTi 등록
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!--container start-->
<div class="registration-bg">
	<div class="container">
		<form class="form-signin wow fadeInUp" method="POST" action="create.do">
			<h2 class="form-signin-heading">MBTi 등록</h2>
			<div class="login-wrap">
				<div>
					<span style="font-weight: bold;">성향 타입</span><br>
					<input type="radio" name="typename" id="typename" value="EE" onclick="setTypeAnimal(this.value);">&nbsp;사자&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="typename" id="typename" value="EI" onclick="setTypeAnimal(this.value);">&nbsp;양&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="typename" id="typename" value="IE" onclick="setTypeAnimal(this.value);">&nbsp;기린&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="typename" id="typename" value="II" onclick="setTypeAnimal(this.value);">&nbsp;늑대&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<br>
				<div>
					<span style="font-weight: bold;">성향 이름 (자동선택)</span><br>
					<input type="text" name="typeanimal" id="typeanimal" readonly>
				</div>
				<br>	
				<div>
					<span style="font-weight: bold;">성향 설명</span><br>
					<textarea name="typeexp" id="typeexp" placeholder="설명을 입력하세요."></textarea>
				</div>
				<br>
				<div>
					<span style="font-weight: bold;">성향 특징 (10글자 이내)</span><br>
					<input type="text" name="typespec1" id="typespec1" placeholder="필수X">
				</div>
				<br>
				<div>
					<span style="font-weight: bold;">성향 특징 (10글자 이내)</span><br>
					<input type="text" name="typespec2" id="typespec2" placeholder="필수X">
				</div>
				<br>
				<div>
					<span style="font-weight: bold;">성향 특징 (10글자 이내)</span><br>
					<input type="text" name="typespec3" id="typespec3" placeholder="필수X">
				</div>
				<br>
				<div>
					<span style="font-weight: bold;">성향 특징 (10글자 이내)</span><br>
					<input type="text" name="typespec4" id="typespec4" placeholder="필수X">
				</div>
				<br>
				<button class="btn btn-lg btn-login btn-block" type="submit">추가하기</button>
			</div>
		</form>
	</div>
</div>
<!--container end-->
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
	function setTypeAnimal(value) {
		//let typeAnimalInput = document.getElementById("typeanimal");
		//typeAnimalInput.value = value;
		//if(typename == "");
		
		let typename = value;
		
		if(typename == "EE") {
			$("#typeanimal").val("사자");
		} else if(typename == "EI") {
			$("#typeanimal").val("양");
		} else if(typename == "IE") {
			$("#typeanimal").val("기린");
		} else if(typename == "II") {
			$("#typeanimal").val("늑대");
		} // if end
	}
</script>
<%@ include file="../footer.jsp" %>
