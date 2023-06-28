	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    
	<%@ include file="../header.jsp" %>
	
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
								공연
							</a>
						</li>
						<li class="">
							공연 등록
						</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!--breadcrumbs end-->
	
	<div class="btn-position">
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='list.do'">공연 목록가기</button>
	</div>
	
	<div class="container privacy-terms">
		<div class="bs-docs-section mar-b-30">
	    <h1 id="forms" class="page-header" style="text-align: center;">공연 등록하기</h1>
		<div class="bs-programform">
		
			<form name="per" method="POST" action="create.do" enctype="multipart/form-data">
		    
		        <div class="per-group">
		          <label>공연코드</label>
		          <input type="text" class="form-control short" name="per_code" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>공연이름</label>
		          <input type="text" class="form-control short" name="per_name" size="50">
		        </div>
		        <div class="per-group">
		          <label><br>공연설명</label><br>
		          <textarea class="form-control short" rows="5" cols="50" name='per_exp'></textarea>
		        </div>
		        <div class="per-group">
		          <label><br>상영날짜</label>
		          <input type="date" class="form-control short" name="per_date" min="2020-01-01" max="2029-12-31">
		        </div>
		        <div class="per-group">
		          <label><br>상영시간</label>
		          <input type="time" class="form-control short" name="per_time" >
		        </div>
		        <div class="per-group">
		          <label><br>공연료</label>
		          <input type="text" class="form-control short" name="per_fee" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>정원</label>
		          <input type="text" class="form-control short" name="per_limit" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>장소</label>
		          <div class="class">
			          <input type="radio" name="class_code" value="theater" checked="checked">극장
			          <input type="radio" name="class_code" value="outdoor">야외  
		          </div>
		        </div>
		        <div class="per-group">
				  <label><br>포스터</label>
		          <input type="file" name="per_imgMF" size="50">  
		        </div>	    
		    
			    <div class='bottom'><br>
			      <input type='submit' class="btn btn-success" value='등록'>
			      <button type="reset" class="btn btn-warning">초기화</button>
			    </div>
		    </div>
		</div>    
	</div>	    
	</form>
		
	    <!-- 본문 끝 -->
	        
	<%@ include file="../footer.jsp" %>