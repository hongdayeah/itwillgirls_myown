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
						대관안내
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
						<h3 style="font-weight:bold; text-align:center;">대관신청서 상세보기</h3>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr align="center" style="background-color:#EFEFEF">
										<th style="text-align: center;">신청일자</th>
										<td>${dto.rent_app}</td>
										<th style="text-align: center;">대관일자</th>
										<td>${dto.rent_date}</td>
									</tr>
									<tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">대관목적</th>
									 	<td colspan="3">${dto.rent_per}</td>
									 </tr>
									 <tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">단체명</th>
									 	<td colspan="3">${dto.rent_group}</td>
									 </tr>
									 <tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">담당자 성함</th>
									 	<td colspan="3">${dto.rent_name}</td>
									 </tr>
									 <tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">담당자 연락처</th>
									 	<td colspan="3">${dto.rent_phone}</td>
									 </tr>
									 <tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">담당자 이메일주소</th>
									 	<td colspan="3">${dto.rent_email}</td>
									 </tr>
									 <tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">대관장소</th>
									 	<td colspan="3">${dto.class_code}</td>
									 </tr>
									 <tr align="center">
										<th style="text-align: center; vertical-align: middle;">대관신청서</th>
										<td colspan="3"><script>
									  // 대관신청서 파일이 없을 경우 "제출안함" 텍스트로 대체
								        <%-- 첨부 파일 이름과 확장명을 표시하고 클릭 시 다운로드 --%>
								        if ("${dto.rent_form}" === "") {
								          document.write("제출 안함");
								        } else {
								          var filePath = "${dto.rent_form}";
								          var fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
								          document.write('<a href="/rentFormimg/' + filePath + '" download>' + fileName + '</a>');
								        }
								      </script>
									</td>
									</tbody>
								</table>
							</div>
						</div>
						</div>
					</div>

    <!-- 본문 끝 -->
   <br>
 <div style="text-align: center;">
<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='http://localhost:9095/rent/list.do'">신청내역보기</button>
</div>
<br><br>     
<%@ include file="../footer.jsp" %>
