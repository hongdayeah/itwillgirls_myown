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
					NOTICE
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
							소식
						</a>
					</li>
					<li class="create">
						공지사항
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<h1 id="forms" class="page-header" style="text-align: center;">공지사항 작성</h1>
=
<div class="container privacy-terms">
	<div class="bs-docs-section mar-b-30"><br><br>
		<div class="bs-programform">
			<form role="form" name="noticefrm" id="noticefrm"  method="POST" action="create.do"  enctype="multipart/form-data" onsubmit="return noticeCheck()">
				<div class="form-group">
				<label>카테고리</label><br>
				<select id="not_cate" name="not_cate" class="form-control short" required>
					<option value="N">전체공지</option>
					<option value="E">이벤트</option>
				</select>
				</div>
				<div class="form-group">
					<label>제목</label><br>
					<input type="text" class="form-control short" name="not_sub" id="not_sub" required>
				</div>
				<div class="form-group">
				    <label for="not_con">내용</label><br>
				    <textarea class="form-control" name="not_con" id="not_con" rows="15"></textarea>
				</div>
<script>
function convertNewlinesToBreaks() {
    const textarea = document.getElementById('not_con');
    const text = textarea.value.replace(/\r?\n/g, '<br>');
    console.log(text);
}

document.getElementById('not_con').addEventListener('input', convertNewlinesToBreaks);
</script>
				<div class="form-group">
				<label>첨부파일</label>	
					<input type="file" name="not_filenameMF">
				</div>
				
				<button type="submit" class="btn btn-success">등록</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</form>
		</div>
	</div>
</div>
<!-- 본문 끝 -->
        



<%@ include file="../footer.jsp" %>
