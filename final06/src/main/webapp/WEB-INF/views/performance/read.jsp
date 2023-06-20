<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<head>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="../css/calendar.css" rel="stylesheet" type="text/css">	
</head>


    <!-- 본문 시작 performanceList.jsp -->
    <h3>*공연상세페이지*</h3>

	<input type="button" value="공연목록" onclick="location.href='list.do'">

	<table>
		<tr>
			<td><img src="../perstorage/${dto.per_img}" width="400"></td>
			<td>${dto.per_name}</td>
			<td>${dto.per_exp}</td>
			<td>${dto.per_date}</td>
			<td>${dto.per_time}</td>
			<td>${dto.class_code}</td>
			<td>${dto.per_fee}</td>
			<td>
                <input type="button" value="수정" onclick="location.href='update.do?per_code=${dto.per_code}"'>
                <input type="button" value="삭제" onclick="location.href='delete.do?per_code=${dto.per_code}"'>
            </td>
	
		</tr>
			
		<section style="float: right; width: 307px;">
		    <div id="calendar_popup" class="calendar_popup_02" style="; ;">
		      <div class="popup_warp">
		        <div id="datepicker" style="background:#fff; border-radius:10px; min-height:230px;"></div>
		        <input type="hidden" name="is_calendar" id="is_calendar" value="y">
		        <form method="post" id="regiform" name="regiform" action="#">
		          <div class="time_select selectBox">
		            <p class="selectbox_title">시간선택</p>
		          </div>
		          <div class="choice_select">
		            <p class="title">수량선택</p>
		            <div class="select_list"></div>
		          </div>
		          <div class="total_warp">
		            <p class="title">총 결제금액</p>
		            <p class="total_price"></p>
		          </div>
		          <div class="submit_btn">
		            <button href="#" class="disabled">결제하기</button>
		          </div>
		        </form>
		      </div>
		    </div>

		
		<script>	
		// 달력 셋팅
		
		$(function(){
			$('#datepicker').datepicker({
				  dateFormat: "yy-mm-dd",
			      monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
			      monthNamesShort: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
			      dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			      dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			      dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			      showMonthAfterYear: true,
			      yearSuffix: '년',
			      minDate: 0
			}); 
		})
	
				
		</script>
	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


