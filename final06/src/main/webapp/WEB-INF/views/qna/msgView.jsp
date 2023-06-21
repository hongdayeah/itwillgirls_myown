<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 performanceList.jsp -->
    <h3>대관신청서 제출여부</h3>
    
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


