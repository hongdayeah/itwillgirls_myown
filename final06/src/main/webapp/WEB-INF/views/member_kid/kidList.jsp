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
        <form class="form-signin wow fadeInUp" name="addKidfrm" id="addKidfrm" method="post" onsubmit="return addCheck()">
        <h2 class="form-signin-heading">자녀 회원 목록</h2>
        <div class="login-wrap">
        	
        	<input type="hidden" class="form-control" placeholder="부모 아이디" value="${member_dto.p_id}" id="p_id" name="p_id" maxlength="20" readonly>
            <table>
	            <tr>
	            	<th>자녀 이름</th>
	            	<th>자녀 생년월일</th>
	            	<th>자녀 성별</th>
	            	<th>자녀 성향</th>
	            </tr>
	            <c:forEach items="${kidList}" var="row">
		            <tr>
		            	<th>${row.k_name}</th>
		            	<th>${row.k_birth}</th>
		            	<th>${row.k_gender}</th>
		            	<th>${row.typename}</th>           
		            </tr>
	            </c:forEach>
            </table>
            
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
		      let k_no=document.getElementById("k_no").value;
		      k_no=k_no.trim();
		      if(k_no.length<5 || k_no.length>10) {
		          alert("자녀 회원번호를 9글자로 입력해 주세요");
		          document.getElementById("k_no").focus();
		          return false; //전송하지 않음
		      }//if end

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

        	// 탈퇴
        	$("#add_button").on("click", function(){
        		
        		if($("#p_id").val()==""){
        			alert("로그인 후 다시 시도해 주세요.");
        			$("#addKidfrm").attr("action", "/member/login.do");
        			$("#addKidfrm").submit();
        			return true;
        		}//if end
        		
        		//아래의 if문들(유효성검사)에 글자수 제한이나 숫자만 입력 같은 조건을 넣는 방법 알아보자~
        		//자녀회원번호를 생년월일 + 시퀀스 스타일로 넣을 수 있는 방법 없을까?
        		if($("#k_no").val()==""){
        			alert("자녀 회원번호를 입력해 주세요.");
        			$("#k_no").focus();
        			return false;
        		}//if end
        		
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
        		
        		var deleteYN = confirm("등록하시겠습니까?");
        		if(deleteYN == true){
        			$("#addKidfrm").attr("action", "/home.do"); //경로 수정 중입니다~
        			$("#addKidfrm").submit();
        		}//if end
        	});
        });
		</script>
        
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
