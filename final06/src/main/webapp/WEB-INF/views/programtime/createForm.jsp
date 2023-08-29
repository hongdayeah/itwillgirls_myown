<%@page import="java.util.List"%>
<%@page import="kr.co.itwill.teacher.TeacherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 programtime -- createForm.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리센터 프로그램을 소개합니다
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
							프로그램
						</a>
					</li>
					<li class="">
						프로그램 타임 추가
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<div class="btn-position">
	<button class="btn btn-default" onclick="javascript:history.back()">뒤로가기</button>
</div>
<br>
<br>
<br>
  
<div class="container privacy-terms">
	<div class="bs-docs-section mar-b-30">
		<h1 id="forms" class="page-header" style="text-align: center;">프로그램 등록하기</h1>
		<div class="bs-programform">
			<form role="form" name="protimefrm" id="protimefrm"  method="POST" action="create.do" onsubmit="return createCheck()"enctype="multipart/form-data">
				<div class="form-group">
					<label>프로그램코드<br>
					<input type="text" class="form-control short" name="pro_obj" id="pro_obj" value="${requestScope.pro_obj}" readonly>
				</div>
				<div class="form-group">
					<label>수강타임</label><br>
					<input type="radio" id="pro_time" name="pro_time" value="10:00">&nbsp;10:00&nbsp;&nbsp;&nbsp;
					<input type="radio" id="pro_time" name="pro_time" value="14:00">&nbsp;14:00&nbsp;&nbsp;&nbsp;
				</div>
				<div class="form-group">
					<label>장소</label><br>
					<!-- room_class테이블에서 행 개수만큼 갖고오기 -->
					<c:forEach var="i" items="${cdto}">
						<input type="radio" id="class_code" name="class_code" value="${i.class_code}">&nbsp;${i.class_name}&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</div>
				<div class="form-group">
					<label>담당강사</label><br>
					<!-- teacher테이블에서 행 개수만큼 갖고오고싶어요  -->
					<select id="t_code" name="t_code">
						<option selected>--강사님--</option>
						<c:forEach var="i" items="${tdto}">
							<option value="${i.t_code}">${i.t_name}</option>
						</c:forEach>
					</select>
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
	function createCheck(){
		if(confirm("등록하시겠습니까?")){
			alert("등록되었습니다.");
			return true;
		}else{
			return false;
		}
	}
</script>
<%@ include file="../footer.jsp" %>
