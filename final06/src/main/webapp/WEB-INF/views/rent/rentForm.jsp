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
<br>    
<br>
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
        <td style="font-size: 25px; font-weight: bold; vertical-align: middle; width: 20%;">|</td>
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; width: 20%;">
            <a href="/rent/list.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-mailing-list-10747269.png" height="20" width="20" style="vertical-align: middle; margin-bottom: 3px;">
                &nbsp;신청내역
            </a>
        </td>
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
			<form role="form" name="programfrm" id="programfrm"  method="POST" action="create.do" enctype="multipart/form-data">
				<div class="form-group">
					<label>대관코드<br></label>
					<input type="text" class="form-control short" name="rent_code" id="rent_code" placeholder="대관코드가 될 아이디를 입력해주세요." required>
				</div>
				<div class="form-group">
					<label>대관일자</label><br>
					<input type="date" class="form-control date" name="rent_date" id="rent_date" required>
				</div>
				<div class="form-group">
					<label>대관목적</label><br>
					<input type="text" class="form-control short" name="rent_per" id="rent_per" required>
				</div>
				<div class="form-group">
					<label>단체명</label><br>
					<input type="text" class="form-control short" name="rent_group" id="rent_group" required>
				</div>
				<div class="form-group">
					<label>담당자 성함</label><br>
					<input type="text" class="form-control short" name="rent_name" id="rent_name" required>
				</div>
				<div class="form-group">
					<label>연락처</label><br>
					<input type="text" class="form-control short" name="rent_phone" id="rent_phone" required>
				</div>
				<div class="form-group">
					<label>이메일주소</label><br>
					<input type="text" class="form-control short" name="rent_email" id="rent_email" required>
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
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
