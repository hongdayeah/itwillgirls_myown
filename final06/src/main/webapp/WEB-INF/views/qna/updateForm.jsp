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
					문의하기
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
						문의하기
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->


<h1 id="forms" class="page-header" style="text-align: center;">문의글 작성</h1>
<div class="container privacy-terms">
	<div class="bs-docs-section mar-b-30">
	<form role="form" name="qnafrm" id="qnafrm"  method="POST" action="update.do" onsubmit="return updateCheck()">
	 <input type="hidden" name="q_no" id="q_no" value=${requestScope.q_no};>
		<div class="bs-programform">
				<div class="form-group">
					<label>작성자</label><br>
					<input type="text" class="form-control short" name="p_id" id="p_id" placeholder="작성자의 이름을 작성해주세요.">
				</div>
			<div class="form-group">
			  <label for="f_answer">제목</label><br>
			  <input type="text" name="p_id" id="p_id" value="${dto.p_id}" class="form-control" maxlength="20" readonly>
			</div>
			<div class="form-group">
			  <label for="f_answer">제목</label><br>
			  <input type="text" name="q_sub" id="q_sub" value="${dto.q_sub}" class="form-control" maxlength="100" required>
			</div>	
			<div class="form-group">
			  <label for="f_answer">내용</label><br>
			  <textarea rows="5" class="form-control" name="q_con" id="q_con">${dto.q_con}</textarea>
			</div>
				
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-warning">취소</button>
			</div>
			</form>
		</div>
	</div>

        
<%@ include file="../footer.jsp" %>
