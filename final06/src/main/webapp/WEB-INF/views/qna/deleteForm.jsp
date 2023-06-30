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
					QNA
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
<h3>QNA삭제</h3>
<div class="title"> QNA삭제 </div>
<form name="qna" method="post" action="delete.do">
	<input type="hidden" name="q_no" value="${requestScope.q_no}">
	<div class="q_con">
		<p>정말로 삭제하시겠습니까?</p>
	</div>
	
	<div class="bottom">
		<input type="submit" value="삭제진행">
	</div>
</form>


<%@ include file="../footer.jsp" %>
