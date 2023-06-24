<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../header.jsp" %>

<head>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>


    <!-- 본문 시작 performanceList.jsp -->
	    
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
	                     공연
	                  </a>
	               </li>
	               <li class="">
	                   공연상세
	               </li>
	            </ol>
	         </div>
	      </div>
	   </div>
	</div>
	<!--breadcrumbs end-->
    
    
    
    
    
    <h3>*공연상세페이지*</h3>

	<input type="button" value="공연목록" onclick="location.href='list.do'">

	<table>
			<tr><td colspan="2"><img src="../perstorage/${dto.per_img}" width="400"></td></tr>
			<tr><td>제목</td><td>${dto.per_name}</td></tr>
			<tr><td>설명</td><td>${dto.per_exp}</td></tr>
			<tr><td>날짜</td><td>${dto.per_date}</td></tr>
			<tr><td>시간</td><td>${dto.per_time}</td></tr>
			<tr><td>장소</td><td>${dto.class_code}</td></tr>
			<tr><td>공연료</td><td>${dto.per_fee}</td></tr>
		
			<tr><td>
                <input type="button" value="수정" onclick="location.href='update.do?per_code=${dto.per_code}'">
                <input type="button" value="삭제" onclick="location.href='delete.do?per_code=${dto.per_code}'">
            </td></tr>
			<tr><td>
				<input type="button" value="좌석예매" onclick="location.href='seat.do?per_code=${dto.per_code}'">
			</td></tr>
			

		
		</script>
	</table>
    <!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>


