<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 program -- read.jsp -->
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
						프로그램 소개
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<div class="btn-position">
	<button class="btn btn-primary" onclick="location.href='../programtime/create.do?pro_obj=${dto.pro_obj}'">시간표 등록</button>
	<button class="btn btn-warning" onclick="location.href='update.do?pro_obj=${dto.pro_obj}'">프로그램수정</button>
	<button class="btn btn-danger" onclick="return deleteCheck()">프로그램삭제</button>
</div>

<!--container start-->
<div class="container">
	<div class="row">
	<!--blog start-->
		<div class="col-lg-9">
			<div class="blog-item">
				<div class="row">
					<div class="col-lg-2 col-sm-2">
						<div class="col-lg-12 col-sm-12 text-right">
							<div class="st-view">
								<ul class="list-unstyled">
									<li>
										${dto.pro_readcnt} 명 조회함
									</li>
									<li>
										n 명이 관심있어함 (찜개수)
									</li>
									<li>
										n 개의 리뷰개수
									</li>
								</ul>
							</div>
						</div>
					</div>
				
					<div class="col-lg-10 col-sm-10">
						<div class="blog-img gs">
							<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_img}" alt="${dto.pro_img}"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-sm-12">
						<h1 style="font-weight:bold;">${dto.pro_name}</h1>
							<div class="table-responsive">
								수업 성향 : ${dto.prochar_no} <br><br>
								<table class="table table-bordered table-striped">
									<colgroup>
									  <col class="col-xs-1">
									  <col class="col-xs-7">
									</colgroup>
								  
									<tbody>
									<tr>
										<td>프로그램 설명</td>
										<td>${dto.pro_exp}</td>
									</tr>
									<tr>
										<td>대상</td>
										<td>${dto.pro_age}</td>
									</tr>
									<tr>
										<td>수강기간</td>
										<td>
											<c:set var="proStart" value="${fn:substring(dto.proper_start, 5, 10)}" />
											<c:set var="proEnd" value="${fn:substring(dto.proper_end, 5, 10)}" />
											${proStart} ~ ${proEnd}
										</td>
									</tr>
									<tr>
										<td>수업 타임</td>
										<td>
											<c:forEach var="i" items="${ptlist}">
												<c:choose>
													<c:when test="${empty i.pro_time}">
														아직 추가되지 않았습니다 <!-- 안되는데 -->
													</c:when>
													<c:otherwise>
														${i.pro_time} : ${i.t_code} 강사님 <br>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td>수강정원</td>
										<td>
											${dto.pro_limit} (여유 ${dto.pro_limit - 10}명) <!-- 예매한 사람 수만큼 뺴기 -->
										</td>
									</tr>
									<tr>
										<td> 접수기간</td>
										<td>
											<c:set var="proStart" value="${fn:substring(dto.proper_start, 5, 10)}" />
											<c:set var="proEnd" value="${fn:substring(dto.proper_end, 5, 10)}" />
											${proStart} ~ ${proEnd} <!-- (n일 남음)하고싶은데 안돼 -->
										</td>
									  </tr>
									</tbody>
								</table>
							</div>
							<a class="btn btn-app">
								<span class="badge bg-red">찜한 개수</span>
								<i class="fa fa-heart-o"></i> Likes
							</a>
							<br><br>
							<!-- 예매하기 -->
							<button class="btn btn-success" onclick="location.href='update.do?pro_obj=${dto.pro_obj}'">예매하기</button>
					
							<h3 style="font-weight:bold;">프로그램 후기</h3>
							<hr>
							<div class="media-body">
								<h4 class="media-heading">
									작성자이름 
									<span>  | </span>	
									<span>  날짜	</span>
								</h4>
								<p>내용</p>
							</div>
					        <!-- 리뷰 리스트 for문 -->
							<div class="media">
								<c:forEach var="review" items="${reviewList}">
									<div class="media-body">
										<h4 class="media-heading">
											작성자 아이디 들어가는 곳 <!-- dto.p_id -->
											<span> | </span>
											<span>댓글 단 날짜 <!-- dto.regdate --></span>
										</h4>
										<p>리뷰 내용 <!-- dto.review --></p>
									  	<hr>
									</div>
								</c:forEach>
							</div>
					</div>
				
					<div class="post-comment">
						<h3 class="skills">후기 남기기</h3>
						<form class="form-horizontal" role="form">
							<div class="form-group">
								<div class="col-lg-6">
								<!-- 현재 로그인한 값의 아이디 readonly로 넣어두기 -->
									<input type="text" placeholder="아이디" class="col-lg-12 form-control">
								</div>
								<div class="col-lg-6">
									<input type="text" placeholder="비밀번호" class="col-lg-12 form-control">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<textarea placeholder="후기를 남겨주세요!" rows="8" class=" form-control">
									</textarea>
								</div>
							</div>
							<p>
								<button type="submit" class="btn btn-info pull-right">등록하기</button>
							</p>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--container end-->
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
