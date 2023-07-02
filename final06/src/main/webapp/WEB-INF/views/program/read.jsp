<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 program -- read.jsp -->
<!--breadcrumbs start-->
<div class="breadcrumbs">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-sm-4">
				<h1>
					우리센터 프로그램을 소개합니다
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
							프로그램
						</a>
					</li>
					<li class="">
						프로그램 소개
					</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<!--breadcrumbs end-->

<div class="btn-position">
	<button class="btn btn-primary" onclick="location.href='../programtime/create.do?pro_obj=${dto.pro_obj}'">시간표 등록</button>
	<button class="btn btn-warning" onclick="location.href='update.do?pro_obj=${dto.pro_obj}'">프로그램수정</button>
	<button class="btn btn-danger" onclick="return deleteCheck('${dto.pro_obj}')">프로그램삭제</button>
</div>

<!--container start-->
<div class="container">
	<div class="row">
	<!--blog start-->
		<div class="col-lg-9">
			<div class="blog-item">
				<div class="row">
					<div class="col-lg-2 col-sm-2">
						<div class="col-lg-12 col-sm-12 text-right">
							<div class="st-view" style="border: 1px">
								<ul class="list-unstyled">
									<li>
										<span style="font-weight: bold;">조회&nbsp;&nbsp;${dto.pro_readcnt} 번</span>
									</li>
									<li>
										<span style="font-weight: bold;">찜&nbsp;&nbsp;${likecnt} 명</span>
									</li>
									<li>
										<span style="font-weight: bold;">후기&nbsp;&nbsp;n 개</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				
					<div class="col-lg-10 col-sm-10">
						<div class="blog-img gs">
							<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/${dto.pro_img}" alt="${dto.pro_img}"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 col-sm-12">
					<form name="proinfofrm" id=proinfofrm method="post" action="proInsert.do">
						<h1 style="font-weight:bold;">${dto.pro_name}</h1>
						<input type="hidden" name="pro_name" id="pro_name" value="${dto.pro_name}">
							<div class="table-responsive">
								수업 성향 : <c:forEach var="type" items="${dto.prochar_no}">	
											<c:choose>
											<c:when test="${type eq 'pro_II'}">
												<span class="label label-info">늑대</span>
											</c:when>
											<c:when test="${type eq 'pro_EE'}">
												<span class="label label-info">사자</span>
											</c:when>
											<c:when test="${type eq 'pro_IE'}">
												<span class="label label-info">양</span>
											</c:when>
											<c:otherwise>
												<span class="label label-info">기린</span>
											</c:otherwise>
											</c:choose>
										 </c:forEach> 
									<br><br>
								
								<table class="table table-bordered table-striped">
									<colgroup>
									  <col class="col-xs-1">
									  <col class="col-xs-7">
									</colgroup>
								  
									<tbody>
									<tr>
										<td>프로그램 설명</td>
										<td>${dto.pro_exp}</td>
									</tr>
									<tr>
										<td>대상</td>
										<td>${dto.pro_age}</td>
									</tr>
									<tr>
										<td>수강기간</td>
										<td>
											<c:set var="proStart" value="${fn:substring(dto.proper_start, 5, 10)}" />
											<c:set var="proEnd" value="${fn:substring(dto.proper_end, 5, 10)}" />
											
											${proStart} ~ ${proEnd} (매 주 ${pro_day})
										</td>
									</tr>
									<tr>
										<td>수업 타임</td>
										<td>
											<c:forEach var="i" items="${ptlist}">
												<c:choose>
													<c:when test="${empty i.pro_time}">
														아직 추가되지 않았습니다 <!-- 안되는데 -->
													</c:when>
													<c:otherwise>
														<input type="radio" name="pro_code" id="pro_code" value="${i.pro_code}">&nbsp;
														<c:set var="t_name" value=""/>
														<c:forEach var="teacher" items="${tlist}">
															<c:if test="${teacher.t_code eq i.t_code}">
																<c:set var="t_name" value="${teacher.t_name}"></c:set>
															</c:if>
														</c:forEach>
														${i.pro_time} : ${t_name} 강사님 &nbsp;
														<select id="selectcnt_${i.pro_code}">
															<!-- radio 선택하지 않은 수량을 선택하면 안넘어가게 하기 -->
															<option value=0>수량선택</option>
															<option value=1>1명</option>
															<option value=2>2명</option>
															<option value=3>3명</option>
															<option value=4>4명</option>
														</select>
														<br>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td>수강정원</td>
										<td>
											${dto.pro_limit} (여유 ${dto.pro_limit - 10}명) <!-- 예매한 사람 수만큼 뺴기 -->
										</td>
									</tr>
									<tr>
										<td>수강료</td>
										<td>
											<input type="hidden" id="pro_fee" name="pro_fee" value="${dto.pro_fee}">
											<fmt:formatNumber var="profee" value="${dto.pro_fee}" pattern="#,###" />
											${profee}원
										</td>
									</tr>
									<tr>
										<td> 접수기간</td>
										<td>
											<c:set var="proStart" value="${fn:substring(dto.proper_start, 5, 10)}" />
											<c:set var="proEnd" value="${fn:substring(dto.proper_end, 5, 10)}" />
											${proStart} ~ ${proEnd} <!-- (n일 남음)하고싶은데 안돼 -->
										</td>
									  </tr>
									</tbody>
								</table>
								
							</div>							
							<input type="hidden" class="form-control" placeholder="부모 아이디" value="${member_dto.p_id}" id="p_id" name="p_id" maxlength="20" readonly>
							<!-- ---------- 찜하기 시작 ---------- -->
							<input type="hidden" id="pro_obj" value="${dto.pro_obj}">
							<input type="hidden" id="p_id"     value="${member_dto.p_id}">
							
							<c:if test="${likedto eq 1}">
								<input type="hidden" id="pro_obj" value="${dto.pro_obj}">
								<input type="hidden" id="p_id"     value="${member_dto.p_id}">
								<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/likeheart.png" id="resetAnchor" style="cursor:pointer;" width="30px">
							</c:if>
							<c:if test="${likedto eq 0}">
								<input type="hidden" id="pro_obj" value="${dto.pro_obj}">
								<input type="hidden" id="p_id"     value="${member_dto.p_id}">
								<img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/binheart.png" id="myAnchor" style="cursor:pointer;" width="30px">
							</c:if>
							
							<!-- 
							<a class="btn btn-app" id="myAnchor">
								<span class="badge bg-red">찜한 개수</span>
								<i class="fa fa-heart-o"></i> Likes
							</a>
							 -->
							 <!-- ---------- 찜하기 끝 ---------- -->
							
							&nbsp;&nbsp;&nbsp;&nbsp;
							
							<!-- ---------- 장바구니 담기 시작 ---------- -->
							<input type="hidden" name="pro_cnt" id="pro_cnt" value="">
							<button class="btn btn-success" onclick="return cartCheck()">장바구니담기</button>
							<!-- ---------- 장바구니 담기 끝 ----------- -->
							</form>
							
							<!-- ---------- 후기 list 시작 ---------- -->
							<h3 style="font-weight:bold;">프로그램 후기</h3>
							<hr>
							<div class="media-body">
								<h4 class="media-heading">
									작성자이름 
									<span>  | </span>	
									<span>  날짜	</span>
								</h4>
								<p>내용</p>
							</div>
					        <!-- 리뷰 리스트 for문 -->
							<div class="media">
								<c:forEach var="review" items="${reviewList}">
									<div class="media-body">
										<h4 class="media-heading">
											작성자 아이디 들어가는 곳 <!-- dto.p_id -->
											<span> | </span>
											<span>댓글 단 날짜 <!-- dto.regdate --></span>
										</h4>
										<p>리뷰 내용 <!-- dto.review --></p>
									  	<hr>
									</div>
								</c:forEach>
							</div>
					</div>
					<!-- ---------- 후기 작성 시작 ---------- -->
					<div class="post-comment">
						<h3 class="skills">후기 남기기</h3>
						<form class="form-horizontal" role="form" name="reviewfrm" id="reviewfrm" action="reviewcreate.do?pro_obj=${dto.pro_obj}">
							<div class="form-group">
								<div class="col-lg-6">
								<!-- 현재 로그인한 값의 아이디 readonly로 넣어두기 -->
									<input type="text" name="" placeholder="${member_dto.p_id}" class="col-lg-12 form-control" readonly>
								</div>
								<div class="col-lg-6"> <!-- p_id의 비밀번호 입력 -->
									<input type="text" placeholder="비밀번호" class="col-lg-12 form-control">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-12">
									<textarea placeholder="후기를 남겨주세요!" rows="8" class=" form-control">
									</textarea>
								</div>
							</div>
							<p>
								<button type="submit" class="btn btn-info pull-right">등록하기</button>
							</p>
						</form>
					</div>
					<!-- ---------- 후기 작성 끝 ---------- -->
				</div>
			</div>
		</div>
	</div>
