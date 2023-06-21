<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<%@ include file="../header.jsp" %>

    <!-- 본문 시작 searchID.jsp -->
	<form id="findIDfrm" method="post" action="findID.do" onsubmit="return findIDCheck()">
		<table border="1">
			<tr>
			  <td colspan="2" align="center">* ID찾기 *</td>
			</tr>
			<tr>
			  <td>이름</td>
			  <td><input type="text" class="form-control" id="p_name" name="p_name" maxlength="20" placeholder="이름을 입력해 주세요 ex) 홍길동" required></td>
			</tr>
			<tr>
			  <td>핸드폰 번호</td>
			  <td><input type="text" class="form-control" id="p_tell" name="p_tell" maxlength="11" placeholder="핸드폰 번호를 입력해 주세요 ex) 01012345678" required></td>
			</tr>
			<tr>
			  <td colspan=2 align=center>
			    <input type="submit" class="find_button" value="ID찾기">
			    <input type="reset"  value="취소" onclick="javascript:history.back()">
			  </td>
			</tr>
		</table>
	</form>

<script>
function findIDCheck() {
//아이디찾기 유효성 검사
//1)이름 2글자 이상인지?
	  let p_name=document.getElementById("p_name").value;
	  p_name=p_name.trim();
      if(p_name.length<2) {
		  alert("이름을 2글자 이상 입력해 주세요");
		  document.getElementById("p_name").focus();
		  return false;
	  }//if end

//2)전화번호가 10~11자리의 숫자인지?
	  let p_tell=document.getElementById("p_tell").value;
	  p_tell=p_tell.trim();
      if(p_tell.length<10 || p_tell.length>11 || isNaN(p_tell)) {
		  alert("전화번호는 '-' 기호를 생략하고 숫자형식으로 입력해 주세요");
		  document.getElementById("p_tell").focus();
		  return false;
	  }//if end

	  return true;
}//findIDCheck() end
</script>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
