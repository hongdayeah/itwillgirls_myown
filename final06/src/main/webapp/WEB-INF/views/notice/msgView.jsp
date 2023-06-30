<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 program -- createForm.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					NOTICE
				</h1>
			</div>
			<div class="col-lg-8 col-sm-8">
				<ol class="breadcrumb pull-right">
					<li>
						<a href="../home.do">
							Home
						</a>
					</li>
					<li>
						<a href="list.do">
							소식
						</a>
					</li>
					<li class="create">
						공지사항
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
    <!-- 본문 시작 performanceList.jsp -->
    <h3>공지사항 제출여부</h3>
    
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


