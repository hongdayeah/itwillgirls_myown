<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<%@ include file="../header.jsp"%>

<!--breadcrumbs start-->
<div class="breadcrumbs">
   <div class="container">
      <div class="row">
         <div class="col-lg-4 col-sm-4">
            <h1>
               관리자페이지
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
               		관리자페이지
               </li>
               <li class="">
                  전체 회원 목록
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 memberParentList.jsp -->
<!--container start-->
<div class="component-bg">
	<div class="container">
		<form class="" name="kidfListfrm" id="kidfListfrm" method="post">
			<div class="bs-docs-section">
				
				<h1 id="tables" class="page-header">전체 회원 목록</h1>
				<h2 id="tables-hover-rows"></h2>
				
				<div class="bs-example">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>회원 아이디</th>
							<th>회원 이름</th>
							<th>회원 생년월일</th>
							<th>회원 성별</th>
							<th>회원 핸드폰번호</th>
							<th>회원 이메일주소</th>
							<th>회원 등급</th>
							<th>가입일</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="member_dto" items="${list}">
								<c:if test="${member_dto.p_id != 'webmaster'}">
								<tr>
									<td>${member_dto.p_id}</td>
									<td>${member_dto.p_name}</td>
									<td>${fn:substring(member_dto.p_birth,0,2)}년 ${fn:substring(member_dto.p_birth,2,4)}월 ${fn:substring(member_dto.p_birth,4,6)}일</td>
									<td>
										<c:if test="${member_dto.p_gender == 1}">
											남성
										</c:if>
										<c:if test="${member_dto.p_gender == 2}">
											여성
										</c:if>
									</td>
									<td>${fn:substring(member_dto.p_tell,0,3)}-${fn:substring(member_dto.p_tell,3,7)}-${fn:substring(member_dto.p_tell,7,11)}</td>
									<td>${member_dto.p_email}</td>
									<td>
										<c:if test="${member_dto.p_grade == 'P'}">
											일반 회원<!-- 일반/관리자 등급만 구분할 거면 빼는 게 나으려나? 고민 중입니다~ -->
										</c:if>
									</td>
									<td>${member_dto.p_date}</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
</div>
<br><br><br>
<!--container end-->
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>
