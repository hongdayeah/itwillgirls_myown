<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<%@ include file="../header.jsp"%>

<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>우리센터 프로그램을 소개합니다</h1>
			</div>
			<div class="col-lg-8 col-sm-8">
				<ol class="breadcrumb pull-right">
					<li><a href="../home.do"> Home </a></li>
					<li><a href="list.do"> 프로그램 </a></li>
					<li class="">프로그램 소개</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 myLikeList.jsp -->
<!--container start-->
<div class="component-bg">
	<div class="container">
		<form class="" name="myLikefrm" id="myLikefrm" method="post">
			<div class="bs-docs-section">

				<h1 id="tables" class="page-header">나의 관심 프로그램 목록</h1>
				<h2 id="tables-hover-rows"></h2>

				<div class="bs-example">
					<input type="hidden" name="p_id" value="${member_dto.p_id}">
					
					<!-- 부모 아이디 -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th>프로그램 이름</th>
								<th>삭제 넣을 건가요~</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="like_dto" items="${list}">
								<c:if test="${member_dto.p_id == like_dto.p_id}">
									<input type="hidden" name="p_id" value="${like_dto.p_id}">
										<tr>
											<td>
												<a href="/program/read.do?pro_obj=${like_dto.pro_obj}">
												<c:if test="${like_dto.pro_obj == 'A01'}">
													알록달록아트전시회
												</c:if>
												<c:if test="${like_dto.pro_obj == 'A02'}">
													캐릭터디자인스쿨
												</c:if>
												<c:if test="${like_dto.pro_obj == 'A03'}">
													미술미술수업
												</c:if>
												<c:if test="${like_dto.pro_obj == 'E01'}">
													영어수업
												</c:if>
												<c:if test="${like_dto.pro_obj == 'S01'}">
													체육수업
												</c:if>
												</a>										
											</td>

											<!-- 찜 취소는 그 프로그램 페이지로 가서 하도록 할 건가용? -->
											<td><input type="button" class="btn btn-danger"
												value="삭제"
												onclick="location.href='/program/likeDelete.do?like_no=${like_dto.like_no}'"></td>
										</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /example -->

			</div>
		</form>
	</div>
</div>

<!--container end-->
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>
