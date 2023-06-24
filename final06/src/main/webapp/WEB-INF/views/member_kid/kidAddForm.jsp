<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

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

<!-- 본문 시작 kidAddForm.jsp -->
<!--container start-->
<div class="login-bg">
    <div class="container">
        <div class="form-wrapper">
        <input type="button" onclick="location.href='/member_kid/kidList.do'" value="자녀 회원 목록">
        <form class="form-signin wow fadeInUp" name="kidfrm" id="kidfrm" method="post" onsubmit="return addCheck()"><!-- 리스트 만들어서 보여줄까~ -->
        <h2 class="form-signin-heading">자녀 회원 추가</h2>
        <div class="login-wrap">
        	
        	<!-- 부모 코드(로그인한 세션 아이디 가져오기 완료), typename 참조 해야 함 / type 테이블 만들어서 참조해야 하나?! -->
        	<input type="text" class="form-control" placeholder="부모 아이디" value="${member_dto.p_id}" id="p_id" name="p_id" maxlength="20" readonly>
            <!-- 자녀 회원번호는 시퀀스 사용으로 주석 처리함
            <input type="text" class="form-control" placeholder="자녀 회원번호" id="k_no" name="k_no" maxlength="9"> -->
            <input type="text" class="form-control" placeholder="자녀 이름" id="k_name" name="k_name" maxlength="20">
            <input type="text" class="form-control" placeholder="자녀 생년월일 ex) 210310" id="k_birth" name="k_birth" maxlength="6">
            
            <div style="padding: 5px;">
				<div>
				&nbsp;
	            <input type="radio" name="k_gender" id="k_gender" value="1">남성
	            &nbsp;
	            <input type="radio" name="k_gender" id="k_gender" value="2">여성
				</div>
			</div>
            
            <!-- 테스트 하면 typename에 결과값이 자동 입력될 수 있게 하기, 입력되지 않았을 때는 테스트하기 링크 연결할까? -->
            <input type="text" class="form-control" placeholder="자녀 성향 ex) 테스트를 진행해 주세요" id="typename" name="typename" maxlength="5">
            
            <button class="btn btn-lg btn-login btn-block" type="submit" id="add_button">등록</button>
        </div>

      </form>
      </div>
    </div>
</div>
<!--container end-->
      
       <script>
       /*
       //아이디 중복검사
		$('#k_no').on("propertychange change keyup paste input", function(){
			
			var k_no = $('#k_no').val();			// .id_input에 입력되는 값
			var data = {k_no : k_no}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
			
			$.ajax({
				type : "post",
				url : "/member/memberIdChk.do",
				data : data,
				success : function(result){

					if(result != 'fail'){
						$('.id_input_re_1').css("display","inline-block");
						$('.id_input_re_2').css("display", "none");				
					} else {
						$('.id_input_re_2').css("display","inline-block");
						$('.id_input_re_1').css("display", "none");				
					}//if end
				}// success 종료
			
			}); // ajax 종료	
		
		});// function 종료
		*/
		</script>
		
        <script>
		function addCheck2() {
			//자녀회원추가 유효성 검사
		      
		      //1)자녀회원번호 글자수 체크 (9글자 고정으로 할까?)
		      /*
		      let k_no=document.getElementById("k_no").value;
		      k_no=k_no.trim();
		      if(k_no.length<5 || k_no.length>10) {
		          alert("자녀 회원번호를 9글자로 입력해 주세요");
		          document.getElementById("k_no").focus();
		          return false; //전송하지 않음
		      }//if end
			  */
			  
			  //2)이름 2글자 이상인지?
			  let k_name=document.getElementById("k_name").value;
			  k_name=k_name.trim();
		      if(k_name.length<2) {
				  alert("자녀 이름을 2글자 이상 입력해 주세요");
				  document.getElementById("k_name").focus();
				  return false;
			  }//if end
			  
			  //3)생년월일이 6자리의 숫자인지?
			  let k_birth=document.getElementById("k_birth").value;
			  k_birth=k_birth.trim();
		      if(k_birth.length!=6 || isNaN(k_birth)) {
				  alert("자녀 생년월일을 6자리 숫자로 입력해 주세요");
				  document.getElementById("k_birth").focus();
				  return false;
			  }//if end
			  
			  //4)성별을 선택했는지?
		      let flag = false;
		      for(i=0; i < memfrm.k_gender.length; i++){
		            if(memfrm.k_gender[i].checked == true) {
		                flag = true; // 하나라도 체크되면 true값 저장
		                // 하나도 체크되지 않으면 false 값 그대로 유지
		            }//if end
		        }//for end
		        
		        if(flag == false) { // 하나도 체크되지 않았을 경우
		        	alert("성별 체크해 주세요");
		            return false;
		        }//if end

			  return true;
		}//joinCheck() end
        </script>
        
        <script>
        $(document).ready(function(){

        	// 자녀 회원 추가
        	$("#add_button").on("click", function(){
        		
        		if($("#p_id").val()==""){
        			alert("로그인 후 다시 시도해 주세요.");
        			$("#kidfrm").attr("action", "/member/login.do");
        			$("#kidfrm").submit();
        			return true;
        		}//if end
        		
        		//아래의 if문들(유효성검사)에 글자수 제한이나 숫자만 입력 같은 조건을 넣는 방법 알아보자~
        		//자녀회원번호를 생년월일 + 시퀀스 스타일로 넣을 수 있는 방법 없을까?
        		/*
        		if($("#k_no").val()==""){
        			alert("자녀 회원번호를 입력해 주세요.");
        			$("#k_no").focus();
        			return false;
        		}//if end
        		*/
        		
        		if($("#k_name").val()==""){
        			alert("자녀 이름을 입력해 주세요.");
        			$("#k_name").focus();
        			return false;
        		}//if end
        		
        		if($("#k_birth").val()==""){
        			alert("자녀 생년월일을 입력해 주세요.");
        			$("#k_birth").focus();
        			return false;
        		}//if end
        		
        		if($("#k_no").val()==""){
        			alert("자녀 회원번호를 입력해 주세요.");
        			$("#k_no").focus();
        			return false;
        		}//if end
        		
        		if($("#k_gender").val()==""){
        			alert("자녀 성별을 선택해 주세요.");
        			$("#k_gender").focus();
        			return false;
        		}//if end
        		
        		var deleteYN = confirm("확인을 누르면 자녀회원이 등록되며, 등록한 자녀는 마이페이지에서 확인할 수 있습니다. 등록하시겠습니까?");
        		if(deleteYN == true){
        			$("#kidfrm").attr("action", "/member_kid/addKid.do"); //경로 설정 중요함, 꼭! 내가 매핑한 곳으로 연결해주기!
        			$("#kidfrm").submit();
        		}//if end
        	});
        });
		</script>
        
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
