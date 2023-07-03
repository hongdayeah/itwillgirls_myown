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
						대관안내
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
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
						<h1 style="font-weight:bold;">어린이문화센터 대관료</h1>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr align="center" style="background-color:#EFEFEF">
										<th colspan="2" style="text-align: center;">장소/시간별</th>
										<th style="text-align: center;">1일</th>
										<th style="text-align: center;">오전</th>
										<th style="text-align: center;">오후</th>
										<th style="text-align: center;">야간</th>
									</tr>
									<tr align="center">
									 	<td rowspan="3" style="text-align: center; vertical-align: middle;">야외</td>
									 	<td>시간</td>
									 	<td>09:00~22:00</td>
									 	<td>09:00~12:00</td>
									 	<td>13:00~17:00</td>
									 	<td>18:00~22:00</td>
									 </tr>
									 <tr align="center">
									 	<td>평일</td>
									 	<td>400,000</td>
									 	<td>200,000</td>
									 	<td>250,000</td>
									 	<td>300,000</td>
									 </tr>
									 <tr align="center">
									 	<td>휴일</td>
									 	<td>480,000</td>
									 	<td>240,000</td>
									 	<td>300,000</td>
									 	<td>360,000</td>
									 </tr>
									 <tr align="center">
									 	<td rowspan="3" style="text-align: center; vertical-align: middle;">극장</td>
									 	<td>시간</td>
									 	<td>09:00~22:00</td>
									 	<td>09:00~12:00</td>
									 	<td>13:00~17:00</td>
									 	<td>18:00~22:00</td>
									 </tr>
									 <tr align="center">
									 	<td>평일</td>
									 	<td>300,000</td>
									 	<td>100,000</td>
									 	<td>150,000</td>
									 	<td>200,000</td>
									 </tr>
									 <tr align="center">
									 	<td>휴일</td>
									 	<td>360,000</td>
									 	<td>120,000</td>
									 	<td>180,000</td>
									 	<td>240,000</td>
									 </tr>
									 <tr align="center">
									 	<td colspan="2" rowspan="2" style="text-align: center; vertical-align: middle;">감면대상</td>
									 	<td colspan="2">1. 시가 주최/주관하는 행사</td>
									 	<td colspan="2">대관료 전액 감면</td>
									 </tr>
									 <tr align="center">
									 	<td colspan="2">2. 시가 후원하는 행사</td>
									 	<td colspan="2">대관료 50% 감면</td>
									 </tr>
									</tbody>
								</table>
							</div>
						</div>
			</div>
		</div>
<div class="container">
	<div class="row">
	<!--blog start-->
				<div class="row">
							<div class="table-responsive">
								<table>
									<tbody>
									<tr align="center">
										<td style="text-align: left;">※ 극장은 어린이 전용 극장으로 어린이 관련 기관 또는 단체 행사를 위해 대관을 진행합니다.</td>
									</tr>
									<tr align="center">
									 	<td style="text-align: left;">※ 공연 연습 또는 무대설치를 위한 무대 사용 시는 해당요금의 50%로 함.</td>
									 </tr>
									<tr align="center">
									 	<td style="text-align: left;">※ 초과 사용료: 매시간 초과시 기준사용료의 20% 가산, 1시간 미만은 1시간으로 계산함.</td>
									 </tr>
									<tr align="center">
									 	<td style="text-align: left;">※ 토·일·공휴일은 사용료의 20%를 가산한다.</td>
									 </tr>
									<tr align="center">
									 	<td style="text-align: left;">※ 부가세 별도</td>
									 </tr>
									</tbody>
								</table>
							</div>
						</div>
			</div>
		</div>
	<br><br>
