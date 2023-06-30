<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 program -- updateForm.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리센터 강사님을 소개합니다
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
						<a href="list.do">
							강사
						</a>
					</li>
					<li class="">
						강사 수정
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
		<h1 id="forms" class="page-header" style="text-align: center;">강사 수정하기</h1>
		<div class="bs-programform">
			<form role="form" name="teacherfrm" id="teacherfrm"  method="POST" action="update.do" enctype="multipart/form-data" onsubmit="return updateCheck()">
				<div class="form-group">
					<label>강사 코드</label>
					<input type="text" class="form-control short" name="t_code" id="t_code" value="${dto.t_code}">
				</div>
				<div class="form-group">
					<label>강사 이름</label><br>
					<input type="text" class="form-control short" name="t_name" id="t_name" value="${dto.t_name}">
				</div>
				<div class="form-group">
					<label>연락처</label><br>
					<input type="text" class="form-control short" name="t_phone" id="t_phone" value="${dto.t_phone}">
				</div>
				<div class="form-group">
					<label>생년월일</label><br>
					<input type="text" class="form-control short" name="t_birth" id="t_birth" value="${dto.t_birth}">
				</div>
				<div class="form-group">
					<label>성별</label><br>
					<input type="radio" name="t_gender" id="t_gender" value="1">남자
					<input type="radio" name="t_gender" id="t_gender" value="2">여자
				</div>
				<div class="form-group">
					<label>사진</label>
					<input type="file" id="t_photoMF" name="t_photoMF">
				</div>
				<button type="submit" class="btn btn-success">수정</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- 본문 끝 -->
<!-- JavaScript함수 -->
<script>
	function updateCheck(){
		if(confirm("수정하시겠습니까?")){
			alert("수정이 완료되었습니다.");
			return true;
		}else{
			return false;
		}
	}
</script>        
<%@ include file="../footer.jsp" %>
