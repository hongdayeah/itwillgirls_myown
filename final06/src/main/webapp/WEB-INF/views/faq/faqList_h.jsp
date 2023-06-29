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
					자주묻는질문
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


<!--container start-->
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
						<h3 style="font-weight:bold; text-align:center;'">FAQ 관리자리스트</h3>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr>
									  <th style="text-align: center;">번호</th>
									  <th style="text-align: center;">카테고리</th>
									  <th style="text-align: center;">질문</th>
									  <th style="text-align: center;">답변</th>
									</tr>
									<c:forEach var="dto" items="${list2}">
									<tr>
										<td style="text-align: center;">${dto.f_no}
										</td>
										<td style="text-align: center;">
										<script>
											  if ("${dto.f_cate}" === "C") {
											    document.write("고객");
											  } else if ("${dto.f_cate}" === "P") {
											    document.write("프로그램");
											  } else {
											    document.write("기타");
											  }
											</script>
										</td>
										<td><a href="read.do?f_no=${dto.f_no}">${dto.f_question}</a></td>
										<td>${dto.f_answer}</td>
									</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
			</div>
		</div>
<!--container end-->
<!-- 본문 끝 -->
 <br>
 <div style="text-align: center;">
 
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='http://localhost:9095/faq/create.do'">작성</button>
<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='http://localhost:9095/faq/list.do'">FAQ 바로가기</button>
</div>
<br><br>


        
<%@ include file="../footer.jsp" %>
