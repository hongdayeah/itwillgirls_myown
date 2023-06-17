<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 performanceList.jsp -->
    <h3>*공연삭제폼*</h3>

	<div class="title"> 음원 삭제 </div>

	<form name='per' method="post" action="delete.do">
		<input type="hidden" name="per_code" value="${requestScope.per_code}">
		<div class="content">
			<p>레알 삭제하실?</p>
		</div>
		
		<div class='bottom'>
			<input type='submit' value='삭제진행'>
		</div>
		
	</form>

		
	
	

	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


