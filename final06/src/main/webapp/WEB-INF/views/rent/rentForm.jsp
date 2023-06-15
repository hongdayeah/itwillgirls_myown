<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  
</head>
<body>
<div class=tab>
	<ul class="category">
	<li><a href="/rent/info.do">대관안내</a></li>
	<li><a href="/rent/create.do">대관신청</a></li> 
	<li><a href="/rent/list.do">대관신청내역</a></li>
	</ul>
</div>
<hr>
<form name="rentform" id="rentform" method="post" action="create.do" enctype="multipart/form-data" onsubmit="return rentCheck()"> <!-- myscript.js -->
	<ul>
		<li>야외와 극장은 어린이 관련 기관 또는 단체 행사를 위해 대관을 진행합니다.</li>
		<li>대관은 신청 후, 담당자와 전화 상담(02-1234-1234)을 통하여 확정됩니다.</li>
		<li>대관신청서는 미리 첨부하여 제출하여 주시기 바랍니다.</li>
		<li>문의사항이 있으신 경우, 담당자 이메일(itwill@itwillkids.or.kr)로 보내주시기 바랍니다.</li>
	</ul>

<hr>

<h3>대관신청</h3>
어린이 문화센터의 야외 및 극장을 대관할 수 있습니다.
<table align="center" width="98%" height="270px">
	<tr>
		<td align="center" style="background-color:#FAF9F9">대관일자</td>
		<td class="cal_sel">
			<input type="text" id=rent_date name="rent_date" readonly="readonly" class="datepicker" required>
		<script>
		$.datepicker.setDefaults({
			  dateFormat: 'yy-mm-dd',
			  prevText: '이전 달',
			  nextText: '다음 달',
			  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  showMonthAfterYear: true,
			  yearSuffix: '년'
			});

			$(function () {
			  $('.datepicker').datepicker();
			});
		</script>
		</td>
	</tr>
	<tr>
		<td align="center" style="background-color:#FAF9F9">대관목적</td>
		<td>
			<input type="text" style="width:500px" id="rent_per" name="rent_per" placeholder="대관 목적을 입력해주세요." value="" required>
		</td>
	</tr>
	<tr>
		<td align="center" style="background-color:#FAF9F9">단체명</td>
		<td>
			<input type="text" style="width:500px" id="rent_group" name="rent_group" placeholder="단체명을 입력해주세요." value="" required>
		</td>
	</tr>
	<tr>
		<td align="center" style="background-color:#FAF9F9">담당자 성함</td>
		<td>
			<input type="text" style="width:500px" id="rent_name" name="rent_name" placeholder="담당자 성함을 입력해주세요." value="" required>
		</td>
	</tr>
	<tr>
		<td align="center" style="background-color:#FAF9F9">연락처</td>
		<td>
			<input type="text" class="numberOnly" id="rent_phone" name="rent_phone" maxlength="11" value="" required>
		</td>
	</tr>
	<tr>
		<td align="center" style="background-color:#FAF9F9">이메일 주소</td>
		<td>
			<input type="text" style="width:500px" id="rent_email" name="rent_email" placeholder="이메일 주소를 입력해주세요." value="" required>
		</td>
	</tr>
	<tr>
	<td align="center" style="background-color:#FAF9F9">장소</td>
	<td>
	<select id="class_code" name="class_code" required>
		<option value="outdoor">야외</option>
		<option value="theater" selected>극장</option>
	</select>
	<tr>
		<td align="center" style="background-color:#FAF9F9">대관신청서 제출</td>
		<td>대관신청을 위해 사전에 미리 신청서를 다운로드하여 작성해주시길 바랍니다. 
		<a class="btn" href="./form.zip" download>대관신청서 다운로드</a><br>
		<input type="file" name="rent_formMF" size="50">
		</td>
	</tr>
</table>
<hr>
<div class="reservation">
<h3>개인정보 수업 이용동의</h3>
<div class="check" style="text-align:right; margin-right:20px;">
	<input type="checkbox" id=agree checked="checked" required>
	<label for="cb_ag01">
	개인정보 수집 이용에 동의합니다.</label>
