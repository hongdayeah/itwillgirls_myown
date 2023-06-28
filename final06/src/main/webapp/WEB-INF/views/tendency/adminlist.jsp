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
               관리자페이지
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
               		관리자페이지
               </li>
               <li class="">
                  MBTi 관리
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 memberParentList.jsp -->
<div class="btn-position">
	<button class="btn btn-primary" onclick="location.href='create.do'">MBTi등록</button>
</div>
<!--container start-->
<div class="component-bg">
	<div class="container">
		<form class="" name="kidfListfrm" id="kidfListfrm" method="post">
			<div class="bs-docs-section">
				
				<h1 id="tables" class="page-header">MBTi 성향 목록</h1>
				<h2 id="tables-hover-rows"></h2>
				
				<div class="bs-example">
					<table class="table table-hover">
						<thead>
						<tr>
							<th>성향타입</th>
							<th>성향구분</th>
							<th>성향설명</th>
							<th style="text-align: center;">수정 | 삭제</th>
						</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${list}">
								<tr>
									<td>${i.typename}</td>
									<td>${i.typeanimal}</td>
									<td><p style="white-space: pre-line;">${i.typeexp}</p></td>
									<td style="text-align: center;"><input type="button" class="btn btn-warning" value="수정" onclick="location.href='update.do?typename=${i.typename}'">
								<input type="button" class="btn btn-danger" value="삭제" onclick="return deleteCheck(${i.typename})"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
</div>
<!--container end-->
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
function deleteCheck(typename){
	
	//alert(typename);
	if(confirm("삭제하면 복구되지 않습니다.\n삭제하시겠습니까?")){
		window.location.href = "/tendency/delete.do?typename=" + typename;
	}else{
		return false;
	}
}
</script>
<%@ include file="../footer.jsp"%>
