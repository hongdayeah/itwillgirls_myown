<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 performanceList.jsp -->


	<div class="title"></div>

	<form name='per' method="post" action="delete.do">
		<input type="hidden" name="per_code" value="${requestScope.per_code}">
		<div class="content">
			<p>정말 삭제하시겠습니까?</p>
		</div>
		
		<div class='bottom'>
			<input type='submit' value='삭제진행'>
		</div>
		
	</form>

		
	
	

	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


