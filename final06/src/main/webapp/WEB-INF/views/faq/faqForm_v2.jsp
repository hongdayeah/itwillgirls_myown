<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="author" content="cosmic">
    <meta name="keywords" content="Bootstrap 3, Template, Theme, Responsive, Corporate, Business">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Acme | Home</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/flexslider.css"/>
    <link href="assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/animate.css">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>



      <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="css/component.css">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="../css/faq.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
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

<link rel=stylesheet" type="text/css" href="../css/faq.css">
</head>



<body>
<form name="faqfrm" id="faqfrm" method="post" action="create.do" onsubmit="return faqCheck()">
<h3 style="padding-left: 10px;">FAQ 작성</h3>
<br>
<table width="98%" height="350px">
	<tr>
		<th>카테고리</th>
		<td>
			<select id="f_cate" name="f_cate" class="form-control" required>
				<option value="C">고객 관련</option>
				<option value="F">시설 관련</option>
				<option value="P">프로그램 관련</option>
			</select>
		</td>
	</tr>
	<tr>
		<th align="center">질문</th>
		<td><textarea class="form-control" rows="10" cols="40" name="f_question" id="f_question" required></textarea></td>
	</tr>  
	<tr>
		<th align="center">답변</th>
		<td><textarea class="form-control" rows="10" cols="40" name="f_answer" id="f_answer" required></textarea></td>
	</tr>       
</table>

        
<div align="center">
<button type="submit" class="btn btn-primary">등록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="reset" class="btn btn-danger">취소</button>      

     
</div><br><br>
</form>
</body>
<%@ include file="../footer.jsp" %>
