<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 program -- updateForm.jsp -->

<button type="button" class="btn btn-outline-secondary" onclick="location.href='list.do'">프로그램 목록가기</button>
<br>    
프로그램 수정
<br>
  
<form name="programfrm" id="programfrm" method="POST" action="update.do" onsubmit="return updateCheck()" enctype="multipart/form-data">
 	<table border="1">
		<tr>
			<th>프로그램코드<br>
				(A:미술  S:체육  E:교육  M:음악)
			</th>
			<td>
				<input type="text" name="pro_obj" value="${dto.pro_obj}">
			</td>
		</tr>
		<tr>
			<th>프로그램 이름</th>
			<td><input type="text" name="pro_name" value="${dto.pro_name}"></td>
		</tr>
		<tr>
			<th>성향 정보</th> <!-- 선택되어있게 하기 -->
			<td>
				<input type="checkbox" name="prochar_no" value="pro_IE">IE
				<input type="checkbox" name="prochar_no" value="pro_II">II
				<input type="checkbox" name="prochar_no" value="pro_EE">EE
				<input type="checkbox" name="prochar_no" value="pro_EI">EI
			</td>
		</tr>
		<tr>
			<th>정원</th>
			<td><input type="number" id="pro_limit" name="pro_limit" min="1" value="${dto.pro_limit}"><td>
		</tr>
		<tr>
			<th>수강료</th>
			<td><input type="text" name="pro_fee" value="${dto.pro_fee}"></td>
		</tr>
		<tr>
			<th>접수기간</th>
			<td>
				<input type="date" name="prorec_start" id="prorec_start" value="${dto.prorec_start}"> ~ <input type="date" name="prorec_end" id="prorec_end" value="${dto.prorec_end}">
			</td>
		</tr>
		<tr>
			<th>수강기간</th>
			<td>
				<input type="date" name="proper_start" id="proper_start" value="${dto.proper_start}"> ~ <input type="date" name="proper_end" id="proper_end" value="${dto.proper_end}">
			</td>
		</tr>
		<tr>
			<th>수강 요일</th> <!-- 선택되어있게 하기 -->
			<td>
				<input type="checkbox" name="pro_day" value="Tue">화
				<input type="checkbox" name="pro_day" value="Wed">수
				<input type="checkbox" name="pro_day" value="Thu">목
				<input type="checkbox" name="pro_day" value="Fri">금
				<input type="checkbox" name="pro_day" value="Sat">토
				<input type="checkbox" name="pro_day" value="Sun">일
			</td>
		</tr>
		<tr>
			<th>수강연령</th>
			<td><input type="text" name="pro_age" id="pro_age" value="${dto.pro_age}"></td>
		</tr>
		<tr>
			<th>프로그램 설명</th>
			<td><textarea rows="3" cols="30" name="pro_exp" id="pro_exp" placeholder="간단한 설명을 덧붙여보세요!">${dto.pro_exp}</textarea></td>
		</tr>
		<tr>
			<th>썸네일 이미지</th>
			<td><input type="file" name="pro_posterMF"></td>
		</tr>
		<tr>
			<th>프로그램 설명 이미지</th>
			<td><input type="file" name="pro_imgMF"></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="올리기">
		<input type="reset" value="초기화">
	</div>
</form>
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
	function updateCheck(){
		if(confirm("수정하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
</script>
        
<%@ include file="../footer.jsp" %>
