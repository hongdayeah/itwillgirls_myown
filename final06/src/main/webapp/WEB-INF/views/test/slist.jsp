<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
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
						<a href="slist.do">
							테스트[1부]
						</a>
					</li>
					<li class="">
						테스트 관리
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
<!--container start-->
<div class="component-bg">
	<div class="container">
		<form class="" name="slistfrm" id="slistfrm" method="get">
			<div class="bs-docs-section">
				<div class="btn-position">
					<input type="button" class="btn btn-primary" onclick="location.href='screate.do'" value="질문 추가">
				</div>
				
				<h1 id="tables" class="page-header">질문 목록</h1>
				<h2 id="tables-hover-rows"></h2>
				
				<div class="bs-example">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>질문 번호</th>
								<th>질문 내용</th>
								<th style="text-align: center;">수정 | 삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${slist}">
							<tr>
								<td>${i.stest_no}</td>
								<td>${i.stest_name}</td>
								<td style="text-align: center;"><input type="button" class="btn btn-warning" value="수정" onclick="location.href='supdate.do?stest_no=${i.stest_no}'">
								<input type="button" class="btn btn-danger" value="삭제" onclick="return deleteCheck(${i.stest_no})"></td>
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
<br><br><br>
<!--container end-->
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
function deleteCheck(stest_no){
	
	//alert(stest_no);
	if(confirm("삭제하면 복구되지 않습니다.\n삭제하시겠습니까?")){
		window.location.href = "/test/sdelete.do?stest_no=" + stest_no;
	}else{
		return false;
	}
}
</script>
        
<%@ include file="../footer.jsp" %>
