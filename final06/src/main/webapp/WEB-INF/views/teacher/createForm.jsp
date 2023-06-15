<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

    <!-- teacher -- createForm.jsp -->
    <button type="button" class="btn btn-outline-secondary" onclick="location.href='list.do'">강사 목록가기</button>
    <br>
    강사 등록
    <br>
    
    <form name="teacherfrm" id="teacherfrm" method="POST" action="create.do" enctype="multipart/form">
    	<table border="1">
    	<tr>
    		<th>강사코드</th>
    		<td>
    			<input type="text" name="t_code">
    		</td>
    	</tr>
    	<tr>
    		<th>강사 이름</th>
    		<td>
    			<input type="text" name="t_name">
    		</td>
    	</tr>
    	<tr>
    		<th>연락처</th>
    		<td>
    			<input type="text" name="t_phone">
    		</td>
    	</tr>
    	<tr>
    		<th>생년월일</th>
    		<td>
    			<input type="text" name="t_birth" placeholder="6자리 숫자">
    		</td>
    	</tr>
    	<tr>
    		<th>성별</th>
    		<td>
    			<input type="radio" name="t_gender" value=1>남자
    			<input type="radio" name="t_gender" value=2>여자
    		</td>
    	</tr>
    	<tr>
			<th>사진</th>
			<td>
			<input type="file" name="t_photoMF">
			</td>
		</tr>
    	</table>
    	<div>
    		<input type="submit" value="등록">
    		<input type="reset" value="초기화">
    	</div>
    </form>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
