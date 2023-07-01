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

<form>
	<input type="hidden" name="order_no" id="order_no" value="${dto.order_no}">
	주문서 번호 : ${dto.order_no} <br>
	<input type="hidden" name="tot_price" id="tot_price" value="${dto.tot_price}">
	총 금액 : ${dto.tot_price}<br>
</form>

<button onclick="requestPay()">결제하기</button><br>


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
		    IMP.request_pay({
		      pg: "html5_inicis",
		      pay_method: "card",
		      merchant_uid: "ORD20180131-0000011",   // 주문번호
		      name: "도담도담 어린이문화센터",
		      amount: 100,                         // 숫자 타입
		      buyer_email: "구매자이메일",
		      buyer_name: "구매자명",
		      buyer_tel: "구매자휴대폰번호",
		      buyer_addr: "구매자주소",
		      buyer_postcode: "우편번호"
		    }, function (rsp) { // callback: 결제 request_pay 끝나고 여기로
		    	if(rsp.success){
		    		alert('결제 성공 ');
		    	}else{
		    		alert('결제 실패 ');
		    	}
		      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		    });
		  }
	</script>
        
<%@ include file="../footer.jsp" %>
