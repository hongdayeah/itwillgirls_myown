<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 test -- sungtest.jsp -->
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
      <h1>MBTi 테스트하기 [1부]</h1>
      
      <form name="stestfrm" id="stestfrm" method="POST" action="supdate.do?">
	      <input type="text" class="form-control short" name="k_name" id="k_name" placeholder="자녀정보에 입력했던 자녀의 이름으로 입력해주세요.">
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
