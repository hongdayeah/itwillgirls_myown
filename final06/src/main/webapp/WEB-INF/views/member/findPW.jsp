<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<%@ include file="../header.jsp" %>

    <!-- 본문 시작 searchPW.jsp -->
	<form id="findPWfrm" method="post" action="findPW.do" onsubmit="return findPWCheck()">
		<table border="1">
			<tr>
			  <td colspan="2" align="center">* PASSWORD 찾기 *</td>
			</tr>
			<tr>
			  <td>아이디</td>
			  <td><input type="text" class="form-control" id="p_id" name="p_id" maxlength="20" placeholder="아이디를 입력해 주세요 ex) 홍길동" autofocus required>
			</tr>
			<tr>
			  <td>이메일 주소</td>
			  <td><input type="text" class="form-control" id="p_email" name="p_email" maxlength="25" placeholder="이메일을 입력해 주세요 ex) itwill@itwill.com" required>
			</tr>
			<tr>
			  <td colspan=2 align=center>
			    <input type="button" class="find_button" id="find_button" value="PW찾기">
			    <input type="reset"  value="취소" onclick="javascript:history.back()">
			  </td>
			</tr>
		</table>
	</form>

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

 return true;
}//findPWCheck() end
</script>

<script>
$(function(){
	$("#find_button").click(function(){
		$.ajax({
			url : "/member/findPW.do",
			type : "POST",
			data : {
				p_id : $("#p_id").val(),
				p_email : $("#p_email").val()
			},
			success : function(result) {
				alert(result);
			},
		})
	});
})
</script>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
