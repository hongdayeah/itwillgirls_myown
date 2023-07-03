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
                  자녀 회원 정보 수정
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
        <h2 class="form-signin-heading">자녀 회원 정보 수정</h2>
        <div class="login-wrap">
        	<input type="hidden" class="form-control" value="${dto.k_no}" id="k_no" name="k_no">
        	
        	<input type="text" class="form-control" placeholder="부모 아이디" value="${member_dto.p_id}" id="p_id" name="p_id" maxlength="20" readonly>
            <input type="text" class="form-control" placeholder="자녀 이름" value="${dto.k_name}" id="k_name" name="k_name" maxlength="20">
            <input type="text" class="form-control" placeholder="자녀 생년월일 ex) 210310" value="${dto.k_birth}" id="k_birth" name="k_birth" maxlength="6">
            
			<div style="padding: 5px;">
				&nbsp;
				<c:if test="${dto.k_gender == 1}">
					<input type="radio" name="k_gender" id="k_gender" value="1" checked> 남성
					<input type="radio" name="k_gender" id="k_gender" value="2"> 여성
				</c:if>
					<c:if test="${dto.k_gender == 2}">
					<input type="radio" name="k_gender" id="k_gender" value="1"> 남성
					<input type="radio" name="k_gender" id="k_gender" value="2" checked> 여성
				</c:if>
			</div>
            
            <!-- 테스트는 최초 1번만 가능하다고 가정, 자녀의 성향정보는 확인만 가능하며 수기로 수정 불가능하도록 제어 -->
           	<c:if test="${dto.typename == 'EE'}">
				<input type="text" class="form-control" id="k_typename" name="k_typename" value="사자" readonly>
			</c:if>
			<c:if test="${dto.typename == 'EI'}">
				<input type="text" class="form-control" id="k_typename" name="k_typename" value="양" readonly>
			</c:if>
			<c:if test="${dto.typename == 'IE'}">
				<input type="text" class="form-control" id="k_typename" name="k_typename" value="기린" readonly>
			</c:if>
			<c:if test="${dto.typename == 'II'}">
				<input type="text" class="form-control" id="k_typename" name="k_typename" value="늑대" readonly>
			</c:if>
            
            <button class="btn btn-lg btn-login btn-block" type="submit" id="modify_button">수정</button>
        </div>

      </form>
      </div>
    </div>
</div>
<!--container end-->

<script>
$(document).ready(function(){

	// 자녀 회원 정보 수정
	$("#modify_button").on("click", function(){
		
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
		
		var deleteYN = confirm("확인을 누르면 자녀 회원 정보가 수정됩니다. 수정하시겠습니까?");
		if(deleteYN == true){
			$("#kidfrm").attr("action", "/member_kid/kidModify.do");
			$("#kidfrm").submit();
		} else {
			$("#kidfrm").attr("action", "javascript:history.back()");
		}//if end
	});
});
</script>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
