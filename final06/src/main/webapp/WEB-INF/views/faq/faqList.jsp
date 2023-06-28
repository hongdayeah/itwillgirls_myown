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
					예약 - 대관신청
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
						자주묻는 질문
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 template.jsp -->
<!--container start-->

<section id="faq">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 mar-b-30">
                <div id="heading">
                    <h1 class="wow flipInX">F.A.Q.</h1>
                    <p class="lead wow fadeIn">자세한 문의는 문의게시판을 이용해주세요.</p>
                </div>
                <div class="panel-group wow fadeInUp" id="accordion" data-wow-duration="2s">
                    <c:forEach var="dto" items="${list}" varStatus="status">
                        <!-- PANEL -->
                        <div class="panel panel-default">
                            <div class="panel-heading panel-heading-faq">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse-${status.index}">
                                        ${dto.f_question}
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-${status.index}" class="panel-collapse collapse">
                                <div class="panel-body panel-faq">
                                    <p>${dto.f_answer}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div><!-- /panel-group -->
            </div><!-- /col-md-10 -->
        </div>
    </div>
    <c:if test="${member_dto.p_id == 'webmaster'}">
    <div align="center">
		<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='/faq/list2.do'">관리자 리스트</button>
	</div>
	</c:if>
<br><br>
</section>
<br><br>


<!--container end-->
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
