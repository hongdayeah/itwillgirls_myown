<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
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
						<a href="slist.do">
							테스트[1부]
						</a>
					</li>
					<li class="">
						테스트 관리
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
<!--container start-->
<div class="component-bg">
	<div class="container">
		<form class="" name="slistfrm" id="slistfrm" method="get">
			<div class="bs-docs-section">
				<div class="btn-position">
					<input type="button" class="btn btn-primary" onclick="location.href='screate.do'" value="질문 추가">
				</div>
				
				<h1 id="tables" class="page-header">질문 목록</h1>
				<h2 id="tables-hover-rows"></h2>
				
				<div class="bs-example">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>질문 번호</th>
								<th>질문 내용</th>
								<th style="text-align: center;">수정</th>
								<th style="text-align: center;">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="kid_dto" items="${list}">
							<tr>
								<c:if test="${kid_dto.p_id == member_dto.p_id}">
								<!-- 
									<td>${kid_dto.p_id}</td> 자녀회원을 추가한 부모 아이디
									<td>${member_dto.p_id}</td> 현재 로그인한 아이디
								 -->
									<td>${kid_dto.k_name}</td>
									<!-- <td>${kid_dto.k_birth}</td> -->
									<td>${fn:substring(kid_dto.k_birth,0,2)}년 ${fn:substring(kid_dto.k_birth,2,4)}월 ${fn:substring(kid_dto.k_birth,4,6)}일</td>
									<td>
										<c:if test="${kid_dto.k_gender == 1}">
											남성
										</c:if>
										<c:if test="${kid_dto.k_gender == 2}">
											여성
										</c:if>
									</td>
									<td>${kid_dto.typename}</td>
									<!-- <td>${kid_dto.k_no}</td> -->
									<td><input type="button" class="btn btn-warning" value="수정" onclick="location.href='kidModify.do?k_no=${kid_dto.k_no}'"></td>
									<td><input type="button" class="btn btn-danger" value="삭제" onclick="location.href='kidDelete.do?k_no=${kid_dto.k_no}'"></td>
									</c:if>
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
        
<%@ include file="../footer.jsp" %>
