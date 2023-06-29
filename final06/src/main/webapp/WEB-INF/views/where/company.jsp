<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>
<head>
<style>
	li {
		 font-size: 1.3em; 
		}
	blockquote {
		 font-size: 1.5em;
		}
</style>
</head>

<!-- 본문 시작 template.jsp -->
 <!--breadcrumbs start-->
    <div class="breadcrumbs">
      <div class="container">
        <div class="row">
          <div class="col-lg-4 col-sm-4">
            <h1>
              About us
            </h1>
          </div>
          <div class="col-lg-8 col-sm-8">
            <ol class="breadcrumb pull-right">
              <li>
                <a href="#">
                  Home
                </a>
              </li>
              <li>
                <a href="#">
                  Pages
                </a>
              </li>
              <li class="active">
                About
              </li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <!--breadcrumbs end-->
<!-- click start -->

<div style="text-align:center;">
    <table class="tab" width="50%" style="margin: auto; table-layout: fixed;">
    <tr style="text-align:center">
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; text-align: center; width: 20%;">
            <a href="/where/classroom.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-university-6309120.png" height="20" width="20" style="vertical-align: bottom; margin-bottom: 4px;">
                &nbsp;체험시설
            </a>
        </td>
        <td style="font-size: 25px; font-weight: bold; vertical-align: middle; width: 20%;">|</td>
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; width: 20%;">
            <a href="/where/facility.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-firm-1622823.png" height="20" width="20" style="vertical-align: bottom; margin-bottom: 3px;">
                &nbsp;편의시설
            </a>
        </td>
        <td style="font-size: 25px; font-weight: bold; vertical-align: middle; width: 20%;">|</td>
        <td style="color: #f1f1f1; font-size: 15px; font-weight: bold; vertical-align: middle; width: 20%;">
            <a href="/where/company.do">
                <img src="https://myabcdebucket.s3.ap-northeast-2.amazonaws.com/free-icon-company-3932615.png" height="20" width="20" style="vertical-align: middle; margin-bottom: 3px;">
                &nbsp;입주기관
            </a>
        </td>
    </tr>
</table>
  </div>
  <br>

<hr>
<!-- click end -->
        
<%@ include file="../footer.jsp" %>
 