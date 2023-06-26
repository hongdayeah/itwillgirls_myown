<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 performanceList.jsp -->
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
	                  <a href="list.do">
	                     공연
	                  </a>
	               </li>
	               <li class="">
	                  공연 소개
	               </li>
	            </ol>
	         </div>
	      </div>
	   </div>
	</div>
	<!--breadcrumbs end-->


	<div class="btn-position">
	<input class="btn btn-primary" type="button" value="공연등록" onclick="location.href='create.do'">
	</div>
	
	<br>
	<br>
	<br>
	
	<!--container start-->
	<div class="container">
	<!-- 리스트 행 개수만큼 출력 -->
	<c:forEach var="dto" items="${list}" varStatus="status">
		<c:if test="${status.count % 2 == 1}">
			<div class="row">
		</c:if>
	<div class="col-md-6">
	
		<!-- 왼쪽 -->
		<div class="blog-left">
			<div class="blog-img">
				<img class="grid-image" src="../perstorage/${dto.per_img}" />
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="blog-two-info">
						<p>							
						<!-- 공연날짜 -->
						<i class="fa fa-calendar"></i>
						<span style="font-weight: bold;">공연날짜</span>
						<var="per_date" value="${dto.per_date}"/>
					|
						<!-- 공연시간 -->
						<i class="fa fa-calendar"></i>
						<span style="font-weight: bold;">공연시간</span>
						<var="per_time" value="${dto.per_time}"/>							
						</p>
					</div>
				</div>
			</div>					
			<div class="blog-content">					
				<h3>
					<a href="read.do?per_code=${dto.per_code}">${dto.per_name}</a>
				</h3>
				<p>
				  ${dto.per_exp}
				</p>
			</div>
			
			</div>

			<c:if test="${status.count % 2 == 0}">
				</div>
		</c:if>
	</c:forEach>
	</div>
	</div>
		

<!--container end-->	

    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


