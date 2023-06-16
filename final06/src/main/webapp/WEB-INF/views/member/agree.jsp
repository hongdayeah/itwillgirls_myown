<%@page import="kr.co.itwill.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content">	 
	        
			<!-- 본문시작 agreement.jsp-->
			<form name="mem2frm" id="mem2frm" onsubmit="return send()"><!-- JavaScript는 현재페이지에 작성 -->
			<div id="font" style="text-align: center; font-size: 30px; padding-top: 50px; padding-bottom: 50px;"><h6>이 용 약 관</h6></div>
				<div class="agreeCon" tabindex="0">
					<h5>1. 이용약관</h5>
					<div class="agreeTxt">
						약관 준비 중입니다~
					</div>
					</div>			
			<div style="text-align: center">
				<div style="margin-bottom: 30px;">
					<label><input type="checkbox" name="agreeterms" id="agreeterms" onclick="agree()">&nbsp;&nbsp;약관에 동의합니다</label>
			  	</div>
			  <button type="submit" class="btn btn-primary btn-lg btn-block" id="agree">계속 진행</button>
			  &nbsp;&nbsp;
			  <button class="btn btn-primary btn-lg btn-block" id="back" onclick="javascript:window.close()">뒤로가기</button>
			</div>

			</form>
			
			<script>
			for(var i=0; i<$('input[type="checkbox"']').is(':checked').length; i++){
		    $('agreeterms', opener.document).html($('input[type="checkbox"']').is(':checked').val()+'<br>');
			}//for end
			function agree() {
			  	opener.window.document.memfrm.agreeterms.value = mem2frm.agreeterms.value;
			  	window.close();
			}//agree() end
			</script>
			
			
			<!-- 
			<script>
				function send(){
					if(document.getElementById("agree").checked==true){
						return true;
					}else{
						alert("약관에 동의한 후 회원가입이 가능합니다")
						return false;
					}//if end
				}//send() end
			</script>
 			-->
        <!-- 본문 끝 -->
        </div>