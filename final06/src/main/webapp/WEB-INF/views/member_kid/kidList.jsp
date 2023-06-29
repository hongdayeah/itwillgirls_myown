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
            <h1>
               마이페이지
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
               		마이페이지
               </li>
               <li class="">
                  자녀 회원 목록
               </li>
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
				<div class="btn-position">
					<input type="button" class="btn btn-primary" onclick="location.href='/member_kid/addKid.do'" value="자녀 회원 등록">
				</div>
				
				<h1 id="tables" class="page-header">자녀 회원 목록</h1>
				<h2 id="tables-hover-rows"></h2>
				
				<div class="bs-example">
					<input type="hidden" name="p_id" value="${member_dto.p_id}">
					<!-- 부모 아이디 -->
					<table class="table table-hover">
						<thead>
							<tr>
							<!-- 
								<th>부모 아이디</th>
								<th>로그인한 아이디</th>
							-->
								<th>자녀 이름</th>
								<th>자녀 생년월일</th>
								<th>자녀 성별</th>
								<th>자녀 성향</th>
								<!-- <th>자녀 회원번호</th> -->
								<th>수정</th>
								<th>삭제</th>
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
									<td>
										<c:choose>
											<c:when test="${kid_dto.typename == 'EE'}">
											<a href="../test/testresult.do?k_no=${kid_dto.k_no}">사자</a>
											</c:when>
											<c:when test="${kid_dto.typename == 'EI'}">
											<a href="../test/testresult.do?k_no=${kid_dto.k_no}">양</a>
											</c:when>
											<c:when test="${kid_dto.typename == 'IE'}">
											<a href="../test/testresult.do?k_no=${kid_dto.k_no}">기린</a>
											</c:when>
											<c:when test="${kid_dto.typename == 'II'}">
											<a href="../test/testresult.do?k_no=${kid_dto.k_no}">늑대</a>
											</c:when>
										</c:choose>
									</td>
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

<%@ include file="../footer.jsp"%>
