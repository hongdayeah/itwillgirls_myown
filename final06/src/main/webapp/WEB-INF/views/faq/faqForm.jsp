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
					FAQ
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
						자주묻는 질문
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<h1 id="forms" class="page-header" style="text-align: center;">FAQ 작성</h1>
=
<div class="container privacy-terms">
	<div class="bs-docs-section mar-b-30"><br><br>
		<div class="bs-programform">
			<form role="form" name="faqfrm" id="faqfrm"  method="POST" action="create.do" onsubmit="return faqCheck()">
				<div class="form-group">
				<label>카테고리</label><br>
				<select id="f_cate" name="f_cate" class="form-control short" required>
				<option value="C">고객 관련</option>
				<option value="F">시설 관련</option>
				<option value="P">프로그램 관련</option>
			</select>
				</div>
				<div class="form-group">
					<label>제목</label><br>
					<input type="text" class="form-control short" name="f_question" id="f_question" required>
				</div>
			<div class="form-group">
			  <label for="f_answer">답변</label><br>
			  <textarea class="form-control" name="f_answer" id="f_answer" rows="10" required></textarea>
			</div>	
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- 본문 끝 -->
        



<%@ include file="../footer.jsp" %>
