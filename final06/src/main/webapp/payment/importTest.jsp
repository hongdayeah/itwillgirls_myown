<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>	
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
	<script>
	 const IMP = window.IMP; // 생략 가능
	 IMP.init("imp63451281"); // 예: imp00000000a
	 
	 function requestPay() {
		    IMP.request_pay({
		      pg: "kcp.{TC0ONETIME}",
		      pay_method: "card",
		      merchant_uid: "ORD20180131-0000011",   // 주문번호
		      name: "노르웨이 회전 의자",
		      amount: 100,                         // 숫자 타입
		      buyer_email: "gildong@gmail.com",
		      buyer_name: "홍길동",
		      buyer_tel: "010-4242-4242",
		      buyer_addr: "서울특별시 강남구 신사동",
		      buyer_postcode: "01181"
		    }, function (rsp) { // callback: 결제 request_pay 끝나고 여기로
		    	if(rsp.success){
		    		alert('결제 성공 ');
		    	}else{
		    		alert('결제 실패 ');
		    	})
		      //rsp.imp_uid 값으로 결제 단건조회 API를 호출하여 결제결과를 판단합니다.
		    });
		  }
	</script>
</head>
<body>
	<button onclick="requestPay()">결제하기</button>
</body>
</html>