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
										<th style="text-align: center;">카테고리</th>
										<td style="text-align: center;">
										<script>
											  if ("${dto.not_cate}" === "N") {
											    document.write("전체공지");
											  } else if ("${dto.not_cate}" === "E") {
											    document.write("이벤트");
											  }
											</script>
										</td>
										<th style="text-align: center;">작성일</th>
										<td>${dto.not_regdt}</td>
									</tr>
									<tr align="center">
									 </tr>
									 <tr align="center">
									 	<td colspan="4" style="text-align: center; vertical-align: middle;">
									 	<br>${dto.not_con}<br>
									 	<script>
										  if ("${dto.not_filename}" === "") {
										    document.write(" ");
										  } else {
										    document.write('<img src="../noticeimg/${dto.not_filename}" width="500">');
										  }
										</script>
									 	</td>
									 </tr>
									
									</tbody>
								</table>
							</div>
						</div>
						</div>
					</div>

    <!-- 본문 끝 -->
   <br>
  
<c:if test="${member_dto.p_id == 'webmaster'}">
<div align="center">
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='update.do?not_no=${dto.not_no}'">수정</button>
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='delete.do?not_no=${dto.not_no}'">삭제</button>
</div>
</c:if>
<br><br>
<%@ include file="../footer.jsp" %>
