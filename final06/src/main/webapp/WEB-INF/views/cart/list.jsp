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
					장바구니 목록
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
							장바구니
						</a>
					</li>
					<li class="">
						장바구니
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
<head>
	<script>
		function order(){
			if(confirm("주문하시겠습니까?")){
				locarion.href="";
			} //if end
		} //order() end
	</script>

</head>

	    <table border="1" table class="table table-bordered table-striped">
	    <tr>
	  		<th>번호</th>
	    	<th>아이디</th>	    	
	    	<th>프로그램코드</th>
	    	<th>공연코드</th>
	    	<th>좌석번호</th>
	    	<th>자녀회원번호</th>
	    </tr>
	    
	    <c:forEach items="${list}" var="dto">
	    	<tr>
				<td>${dto.cart_no}</td>
				<td>${dto.p_id}</td>
				<td>${dto.pro_code}</td>
				<td>${dto.per_code}</td>
				<td>${dto.seat_no}</td>
				<td>${dto.k_no}</td>
			</tr>
		</c:forEach>
	    </table>
	    
	    <br>
	    <input type="button" class="btn btn-success" value="주문하기" onclick()="order()" >
	    




<!-- 본문 끝 -->





        
<%@ include file="../footer.jsp" %>
