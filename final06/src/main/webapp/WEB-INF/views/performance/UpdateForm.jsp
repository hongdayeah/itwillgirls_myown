<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 performanceList.jsp -->
    <h3>*공연수정폼*</h3> 


	<input type="button" value="공연등록" onclick="location.href='create.do'" onsubmit="return updateCheck()">

 
		
	<form name='per' method='POST' action="update.do" enctype="multipart/form-data">
	
		   <table>
	        <tr>
	          <th>공연코드</th>
	          <td><input type="text" name="per_code" value="${dto.per_code}" size="20"></td>
	        </tr>
	        <tr>
	          <th>공연이름</th>
	          <td><input type="text" name="per_name" value="${dto.per_name}" size="50"></td>
	        </tr>
	        <tr>
	          <th>공연설명</th>
	          <td><textarea rows="5" cols="50" name="per_exp">${dto.per_exp}</textarea></td>
	        </tr>
	        <tr>
	          <th>상영날짜</th>
	          <td><input type="date" name="per_date"  value="${dto.per_date}"min="2020-01-01" max="2029-12-31"></td>
	        </tr>
	        <tr>
	          <th>상영시간</th>
	          <td><input type="time" name="per_time" value="${dto.per_time}" size="20"></td>
	        </tr>
	        <tr>
	          <th>공연료</th>
	          <td><input type="text" name="per_fee" value="${dto.per_fee}" size="20"></td>
	        </tr>
	        <tr>
	          <th>정원</th>
	          <td><input type="text" name="per_limit" value="${dto.per_limit}" size="20"></td>
	        </tr>
	        <tr>
	          <th>장소</th>
	          <td>
	          <input type="radio" name="class_code" value="theater">극장
	          <input type="radio" name="class_code" value="outdoor">야외  
	          </td>
	        </tr>
	        <tr>
	          <th>포스터</th>
	          <img src="../perstorage/${dto.per_img}" width="100" }"><br>
	          <td><input type="file" name="per_imgMF" size="50"></td>    
	        </tr>
        </table>	   
        
        <div class="bottom">
        	<input type="submit" value="수정">
        	<input type="button" value="목록" onclick="location.href='list.do'">
        	<input type="button" value="홈" onclick="location.href='home.do'">
        </div>

	</form>
	<script>
		function updateCheck(){
			let message=" 삭제됨 수정 하실?";
			if(confirm(message)){
				return true;
			} else {
				return false;
			} //if end
		} //updateCheck() end
	
	</script>
	
	

	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


