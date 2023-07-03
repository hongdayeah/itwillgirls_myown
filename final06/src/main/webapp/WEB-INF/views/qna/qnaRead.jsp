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
					소식 - 문의하기
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
							소식
						</a>
					</li>
					<li class="create">
						문의하기
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
						<h3 style="font-weight:bold; text-align:center;">문의글 상세보기</h3>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr align="center">
										<th style="text-align: center;">작성자</th>
										<td style="text-align: center;">${dto.p_id}</td>
										<th style="text-align: center;">작성일</th>
										<td style="text-align: center;">${dto.q_regdt}</td>
									</tr>
									<tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">제목</th>
									 	<td colspan="4" style="text-align: center; vertical-align: middle;">${dto.q_sub}</td>
									 </tr>
									 <tr align="center">
									 	<th style="text-align: center; vertical-align: middle;">내용</th>
									 	<td colspan="4" style="text-align: center; vertical-align: middle;">${dto.q_con}</td>
									 </tr>
									
									</tbody>
								</table>
							</div>
						</div>
						</div>
					</div>

    <!-- 본문 끝 -->
   <br>
  
	<div align="center">
		<c:if test="${member_dto.p_id == 'webmaster'}">
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='reply.do?q_no=${dto.q_no}'">답변쓰기</button>
		</c:if>
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='update.do?q_no=${dto.q_no}'">수정</button>
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='delete.do?q_no=${dto.q_no}'">삭제</button>
	</div>

<br><br>     
<%@ include file="../footer.jsp" %>
