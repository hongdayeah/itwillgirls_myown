<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 program -- list.jsp -->

<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리센터 공연을 소개합니다
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
						공연 상세
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
							<img src="../perstorage/${dto.per_img}" width="200">
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
									<td>${dto.per_time} <br>
									${dto.per_timedetail}</td>
								</tr>								
								<tr>
									<td>공연 장소</td>
									<td>
										<script>
											if("${dto.class_code}" === "theater"){
												document.write("극장");
											} else {
												document.write("야외");
											}
										</script>
									</td>
								</tr>
								<tr>
									<td>공연료</td>
									<td>${dto.per_fee}원</td>
								</tr>
							
								
								</table>
							</div>
					</div>
					</div>
				
				
				
		     <script>
              //공연장소가 극장일 때에만 좌석예매 버튼이 생성되도록 함 
              if ("${dto.class_code}" === "theater") {
                document.write('<input type="button" class="btn btn-success" value="좌석예매" onclick="location.href=\'seat.do?per_code=${dto.per_code}\'">');
              } else {
            	  document.write("야외공연은 현장에서 선착순으로 접수가능합니다. ");
              }
            </script>
		
			<div class="perdetail">
				<div class="blog-img gs">
			    <br>
			    	<img src="../perstorage/${dto.per_img2}" width="400">
    
				    <script>
				      // 공연장소가 극장일 때에만 추가 이미지를 보여줍니다.
				      if ("${dto.class_code}" === "theater") {
				        document.write('<img src="../img/performance/티켓수령상세.png" width="400">');
				      }
				    </script>
			  	</div>
			</div>
			<br>
			<br>
		</div>
	</div>
	</div>
	</div>
			

    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


