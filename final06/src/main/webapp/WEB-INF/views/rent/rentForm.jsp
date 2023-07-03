<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문시작 program -- createForm.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					예약 - 대관신청
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
							예약
						</a>
					</li>
					<li class="create">
						대관신청
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->
<div style="text-align:center;">
    <table class="tab" width="50%" style="margin: auto; table-layout: fixed;">
    <tr style="text-align:center">
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; text-align: center; width: 20%;">
            <a href="/rent/info.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-appointment-7322265.png" height="20" width="20" style="vertical-align: bottom; margin-bottom: 4px;">
                &nbsp;대관안내
            </a>
        </td>
        <td style="font-size: 25px; font-weight: bold; vertical-align: middle; width: 20%;">|</td>
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; width: 20%;">
            <a href="/rent/create.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-contract-684831.png" height="20" width="20" style="vertical-align: bottom; margin-bottom: 3px;">
                &nbsp;대관신청
            </a>
        </td>
        <c:if test="${member_dto.p_id == 'webmaster'}">
        <td style="font-size: 25px; font-weight: bold; vertical-align: middle; width: 20%;">|</td>
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; width: 20%;">
            <a href="/rent/list.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-mailing-list-10747269.png" height="20" width="20" style="vertical-align: middle; margin-bottom: 3px;">
                &nbsp;신청내역
            </a>
        </td>
        </c:if>
    </tr>
</table>
  </div>
  <br>

<hr>

<h1 id="forms" class="page-header" style="text-align: center;">대관 신청하기</h1>
<div style="text-align: center;">
    <ul style="text-align: left; display: inline-block;">
        <li>야외와 극장은 어린이 관련 기관 또는 단체 행사를 위해 대관을 진행합니다.</li>
        <li>대관은 신청 후, 담당자와 전화 상담(02-1234-1234)을 통하여 확정됩니다.</li>
        <li>대관신청서는 미리 첨부하여 제출하여 주시기 바랍니다.</li>
        <li>문의사항이 있으신 경우, 담당자 이메일(itwill@itwillkids.or.kr)로 보내주시기 바랍니다.</li>
    </ul>
</div>
<div class="container privacy-terms">
	<div class="bs-docs-section mar-b-30"><br><br>
		<div class="bs-programform">
			<form role="form" name="programfrm" id="programfrm"  method="POST" action="create.do" enctype="multipart/form-data" onsubmit="return rentCheck()">
				<div class="form-group">
				  <label>아이디</label><br>
				  <input type="text" class="form-control short" name="p_id" id="p_id" placeholder="${member_dto.p_id}" readonly>
				</div>
				<div class="form-group">
					<label>대관일자</label><br>
					<input type="date" class="form-control date" name="rent_date" id="rent_date" required>
				</div>
				<div class="form-group">
					<label>대관목적</label><br>
					<input type="text" class="form-control short" name="rent_per" id="rent_per" placeholder="대관목적을 입력해주세요." required>
				</div>
				<div class="form-group">
					<label>단체명</label><br>
					<input type="text" class="form-control short" name="rent_group" id="rent_group" placeholder="단체명을 입력해주세요." required>
				</div>
				<div class="form-group">
					<label>담당자 성함</label><br>
					<input type="text" class="form-control short" name="rent_name" id="rent_name" placeholder="담당자 성함을 입력해주세요." required>
				</div>
				<div class="form-group">
					<label>연락처</label><br>
					<input type="number" class="form-control short" name="rent_phone" id="rent_phone" pattern="[0-9]*" inputmode="numeric" oninput="limitInputLength(this, 11)" placeholder="휴대폰번호 11자리를 입력해주세요." required>
				</div>
				<div class="form-group">
					<label>이메일주소</label><br>
					<input type="text" class="form-control short" name="rent_email" id="rent_email" placeholder="이메일 주소를 입력해주세요." required>
				</div>
				<div class="form-group">
				<label>대관장소</label><br>
				<select id="class_code" name="class_code" required>
					<option value="outdoor">야외 (Outdoor)</option>
					<option value="theater" selected>극장 (Theater)</option>
				</select>
				</div>
				<div class="form-group">
					<label>대관신청서 다운</label><br>
					<a class="btn btn-info btn-sm"  href="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/%EB%8C%80%EA%B4%80+%EC%8B%A0%EC%B2%AD%EC%84%9C.hwp" download>대관신청서 다운로드</a>
				</div>	
				<div class="form-group">
				<label>대관신청서 제출</label>	
					<input type="file" name="rent_formMF">
				</div>
				<div class="form-group">
					<label>개인정보 수집 이용동의</label>
				</div>
				<div class="check" style="text-align:right; margin-right:20px;">
	<input type="checkbox" name="agree" id="agree" checked="checked" required>
	<label for="cb_ag01">
	개인정보 수집 이용에 동의합니다.</label>
</div>
				
				<div>
		 <table border="0" cellspacing="0" cellpadding="2"  align="center">
    <tr align="center" height="10"> 
        <td>
            <textarea rows="14" cols="72" readonly>1. 수집하는 개인정보
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
   <br><br>  
        </td>
    </tr>
</table>
</div> <!-- reservation 끝 -->

				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- 본문 끝 -->
        


<script>
function rentCheck() {
	//1) 로그인
	let p_id=document.getElementById("p_id").value;
	if(rent_date==""){
		alert("로그인 먼저 해주세요.");
		document.getElementById("p_id");
		return false;
	}
	
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
		alert("단체명 2글자이상 입력해주세요.");
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
	
	//7) 약관동의
	if (document.getElementById("agree").checked == true) {
	return true;
	}else if (document.getElementById("agree1").checked == false) {
	alert("개인정보수집에 동의 후 회원가입이 가능합니다");
	document.getElementById("agree").focus();
	return false;
	}//if end
	
	return true;
}
</script>
<%@ include file="../footer.jsp" %>
