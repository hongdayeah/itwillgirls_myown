<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


<!-- 본문 시작 memberJoinForm.jsp -->

	<h3>* 로 그 인 *</h3>

	<form name="memberLoginfrm" id="memberLoginfrm" method="post" action="loginProc" onsubmit="return loginCheck()">
		<div>
			<input type="text" name="id" id="id" placeholder="아이디" autofocus required>
		</div>
		<div>
			<input type="text" name="passwd" id="passwd" placeholder="비밀번호" required>
		</div>
		<div>
			<label><input type="checkbox" name="save" id="save" value="SAVE">ID저장</label>
			&nbsp;&nbsp;
			<input type="submit" value="로그인">
		</div>
	</form>
	
	<button type="button" class="btn btn-warning" onclick="location.href='/member/join'">회원가입</button>
	<button type="button" class="btn btn-info" onclick="">아이디/비밀번호 찾기</button>
	
	
	<script>
	function loginCheck() { //로그인 유효성 검사 (아이디, 비번)
		  //1) 아이디 5~10글자 이내인지 검사
		  let id = document.getElementById("id").value;
	      id = id.trim();
	      if(id.length < 5 || id == 'guest') {
	          alert("아이디를 5글자 이상 입력해 주세요~");
	          document.getElementById("id").focus(); //작성자칸에 커서 생성
	          return false; //전송하지 않음
	      }//if end
		  
		  //2) 비밀번호 5~10글자 이내인지 검사
		  let passwd = document.getElementById("passwd").value;
	      passwd = passwd.trim();
	      if(passwd.length < 5) {
	          alert("비밀번호를 4글자 이상 입력해 주세요~");
	          document.getElementById("passwd").focus(); //작성자칸에 커서 생성
	          return false; //전송하지 않음
	      }//if end
	      
	      return true;
	  }//loginCheck() end	
	</script>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