</div>
<!--container end-->
<!-- 본문 끝 -->
<!-- JavaScript 함수 -->
<script>
	//likedto가 0인 상태에서 찜 버튼 눌렀을때 실행
	document.getElementById("myAnchor").addEventListener("click", function(event){
		event.preventDefault();
	
		let pro_obj=$("#pro_obj").val();
		let p_id   =$("#p_id").val();
	
		if (p_id === null || p_id === "") {
			alert("관심프로그램 등록은 로그인 상태에서만 가능합니다.");
			return false;
		} else {
			if(confirm("관심프로그램으로 등록하시겠습니까?")){
				$.ajax({
					url: "/program/likeInsert.do", // 컨트롤러에 대한 URL 매핑
					type: "POST", // 요청 메소드 설정 (POST 또는 GET)
					data: { "pro_obj": pro_obj, "p_id": p_id }, // 전송할 데이터 설정
					success: function(response) {
						// 요청이 성공적으로 처리된 후 실행될 콜백 함수
						// 처리 결과에 따른 후속 작업 수행
						alert(response);
						// 이미지 변경
						$("#myAnchor").attr("src", "https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/likeheart.png");
					},
					error: function(xhr, status, error) {
						// 요청이 실패한 경우 실행될 콜백 함수
						// 에러 처리 로직 구현
						alert("관심프로그램으로 등록하기 실패");
					}
				});
			}else{
				return false;
			}//if end
		}//if end
	});//ajax end
