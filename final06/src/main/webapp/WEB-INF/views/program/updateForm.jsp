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
						프로그램 수정
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
		<h1 id="forms" class="page-header" style="text-align: center;">프로그램 수정하기</h1>
		<div class="bs-programform">
			<form role="form" name="programfrm" id="programfrm"  method="POST" action="update.do" onsubmit="return updateCheck()" enctype="multipart/form-data">
				<div class="form-group">
					<label>프로그램코드 (수정불가)</label><br>
					<input type="radio" name="obj_code" id="obj_code" value="A" ${dto.obj_code eq 'A' ? 'checked' : ''} onclick="return false;" readonly>&nbsp;미술&nbsp;&nbsp;&nbsp;
					<input type="radio" name="obj_code" id="obj_code" value="S" ${dto.obj_code eq 'S' ? 'checked' : ''} onclick="return false;" readonly>&nbsp;체육&nbsp;&nbsp;&nbsp;
					<input type="radio" name="obj_code" id="obj_code" value="E" ${dto.obj_code eq 'E' ? 'checked' : ''} onclick="return false;" readonly>&nbsp;교육&nbsp;&nbsp;&nbsp;
					<input type="radio" name="obj_code" id="obj_code" value="M" ${dto.obj_code eq 'M' ? 'checked' : ''} onclick="return false;" readonly>&nbsp;음악&nbsp;&nbsp;&nbsp;
					<input type="hidden" name="pro_obj" id="pro_obj" value="${dto.pro_obj}">
				</div>
				<div class="form-group">
					<label>프로그램 이름</label><br>
					<input type="text" class="form-control short" name="pro_name" id="pro_name" value="${dto.pro_name}">
				</div>
				<div class="form-group">
					<label>프로그램 성향 (중복선택 가능)</label><br>
					<input type="checkbox" name="prochar_no" value="pro_IE" ${dto.prochar_no.contains('pro_IE') ? 'checked' : ''}>&nbsp;기린(IE형)&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="prochar_no" value="pro_II" ${dto.prochar_no.contains('pro_II') ? 'checked' : ''}>&nbsp;늑대(II형)&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="prochar_no" value="pro_EE" ${dto.prochar_no.contains('pro_EE') ? 'checked' : ''}>&nbsp;사자(EE형)&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="prochar_no" value="pro_EI" ${dto.prochar_no.contains('pro_EI') ? 'checked' : ''}>&nbsp;양(EI형)&nbsp;&nbsp;&nbsp;
				</div>
				<div class="form-group">
					<label>프로그램 정원</label><br>
					<input type="number" class="form-control short" name="pro_limit" id="pro_limit" value="${dto.pro_limit}">
				</div>
				<div class="form-group">
					<label>수강료</label><br>
					<input type="text" class="form-control short" name="pro_fee" id="pro_fee" value="${dto.pro_fee}">
				</div>
				<div class="form-group">
					<label>접수기간</label><br>
					<input type="date" class="form-control date" name="prorec_start" id="prorec_start" value="${dto.prorec_start}"> &nbsp;~&nbsp;
					<input type="date" class="form-control date" name="prorec_end" id="prorec_end" value="${dto.prorec_end}">
				</div>
				<div class="form-group">
					<label>수강기간</label><br>
					<input type="date" class="form-control date" name="proper_start" id="proper_start" value="${dto.proper_start}"> &nbsp;~&nbsp;
					<input type="date" class="form-control date" name="proper_end" id="proper_end" value="${dto.proper_end}">
				</div>
				<div class="form-group">
					<label>수강요일</label><br>
					<input type="checkbox" name="pro_day" id="pro_day" value="Tue" ${dto.pro_day.contains('Tue') ? 'checked' : ''}>&nbsp;화&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Wed" ${dto.pro_day.contains('Wed') ? 'checked' : ''}>&nbsp;수&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Thu" ${dto.pro_day.contains('Thu') ? 'checked' : ''}>&nbsp;목&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Fri" ${dto.pro_day.contains('Fri') ? 'checked' : ''}>&nbsp;금&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Sat" ${dto.pro_day.contains('Sat') ? 'checked' : ''}>&nbsp;토&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="pro_day" id="pro_day" value="Sun" ${dto.pro_day.contains('Sun') ? 'checked' : ''}>&nbsp;일&nbsp;&nbsp;&nbsp;
				</div>
				<div class="form-group">
					<label>수강 적정 연령</label><br>
					<input type="text" class="form-control short" name="pro_age" id="pro_age"  value="${dto.pro_age}">
				</div>
				<div class="form-group">
					<label>프로그램 설명</label><br>
					<input type="text" class="form-control" name="pro_exp" id="pro_exp"  value="${dto.pro_exp}">
				</div>
				<div class="form-group">
					<label>썸네일 이미지</label>
					<input type="file" id="pro_posterMF" name="pro_posterMF">
				</div>
				<div class="form-group">
					<label>본문 이미지</label>
					<input type="file" id="pro_imgMF" name="pro_imgMF">
				</div>
				<button type="submit" class="btn btn-success">수정</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
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
