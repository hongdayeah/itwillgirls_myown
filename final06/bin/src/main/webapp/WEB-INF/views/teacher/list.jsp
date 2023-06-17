<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

    <!-- teacher -- list.jsp -->
    <button type="button" class="btn btn-outline-primary" onclick="location.href='create.do'">강사 등록</button>
    <br>
    강사 목록
    <table border="1">
		<thead>
			<tr>
				<th>이미지</th>
				<th>강사이름</th> 
			</tr>
		</thead>				
	
	
		<c:forEach var="dto" items="${list}">
			<tr>
				<td><img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.t_photo}" width="200"></td>
				<td><a href="read.do?t_code=${dto.t_code}">${dto.t_name}</a></td>
				<td>
		               <input type="button" value="수정" onclick="#">
		               <input type="button" value="삭제" onclick="#">
		        </td>
		
			</tr>
		</c:forEach>

	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
