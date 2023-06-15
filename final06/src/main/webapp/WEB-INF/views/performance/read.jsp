<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


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
                <input type="button" value="수정" onclick="#">
                <input type="button" value="삭제" onclick="#">
            </td>
	
		</tr>
	


	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


