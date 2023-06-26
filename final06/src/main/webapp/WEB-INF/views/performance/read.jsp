<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<head>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>


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
	                   공연상세
	               </li>
	            </ol>
	         </div>
	      </div>
	   </div>
	</div>
	<!--breadcrumbs end-->
    
	<div class="btn-position">
		<button class="btn btn-success" onclick="location.href='list.do'">프로그램 목록</button>
		<button class="btn btn-warning" onclick="location.href='update.do?per_code=${dto.per_code}'">공연 수정</button>
		<button class="btn btn-danger" onclick="location.href='delete.do?per_code=${dto.per_code}'">프로그램 삭제</button>
	</div>

	<!--container start-->
	<div class="container">
		<div class="row">
		<!--blog start-->
			<div class="col-lg-9">
				<div class="blog-item">
					<div class="row">
					
					<div class="col-lg-10 col-sm-10">
						<div class="blog-img gs">
							<img src="../perstorage/${dto.per_img}" width="400">
						</div>
					</div>
				</div>	

				<div class="row">
				<div class="col-lg-12 col-sm-12">
					<h1 style="font-weight:bold;">${dto.per_name}</h1>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
								
								<colgroup>
								  <col class="col-xs-1">
								  <col class="col-xs-7">
								</colgroup>

									<tbody>
								<tr>
									<td>공연 설명</td>
									<td>${dto.per_exp}</td>
								</tr>
								<tr>
									<td>공연 날짜</td>
									<td>${dto.per_date}</td>
								</tr>
								<tr>
									<td>공연 시간</td>
									<td>${dto.per_time}</td>
								</tr>
								<tr>
									<td>공연 장소</td>
									<td>${dto.class_code}</td>
								</tr>
								<tr>
									<td>공연료</td>
									<td>${dto.per_fee}</td>
								</tr>
								
								</table>
							</div>
					</div>
					</div>
					
				<td>
					<input type="button" class="btn btn-success" value="좌석예매" onclick="location.href='seat.do?per_code=${dto.per_code}'">
				</td>

		
		
			</div>
		</div>
	</div>
	</div>
			

    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


