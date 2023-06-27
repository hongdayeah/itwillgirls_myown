<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script> -->

<%@ include file="../header.jsp" %>


<!--breadcrumbs start-->
<div class="breadcrumbs">
   <div class="container">
      <div class="row">
         <div class="col-lg-4 col-sm-4">
            <h1>
               로그인
            </h1>
         </div>
         <div class="col-lg-8 col-sm-8">
            <ol class="breadcrumb pull-right">
               <li>
                  <a href="../home.do">
                     Home
                  </a>
               </li>
               <li class="">
                  로그인
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 loginForm.jsp -->
<!--container start-->
<div class="login-bg">
    <div class="container">
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" id="loginfrm" method="post" action="login.do" onsubmit="return loginCheck()">
        <h2 class="form-signin-heading">로그인</h2>
        <div class="login-wrap">
            <input type="text" class="form-control" id="p_id" name="p_id" size="20" value="${cookie.id.value}" placeholder="아이디" autofocus required>
            <input type="password" class="form-control" id="p_passwd" name="p_passwd" size="20" placeholder="비밀번호">
            <label class="checkbox">
                <input type="checkbox" id="rememberId" name="rememberId" ${empty cookie.id.value ? "":"checked"}> ID 기억하기
                <span class="pull-right">
                	<!-- <a data-toggle="modal" href="#myModal" onclick="location.href='/member/findID.do'"> Forgot ID?</a> -->
                	<a href="/member/findID.do"> 아이디 찾기 </a>
                </span>
            </label>
            <span>
				<c:if test="${result == 0}">
					<div class="login_warn" style="color: red; font-size: 12px; text-align: center;">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div> <!-- 위치 조정 필요함 -->
				</c:if>
			</span>
            <button class="btn btn-lg btn-login btn-block" type="submit">로그인 하기</button>
           
            <div class="registration">
            <br>
                아직 회원이 아니신가요?
                <a class="" href="/member/agree.do">
                    회원가입
                </a>
            </div>
        </div>
      </form>
      </div>
    </div>
</div>
<!--container end-->
<!-- 본문 끝 -->


<script>
function loginCheck() {
	//로그인 유효성 검사
      
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
      
      return true;
}//loginCheck() end
</script>

<script>
$(document).ready(function() {
	//저장된 쿠키값을 가져와서 ID 작성 input에 넣어준다. 쿠키값 없으면 공백 저장
	var p_id = getCookie("c_id");
	$("input[name='p_id']").val(c_id);
		
	$(".login_button").click(function() {
			
		let p_id = $("#p_id").val();
		let rememberId = $('#rememberId').is(":checked");
		
		if (rememberId){ //아이디 저장에 체크가 되어있다면
			//쿠키 저장
			setCookie("p_id", p_id, 7);

		} else {
			//쿠키 삭제
			deleteCookie("p_id");
		}//if end
	}//click() end
}//ready() end
</script>

<script>
	//쿠키 저장
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value) + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}//setCookie() end
	
	//쿠키 삭제
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		exdate.setDate(exdpireDate.getDate() - 1);
		document.cookie = cookieName + "=" + "; expires=" + exdate.toGMTString());
	}//deleteCookie() end
	
	//쿠키 가져오기
	function getCookie(cookieName) {
		cookieName = cookieName + "=";
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = "";
		if(start != -1) { //쿠키가 존재한다면
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if(end == -1) { //쿠키 값의 마지막 위치 인덱스 번호 설정
				end = cookieData.length;
				cookieValue = cookieData.substring(start, end);
			}//if end
		}//if end
		
		return unescape(cookieValue);
</script>

    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
