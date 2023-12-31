<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 program -- read.jsp -->
프로그램 상세페이지
<br>
<!-- 관리자만 볼 수 있음 -->
<input type="button" value="프로그램 시간 추가" onclick="location.href='../programtime/create.do?pro_obj=${dto.pro_obj}'">
<input type="button" value="프로그램 시간 수정">
 
<input type="button" value="프로그램 목록" onclick="location.href='list.do'">
<br>

<table border="1">
	<tr>
		<td>
		<div>
			<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_poster}">
		</div>
		<div>
			<table border="1">
				<tr>
					<th>프로그램명</th>
					<td>${dto.pro_name}</td>
				</tr>
				<tr>
					<th>대상</th>
					<td>${dto.pro_age}</td>
				</tr>
				<tr>
					<th>수업 성향</th>
					<td>${dto.prochar_no}</td>
				</tr>
				<tr>
					<th>수강기간</th>
					<td>${dto.proper_start} ~ ${dto.proper_end}</td>
				</tr>
				<tr>
					<th>수강요일</th>
					<td>${dto.pro_day}</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td>${dto.pro_fee}</td>
				</tr>
				<tr>
					<th>수업 시간 | 강사</th>
					<td>
					<c:forEach var="i" items="${ptlist}">
						${i.pro_time} | ${i.t_code} <br>
					</c:forEach>
					</td>
				</tr>
				<tr>
					<th>수강 정원</th>
					<td>${dto.pro_limit}명</td>
				</tr>
				<tr>
					<th>접수기간</th>
					<td>${dto.prorec_start} ~ ${dto.prorec_end}</td>
				</tr>
			</table>
		</div>
		</td>
	</tr>
	<tr>
		<td>
			<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_img}">
		</td>
	</tr>
</table>

<!-- 예매하기 -->
<input type="button" value="예매하기" onclick="#">

<!-- 찜하기 -->
<input type="button" value="찜하기" onclick="addLike('${dto.pro_obj}')">
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
	function addLike(pro_obj){
		if(confirm("관심프로그램으로 등록하시겠습니까?")){
			// Ajax를 사용하여 찜 테이블에 INSERT 요청 보내기
		    var xhr = new XMLHttpRequest();
		    xhr.open("POST", "/likeprogram/like.do", true);
		    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		    xhr.onreadystatechange = function() {
		        if (xhr.readyState === 4 && xhr.status === 200) {
		            // 요청 완료 후의 로직 수행
		            alert("찜이 완료되었습니다.");
		        }
		    };
		    xhr.send("pro_obj=" + pro_obj);
		}
	}//addLike() end
</script>
        
<%@ include file="../footer.jsp" %>
