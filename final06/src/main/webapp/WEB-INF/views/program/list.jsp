<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 ProgramList.jsp -->

<div>프로그램 목록</div>

<div class="container">
	<table class="table table-bordered">
	<tr>
		<c:forEach items="${list}" var="row" varStatus="vs">
			<td>
				<c:choose>
					<c:when test="${rows.PRO_IMG != '-'}">
						<img src="/storage/${row.PRO_IMG}" width="100px">
					</c:when>
					<c:otherwise>
						등록된 사진 없음<br>
					</c:otherwise>
				</c:choose>
				<br>
				프로그램명 : <a>${row.PRO_NAME}</a>
				<br>
				<!-- 설명 -->
				${row.PRO_EXP}
				<br>
				일시 : ${row.PROPER_START}<br>
				대상 : ${row.PRO_AGE}<br>
				비용 : ${row.PRO_FEE}<br>
			</td>
			<!-- 테이블 한 줄에 3칸씩 -->
			<c:if test="${vs.count mod 3==0}">
				</tr><tr>
			</c:if>
		</c:forEach>
	</tr>
	</table>
</div>

<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
