<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

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

<!-- 본문 시작 kidAddForm.jsp -->
<!--container start-->
<div class="component-bg">
	<div class="container">
		<form class="" name="kidfListfrm" id="kidfListfrm" method="post">
			<div class="bs-docs-section">
				<h1 id="tables" class="page-header">자녀 회원 목록</h1>

				<h2 id="tables-hover-rows"></h2>
				<p>
					<input type="button" onclick="location.href='/member_kid/addKid.do'" value="자녀 회원 등록">
				</p>
				<div class="bs-example">
					<input type="hidden" name="p_id" value="${member_dto.p_id}">
					<!-- 부모 아이디 -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th>자녀 이름</th>
								<th>자녀 생년월일</th>
								<th>자녀 성별</th>
								<th>자녀 성향</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="kid_dto" items="${list}">
								<tr>
									<td>${kid_dto.k_name}</td>
									<td>${kid_dto.k_birth}</td>
									<td><c:if test="${kid_dto.k_gender == 1}">
									남성
								</c:if> <c:if test="${kid_dto.k_gender == 2}">
									여성
								</c:if></td>
									<td>${kid_dto.typename}</td>
									<td><input type="button" value="수정" onclick="location.href='update.do'"> <!-- 임시 경로 --></td>
									<td><input type="button" value="삭제" onclick="location.href='delete.do'"> <!-- 임시 경로 --></td>
								</tr>
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