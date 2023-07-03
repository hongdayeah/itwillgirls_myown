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
                  나의 관심내역
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 myLikeList.jsp -->
<!--container start-->
<div class="login-bg">
    <div class="container">
    <br>
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" name="myLikefrm" id="myLikefrm" method="post">
        <h2 class="form-signin-heading">나의 관심 프로그램</h2>
        <div class="login-wrap">
            <div class="bs-example">
				<input type="hidden" name="p_id" value="${member_dto.p_id}"><!-- 부모 아이디 -->
				<table class="table table-hover">
					<thead>
						<tr>
							<th style="text-align: center;">프로그램 이름</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="like_dto" items="${llist}">
									<tr>
										<td style="text-align: center;">
											<a href="/program/read.do?pro_obj=${like_dto.pro_obj}">
											${like_dto.pro_name}
											</a>										
										</td>
									</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			      <p style="padding: 10px; font-size: 15px;">프로그램 이름을 클릭하면,<br> 프로그램 상세보기 페이지로 이동합니다.</p>
        </div>
      </form>
      

      
      </div>
    </div>
</div>
<!--container end-->
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>
