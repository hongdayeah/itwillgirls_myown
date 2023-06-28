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
		<button type="button" class="btn btn-outline-secondary" onclick="location.href='/performance/list.do'">공연 목록가기</button>
	</div>
	
	<div class="container privacy-terms">
		<div class="bs-docs-section mar-b-30">
	    <h1 id="forms" class="page-header" style="text-align: center;">공연 수정하기</h1>
		<div class="bs-programform">
		
			<form name="per" method="POST" action="update.do" onsubmit="return updateCheck()" enctype="multipart/form-data">
		    
		        <div class="per-group">
		          <label>공연코드</label>
		           <input type="text" class="form-control short" name="per_code" value="${dto.per_code}" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>공연이름</label>
		          <input type="text" class="form-control short" name="per_name" value="${dto.per_name}" size="50">
		        </div>
		        <div class="per-group">
		          <label><br>공연설명</label><br>
		          <textarea class="form-control short" rows="5" cols="50" name="per_exp">${dto.per_exp}</textarea>
		        </div>
		        <div class="per-group">
		          <label><br>상영날짜</label>
		           <input class="form-control short" type="date" name="per_date"  value="${dto.per_date}"min="2020-01-01" max="2029-12-31">
		        </div>
		        <div class="per-group">
		          <label><br>공연시간</label>
		          <input class="form-control short" type="time" name="per_time" value="${dto.per_time}" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>상영시간</label>
		          <input class="form-control short" type="text" name="per_timedetail" value="${dto.per_timedetail}" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>공연료</label>
		          <input class="form-control short" type="text" name="per_fee" value="${dto.per_fee}" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>정원</label>
		          <input class="form-control short" type="text" name="per_limit" value="${dto.per_limit}" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>장소</label>
		          <div class="class">
			          <input type="radio" name="class_code" value="theater" checked="checked">극장
			          <input type="radio" name="class_code" value="outdoor">야외  
		          </div>
		        </div>
		        <div class="per-group">
				  <label><br><br>포스터<br></label>
		          <img src="../perstorage/${dto.per_img}" width="100" }"><br>
			      <td><br><input type="file" name="per_imgMF" size="50"></td>   
		        </div>	  
		        <div class="per-group">
				  <label><br><br>포스터상세<br></label>
		          <img src="../perstorage/${dto.per_img2}" width="100" }"><br>
			      <td><br><input type="file" name="per_imgMFD" size="50"></td>   
		        </div>	  
		    
			    <div class='bottom'><br>
			      <input type="submit"  class="btn btn-success" value="수정">
			      <button type="reset" class="btn btn-warning">초기화</button>
			    </div>
		    </div>
		</div>    
	</div>	    
	</form>
	
	<script>
		function updateCheck(){
			let message=" 수정 하시겠습니까?";
			if(confirm(message)){
				alert("수정 완료되었습니다.");
				return true;
			} else {
				return false;
			} //if end
		} //updateCheck() end
	
	</script>
		
	    <!-- 본문 끝 -->
	        
	<%@ include file="../footer.jsp" %>