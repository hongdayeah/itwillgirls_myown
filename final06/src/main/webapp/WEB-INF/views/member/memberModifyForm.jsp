<%@page import="kr.co.itwill.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

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

<!-- 본문 시작 memberModifyForm.jsp -->
<!--container start-->
<div class="login-bg">
    <div class="container">
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" name="modifyfrm" id="modifyfrm" method="post" onsubmit="return modifyCheck()">
        <h2 class="form-signin-heading">회원 정보 수정</h2>
        <div class="login-wrap">
        	
        	<input type="text" class="form-control" placeholder="ID" id="p_id" name="p_id" value="${member_dto.p_id}" readonly>
            <input type="text" class="form-control" placeholder="Name" id="p_name" name="p_name" maxlength="20" value="${member_dto.p_name}" required>
            <input type="password" class="form-control" placeholder="Password" id="p_passwd" name="p_passwd" maxlength="20" value="${member_dto.p_passwd}" required>
           	<input type="password" class="form-control" placeholder="Password Check" id="re_p_passwd" name="re_p_passwd" value="${member_dto.p_passwd}" maxlength="20" required>
            <input type="text" class="form-control" placeholder="Birth ex) 910912" id="p_birth" name="p_birth" maxlength="6" value="${member_dto.p_birth}" required>
            <input type="text" class="form-control" placeholder="Phone Number ex) 01012345678" id="p_tell" name="p_tell" maxlength="11" value="${member_dto.p_tell}" required>
            <input type="text" class="form-control" placeholder="E-mail ex) itwill@itwill.com" id="p_email" name="p_email" maxlength="25" value="${member_dto.p_email}" required>
            <div>
				&nbsp;
				<c:if test="${member_dto.p_gender == 1}">
					<input type="radio" name="p_gender" id="p_gender" value="1" checked>남
					<input type="radio" name="p_gender" id="p_gender" value="2">여
				</c:if>
					<c:if test="${member_dto.p_gender == 2}">
					<input type="radio" name="p_gender" id="p_gender" value="1">남
					<input type="radio" name="p_gender" id="p_gender" value="2" checked>여
				</c:if>
			</div>

            <button class="btn btn-lg btn-login btn-block" type="submit">수정하기</button>
        </div>

      </form>
      </div>
    </div>
</div>
<!--container end-->


<script>
	function modifyCheck() {
		//회원정보 수정 유효성 검사

		//1)비밀번호 5~10글자 인지?
		let p_passwd = document.getElementById("p_passwd").value;
		p_passwd = p_passwd.trim();
		if (p_passwd.length<5 || p_passwd.length>10) {
			alert("비밀번호를 5글자~10글자 사이로 입력해 주세요");
			document.getElementById("p_passwd").focus();
			return false;
		}//if end

		//2)비밀번호와 비밀번호확인이 서로 일치하는지?
		let re_p_passwd = document.getElementById("re_p_passwd").value;
		re_p_passwd = re_p_passwd.trim();
		if (p_passwd != re_p_passwd) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
			document.getElementById("re_p_passwd").focus();
			return false;
		}//if end

		//3)이름 2글자 이상인지?
		let p_name = document.getElementById("p_name").value;
		p_name = p_name.trim();
		if (p_name.length < 2) {
			alert("이름을 2글자 이상 입력해 주세요");
			document.getElementById("p_name").focus();
			return false;
		}//if end

		//4)생년월일이 6자리의 숫자인지?
		let p_birth = document.getElementById("p_birth").value;
		p_birth = p_birth.trim();
		if (p_birth.length != 6 || isNaN(p_birth)) {
			alert("생년월일을 6자리 숫자로 입력해 주세요");
			document.getElementById("p_birth").focus();
			return false;
		}//if end

		//5)전화번호가 10~11자리의 숫자인지?
		let p_tell = document.getElementById("p_tell").value;
		p_tell = p_tell.trim();
		if (p_tell.length<10 || p_tell.length>11 || isNaN(p_tell)) {
			alert("전화번호는 '-' 기호를 생략하고 숫자형식으로 입력해 주세요");
			document.getElementById("p_tell").focus();
			return false;
		}//if end

		//6)성별을 선택했는지?
		let flag = false;
		for (i = 0; i < memfrm.p_gender.length; i++) {
			if (memfrm.p_gender[i].checked == true) {
				flag = true; // 하나라도 체크되면 true값 저장
				// 하나도 체크되지 않으면 false 값 그대로 유지
			}//if end
		}//for end

		if (flag == false) { // 하나도 체크되지 않았을 경우
			alert("성별 체크해 주세요");
			return false;
		}//if end

		//7)주소 입력했는지?
		let p_addr1 = document.getElementById("p_addr1").value;
		if (p_addr1 == "") {
			alert("주소를 입력해 주세요");
			return false;
		}//if end

		//8)약관 동의 체크했는지?
		if (document.getElementById("agreeterms").checked == false) {
			alert("약관 동의 후 회원가입이 가능합니다");
			return false;
		}//if end		    

		return true;
	}//joinCheck() end
</script>

<script>
	$(document).ready(function(){
		//회원정보 수정하기 버튼
		$("#modify_button").click(function(){
			
			var deleteYN = confirm("회원정보를 수정하시겠습니까?");
			
			if(deleteYN == true){
				$("#modifyfrm").attr("action", "/member/memberModify.do");
				$("#modifyfrm").submit();
			}//if end
		});
	});
</script>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>