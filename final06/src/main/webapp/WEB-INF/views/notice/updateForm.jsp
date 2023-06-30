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
					NOTICE
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
							소식
						</a>
					</li>
					<li class="create">
						공지사항
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->



<h1 id="forms" class="page-header" style="text-align: center;">공지 수정</h1>
<div class="container privacy-terms">
	<div class="bs-docs-section mar-b-30">
	<form role="form" name="notfrm" id="notfrm"  method="POST" action="update.do" onsubmit="return qnaCheck()">
	 <input type="hidden" name="not_no" id="not_no" value=${requestScope.not_no}>
		<div class="bs-programform">
				<div class="form-group">
					<label>카테고리</label><br>
				  <select id="not_cate" name="not_cate" required>
				    <option value="N" ${dto.not_cate == 'N' ? 'selected' : ''}>전체공지</option>
				    <option value="E" ${dto.not_cate == 'E' ? 'selected' : ''}>이벤트</option>
				  </select>
				</div>
			<div class="form-group">
			  <label for="not_sub">제목</label><br>
			  <input type="text" name="not_sub" id="not_sub" value="${dto.not_sub}" class="form-control" maxlength="20">
			</div>
			<div class="form-group">
			  <label for="not_con">내용</label><br>
			  <textarea class="form-control" name="not_con" id="not_con" rows="15">${dto.not_con}</textarea>
			<br>
 			<input type="file" name="not_filenameMF" size="100">
 			
 			</div>
			<div style="text-align:center;">
			 		<input type="submit" value="등록" class="btn btn-success" style="align:center;">&nbsp;&nbsp;&nbsp;&nbsp;
			 		<input type="reset" value="취소" class="btn btn-danger" style="align:center;">
			</div>
			
			 <br>
			  <br>
			</form>
		</div>
	</div>


 
 <script>
 	function updateCheck(){
 		let message="기존에 작성한 공지는 삭제됩니다. 수정하시겠습니까?"
 		if(confirm(message)){
 			return true;
 		}else{
 			return false;
 		}//if end
 	}//updateCheck() end
 </script>
<%@ include file="../footer.jsp" %>
