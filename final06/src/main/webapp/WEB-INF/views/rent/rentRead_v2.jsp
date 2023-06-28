<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<h3>대관신청서 상세보기</h3>

<table border="1" align="center" style="width: 900px; height: 1000px; text-align:center;">
	<tr align="center">
		<td style="background-color:#EFEFEF">신청일자</td>
		<td>${dto.rent_app}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">대관일자</td>
		<td>${dto.rent_date}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">대관목적</td>
		<td>${dto.rent_per}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">단체명</td>
		<td>${dto.rent_group}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">담당자 성함</td>
		<td>${dto.rent_name}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">담당자 연락처</td>	
		<td>${dto.rent_phone}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">담당자 이메일주소</td>
		<td>${dto.rent_email}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">대관장소</td>
		<td>${dto.class_code}</td>
	</tr>
	<tr align="center">
		<td style="background-color:#EFEFEF">대관신청서</td>
		<td><script>
	  // 대관신청서 파일이 없을 경우 "제출안함" 텍스트로 대체
        <%-- 첨부 파일 이름과 확장명을 표시하고 클릭 시 다운로드 --%>
        if ("${dto.rent_form}" === "") {
          document.write("제출 안함");
        } else {
          var filePath = "${dto.rent_form}";
          var fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
          document.write('<a href="/rentFormimg/' + filePath + '" download>' + fileName + '</a>');
        }
      </script>
	</td>
	</tr>
	
</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
