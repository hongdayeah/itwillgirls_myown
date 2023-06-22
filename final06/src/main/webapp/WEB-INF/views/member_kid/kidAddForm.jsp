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
        <form class="form-signin wow fadeInUp" name="kidfrm" id="kidfrm" method="post" action="" onsubmit="return addCheck()"><!-- 리스트 만들어서 보여줄까~ -->
        <h2 class="form-signin-heading">자녀 회원 추가</h2>
        <div class="login-wrap">
        	
        	<!-- 부모 코드, typename 참조 해야 함 / type 테이블 만들어서 참조해야 하나?! -->
        	<input type="text" class="form-control" placeholder="부모 아이디" value="${member_dto.p_id}" id="p_id" name="p_id" maxlength="20" readonly>
            <input type="text" class="form-control" placeholder="자녀 회원번호" id="k_no" name="k_no" maxlength="9" required>
            <input type="text" class="form-control" placeholder="자녀 이름" id="k_name" name="k_name" maxlength="20" required>
            <input type="text" class="form-control" placeholder="자녀 생년월일 ex) 210310" id="k_birth" name="k_birth" maxlength="6" required>
            
            <div style="padding: 5px;">
				<div>
				&nbsp;
	            <input type="radio" name="k_gender" id="k_gender" value="1">남성
	            &nbsp;
	            <input type="radio" name="k_gender" id="k_gender" value="2">여성
				</div>
			</div>
            
            <button class="btn btn-lg btn-login btn-block" type="submit">등록</button>
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
		function addCheck() {
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
        /*
		$(document).ready(function(){
			//등록 버튼 작동
			$("#button").click(function(){
				$("#kidfrm").attr("action", "/member/memberJoinForm");
				$("#kidfrm").submit();
			});
		});
        */
		</script>
        
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
