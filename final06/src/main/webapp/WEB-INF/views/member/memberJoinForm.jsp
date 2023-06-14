<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>


    <!-- 본문 시작 memberJoinForm.jsp -->
    <h3>* 회/원/가/입 *</h3>
    <span style="color: red; font-weight: bold">* 필수입력</span>
	<br>
	
	<form name="memberJoinfrm" id="memberJoinfrm" method="post" action="joinProc" onsubmit="return joinCheck()">
		<table border="1">
			<tr>
				<th>* 아이디</th>
				<td style="text-align: left">
					<input type="text" name="p_id" id="p_id" size="20" maxlength="20" autofocus required>
				</td>
			</tr>
			<tr>
				<th>* 비밀번호</th>
				<td style="text-align: left">
					<input type="text" name="p_passwd" id="p_passwd" size="20" maxlength="20" required>
				</td>
			</tr>
			<tr>
				<th>* 비밀번호 확인</th>
				<td style="text-align: left">
					<input type="text" name="re_p_passwd" id="re_p_passwd" size="20" maxlength="20" required>
				</td>
			</tr>			
			<tr>
				<th>* 이름</th>
				<td style="text-align: left">
					<input type="text" name="p_name" id="p_name" size="20" maxlength="20" required>
				</td>
			</tr>
			<tr>
				<th>* 생년월일</th>
				<td style="text-align: left">
					<input type="text" name="p_birth" id="p_birth" size="20" maxlength="6" placeholder="ex) 910912" required>
				</td>
			</tr>
			<tr>
				<th>* 전화번호</th>
				<td style="text-align: left">
					<input type="text" name="p_tell" id="p_tell" size="20" maxlength="14" placeholder="ex) 01012345678" required>
				</td>
			</tr>			
			<tr>
				<th>* 주소</th>
				<td style="text-align: left">
					<input type="text" name="p_addr1" id="p_addr1" size="20" readonly>
					<input type="button" value="주소찾기" onclick="DaumPostcode()">
				</td>
			</tr>
			<tr>
				<th>* 나머지주소</th>
				<td style="text-align: left">
					<input type="text" name="p_addr2" id="p_addr2" size="20">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="가입하기" class="btn btn-success">
					<input type="reset"  value="취소" class="btn btn-danger" onclick="history.back()">
				</td>
			</tr>								
		</table>				
	</form>
	
<!-- DAUM 우편번호 API 시작 -->
	<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
    </div>
        
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            // 우편번호 찾기 찾기 화면을 넣을 element
            var element_wrap = document.getElementById('wrap');
        
            function foldDaumPostcode() {
                // iframe을 넣은 element를 안보이게 한다.
                element_wrap.style.display = 'none';
            }
        
            function DaumPostcode() {
                // 현재 scroll 위치를 저장해놓는다.
                var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
        
                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var addr = ''; // 주소 변수
                        var extraAddr = ''; // 참고항목 변수
        
                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            addr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            addr = data.jibunAddress;
                        }
        
                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                        if(data.userSelectedType === 'R'){
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있고, 공동주택일 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                            if(extraAddr !== ''){
                                extraAddr = ' (' + extraAddr + ')';
                            }
                            // 조합된 참고항목을 해당 필드에 넣는다.
                            document.getElementById("p_addr2").value = extraAddr;
                        
                        } else {
                            document.getElementById("p_addr2").value = '';
                        }
        
                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById("p_addr1").value = addr;
                        // 커서를 상세주소 필드로 이동한다.
                        document.getElementById("p_addr2").focus();
        
                        // iframe을 넣은 element를 안보이게 한다.
                        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                        element_wrap.style.display = 'none';
        
                        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                        document.body.scrollTop = currentScroll;
                    },
                    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                    onresize : function(size) {
                        element_wrap.style.height = size.height+'px';
                    },
                    width : '100%',
                    height : '100%'
                }).embed(element_wrap);
        
                // iframe을 넣은 element를 보이게 한다.
                element_wrap.style.display = 'block';
            }
        </script>
        
        
        <<script>
		function joinCheck() {
			//회원가입 유효성 검사
		      
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
		      		
			  //3)비밀번호와 비밀번호확인이 서로 일치하는지?
			  let re_p_passwd=document.getElementById("re_p_passwd").value;
			  re_p_passwd=re_p_passwd.trim();
		      if(p_passwd!=re_p_passwd) {
				  alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
				  return false;
			  }//if end
			  
			  //4)이름 2글자 이상인지?
			  let p_name=document.getElementById("p_name").value;
			  p_name=p_name.trim();
		      if(p_name<2) {
				  alert("이름을 2글자 이상 입력해 주세요");
				  return false;
			  }//if end
			  
			  //5)생년월일이 6자리의 숫자인지?
			  let p_birth=document.getElementById("p_birth").value;
			  p_birth=p_birth.trim();
		      if(p_birth<6 || isNaN(p_birth)) {
				  alert("생년월일을 6자리 숫자로 입력해 주세요");
				  return false;
			  }//if end
			  
			  //6)전화번호가 10~11자리의 숫자인지?
			  let p_tell=document.getElementById("p_tell").value;
			  p_tell=p_tell.trim();
		      if(p_tell<9 || isNaN(p_tell)) {
				  alert("전화번호는 '-' 기호를 생략하고 숫자형식으로 입력해 주세요");
				  return false;
			  }//if end
			  
			  return true;
		}//joinCheck() end
        </script>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
