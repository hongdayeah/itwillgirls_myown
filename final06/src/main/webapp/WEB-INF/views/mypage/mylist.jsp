<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<!-- 본문 시작 mylist.jsp -->
<!-- 마이페이지: 회원가입 + 로그인 한 사람에게만 보여줄 것인가? or 모두에게 보여줄 것인가? -->

<div class="content">
	<div class="my_list">
		<ul>
			<li class="fa_qna"><a>마이페이지</a></li>
		</ul>
		<ul>
			<li class="info_qna_h"><a href="/home.do">홈</a></li>
			<li class="info_qna_h"><a href="">예매내역</a></li>
			<li class="info_qna_d"><a href="">개인정보수정</a></li>
			<li class="info_qna_d"><a href="../member/memberWithdraw.do">회원탈퇴</a></li>
			<li class="info_qna_h"><a href="">찜목록</a></li>
		</ul>
	</div>
</div>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>
