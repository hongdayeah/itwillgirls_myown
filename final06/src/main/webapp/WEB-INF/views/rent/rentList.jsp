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
					예약 - 대관신청
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
							예약
						</a>
					</li>
					<li class="create">
						신청내역
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
<div style="text-align:center;">
    <table class="tab" width="50%" style="margin: auto; table-layout: fixed;">
    <tr style="text-align:center">
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; text-align: center; width: 20%;">
            <a href="/rent/info.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-appointment-7322265.png" height="20" width="20" style="vertical-align: bottom; margin-bottom: 4px;">
                &nbsp;대관안내
            </a>
        </td>
        <td style="font-size: 25px; font-weight: bold; vertical-align: middle; width: 20%;">|</td>
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; width: 20%;">
            <a href="/rent/create.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-contract-684831.png" height="20" width="20" style="vertical-align: bottom; margin-bottom: 3px;">
                &nbsp;대관신청
            </a>
        </td>
        <td style="font-size: 25px; font-weight: bold; vertical-align: middle; width: 20%;">|</td>
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; width: 20%;">
            <a href="/rent/list.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-mailing-list-10747269.png" height="20" width="20" style="vertical-align: middle; margin-bottom: 3px;">
                &nbsp;신청내역
            </a>
        </td>
    </tr>
</table>
  </div>
  <br>
 <hr>

<!--container start-->
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
						<h1 style="font-weight:bold;">${dto.pro_name}</h1>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
								  
									<tbody>
									<tr>
  <th style="text-align: center;">신청날짜</th>
  <th style="text-align: center;">단체명</th>
  <th style="text-align: center;">담당자</th>
  <th style="text-align: center;">대관일자</th>
  <th style="text-align: center;">대관목적</th>
  <th style="text-align: center;">장소</th>
</tr>
									<c:forEach var="dto" items="${list}">
									 	<tr align="center">
									 		<td>${dto.rent_app}</td>
									 		<td><a href="read.do?rent_code=${dto.rent_code}">${dto.rent_group}</a></td> 
									 		<td>${dto.rent_name}</td>
									 		<td>${dto.rent_date}</td>
									 		<td>${dto.rent_per}</td>
									 		<td>${dto.class_code}</td>
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



        
<%@ include file="../footer.jsp" %>