<%@page import="java.util.List"%>
<%@page import="kr.co.itwill.teacher.TeacherDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 programtime -- createForm.jsp -->

<button type="button" class="btn btn-outline-secondary" onclick="javascript:history.back()">뒤로가기</button>
<br>    

<br>
  
<form name="protimefrm" id="protimefrm" method="POST" action="create.do">
<input type="hidden" name="pro_obj" value="${requestScope.pro_obj}">
<!-- 프로그램 제목도 보여주고싶음 ㅠㅠ -->
<!-- <input type="hidden" name="pro_name" value="${reqeustScope.pro_name}"> -->
 	<table border="1">
		<tr>
			<th>프로그램코드</th>
			<td>
				<input type="text" id="pro_obj" name="pro_obj" value="${requestScope.pro_obj}" readonly>
			</td>
		</tr>
		<!-- 
		<tr>
			<th>프로그램 이름</th>
			<td>
				<input type="text" id="pro_name" value="${requestScope.pro_name}" readonly>
			</td>
		</tr>
		-->
		<tr>
			<th>프로그램 시간코드</th>
			<td>
				<input type="text" id="pro_code" name="pro_code">
			</td>
		</tr>
		<tr>
			<th>시간대</th>
			<!-- createCheck()에서 두 타임 모두 추가할 때 중복 insert 안되도록 유효성검사 추가 -->
			<td>
				<input type="radio" id="pro_time" name="pro_time" value="10:00">10:00
				<input type="radio" id="pro_time" name="pro_time" value="14:00">14:00
			</td>
		</tr>
		<tr>
			<th>장소</th>
			<td>
			<!-- room_class테이블에서 행 개수만큼 갖고오기 -->
			<c:forEach var="i" items="${cdto}">
				<input type="radio" id="class_code" name="class_code" value="${i.class_code}">${i.class_name}
			</c:forEach>
			</td>
		</tr>
		<tr>
			<th>담당강사</th>
			<td>
			<!-- teacher테이블에서 행 개수만큼 갖고오고싶어요  -->
			<select id="t_code" name="t_code">
				<option selected>--강사님--</option>
				<c:forEach var="i" items="${tdto}">
					<option value="${i.t_code}">${i.t_name}</option>
				</c:forEach>
			</select>
			</td>
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
	function createCheck(){
		if(confirm("등록하시겠습니까?")){
			return true;
		}else{
			return false;
		}
	}
</script>
<%@ include file="../footer.jsp" %>
