<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 performanceList.jsp -->
    <h3>*공연등록폼*</h3>

	
	<form name="percreate" method="POST" action="create.do" enctype="multipart/form-data">
	    
	    <table>
	        <tr>
	          <th>공연코드</th>
	          <td><input type="text" name="per_code" size="20"></td>
	        </tr>
	        <tr>
	          <th>공연이름</th>
	          <td><input type="text" name="per_name" size="50"></td>
	        </tr>
	        <tr>
	          <th>공연설명</th>
	          <td><textarea rows="5" cols="50" name='per_exp'></textarea></textarea></td>
	        </tr>
	        <tr>
	          <th>상영날짜</th>
	          <td><input type="date" name="per_date" min="2020-01-01" max="2029-12-31"></td>
	        </tr>
	        <tr>
	          <th>상영시간</th>
	          <td><input type="text" name="per_time" size="20"></td>
	        </tr>
	        <tr>
	          <th>공연료</th>
	          <td><input type="text" name="per_fee" size="20"></td>
	        </tr>
	        <tr>
	          <th>정원</th>
	          <td><input type="text" name="per_imit" size="20"></td>
	        </tr>
	        <tr>
	          <th>장소</th>
	          <td>
	          <input type="radio" name="class_code" value="theater" checked="checked">극장
	          <input type="radio" name="class_code" value="outdoor">야외  
	          </td>
	        </tr>
	        <tr>
	          <th>포스터</th>
	          <td><input type="file" name="per_imgMF" size="50"></td>    
	        </tr>
        </table>	    
	    
	    <div class='bottom'>
	      <input type='submit' value='공연등록'>
	      <input type='button' value='공연목록' onclick="location.href='list.do'">
	      <input type="button" value="HOME"  onclick="location.href='/home.do'"> <!-- 절대경로 -->
	    </div>
	    
	</form>
	
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>