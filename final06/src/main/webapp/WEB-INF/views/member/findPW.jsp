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


<!-- 아직 구현 관련 공부 중인 페이지 입니다~ -->
<!-- 본문 시작 findPW.jsp -->
<!--container start-->
<div class="login-bg">
    <div class="container">
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" id="findPWfrm" method="post" action="findPW.do" onsubmit="return findPWCheck()">
        <h2 class="form-signin-heading">Find PW</h2>
        <div class="login-wrap">
            <input type="text" class="form-control" id="p_id" name="p_id" maxlength="20" placeholder="User ID" autofocus required>
            <input type="text" class="form-control" id="p_email" name="p_email" maxlength="25" placeholder="E-mail" required>
            <button class="btn btn-lg btn-login btn-block" type="submit" id="find_button">Temporary Password</button>    
        </div>
      </form>
      </div>
    </div>
</div>

<script>
function findPWCheck() {
//비밀번호 찾기 유효성 검사
//1)아이디 5~10글자 인지?
   let p_id=document.getElementById("p_id").value;
   p_id=p_id.trim();
   if(p_id.length<5 || p_id.length>10) {
       alert("아이디를 5글자~10글자 사이로 입력해 주세요");
       document.getElementById("p_id").focus();
       return false; //전송하지 않음
   }//if end

 //8)이메일 12글자 이상인지? //조건 체크
  let p_email=document.getElementById("p_email").value;
  p_email=p_email.trim();
  
  if(p_email.length<12) {
     alert("이메일을 12글자 이상 입력해 주세요");
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

 return true;
}//findPWCheck() end
</script>

<script>
$(function(){
	$("#find_button").click(function(){
		
		let p_id = $("input[name='p_id']").val();
		let p_email = $("input[name='p_email']").val();
		
		$.ajax({
			url : "/member/findPW.do",
			dataType : 'json',
			data : {"p_id":p_id, "p_email":p_email},
			success : function(data) {
				if(data == true) {
					alert("임시 비밀번호가 발급되었습니다. 메일함을 확인해 주세요.");
					console.log(data);
				} else {
					alert("아이디 또는 이메일을 정확하게 입력해 주세요.");
					console.log(data);
				}//if end
			}//function(data) end
		});//ajax() end
	});//click() end
});//$(function) end
</script>
<!--container end-->
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
