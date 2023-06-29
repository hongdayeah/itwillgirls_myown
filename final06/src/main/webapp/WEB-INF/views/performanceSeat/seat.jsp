<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<style>
		.seat {
		  display: inline;
		  justify-content : center;
		  width : 50px;
		  height : 50px;
		  background-color : pink;	
		  margin : 5px;  
		}
		.occupiedSeat {
		  display: inline;
		  justify-content : center;
		  width : 50px;
		  height : 50px;
		  background-color : gray;	
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
		
	<div class="seatList">
		<div class="availableSeat"></div>
		<div class="selectedSeat"></div>
		<div class="occupiedSeat"></div>
	</div>
		
	<table>
	
		<tr>
			<th>제목</th>
			<td>${dto.per_name}<td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${dto.per_date}<td>
		</tr>
		<tr>	
			<th>시간</th>
			<td>${dto.per_time}<td>
		</tr> 
		
		<tr>
			<th>수량선택</th>
			<td>
				<select name="pernum" id="pernum">
					<option value=0>수량을 선택하세요</option>
					<option value=1>1</option>
					<option value=2>2</option>
					<option value=3>3</option>
					<option value=4>4</option>
					<option value=5>5</option>
				</select>
			</td>
		</tr>
		</table>

			<strong>좌석 배치도</strong>
			<br>

			<div class="seatcontainer">
			  <c:forEach var="i" begin="1" end="${perSeatdto.class_row}" step="1">
			    <c:forEach var="j" begin="1" end="${perSeatdto.class_column}" step="1">
			      <c:set var="occupied" value="false" />
			      <c:forEach var="seat" items="${seatList}">
			        <c:if test="${seat.row == i && seat.col == j && seat.isReserved == 1}">
			          <c:set var="occupied" value="true" />
			        </c:if>
			      </c:forEach>
			      <!-- occupied 값이 true일 경우 클래스를 occupiedSeat 으로 지정하고 아닐경우 클래스를 seat으로 지정한다
			      	   occupied 값이 true일 경우 disable 시켜서 버튼에 disabled 속성이 추가되도록 함
			      	   occupied 값이 false일 경우 buttons(this.id)함수가 클릭이벤트를 처리함 -->
			   		<button class="seat ${occupied ? 'occupiedSeat' : 'seat'}" id="${i}${j}" ${occupied ? 'disabled' : ''} onclick="${occupied ? '' : 'buttons(this.id)'}">
					 	${i}${j}
			     	</button>
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
				        button.style.backgroundColor = 'orange';
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
			  
			  // arrSeat 배열 값을 쉼표로 구분해서 문자열로 변환하여 arrSeat 입력란의 value 속성에 할당함
			  // join() 메서드는 배열의 모든 요소를 연결해 하나의 문자열로 만든다.
			  document.getElementById('arrSeat').value = arrSeat.join(',');
			  
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
			    return true; // confirm에서 확인 누르면 폼 제출
			  } else {
			    return false; // confirm에서 취소 누르면 alert창 꺼짐
			  }
			}
			</script>
			
			<form name="rsvseats" id="rsvseats" method="POST" action="/performance/perInsert.do" enctype="multipart/form-data">
			  <input type="hidden" name="per_code" id="per_code" value="${dto.per_code}">
			  <input type="hidden" name="arrSeat"  id="arrSeat" value="${arrSeat}">
			  <input type="hidden" name="selectNum"  id="selectNum" value="${selectNum}">
			  <input type="hidden" name="per_fee"  id="per_fee" value="${dto.per_fee}">
			  <input type="submit" class="btn btn-warning" value="예매하기" onclick="return reserveSeats()">
			</form>

			</html>



	
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


