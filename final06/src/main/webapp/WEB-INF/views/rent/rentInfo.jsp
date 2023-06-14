<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<div class=tab>
	<ul class="category">
	<li><a href="/rent/info.do">대관안내</a></li>
	<li><a href="/rent/form.do">대관신청</a></li> 
	</ul>
</div>
 <hr>
<form name="rentinfo" id="rentinfo" method="post">
 <h3>어린이문화센터 대관료</h3>
 <table border="1" align="center" width="98%" height="270px">
 <tr align="center" style="background-color:#EFEFEF">
 <td colspan="2">장소/시간별</td>
 <td>1일</td>
 <td>오전</td>
 <td>오후</td>
 <td>야간</td>
 </tr>
 <tr align="center">
 	<td rowspan="3">야외</td>
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
 	<td rowspan="3">극장</td>
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
 	<td colspan="2" rowspan="2">감면대상</td>
 	<td colspan="2">1. 시가 주최/주관하는 행사</td>
 	<td colspan="2">대관료 전액 감면</td>
 </tr>
 <tr align="center">
 	<td colspan="2">2. 시가 후원하는 행사</td>
 	<td colspan="2">대관료 50% 감면</td>
 </tr>
 </table>
 <br>
 <ul>
		<li>야외 및 극장은 어린이 전용 공연장으로 어린이 관련 기관 또는 단체 행사를 위해 대관을 진행합니다.</li>
		<li>공연 연습 또는 무대설치를 위한 무대 사용 시는 해당요금의 50%로 함.</li>
		<li>초과 사용료 : 매시간 초과 시 기준사용료의 20%가산, 1시간 미만은 1시간으로 계산함.</li>
		<li>토요일/일요일/공휴일의 경우 사용료의 20%를 가산한다.</li>
		<li>부가세 별도</li>
	</ul>
	<br><br>
<h3>극장 좌석배치도</h3>
나중에 김효원이가 좌석배치도 만들어서 삽입예정:)
<br><br>
<h3>야외 및 극장 부대/부대시설 사용료</h3>
 <table border="1" align="center" width="98%" height="270px">
 <tr align="center" style="background-color:#EFEFEF">
 	<td>구분</td>
 	<td>항목</td>
 	<td>기준</td>
 	<td>사용료</td>
 	<td>비고</td>
 </tr>
 <tr align="center">
 	<td rowspan="2">무대</td>
 	<td>덧마루</td>
 	<td>1회</td>
 	<td>30,000</td>
 	<td>설치 및 처거, 재료비 사용자 부담</td>
 </tr>
 <tr align="center">
 	<td>연주용 기자재</td>
 	<td>1회</td>
 	<td>50,000</td>
 	<td>설치 및 철거 사용자 부담<br>(연주자 의자 50개, 보면대 5개)</td>
 </tr>
 <tr align="center">
 	<td>악기</td>
 	<td>디지털피아노</td>
 	<td>1회</td>
 	<td>10,000</td>
 </tr>
 <tr align="center">
 	<td rowspan="5"></td>
 	<td>유선마이크</td>
 	<td>1회</td>
 	<td>10,000</td>
 </table>
 </form>
 
<%@ include file="../footer.jsp" %>
