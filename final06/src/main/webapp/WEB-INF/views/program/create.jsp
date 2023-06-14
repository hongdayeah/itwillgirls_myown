<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

    <!-- program -- create.jsp -->
    
    <button type="button" class="btn btn-outline-secondary" onclick="location.href='list'">프로그램 목록가기</button>
    <br>    
    프로그램 등록하기
    <br>
    
    <form name="programfrm" id="programfrm" method="post" action="insert" enctype="multipart/form-data">
    	<table border="1">
			<tr>
				<th>프로그램코드<br>
					(A:미술  S:체육  E:교육  M:음악)
				</th>
				<td>
					<input type="text" name="pro_obj">
				</td>
			</tr>
			<tr>
				<th>프로그램 이름</th>
				<td><input type="text" name="pro_name"></td>
			</tr>
			<tr>
				<th>성향 정보</th>
				<td>
					<input type="checkbox" name="prochar_no" value="IE">IE
					<input type="checkbox" name="prochar_no" value="II">II
					<input type="checkbox" name="prochar_no" value="EE">EE
					<input type="checkbox" name="prochar_no" value="EI">EI
				</td>
			</tr>
			<tr>
				<th>정원</th>
				<td><input type="number" id="pro_limit" name="pro_limit" min="1"><td>
			</tr>
			<tr>
				<th>수강료</th>
				<td><input type="text" name="pro_fee"></td>
			</tr>
			<tr>
				<th>접수기간</th>
				<td>
					<input type="date" name="prorec_start" id="prorec_start"> ~ <input type="date" name="prorec_end" id="prorec_end">
				</td>
			</tr>
			<tr>
				<th>수강기간</th>
				<td>
					<input type="date" name="proper_start" id="proper_start"> ~ <input type="date" name="proper_end" id="proper_end">
				</td>
			</tr>
			<tr>
				<th>수강연령</th>
				<td><input type="text" name="pro_age" id="pro_age"></td>
			</tr>
			<tr>
				<th>프로그램 설명</th>
				<td><textarea rows="3" cols="30" name="pro_exp" id="pro_exp" placeholder="간단한 설명을 덧붙여보세요!"></textarea></td>
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
        
<%@ include file="../footer.jsp" %>
