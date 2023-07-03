<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 test -- main.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					MBTi테스트를 해보세요.
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
						<a href="main.do">
							MBTi테스트
						</a>
					</li>
					<li class="">
						테스트하기
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<c:if test="${member_dto.p_id == 'webmaster'}">
	<div class="btn-positiontest">
		<div class="btn-group">
			<button type="button" class="btn btn-info">관리자</button>
			<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
				<span class="caret"></span>
				<span class="sr-only">Toggle Dropdown</span>
			</button>
			<ul class="dropdown-menu" role="menu">
				<li><a href="slist.do">테스트[1부] 질문리스트</a></li>
				<li class="divider"></li>
				<li><a href="hlist.do">테스트[2부] 질문리스트</a></li>
			</ul>
		</div>
	</div>                                        
</c:if>                                      
                                        
                                   
<div style="display: flex;justify-content: center;align-items: center;">
	<section>
		<h1 style="display: flex;justify-content: center;align-items: center;">MBTi 테스트하기</h1>
		<div style="display: flex;justify-content: center;align-items: center;">
			<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/testmain.jpg" alt="mainImage" style="display: flex;justify-content: center;align-items: center;">
		</div>
		<p style="text-align: center;">
			우리 아이의 MBTi는 뭘까? <br>
			테스트 할 자녀의 이름을 선택하고 아래의 시작하기 버튼을 눌러 시작해 주세요.
		</p>
		<form name="testfrm" id="testfrm" method="POST" action="create.do" onsubmit="return loginCheck()" style="display: flex;justify-content: center;align-items: center;">
			<select id="k_no" name="k_no">
				<option value="0" selected>--나의 자녀목록--</option> <!-- 이거 선택하면 form 안넘어가게 하기 -->
				<c:forEach var="i" items="${klist}">
					<option value="${i.k_no}">${i.k_name}</option>
				</c:forEach>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="submit" class="btn btn-success">시작하기</button>
		</form>
	</section>
</div>
<br><br>
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
	function loginCheck(){
		let p_id = "${member_dto.p_id}";
		let selectNum = document.getElementById("k_no").value;
		
		if(p_id===null || p_id===""){
			alert("로그인 후 이용하실 수 있습니다.");
			return false;
		}
		
		if(selectNum == 0){
			alert("자녀를 선택해주세요.");
			return false;
		}
		return true;
	}
</script>
        
<%@ include file="../footer.jsp" %>
