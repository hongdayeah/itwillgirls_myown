<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>



  <!-- 본문 시작 performanceSeatList.jsp -->
    <h3>*좌석예매폼*</h3>
		
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
	





		


	
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


