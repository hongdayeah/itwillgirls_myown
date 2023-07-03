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
					<th>예매좌석</th>
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

<script>
	function orderCheck(){
		event.preventDefault();
		
		
		
		let p_id = $("#p_id").val();
		let order_cnt = parseInt($("#totalCount").text());
		let tot_price = updateTotal();
		//alert(p_id);
		//alert(order_cnt);
		//alert(tot_price);
	    
		// 주문할 상품 정보를 배열로 저장
		let prolist = [];
		$("input[name='pro_checkbox']:checked").each(function() {
		    let cart_no = parseInt($(this).val());
		    let pro_name = $(this).closest("tr").find("td:eq(1)").text();
		    let cart_cnt = $(this).closest("tr").find("td:eq(2)").text();
		    let cart_price = $(this).closest("tr").find("td:eq(3)").text().trim(); //trim을 안붙였더니 엄청난 공백
		    
		    //숫자 부분만 추출하여 저장, null일 경우 0
		    cart_price = cart_price ? parseInt(cart_price.replace(/[^0-9]/g, '')) : 0;
		    
		    prolist.push({
		        cart_no: cart_no,
		        pro_name: pro_name,
		        cart_cnt: cart_cnt,
		        cart_price: cart_price,
		        
		    });
		});
		
		// 주문할 공연 정보를 배열로 저장
		let perlist = [];
		$("input[name='per_checkbox']:checked").each(function() {
		    let cart_no = parseInt($(this).val());
		    let per_name = $(this).closest("tr").find("td:eq(1)").text();
		    let cart_cnt = $(this).closest("tr").find("td:eq(2)").text();
		    let seat_no =  $(this).closest("tr").find("td:eq(3)").html().trim();
		    seat_no = seat_no ? seat_no.match(/\d+/g)?.slice(0, 2)?.join(",") : '';
		    
		    let cart_price = $(this).closest("tr").find("td:eq(4)").text().trim();
		    
		    cart_price = cart_price ? parseInt(cart_price.replace(/[^0-9]/g, '')) : 0;
		    
		    perlist.push({
		        cart_no: cart_no,
		        per_name: per_name,
		        cart_cnt: cart_cnt,
		        seat_no: seat_no,
		        cart_price: cart_price,
		        
		    });
		});
		
		let selectedCartNos = [];
		for (let i = 0; i < prolist.length; i++) {
		    selectedCartNos.push(prolist[i].cart_no);
		}
		for (let i = 0; i < perlist.length; i++) {
		    selectedCartNos.push(perlist[i].cart_no);
		}
		
		//console.log(prolist[0]);
		//console.log(perlist);
	    if (p_id === null || p_id === "") {
	        alert("주문은 로그인 상태에서만 가능합니다.");
	        return false;
	    } else{
	    	
	        
	    	let message = "총 " + order_cnt + "건 주문하시겠습니까??"
	    	if(confirm(message)){
	    		
	    		$.ajax({
	    	        url: "/cart/orderForm.do",
	    	        type: "POST",
	    	        data:  JSON.stringify({
	    	          order_cnt: order_cnt,
	    	          p_id: p_id,
	    	          tot_price: tot_price,
	    	          prolist: prolist, //배열상태
	    	          perlist: perlist //배열상태
	    	        }),
	    	        contentType: "application/json",
	    	        success: function (response) {
	    	          // orderForm.do로부터 생성된 order_no 값을 받아옴
	    	          let order_no = response;
	    	          //alert(order_no);
	    	          

	    	          // updateOrderNo.do로 order_no 값을 전달
	    	          $.ajax({
	    	        	    url: "/cart/updateOrderNo.do",
	    	        	    type: "POST",
	    	        	    data: JSON.stringify({
	    	        	        cartNos: selectedCartNos,
	    	        	        orderNo: order_no
	    	        	    }),
	    	        	    contentType: "application/json",
	    	        	    success: function (updateResponse) {
	    	        	        // 업데이트 성공 시 실행할 코드
	    	        	        alert(updateResponse);

	    	        	        // 주문폼으로 이동
	    	        	        window.location.href = "/order/formRead";
	    	        	    },
	    	        	    error: function (xhr, status, error) {
	    	        	        // 업데이트 실패 시 실행할 코드
	    	        	        alert("주문 항목 업데이트 실패");
	    	        	    },
	    	        	});
	    	        },
	    	        error: function (xhr, status, error) {
	    	          alert("주문 폼 조회 실패");
	    	          return false;
	    	        },
	    	      });
	    		return true;
	    	}else{
	    		return false;
	    	}
	    }
	}
