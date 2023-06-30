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

<div class=container>
	<form id="cartfrm" name="cartfrm" method="post" action="orderForm.do">
		<table border="1" table class="table table-bordered table-striped">
			<tr>
				<th>번호</th>
				<th>아이디</th>	    	
				<th>프로그램코드</th>
				<th>공연코드</th>
				<th>좌석번호</th>
				<th>인원수</th>
				<th>자녀회원번호</th>
				<th>총 금액</th>
			</tr>
		
			<c:forEach items="${list}" var="dto">
		 	<tr>
				<td>${dto.cart_no}</td>
				<td>${dto.p_id}</td>
				<td>${dto.pro_code}</td>
				<td>${dto.per_code}</td>
				<td>
				  <script>
			        function seatLabel() {
			            var alertSeat = [];
			            var seat_no = "${dto.seat_no}";
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
				<td>${dto.cart_cnt}</td>
				<td>${dto.k_no}</td>
				<td>
					<c:set var="total" value="${dto.cart_cnt * dto.cart_price}"></c:set>
					<fmt:formatNumber var="formattedTotal" value="${total}" pattern="#,###" />
					${formattedTotal}
				</td>
			</tr>
			<!-- 장바구니 내의 모든 상품의 총 금액 -->
			<c:set var="totalSum" value="${totalSum + (dto.cart_cnt * dto.cart_price)}" />
			<fmt:formatNumber var="sum" value="${totalSum}" pattern="#,###" />
			
			<!-- 장바구니 내의 행의 개수 -->
			<c:set var="order_cnt" value="${order_cnt + 1}" />
			</c:forEach>
			
		</table>
		<h3 style="font-weight: bold;">총 ${order_cnt}건</h3>
		<h3 style="font-weight: bold;">장바구니 총 금액 : ${sum}원</h3><br><br>
		<input type="hidden" name="p_id" id="p_id" value="${member_dto.p_id}">
		<input type="hidden" name="order_cnt" id="order_cnt" value="${order_cnt}">
		<input type="hidden" name="tot_price" id="tot_price" value="${totalSum}">
		
		<button class="btn btn-success" onclick="return orderCheck()">주문하기</button>
	</form>
</div>

<br><br>
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
	function orderCheck(){
		event.preventDefault();

		
		let p_id = $("#p_id").val();
		let order_cnt = $("#order_cnt").val();
		let tot_price = $("#tot_price").val();
		//alert(p_id);
		//alert(order_cnt);
		//alert(tot_price);
	    
	    if (p_id === null || p_id === "") {
	        alert("주문은 로그인 상태에서만 가능합니다.");
	        return false;
	    } else{
	    	let message = "주문하시겠습니까??"
	    	if(confirm(message)){
	    		$.ajax({
	                url: "/cart/orderForm.do", // 컨트롤러에 대한 URL 매핑
	                type: "POST", // 요청 메소드 설정 (POST 또는 GET)
	                data: { "order_cnt": order_cnt, "p_id": p_id, "tot_price": tot_price }, // 전송할 데이터 설정
	                success: function(response) {
	                    // 요청이 성공적으로 처리된 후 실행될 콜백 함수
	                    // 처리 결과에 따른 후속 작업 수행
	                    alert(response);
	                    //장바구니로 이동
	                    window.location.href = "/order/formRead";
	                },
	                error: function(xhr, status, error) {
	                    // 요청이 실패한 경우 실행될 콜백 함수
	                    // 에러 처리 로직 구현
	                    alert("주문 폼 조회 실패");
	                }
	            });
	    		return true;
	    	}else{
	    		return false;
	    	}
	    }
	}

        
<%@ include file="../footer.jsp" %>