</script>
<script>
	//likedto가 1인 상태에서 찜 버튼 눌렀을 때 실행
	document.getElementById("resetAnchor").addEventListener("click", function(event) {
    event.preventDefault();

    let pro_obj = $("#pro_obj").val();
    let p_id = $("#p_id").val();

    if (p_id === null || p_id === "") {
        alert("관심프로그램 등록은 로그인 상태에서만 가능합니다.");
        return false;
    } else {
        if (confirm("관심프로그램을 취소하시겠습니까?")) {
            $.ajax({
                url: "/program/likeDelete.do", // 컨트롤러에 대한 URL 매핑
                type: "POST", // 요청 메소드 설정 (POST 또는 GET)
                data: { "pro_obj": pro_obj, "p_id": p_id }, // 전송할 데이터 설정
                success: function(response) {
                    // 요청이 성공적으로 처리된 후 실행될 콜백 함수
                    // 처리 결과에 따른 후속 작업 수행
                    alert(response);
                    // 이미지 변경
                    $("#resetAnchor").attr("src", "https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/binheart.png");
                },
                error: function(xhr, status, error) {
                    // 요청이 실패한 경우 실행될 콜백 함수
                    // 에러 처리 로직 구현
                    alert("관심프로그램 취소 실패");
                }
            });
        } else {
            return false;
        }
    }
});
</script>
<script>
	function cartCheck(){
		event.preventDefault();
		
		let pro_code = document.querySelector('input[name="pro_code"]:checked').value;
		let selectOption = document.getElementById("selectcnt_" + pro_code);
		let pro_cnt = selectOption ? selectOption.value : "";
		document.getElementById("pro_cnt").value = pro_cnt;
		
		let p_id = $("#p_id").val();
		let pro_fee = document.getElementById("pro_fee").value; 
		let pro_name = document.getElementById("pro_name").value;
	    //alert(pro_name);
	    //alert(selectcnt);
	    //alert(p_id);
	    
	    if (p_id === null || p_id === "") {
	        alert("장바구니 담기는 로그인 상태에서만 가능합니다.");
	        return false;
	    } else{
	    	let message = "장바구니에 담으시겠습니까??"
	    	if(confirm(message)){
	    		$.ajax({
	                url: "/program/proInsert.do", // 컨트롤러에 대한 URL 매핑
	                type: "POST", // 요청 메소드 설정 (POST 또는 GET)
	                data: { "pro_code": pro_code, "p_id": p_id, "pro_cnt": pro_cnt, "pro_fee": pro_fee, "pro_name": pro_name }, // 전송할 데이터 설정
	                success: function(response) {
	                    // 요청이 성공적으로 처리된 후 실행될 콜백 함수
	                    // 처리 결과에 따른 후속 작업 수행
	                    alert(response);
	                    //장바구니로 이동
	                    window.location.href = "../cart/list";
	                },
	                error: function(xhr, status, error) {
	                    // 요청이 실패한 경우 실행될 콜백 함수
	                    // 에러 처리 로직 구현
	                    alert("장바구니 담기 실패");
	                }
	            });
	    		return true;
	    	}else{
	    		return false;
	    	}
	    }
	}
</script>
<script>
	/*
	function likeCheck(pro_obj, p_id){
		
		alert(pro_obj);
		alert(p_id);
		if(confirm("관심프로그램으로 등록하시겠습니까?")){
			$.ajax({
			    url: "likeInsert.do", // 컨트롤러에 대한 URL 매핑
			    type: "POST", // 요청 메소드 설정 (POST 또는 GET)
			    data: { "pro_obj": pro_obj, "p_id": p_id }, // 전송할 데이터 설정
			    success: function(response) {
			      // 요청이 성공적으로 처리된 후 실행될 콜백 함수
			      // 처리 결과에 따른 후속 작업 수행
			      alert(response);
			      
			    },
			    error: function(xhr, status, error) {
			      // 요청이 실패한 경우 실행될 콜백 함수
			      // 에러 처리 로직 구현
			      alert("관심프로그램으로 등록하기 실패");
			    }
			  });
		}else{
			return false;
		}
	}//likeCheck() end
	*/
</script>
<script>
	function deleteCheck(pro_obj){
		
		//alert(pro_obj);
		if(confirm("삭제하면 복구되지 않습니다.\n삭제하시겠습니까?")){
			alert("삭제되었습니다.");
			window.location.href = "/program/delete.do?pro_obj=" + pro_obj;
		}else{
			return false;
		}
	}
</script>
<%@ include file="../footer.jsp" %>