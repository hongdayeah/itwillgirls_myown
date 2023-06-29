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
		
			<form name="per" method="POST" action="create.do" enctype="multipart/form-data"  onsubmit="return percreateCheck()">
		    
		        <div class="per-group">
		          <label>공연코드</label>
		          <input type="text" class="form-control short" id="per_code" name="per_code" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>공연이름</label>
		          <input type="text" class="form-control short" id="per_name" name="per_name" size="50">
		        </div>
		        <div class="per-group">
		          <label><br>공연설명</label><br>
		          <textarea class="form-control short" rows="5" cols="50" id=per_exp' name='per_exp'></textarea>
		        </div>
		        <div class="per-group">
		          <label><br>상영날짜</label>
		          <input type="date" class="form-control short" id="per_date" name="per_date" min="2020-01-01" max="2029-12-31">
		        </div>
		        <div class="per-group">
		          <label><br>공연시간</label>
		          <input type="time" class="form-control short" id="per_time" name="per_time" >
		        </div>
		        <div class="per-group">
		          <label><br>상영시간</label>
		          <input type="text" class="form-control short" id="per_timedetail" name="per_timedetail" size="50">
		        </div>
		        <div class="per-group">
		          <label><br>공연료</label>
		          <p>(무료일 경우 0 입력)</p>
		          <input type="text" class="form-control short" id="per_fee" name="per_fee" size="20">
		        </div>
		        <div class="per-group">
		          <label><br>정원</label>
		          <p>(정원 없을 경우 0 입력)<p>
		          <input type="text" class="form-control short" id="per_limit" name="per_limit" size="20">
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
		          <div class="per-group">
				  <label><br>포스터상세</label>
		          <input type="file" name="per_imgMFD" size="50">  
		        </div>	   
		    
			    <div class='bottom'><br>
			      <input type='submit' class="btn btn-success" value='등록'>
			      <button type="reset" class="btn btn-warning">초기화</button>
			    </div>
			    </form>
		    </div>
		</div>    
	</div>	    
	
	
	

       <script>
	function percreateCheck() {
		//per_code 유효성 검사
	      
	      //1) per_code가 P로 시작하는지?
	      let per_code=document.getElementById("per_code").value;
	      let first=per_code.substr(0,1);
	      if(first !== "P") {
	          alert("공연코드는 P로 시작됩니다");
	          document.getElementById("per_code").focus();
	          return false; //전송하지 않음
	      }//if end

	      //2) 공연료가 숫자인지?
	      let per_fee=document.getElementById("per_fee").value;
	      if(isNaN(per_fee)){
	    	  alert("공연료에는 숫자만 입력해 주세요");
	    	  document.getElementById("per_fee").focus();
	    	  return false;
	      }
	      
		  //3) 정원이 숫자인지?
	      let per_limit=document.getElementById("per_limit").value;
	      if(isNaN(per_limit)){
	    	  alert("정원칸에는 숫자만 입력해 주세요");
	    	  document.getElementById("per_limit").focus();
	    	  return false;
	      }
	      
	    		  
		  return true;
	      
	}//percreateCheck() end
       </script>
	
    <!-- 본문 끝 -->
	        
	<%@ include file="../footer.jsp" %>