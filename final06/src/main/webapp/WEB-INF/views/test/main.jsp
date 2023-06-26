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

<div>
    <section id="main">
      <h1>MBTi 테스트하기</h1>
      <div>
        <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/testmain.jpg" alt="mainImage">
      </div>
      <p>
        우리 아이의 MBTi는 뭘까? <br>
        자녀의 이름을 입력하고 아래의 시작하기 버튼을 눌러 시작해 주세요.
      </p>
      <form name="testfrm" id="testfrm" method="POST" action="create.do">
	      <input type="text" class="form-control short" name="k_name" id="k_name" placeholder="자녀정보에 입력했던 자녀의 이름으로 입력해주세요. (ex. 김자녀 or 자녀)">
	      <button type="submit" class="btn btn-success">시작하기</button>
      </form>
    </section>
    <section id="qna">
      <div class="status mx-auto mt-5">
        <div class="statusBar">
        </div>
      </div>
      <div class="qBox my-5 py-3 mx-auto">

      </div>
      <div class="answerBox">

      </div>
    </section>
    <section id="result">
      
    </section>
    <script src="./js/data.js" charset="utf-8"></script>
    <script src="./js/start.js" charset="utf-8"></script>
  </div>
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>