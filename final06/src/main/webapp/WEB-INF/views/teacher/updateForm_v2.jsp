<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 teacher -- updateForm.jsp -->
<button type="button" class="btn btn-outline-secondary" onclick="location.href='list.do'">강사 목록가기</button>
<br>
강사 수정
<br>

<form name="teacherfrm" id="teacherfrm" method="POST" action="update.do" onsubmit="return updateCheck()" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th>강사코드</th>
			<td>
				<input type="text" name="t_code" value="${dto.t_code}">
			</td>
		</tr>
		<tr>
			<th>강사 이름</th>
			<td>
				<input type="text" name="t_name" value="${dto.t_name}">
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<input type="text" name="t_phone" value="${dto.t_phone}">
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="text" name="t_birth" value="${dto.t_birth}">
			</td>
		</tr>
		<tr>
			<th>성별</th> <!-- 체크값 가져오기 -->
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
		<input type="submit" value="수정">
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
