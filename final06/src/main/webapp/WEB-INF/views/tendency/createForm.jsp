<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 program -- createForm.jsp -->
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
						<a href="adminlist.do">
							MBTi 관리
						</a>
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
<div class="btn-position">
	<button class="btn btn-default" onclick="location.href='list.do'">목록돌아가기</button>
</div>
<br>    
<br>

<div class="container privacy-terms">
	<div class="bs-docs-section mar-b-30">
		<h1 id="forms" class="page-header" style="text-align: center;">MBTi 등록</h1>
		<div class="bs-programform">
			<form role="form" name="mbtifrm" id="mbtifrm"  method="POST" action="create.do" enctype="multipart/form-data">
				<div class="form-group">
					<label>성향타입</label>
					<input type="radio" name="typename" id="typename" value="EE" onclick="setTypeAnimal(this.value);">&nbsp;사자&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="typename" id="typename" value="EI" onclick="setTypeAnimal(this.value);">&nbsp;양&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="typename" id="typename" value="IE" onclick="setTypeAnimal(this.value);">&nbsp;기린&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="typename" id="typename" value="II" onclick="setTypeAnimal(this.value);">&nbsp;늑대&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div class="form-group">
					<label>성향이름 (자동선택)</label><br>
					<input type="text" class="form-control" name="typeanimal" id="typeanimal" readonly>
				</div>
				<div class="form-group">
					<label>성향설명</label><br>
					<textarea name="typeexp" class="form-control" id="typeexp" placeholder="설명을 입력하세요."></textarea>
				</div>
				<div class="form-group">
					<label>성향특징1(간략서술)</label><br>
					<input type="text" class="form-control" name="typespec1" id="typespec1" placeholder="필수X">
				</div>
				<div class="form-group">
					<label>성향특징2(간략서술)</label><br>
					<input type="text" class="form-control" name="typespec2" id="typespec2" placeholder="필수X">
				</div>
				<div class="form-group">
					<label>성향특징3(간략서술)</label><br>
					<input type="text" class="form-control" name="typespec3" id="typespec3" placeholder="필수X">
				</div>
				<div class="form-group">
					<label>성향특징4(간략서술)</label><br>
					<input type="text" class="form-control" name="typespec4" id="typespec4" placeholder="필수X">
				</div>
				<div class="form-group">
					<label>사진</label>
					<input type="file" id="typeimgMF" name="typeimgMF">
				</div>
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
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