</div>
 <table border="0" cellspacing="0" cellpadding="2"  align="center">
    <tr align="center" height="10"> 
        <td>
            <textarea cols="150" rows="14" readonly>1. 수집하는 개인정보
이용자는 비회원으로 가입을 하지 않아도 서비스를 이용할 수 있습니다. 화성시어린이문화센터는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
예약결제 시점에 화성시어린이문화센터가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 예약결제 및 예매확인 시에 ‘이름, 휴대전화번호, 이메일 주소’를 필수항목으로 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
화성시어린이문화센터 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.

구체적으로

1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.
2. 수집한 개인정보의 이용
 

예약결제 의사의 확인, 이용자 식별, 예약취소 의사의 확인을 위하여 개인정보를 이용합니다.
콘텐츠 등 서비스 제공(광고 포함)에 더하여, 서비스 방문 및 이용기록의 분석 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
법령 및 화성시어린이문화센터 이용약관을 위반하는 이용자에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 부정거래 방지, 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
예약결제 서비스 제공에 따르는 체험권 상품 및 시네마, 대관시설예약 결제 상품 및 서비스의 예약확인을 위하여 개인정보를 이용합니다.
이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 파기
화성시어린이문화센터는 원칙적으로 이용자의 개인정보를 예약결제 건 현장 발권 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관 기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
이용자에게 개인정보 보관 기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.
부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다. 결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 부정거래기록(이름, 휴대전화번호, 이메일 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다. 부정이용으로 징계를 받기 전에 서비스를 부정 이용하는 사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간 보관합니다.

전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 화성시어린이문화센터는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.

서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이 달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당 기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다. 전자적 파일 형태의 경우 복구 및 재생이 되지 않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.

전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
전자금융거래법
전자금융에 관한 기록: 5년 보관
통신비밀보호법
예약결제 기록: 3개월
            </textarea>
        </td>
    </tr>
</table>
</div> <!-- reservation 끝 -->
<br>
<div style="text-align: center;">
<button type="submit" style="text-align:center" class="btn btn-info">신청하기</button>
</div>
</form>



<script>
function rentCheck() {
	//1) 대관일자선택
	let rent_date=document.getElementById("rent_date").value;
	if(rent_date==""){
		alert("대관일자를 선택해주세요.");
		document.getElementById("rent_date");
		return false;
	}
	
	//2) 대관목적
	let rent_per=document.getElementById("rent_per").value;
	rent_per=rent_per.trim();
	if(rent_per.length<2){
		alert("대관목적을 2글자이상 입력해주세요.");
		document.getElementById("rent_per").focus();
		return false;
	}
	
	//3) 단체명
	let rent_group=document.getElementById("rent_group").value;
	rent_group=rent_group.trim();
	if(rent_group.length<2){
		alert("단체명을 입력해주세요.");
		document.getElementById("rent_group").focus();
		return false;
	}
	
	//4) 담당자 성함
	let rent_name=document.getElementById("rent_name").value;
	rent_name=rent_name.trim();
	if(rent_name.length<2){
		alert("성함을 2글자이상 입력해주세요.");
		document.getElementById("rent_name").focus();
		return false;
	}//if end
	
	//5) 연락처
	let rent_phone=document.getElementById("rent_phone").value;
	rent_phone=rent_phone.trim();
	if(!(rent_phone.length==11)){
		alert("연락처 11자리를 입력해주세요.");
		document.getElementById("rent_phone").focus();
		return false;
	}
	
	//6) 이메일 주소
	let rent_email=document.getElementById("rent_email").value;
	rent_email=rent_email.trim();
	if(rent_email.length<5){
	    alert("이메일 5글자 이상 입력해 주세요");
	    document.getElementById("rent_email").focus();
	    return false;
	}//if end
	
	return true;
}
</script>
<br>
<%@ include file="../footer.jsp" %>