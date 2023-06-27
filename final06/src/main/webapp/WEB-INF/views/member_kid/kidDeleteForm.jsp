<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

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
                  자녀 회원 삭제
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 kidDeleteForm.jsp -->
<div class="login-bg">
    <div class="container">
		<br>
	    <div class="btn-position">
			<input type="button" class="btn btn-primary" onclick="location.href='/member_kid/kidList.do'" value="자녀 회원 목록">
		</div>    
    
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" name="deletefrm" id="deletefrm" method="post" action="/member_kid/kidDelete.do" onsubmit="return deleteCheck()">
        <h2 class="form-signin-heading">자녀 회원 삭제</h2>
        <div class="login-wrap">
        	<input type="hidden" class="form-control" value="${dto.k_no}" id="k_no" name="k_no">
        	
        	<input type="text" class="form-control" placeholder="부모 아이디" value="${member_dto.p_id}" id="p_id" name="p_id" maxlength="20" readonly>
            <input type="text" class="form-control" placeholder="자녀 이름" value="${dto.k_name}" id="k_name" name="k_name" maxlength="20"  readonly>
            <input type="text" class="form-control" placeholder="자녀 생년월일 ex) 210310" value="${dto.k_birth}" id="k_birth" name="k_birth" maxlength="6"  readonly>
            
			<div style="padding: 5px;">
				&nbsp;
				<c:if test="${dto.k_gender == 1}">
					<input type="radio" name="k_gender" id="k_gender" value="1" checked readonly> 남성
				</c:if>
					<c:if test="${dto.k_gender == 2}">
					<input type="radio" name="k_gender" id="k_gender" value="2" checked readonly> 여성
				</c:if>
			</div>
            
            <!-- 테스트 하면 typename에 결과값이 자동 입력될 수 있게 하기, 입력되지 않았을 때는 테스트하기 링크 연결할까? -->
            <input type="text" class="form-control" placeholder="자녀 성향 ex) 테스트를 진행해 주세요" value="${dto.typename}" id="typename" name="typename" maxlength="5"  readonly>
            
            <button class="btn btn-lg btn-login btn-block" type="submit" id="delete_button">삭제</button>
        </div>

      </form>
      </div>
    </div>
</div>

<script>
/*
$(document).ready(function(){

	// 자녀 회원 정보 삭제
	$("#delete_button").on("click", function(){
		
		var deleteYN = confirm("확인을 누르면 자녀회원이 완전히 삭제됩니다. 정말 삭제하시겠습니까?");
		if(deleteYN){
			//$("#deletefrm").attr("action", "/member_kid/kidDelete.do");
			$("#deletefrm").submit();
		} else {
			$("#deletefrm").attr("action", "javascript:history.back()");
		}//if end
	});
});
*/
function deleteCheck() {
	var deleteYN = confirm("확인을 누르면 자녀회원이 완전히 삭제됩니다. 정말 삭제하시겠습니까?");
	if(deleteYN){
		//$("#deletefrm").attr("action", "/member_kid/kidDelete.do");
		return true;
	} else {
		$("#deletefrm").attr("action", "javascript:history.back()");
		return false;
	}//if end
}
</script>
<!--container end-->


<%@ include file="../footer.jsp" %>
