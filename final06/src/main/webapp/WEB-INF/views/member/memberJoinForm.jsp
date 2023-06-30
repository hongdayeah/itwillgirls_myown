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
               회원가입
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
               		회원가입
               </li>
               <li class="">
                  회원가입 정보 입력
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 memberJoinForm.jsp -->
<!--container start-->
<div class="login-bg">
    <div class="container">
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" name="memfrm" id="memfrm" method="post">
        <h2 class="form-signin-heading">회원가입</h2>
        <div class="login-wrap">
        	
        	<div>
	            <input type="text" class="form-control" placeholder="아이디" id="p_id" name="p_id" maxlength="20" autofocus required>
	            <span class="id_input_re_1" style="color: green; display: none;">사용 가능한 아이디 입니다.</span>
				<span class="id_input_re_2" style="color: red; display: none;">아이디가 이미 존재합니다.</span>
            </div>
            
            <input type="text" class="form-control" placeholder="이름" id="p_name" name="p_name" maxlength="20" required>
            <input type="password" class="form-control" placeholder="비밀번호" id="p_passwd" name="p_passwd" maxlength="20" required>
           	<input type="password" class="form-control" placeholder="비밀번호 재입력" id="re_p_passwd" name="re_p_passwd" maxlength="20" required>
            <input type="text" class="form-control" placeholder="생년월일 6자리 ex) 910912" id="p_birth" name="p_birth" maxlength="6" required>
            <input type="text" class="form-control" placeholder="핸드폰 번호 ex) 01012345678" id="p_tell" name="p_tell" maxlength="11" required>
            <input type="text" class="form-control" placeholder="이메일 주소 ex) itwill@itwill.com" id="p_email" name="p_email" maxlength="25" required>
            <div style="padding: 5px;">
				<div>
				&nbsp;
	            <input type="radio" name="p_gender" id="p_gender" value="1"> 남성
	            &nbsp;
	            <input type="radio" name="p_gender" id="p_gender" value="2"> 여성
				</div>
			</div>
            
            <button class="btn btn-lg btn-login btn-block" type="submit" id="join_button">가입하기</button>
        </div>

      </form>
      </div>
    </div>
</div>
<!--container end-->
      
<script>
//아이디 중복검사
$('#p_id').on("propertychange change keyup paste input", function(){
	
	var p_id = $('#p_id').val();			// .id_input에 입력되는 값
	var data = {p_id : p_id}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
	
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
</script>

<script>
$(document).ready(function(){

	// 회원 가입
	$("#join_button").on("click", function(){
		
		//회원가입 유효성 검사
	      
	      //1)아이디 5~10글자 인지?
	      let p_id=document.getElementById("p_id").value;
	      p_id=p_id.trim();
	      if(p_id.length<5 || p_id.length>10) {
	          alert("아이디를 5글자~10글자 사이로 입력해 주세요");
	          document.getElementById("p_id").focus();
	          return false; //전송하지 않음
	      }//if end
		
		  //2)비밀번호 5~10글자 인지?
	      let p_passwd=document.getElementById("p_passwd").value;
	      p_passwd=p_passwd.trim();
	      if(p_passwd.length<5 || p_passwd.length>10) {
	          alert("비밀번호를 5글자~10글자 사이로 입력해 주세요");
	          document.getElementById("p_passwd").focus();
	          return false;
	      }//if end
	      		
		  //3)비밀번호와 비밀번호확인이 서로 일치하는지?
		  let re_p_passwd=document.getElementById("re_p_passwd").value;
		  re_p_passwd=re_p_passwd.trim();
	      if(p_passwd!=re_p_passwd) {
			  alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			  document.getElementById("re_p_passwd").focus();
			  return false;
		  }//if end
		  
		  //4)이름 2글자 이상인지?
		  let p_name=document.getElementById("p_name").value;
		  p_name=p_name.trim();
	      if(p_name.length<2) {
			  alert("이름을 2글자 이상 입력해 주세요");
			  document.getElementById("p_name").focus();
			  return false;
		  }//if end
		  
		  //5)생년월일이 6자리의 숫자인지?
		  let p_birth=document.getElementById("p_birth").value;
		  p_birth=p_birth.trim();
	      if(p_birth.length!=6 || isNaN(p_birth)) {
			  alert("생년월일을 6자리 숫자로 입력해 주세요");
			  document.getElementById("p_birth").focus();
			  return false;
		  }//if end
		  
		  //6)전화번호가 10~11자리의 숫자인지?
		  let p_tell=document.getElementById("p_tell").value;
		  p_tell=p_tell.trim();
	      if(p_tell.length<10 || p_tell.length>11 || isNaN(p_tell)) {
			  alert("전화번호는 '-' 기호를 생략하고 숫자형식으로 입력해 주세요");
			  document.getElementById("p_tell").focus();
			  return false;
		  }//if end
		  
	      //7)이메일 12글자 이상인지? //조건 체크
	        let p_email=document.getElementById("p_email").value;
	        p_email=p_email.trim();
	        
	        if(p_email.length<12) {
	           alert("이메일 12글자 이상 입력해 주세요~");
	           document.getElementById("p_email").focus();
	           return false;
	         }//if end

	  	    let emailck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

	     	  if(emailck.test(p_email)==false){
	  		  //이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
	  		  alert("이메일형식이 올바르지 않습니다.");
	  		  document.getElementById("p_email").focus();
	  		  return false;
	  	    }//if end
	  	  
		  //8)성별을 선택했는지?
	      let flag = false;
	      for(i=0; i < memfrm.p_gender.length; i++){
	            if(memfrm.p_gender[i].checked == true) {
	                flag = true; // 하나라도 체크되면 true값 저장
	                // 하나도 체크되지 않으면 false 값 그대로 유지
	            }//if end
	        }//for end
	        
	        if(flag == false) { // 하나도 체크되지 않았을 경우
	        	alert("성별 체크해 주세요");
	            return false;
	        }//if end
	      
		var deleteYN = confirm("반갑습니다. 회원가입이 완료 되었습니다.");
		if(deleteYN == true){
			$("#memfrm").attr("action", "/member/memberJoinForm");
			$("#memfrm").submit();
		} else {
			$("#memfrm").attr("action", "javascript:history.back()");
		}//if end
	});
});
</script>		        
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
