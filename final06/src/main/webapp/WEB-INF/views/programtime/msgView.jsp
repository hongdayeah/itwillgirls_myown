<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


<!-- 본문 시작 programtime -- msgView.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리센터 프로그램을 소개합니다
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
							프로그램
						</a>
					</li>
					<li class="">
						프로그램 등록
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->


<div class="title">알림</div>
  
<div class="content">
	<dl>
		<dd>${msg1 != null ? img : ""} ${msg1}</dd>
	</dl>
	<p>
	 	${link1} <!-- ${link2} -->
	</p>
</div>


<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


