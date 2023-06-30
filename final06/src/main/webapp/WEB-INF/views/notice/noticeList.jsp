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
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
						<h2 style="font-weight:bold; text-align:center;'">공지사항</h2>
						<br>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr>
									  <th style="text-align: center;">번호</th>
									  <th style="text-align: center;">카테고리</th>
									  <th style="text-align: center;">제목</th>
									  <th style="text-align: center;">작성일</th>
									</tr>
									<c:forEach var="dto" items="${list}">
									<tr>
										<td style="text-align: center;">${dto.not_no}</td>
										<td style="text-align: center;">
										<script>
										  if ("${dto.not_cate}" === "N") {
										    document.write("전체공지");
										  } else if ("${dto.not_cate}" === "E") {
										    document.write("이벤트");
										  }
										</script>
										</td>
										<td style="text-align: center;"><a href="read.do?not_no=${dto.not_no}">${dto.not_sub}</a></td>
										<td style="text-align: center;">${dto.not_regdt}</td>
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
 <c:if test="${member_dto.p_id == 'webmaster'}">
<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='/notice/create.do'">관리자 작성</button>
</c:if>
</div>
<br><br>

<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
