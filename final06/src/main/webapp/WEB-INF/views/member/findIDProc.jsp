<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<%@ include file="../header.jsp" %>

<!--breadcrumbs start-->
<div class="breadcrumbs">
   <div class="container">
      <div class="row">
         <div class="col-lg-4 col-sm-4">
            <h1>
               아이디 찾기
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
                  아이디 찾기
               </li>
            </ol>
         </div>
      </div>
   </div>
</div>
<!--breadcrumbs end-->

<!-- 본문 시작 findIDProc.jsp -->	
<!--container start-->
<div class="login-bg">
    <div class="container">
        <div class="form-wrapper">
        <form class="form-signin wow fadeInUp" id="searchIDProc" method="post" action="login.do">
        <h2 class="form-signin-heading">아이디 찾기 결과</h2>
        <div class="login-wrap">
	        <div>
	        	<c:choose>
				  		<c:when test="${empty dto}">
				  			<p style="color: red">조회 결과가 없습니다.</p>
				  		</c:when>
				  		<c:otherwise>
				  			<p>${dto.p_id}</p>
				  		</c:otherwise>
				  	</c:choose>
	        </div>
            <button class="btn btn-lg btn-login btn-block" type="button" class="login_button" onclick="location.href='/member/login.do'">로그인 하러 가기</button>
        </div>
      </form>
      </div>
    </div>
</div>	
	
	
<script>
$(".login_button").click(function() {
	//alert("로그인 버튼 작동");
	
	//로그인 메서드 서버 요청
	$("#loginfrm").attr("action", "/member/login.do");
	$("#loginfrm").submit();
});//function() end
</script>

<script>
var path = "${pageContext.request.contextPath}";

$(document).ready(function() {
	
});//ready() end
</script>
<!--container end-->
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
