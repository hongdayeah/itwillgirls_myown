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
					예매내역
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
		<span style="font-weight: bold;">아이디 | ${p_id}</span>
		
		<h2 style="font-weight:bold;">프로그램</h2>
		<div class="table-responsive">
		<c:set var="totalprice" value="0"></c:set>
			<table class="table">
				<thead>
				<tr>
					<th>주문번호</th>
					<th>프로그램명</th>
					<th>예매수</th>
					<th>금액</th>
					<th>합계</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="prodto" items="${prolist}">
				<tr>
					<td>${prodto.order_no}</td>
					<td>${prodto.pro_name}</td>
					<td>${prodto.pro_cnt}</td>
					<td>
					<fmt:formatNumber var="cart_price" value="${prodto.pro_fee}" pattern="#,###" />
						${cart_price}
					</td>
					<td>
					<c:set var="rowsum" value="${prodto.pro_cnt * prodto.pro_fee}"></c:set>
					<fmt:formatNumber var="rowSum" value="${rowsum}" pattern="#,###" />
						<span id="rowSum${prodto.order_no}">${rowSum}</span>
						<c:set var="totalprice" value="${totalprice + rowsum}"></c:set>
					</td>
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
					<th>주문번호</th>
					<th>공연명</th>
					<th>예매수</th>
					<th>예매좌석</th>
					<th>금액</th>
					<th>합계</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="perdto" items="${perlist}">
				<tr>
					<td>${perdto.order_no}</td>
					<td>${perdto.per_name}</td>
					<td>${perdto.per_cnt}</td>
					<td>
					  <script>
				        function seatLabel() {
				            var alertSeat = [];
				            var seat_no = "${perdto.seat_no}";
				            var seatArray = seat_no.split(",");
				            
				            for (var i = 0; i < seatArray.length; i++) {
				                var seatNum1 = parseInt(seatArray[i].substring(0, 1));
				                var seatNum2 = seatArray[i].substring(1);
				                var seatNum = String.fromCharCode(seatNum1 + 64);
				                var seatLabel = seatNum + seatNum2;
				                alertSeat.push(seatLabel);
				            }
				            
				            document.write(alertSeat);
				        }
				        
				        seatLabel(); // 함수 호출
	   				 </script>
					</td>
					<td>
					<fmt:formatNumber var="cart_price" value="${perdto.per_fee}" pattern="#,###" />
						${cart_price}
					</td>
					<td>
					<c:set var="rowsum" value="${perdto.per_cnt * perdto.per_fee}"></c:set>
					<fmt:formatNumber var="rowSum" value="${rowsum}" pattern="#,###" />
						<span id="rowSum${perdto.order_no}">${rowSum}</span>
						<c:set var="totalprice" value="${totalprice+rowsum}"></c:set>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
		<br><br>
		<div style="text-align: right;">
			<h3 style="font-weight: bold;">
				<c:set var="totalCnt" value="${fn:length(prolist) + fn:length(perlist)}"></c:set>
				총 ${totalCnt}건
			</h3>
			<h3 style="font-weight: bold;">
				<fmt:formatNumber var="totalPrice" value="${totalprice}" pattern="#,###" />
				주문 총 금액 : ${totalPrice}원
			</h3>
			<br><br>
		</div>
</div>
<br><br>

<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<%@ include file="../footer.jsp" %>
