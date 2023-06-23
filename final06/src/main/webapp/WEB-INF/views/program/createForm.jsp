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
						프로그램 등록
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
		<h1 id="forms" class="page-header" style="text-align: center;">프로그램 등록하기</h1>
		<div class="bs-programform">
			<form role="form" name="programfrm" id="programfrm"  method="POST" action="create.do" enctype="multipart/form-data">
				<div class="form-group">
					<label>프로그램코드<br>
					(A:미술  S:체육  E:교육  M:음악)</label>
					<input type="text" class="form-control short" name="pro_obj" id="pro_obj">
				</div>
				<div class="form-group">
					<label>프로그램 이름</label><br>
					<input type="text" class="form-control short" name="pro_name" id="pro_name">
				</div>
				<div class="form-group">
					<label>프로그램 성향</label><br>
					<input type="checkbox" name="prochar_no" value="pro_IE">&nbsp;주변참여형(IE형)&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="prochar_no" value="pro_II">&nbsp;혼자할래요형(II형)&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="prochar_no" value="pro_EE">&nbsp;함께할래요형(EE형)&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="prochar_no" value="pro_EI">&nbsp;조용한인싸형(EI형)&nbsp;&nbsp;&nbsp;
				</div>
				<div class="form-group">
					<label>프로그램 정원</label><br>
					<input type="number" class="form-control short" name="pro_limit" id="pro_limit">
				</div>
				<div class="form-group">
					<label>수강료</label><br>
					<input type="text" class="form-control short" name="pro_fee" id="pro_fee">
				</div>
				<div class="form-group">
					<label>접수기간</label><br>
					<input type="date" class="form-control date" name="prorec_start" id="prorec_start"> &nbsp;~&nbsp;
					<input type="date" class="form-control date" name="prorec_end" id="prorec_end">
				</div>
				<div class="form-group">
					<label>수강기간</label><br>
					<input type="date" class="form-control date" name="proper_start" id="proper_start"> &nbsp;~&nbsp;
					<input type="date" class="form-control date" name="proper_end" id="proper_end">
				</div>
				<div class="form-group">
					<label>수강요일</label><br>
					<input type="checkbox" name="pro_day" id="pro_day" value="Tue">&nbsp;화&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Wed">&nbsp;수&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Thu">&nbsp;목&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Fri">&nbsp;금&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Sat">&nbsp;토&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Sun">&nbsp;일&nbsp;&nbsp;&nbsp;
				</div>
				<div class="form-group">
					<label>수강 적정 연령</label><br>
					<input type="text" class="form-control short" name="pro_age" id="pro_age" placeholder="만 3~4세">
				</div>
				<div class="form-group">
					<label>프로그램 설명</label><br>
					<input type="text" class="form-control" name="pro_exp" id="pro_exp" placeholder="간단한 설명을 덧붙여보세요!">
				</div>
				<div class="form-group">
					<label>썸네일 이미지</label>
					<input type="file" id="pro_posterMF" name="pro_posterMF">
				</div>
				<div class="form-group">
					<label>본문 이미지</label>
					<input type="file" id="pro_imgMF" name="pro_imgMF">
				</div>
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
