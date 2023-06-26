<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


	<style>
		.seat {
		  display: inline;
		  justify-content : center;
		  width : 50px;
		  height : 50px;
		  background-color : pink;	
		  margin : 5px;  
		}
	</style>
	
	
	  <!-- 본문 시작 performanceSeatList.jsp -->
	  
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
	                  <a href="list.do">
	                     공연
	                  </a>
	               </li>
	               <li class="">
	                  좌석예매
	               </li>
	            </ol>
	         </div>
	      </div>
	   </div>
	</div>
	<!--breadcrumbs end-->
	  
	 <html>
  
  
    <h3>좌석 예매</h3>
    <h4>예매 할 좌석을 선택 해 주세요</h4>
		

		
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>날짜</th>
				<th>시간</th>
			</tr>
		</thead>	
		
		<td>${dto.per_name}<td>
		<td>${dto.per_date}<td>
		<td>${dto.per_time}<td>
		
		
		<tr><td>수량선택</td><td>
			<select name="pernum" id="pernum">
				<option value=0>수량을 선택하세요</option>
				<option value=1>1</option>
				<option value=2>2</option>
				<option value=3>3</option>
				<option value=4>4</option>
				<option value=5>5</option>
			</select>
		</td></tr>
		

		</table>

			<strong>좌석 배치도</strong>
			<br>

			<div class="seatcontainer">
			  <c:forEach var="i" begin="1" end="${perSeatdto.class_row}" step="1">
			    <c:forEach var="j" begin="1" end="${perSeatdto.class_column}" step="1">
			      <button class='seat' id="${i}${j}" onclick="buttons(this.id)" >${i}${j}</button>
			    </c:forEach><br/>
			  </c:forEach>
			</div>
			
			<script>
			//수량 변수 설정
			var seatNum=document.getElementById('pernum');
			var selectNum=0;
			
			//좌석을 담을 배열 생성
			var arrSeat=[]; 
			
			//수량 변경시 이벤트 리스너
			seatNum.addEventListener('change', function(){
				selectNum=seatNum.value;
				alert('선택수량:'+ selectNum);
			})
			
		
			// button 클릭시 실행하는 함수
			function buttons(id) {
				  if (selectNum == 0) {
				    alert("예매할 수량을 선택해주세요.");
				  } else {
				    var button = document.getElementById(id);
				    //arrSeat 배열에서 id값 찾아서 인덱스 확인
				    //indexof()사용해서 배열에서 ID 값을 찾을 수 없는경우 -1을 리턴함
				    var index = arrSeat.indexOf(id);
				    if (index > -1) {
				      // 이미 선택된 버튼인 경우 선택 취소
				      button.style.backgroundColor = 'pink';
				      arrSeat.splice(index, 1);
				    } else {
				      // 선택되지 않은 버튼인 경우 선택 추가
				      if (arrSeat.length < selectNum) {
				        button.style.backgroundColor = 'green';
				        arrSeat.push(id);
				      } else {
				        alert("좌석은 최대 " + selectNum + "석까지만 선택 가능합니다.");
				      }
				    }
				  }
				}
			
			
			function reserveSeats() {
			  if (selectNum == 0) {
			    alert("수량을 선택 해 주세요");
			    return false; // 폼 제출 취소
			  }

			  if (arrSeat.length != selectNum) {
			    alert("좌석을 모두 선택해 주세요.");
			    return false; // 폼 제출 취소
			  }

			  var returnValue = confirm(
			    "예매 정보\n" +
			    "공연 : " + "${dto.per_name}" + "\n" +
			    "공연 날짜: " + "${dto.per_date}" + "\n" +
			    "공연 시간: " + "${dto.per_time}" + "\n" +
			    "선택된 좌석: " + arrSeat + "\n" +
			    "선택된 수량: " + selectNum
			  );

			  if (returnValue) {
			    alert("장바구니로 이동합니다");
			    return true; // 폼 제출
			  } else {
			    return false; // 폼 제출 취소
			  }
			}
			</script>
			
			<!--<button class="btn btn-warning" onclick="reserveSeats()"> 예매하기</button>  -->
				
			<form id="rsvseats" action="/performance/perInsert.do" method="POST">
			  <input type="hidden" name="per_name" value="${dto.per_name}">
			  <input type="hidden" name="per_date" value="${dto.per_date}">
			  <input type="hidden" name="per_time" value="${dto.per_time}">
			  <input type="hidden" name="arrSeat" value="${arrSeat}">
			  <input type="hidden" name="selectNum" value="${selectNum}">
			  <input type="submit" class="btn btn-warning" value="예매하기" onclick="return reserveSeats()">
			</form>

			</html>



	
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


