<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<head>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>


    <!-- 본문 시작 performanceList.jsp -->
    <h3>*공연상세페이지*</h3>

	<input type="button" value="공연목록" onclick="location.href='list.do'">

	<table>
			<tr><td colspan="2"><img src="../perstorage/${dto.per_img}" width="400"></td></tr>
			<tr><td>제목</td><td>${dto.per_name}</td></tr>
			<tr><td>설명</td><td>${dto.per_exp}</td></tr>
			<tr><td>날짜</td><td>${dto.per_date}</td></tr>
			<tr><td>시간</td><td>${dto.per_time}</td></tr>
			<tr><td>장소</td><td>${dto.class_code}</td></tr>
			<tr><td>공연료</td><td>${dto.per_fee}</td></tr>
		
			<tr><td>
                <input type="button" value="수정" onclick="location.href='update.do?per_code=${dto.per_code}"'>
                <input type="button" value="삭제" onclick="location.href='delete.do?per_code=${dto.per_code}"'>
            </td></tr>

	<div class="container">
			<tr><td>수량선택</td><td>
				<select name="pernum">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</td></tr>
			<tr><td>
				<input type="button" value="좌석예매" onclick="location.href='seat.do'">
				
				
			</td></tr>
			
	

	</div>
		
		</script>
	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