</script>
<script>
function deleteCheck(cart_no){
	
	//alert(cart_no);
	if(confirm("장바구니에서 삭제하시겠습니까?")){
		$.ajax({
            url: "/cart/cartDelete.do", // 컨트롤러에 대한 URL 매핑
            type: "POST", // 요청 메소드 설정 (POST 또는 GET)
            data: { "cart_no": cart_no }, // 전송할 데이터 설정
            success: function(response) {
                // 요청이 성공적으로 처리된 후 실행될 콜백 함수
                // 처리 결과에 따른 후속 작업 수행
                alert(response);
                //장바구니로 이동
                window.location.href = "../cart/list";
            },
            error: function(xhr, status, error) {
                // 요청이 실패한 경우 실행될 콜백 함수
                // 에러 처리 로직 구현
                alert("장바구니 삭제 실패");
            }
        });
		return false;
	}else{
		return false;
	}
}
</script>
<script>
	//장바구니에서 특정항목 삭제
	function deleteItems(){
		//perlist 배열에 있는 항목만 삭제
		for(let i=0; i<perlist.length; i++){
			let cart_no=perlist[i].cart_no;
			
			 // AJAX 요청을 통해 서버에서 해당 항목을 삭제하는 로직
			$.ajax({
			      url: "/cart/deleteItem.do",
			      method: "POST",
			      data: { cart_no: cart_no },
			      success: function(response) {
			        // 삭제 성공 시 처리할 로직
			        console.log("항목이 삭제되었습니다.");
			      },
			      error: function(xhr, status, error) {
			        // 삭제 실패 시 처리할 로직
			        console.log("항목 삭제 실패");
			      }
			    });
			
		}
	}
	</script>
<script>
function updateTotal() {
	  let totalCount = 0;
	  let totalPrice = 0;
	  
	  // 프로그램 체크박스 처리
	  let proCheckboxes = document.getElementsByName("pro_checkbox");
	  for (let i = 0; i < proCheckboxes.length; i++) {
	    if (proCheckboxes[i].checked) {
	      let rowSum = parseInt(document.getElementById("rowSum" + proCheckboxes[i].value).innerText.replace(/,/g, ""));
	      totalPrice += rowSum;
	      totalCount++;
	    }
	  }
	  
	  // 공연 체크박스 처리
	  let perCheckboxes = document.getElementsByName("per_checkbox");
	  for (let i = 0; i < perCheckboxes.length; i++) {
	    if (perCheckboxes[i].checked) {
	      let rowSum = parseInt(document.getElementById("rowSum" + perCheckboxes[i].value).innerText.replace(/,/g, ""));
	      totalPrice += rowSum;
	      totalCount++;
	    }
	  }
	  
	  // 건수와 금액 업데이트
	  //document.getElementById("totalPrice").innerText = numberWithCommas(totalPrice);
	  //return totalCount; // totalCount 값을 반환
	  
	  let totalCountElement = document.getElementById("totalCount");
	  totalCountElement.textContent = totalCount === 0 ? '0' : totalCount;
	  document.getElementById("totalPrice").textContent = numberWithCommas(totalPrice);
	  
	  //document.getElementById("totalCount").innerText = totalCount === 0 ? '0' : totalCount.toString();
	  //document.getElementById("totalPrice").innerText = numberWithCommas(totalPrice);
	  
	  return totalPrice;
	}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
<%@ include file="../footer.jsp" %>