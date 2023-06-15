<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 performanceList.jsp -->
    <h3>*공연 등록 성공 여부*</h3>


	 <div class="title">알림</div>
    
    <div class="content">
	    <dl>
		    <dd>${msg1 != null ? img : ""} ${msg1}</dd>
	    </dl>
	    <p>
		    ${link1} ${link2}
	    </p>
    </div>

	
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