<div class="container">
	<div class="row">
	<!--blog start-->

				<div class="row">
						<h1 style="font-weight:bold;">야외 및 극장 부대/부대시설 사용료</h1>
							<div class="table-responsive">
								<table class="table table-bordered table-striped">
									<tbody>
									<tr align="center" style="background-color:#EFEFEF">
										<th style="text-align: center;">구분</th>
										<th style="text-align: center;">항목</th>
										<th style="text-align: center;">기준</th>
										<th style="text-align: center;">사용료</th>
										<th style="text-align: center;">비교</th>
									</tr>
									<tr align="center">
	 	<td rowspan="2" style="text-align: center; vertical-align: middle;">무대</td>
	 	<td>덧마루</td>
	 	<td>1회</td>
	 	<td>30,000</td>
	 	<td>설치 및 처거, 재료비 사용자 부담</td>
	 </tr>
	 <tr align="center">
	 	<td style="text-align: center; vertical-align: middle;">연주용 기자재</td>
	 	<td style="text-align: center; vertical-align: middle;">1회</td>
	 	<td style="text-align: center; vertical-align: middle;">50,000</td>
	 	<td style="text-align: center; vertical-align: middle;">설치 및 철거 사용자 부담<br>(연주자 의자 50개, 보면대 5개)</td>
	 </tr>
	 <tr align="center">
	 	<td style="text-align: center; vertical-align: middle;">악기</td>
	 	<td>디지털피아노</td>
	 	<td>1회</td>
	 	<td>10,000</td>
	 </tr>
	 <tr align="center">
	 	<td rowspan="5"></td>
	 	<td>유선마이크</td>
	 	<td>1회</td>
	 	<td>10,000</td>
	 <tr align="center">
	 	<td>무선마이크</td>
	 	<td>1회</td>
	 	<td>20,000</td>
	 	<td>배터리 별도</td>
	 </tr>
	 <tr align="center">
	 	<td>음향 콘솔</td>
	 	<td>1회</td>
	 	<td>20,000</td>
	 	<td>운영요원 별도</td>
	 </tr>
	 <tr align="center">
	 	<td>빔 프로젝터</td>
	 	<td>1회</td>
	 	<td>100,000</td>
	 	<td>운영요원 별도</td>
	 </tr>
	 <tr align="center">
	 	<td>모니터 스피커</td>
	 	<td>1회</td>
	 	<td>10,000</td>
	 </tr>
	 <tr align="center">
	 	<td rowspan="3" style="text-align: center; vertical-align: middle;">조명</td>
	 	<td>기본조명(화이트)</td>
	 	<td>1시간당</td>
	 	<td>20,000</td>
	 	<td>연습 및 장치 설치 시 사용료의 50%</td>
	 </tr>
	 <tr align="center">
	 	<td>무빙 라이트</td>
	 	<td>1회</td>
	 	<td>20,000</td>
	 	<td>운영요원 별도</td>
	 </tr>
	 <tr align="center">
	 	<td>조명 콘솔</td>
	 	<td>1회</td>
	 	<td>5,000</td>
	 	<td>운영요원 별도</td>
	 </tr>
	 <tr align="center">
	 	<td rowspan="2" style="text-align: center; vertical-align: middle;">녹음</td>
	 	<td>녹화</td>
	 	<td>1회</td>
	 	<td>20,000</td>
	 	<td rowspan="2">재료비 사용자 부담</td>
	 </tr>
	 <tr align="center">
	 	<td>녹음</td>
	 	<td>1회</td>
	 	<td>20,000</td>
	 </tr>
	 <tr align="center">
	 	<td rowspan="2" style="text-align: center; vertical-align: middle;">냉방</td>
	 	<td>냉방</td>
	 	<td>1시간당</td>
	 	<td>20,000</td>
	 	<td rowspan="2" style="text-align: center; vertical-align: middle;">냉방은 6~9월까지, 난방은 11~2월까지 원칙으로 함</td>
	 </tr>
	  <tr align="center">
	  	<td>난방</td>
	  	<td>1시간당</td>
	  	<td>20,000</td>
	 </tr>
	  <tr align="center">
	  	<td rowspan="3" style="text-align: center; vertical-align: middle;">방송</td>
	  	<td>라디오</td>
	  	<td>1회</td>
	  	<td>100,000</td>
	  	<td rowspan="3"></td>
	 </tr>
	  <tr align="center">
	  	<td>텔레비전</td>
	  	<td>1회</td>
	  	<td>200,000</td>
	 </tr>
	 <tr align="center">
	  	<td>영화촬영</td>
	  	<td>1시간당</td>
	  	<td>40,000</td>
	 </tr>
	  <tr align="center">
	  	<td rowspan="2" style="text-align: center; vertical-align: middle;">기타</td>
	  	<td>드라이아이스</td>
	  	<td>1회</td>
	  	<td>10,000</td>
	  	<td>재료비 사용자 부담, 운영요원 별도</td>
	 </tr>
	 <tr align="center">
	 	<td>강연대</td>
	 	<td>1회</td>
	 	<td>10,000</td>
	 </tr>
									</tbody>
								</table>
							</div>
						</div>
			</div>
		</div>
<br>
 <div style="text-align: center;">
<button type="button" style="text-align:center" class="btn btn-info" onclick="location.href='http://localhost:9095/rent/create.do'">대관신청하기</button>
</div>
<br><br> 
 
<%@ include file="../footer.jsp" %>
