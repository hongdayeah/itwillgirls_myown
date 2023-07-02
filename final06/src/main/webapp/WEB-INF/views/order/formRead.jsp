<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 order -- formList.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					주문하기
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
						<a href="">
							주문
						</a>
					</li>
					<li class="">
						주문하기
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
<div class="container">

        <h2 style="font-weight:bold;">${dto.p_id}님, 주문을 확인해주세요.</h2>
		<div class="table-responsive">
			<table class="table">
				<thead>
				<tr>
					<th>주문번호</th>
					<th>주문건수</th>
					<th>주문총금액</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>${dto.order_no}</td>
					<td>${dto.order_cnt}건</td>
					<td>
					<fmt:formatNumber var="totalprice" value="${dto.tot_price}" pattern="#,###" />
						${totalprice}원
					</td>
				</tr>
				</tbody>
			</table>
		</div>
        <button class="btn btn-success" onclick="requestPay()">결제하기</button>

</div>
<br>


<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
	 <!-- jQuery -->
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
      type="text/javascript"
      src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
	<script type="text/javascript">
	 var IMP = window.IMP; // 생략 가능
	 IMP.init("imp63451281"); // 예: imp00000000a
	 
	 function requestPay() {
		 
		 let order_no = "${dto.order_no}";
		 let order_cnt = "${dto.order_cnt}";
		 let tot_price = "${dto.tot_price}";
		 
		    IMP.request_pay({
		      pg: "kakaopay",
		      pay_method: "card",
		      merchant_uid: order_no,   // 주문번호
		      name: "도담도담 어린이문화센터",
		      amount: 100,                         // 숫자 타입
		      buyer_email: "구매자이메일",
		      buyer_name: "구매자명",
		      buyer_tel: "구매자휴대폰번호",
		      buyer_addr: "구매자주소",
		      buyer_postcode: "우편번호"
		    }, function (rsp) { // callback: 결제 request_pay 끝나고 여기로
		    	if(rsp.success){
		    		alert('결제에 성공했습니다. 예매내역으로 이동합니다.');
		    		$.ajax({
		                url: "/orderform/delete.do",
		                method: "POST",
		                data: {"order_no": order_no, "order_cnt": order_cnt, "tot_price": tot_price },
		                success: function (response) {
		                    // 성공적으로 삭제되었을 때 실행할 코드
		                    alert(response);
		                    window.location.href = "/order/myorderlist?order_no="+ order_no + "&order_cnt=" + order_cnt + "&tot_price=" + tot_price; // myorderlist로 이동
		                },
		                error: function (xhr, status, error) {
		                    // 삭제 실패 시 실행할 코드
		                    alert("장바구니 삭제 실패");
		                }
		            });
		    	}else{
		    		alert('결제 실패');
		    	}
		      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		    });
		  }
	</script>
        
<%@ include file="../footer.jsp" %>
