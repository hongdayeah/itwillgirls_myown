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
               마이페이지
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
               		마이페이지
               </li>
               <li class="">
                  자녀 회원 등록
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
    <br>
	    <div class="btn-position">
			<input type="button" class="btn btn-primary" onclick="location.href='/member_kid/kidList.do'" value="자녀 회원 목록">
		</div>
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" name="kidfrm" id="kidfrm" method="post">
        <h2 class="form-signin-heading">자녀 회원 등록</h2>
        <div class="login-wrap">
        	
        	<input type="text" class="form-control" placeholder="부모 아이디" value="${member_dto.p_id}" id="p_id" name="p_id" maxlength="20" readonly>
            <!-- 자녀 회원번호는 입력받는 값이 아닌 숫자 시퀀스 사용으로 주석 처리함
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
$(document).ready(function(){

	// 자녀 회원 정보 수정
	$("#add_button").on("click", function(){
		
		//1) 이름을 입력했는지?
		if($("#k_name").val()==""){
			alert("자녀 이름을 입력해 주세요.");
			$("#k_name").focus();
			return false;
		}//if end
		
		//1-1) 이름이 2글자 이상인지?
		let k_name=document.getElementById("k_name").value;
		  k_name=k_name.trim();
	      if(k_name.length<2) {
			  alert("자녀 이름을 2글자 이상 입력해 주세요");
			  document.getElementById("k_name").focus();
			  return false;
		  }//if end
		
		//2) 생년월일을 입력했는지?
		if($("#k_birth").val()==""){
			alert("자녀 생년월일을 입력해 주세요.");
			$("#k_birth").focus();
			return false;
		}//if end
		
		//2-1) 생년월일이 6자리의 숫자인지?
		let k_birth=document.getElementById("k_birth").value;
		  k_birth=k_birth.trim();
	      if(k_birth.length!=6 || isNaN(k_birth)) {
			  alert("자녀 생년월일을 6자리 숫자로 입력해 주세요");
			  document.getElementById("k_birth").focus();
			  return false;
		  }//if end
		
		//3)성별을 선택했는지?
        let flag = false;
      	for(i=0; i < kidfrm.k_gender.length; i++){
            if(kidfrm.k_gender[i].checked == true) {
                flag = true; // 하나라도 체크되면 true값 저장
                			 // 하나도 체크되지 않으면 false 값 그대로 유지
            }//if end
         }//for end
        
        if(flag == false) { // 하나도 체크되지 않았을 경우
        	alert("성별 체크해 주세요");
            return false;
        }//if end
		
		var deleteYN = confirm("확인을 누르면 자녀회원이 등록되며, 등록한 자녀는 마이페이지에서 확인할 수 있습니다. 등록하시겠습니까?");
		if(deleteYN == true){
			$("#kidfrm").attr("action", "/member_kid/addKid.do");
			$("#kidfrm").submit();
		} else {
			$("#kidfrm").attr("action", "javascript:history.back()");
		}//if end
	});
});
</script>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
