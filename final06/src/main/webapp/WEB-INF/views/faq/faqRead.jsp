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
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
						<h3 style="font-weight:bold; text-align:center;">대관신청서 상세보기</h3>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr align="center">
										<th style="text-align: center;">카테고리</th>
										<td colspan="3" style="text-align: center;">
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
									</tr>
									<tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">질문</th>
									 	<td colspan="3">${dto.f_question}</td>
									 </tr>
									 <tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">답변</th>
									 	<td colspan="3">${dto.f_answer}</td>
									 </tr>
									
									</tbody>
								</table>
							</div>
						</div>
						</div>
					</div>

    <!-- 본문 끝 -->
   <br>
  
<c:if test="${member_dto.p_id == 'webmaster'}">
<div align="center">
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='update.do?f_no=${dto.f_no}'">수정</button>
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='delete.do?f_no=${dto.f_no}'">삭제</button>
</div>
</c:if>
<br><br>
<!--container end-->
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
