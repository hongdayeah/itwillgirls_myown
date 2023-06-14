<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

    <!-- program -- list.jsp -->
    
    <button type="button" class="btn btn-outline-primary" onclick="location.href='create'">프로그램등록</button>
    <br>
    프로그램 목록
    <table border="1">
    	<tr>
   		<c:forEach var="row" items="${list}" varStatus="vs">
   			<td>
   			<c:choose>
   				<c:when test="${row.PRO_IMG != '-'}">
   					<img src="../storage/${row.PRO_IMG}" width="100px">
   				</c:when>
   				<c:otherwise>
   					등록된 사진 없음<br>
   				</c:otherwise>
   			</c:choose>
   			<br>
   			프로그램명 : ${row.PRO_NAME}
   			</td>
   			<c:if test="${vs.count mod 3==0}">
   				<tr></tr>
   			</c:if>
   		</c:forEach>
    	</tr>
    </table>
    <br>
    
    
    
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
