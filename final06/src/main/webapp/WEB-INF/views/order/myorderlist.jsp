<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 cart -- list.jsp -->
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
						<a href="myorderlist.do">
							나의 예매내역
						</a>
					</li>
					<li class="">
						예매내역 보기
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<div class=container>
	<form id="cartfrm" name="cartfrm" method="post" action="orderForm.do" onsubmit="return orderCheck()">
		<span style="font-weight: bold;">아이디 | ${p_id}</span>
		
		<h2 style="font-weight:bold;">프로그램</h2>
		<div class="table-responsive">
		<c:set var="totalprice" value="0"></c:set>
			<table class="table">
				<thead>
				<tr>
					<th>체크</th>
					<th>프로그램명</th>
					<th>예매수</th>
					<th>금액</th>
					<th>합계</th>
					<th>삭제</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="prodto" items="${prolist}">
				<tr>
					<td><input type="checkbox" name="pro_checkbox" value="${prodto.cart_no}" onchange="updateTotal()"></td>
					<td>${prodto.pro_name}</td>
					<td>${prodto.cart_cnt}</td>
					<td>
					<fmt:formatNumber var="cart_price" value="${prodto.cart_price}" pattern="#,###" />
						${cart_price}
					</td>
					<td>
					<c:set var="rowsum" value="${prodto.cart_cnt * prodto.cart_price}"></c:set>
					<fmt:formatNumber var="rowSum" value="${rowsum}" pattern="#,###" />
						<span id="rowSum${prodto.cart_no}">${rowSum}</span>
						<c:set var="totalprice" value="${totalprice + rowsum}"></c:set>
					</td>
					<td><button class="btn btn-danger" onclick="return deleteCheck(${prodto.cart_no})">삭제</button></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<h2 style="font-weight:bold;">공연</h2>
		<div class="table-responsive">
			<table class="table">
				<thead>
				<tr>
					<th>체크</th>
					<th>공연명</th>
					<th>예매수</th>
					<th>금액</th>
					<th>합계</th>
					<th>삭제</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="perdto" items="${perlist}">
				<tr>
					<td><input type="checkbox" name="per_checkbox" value="${perdto.cart_no}" onchange="updateTotal()"></td>
					<td>${perdto.per_name}</td>
					<td>${perdto.cart_cnt}</td>
					<td>
					<fmt:formatNumber var="cart_price" value="${perdto.cart_price}" pattern="#,###" />
						${cart_price}
					</td>
					<td>
					<c:set var="rowsum" value="${perdto.cart_cnt * perdto.cart_price}"></c:set>
					<fmt:formatNumber var="rowSum" value="${rowsum}" pattern="#,###" />
						<span id="rowSum${perdto.cart_no}">${rowSum}</span>
						<c:set var="totalprice" value="${totalprice+rowsum}"></c:set>
					</td>
					<td><button class="btn btn-danger" onclick="return deleteCheck(${perdto.cart_no})">삭제</button></td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<br><br>
		<div style="text-align: right;">
			<h3 style="font-weight: bold;">
				<c:set var="totalCnt" value="${fn:length(prolist) + fn:length(perlist)}"></c:set>
				총 <span id="totalCount">0</span>건
			</h3>
			<h3 style="font-weight: bold;">
				<fmt:formatNumber var="totalPrice" value="${totalprice}" pattern="#,###" />
				장바구니 총 금액 : <span id="totalPrice">0</span>원
			</h3>
			<br><br>
			<input type="hidden" name="p_id" id="p_id" value="${member_dto.p_id}">
			<input type="hidden" name="order_cnt" id="order_cnt" value="${totalCnt}">
			<input type="hidden" name="tot_price" id="tot_price" value="${totalprice}">
			
			<button class="btn btn-success">주문하기</button>
		</div>
	</form>
</div>

<br><br>

<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<%@ include file="../footer.jsp" %>
