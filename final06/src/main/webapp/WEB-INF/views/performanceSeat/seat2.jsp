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
			<select name="pernum">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</td></tr>

		</table>

			<strong>좌석 배치도</strong>
			<br>
			
			<div class="seatcontainer">
			<c:forEach var="i" begin="1" end="${perSeatdto.class_row}" step="1">
				<c:forEach var="j" begin="1" end="${perSeatdto.class_column}" step="1">
					<div class='seat' id="seat${i}${j}" onclick="changeColor('seat${i}${j}')">${i}${j}</div>
				</c:forEach><br/>
			</c:forEach>
			</div>

			<div class="seatcontainer">
			  <c:forEach var="i" begin="1" end="${perSeatdto.class_row}" step="1">
			    <c:forEach var="j" begin="1" end="${perSeatdto.class_column}" step="1">
			      <button class='seat' id="seat${i}${j}" onclick="changeColor('seat${i}${j}')">${i}${j}</button>
			    </c:forEach><br/>
			  </c:forEach>
			</div>
			
			<script>
			  function changeColor(buttonId) {
			    var button = document.getElementById(buttonId);
			    button.style.backgroundColor = "green";
			    alert(button);
			  }
			</script>
			
			</html>



	
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


