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

<!--container start-->
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
						<h3 style="font-weight:bold; text-align:center;'">문의하기</h3>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr>
									  <!--<th style="text-align: center;">번호</th>  -->
									  <th style="text-align: center;">제목</th>
									  <th style="text-align: center;">작성자</th>
									  <th style="text-align: center;">작성일</th>
									</tr>
										<c:forEach var="dto" items="${list}">
										<tr>
											<!-- <td style="text-align: center;">${dto.q_no}</td> -->
											<td>	<c:if test="${dto.q_indent > 0}">
												<c:forEach begin="1" end="${dto.q_indent}">
												&nbsp;
												</c:forEach>
												<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-arrow-right-10025885.png" width="20px">
											</c:if>
										
											
											<a href="read.do?q_no=${dto.q_no}">${dto.q_sub}</a></td>
											<td style="text-align: center;">${dto.p_id}</td>
											<td style="text-align: center;">${dto.q_regdt}</td>
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
 <div style="text-align: center;">
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='http://localhost:9095/qna/create.do'">글쓰기</button>
		</div>
<br><br>

<%@ include file="../footer.jsp" %>
