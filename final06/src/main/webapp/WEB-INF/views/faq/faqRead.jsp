<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
<!--container start-->

    <section id="faq">

<table border="1" align="center" style="width: 900px; height: 1200px; text-align:center;">

<tr align="center" style="height: 50px;">
	<td>일련번호</td>
	<td>${dto.f_no}</td>
</tr>
<tr>
	<td>카테고리</td>
	<td>${dto.f_cate}</td>
</tr>
<tr>
	<td>질문</td>
	<td>${dto.f_question}</td>
</tr>
<tr>
	<td>답변</td>
	<td>${dto.f_answer}</td>
</tr>
</table>
<br><br>
<div align="center">
		<input type="button" value="수정" onclick="location.href='update.do?not_no=${dto.f_no}'">
		<input type="button" value="삭제" onclick="location.href='delete.do?not_no=${dto.f_no}'">
</div>
<br><br>

</section>

<section id="faq-other">
    <div class="container">
        <div class="row mar-b-30">
                <div class="title text-center mar-b-30">
                    <h1 class="wow flipInX">OTHER GREAT <mark>KNOWLEDGE-BASE</mark> ARTICLES</h1>
                    <hr>
                    <p class="lead text-center wow fadeInUp">Showcase your  work with colorfull hover effect and seperate your works in categories</p>
                </div>

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".1s">
                            <i class="fa fa-leaf"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Ultimate and Clean Design</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".2s">
                            <i class="fa fa-desktop"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Responsive Design</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".3s">
                            <i class="fa fa-html5"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">HTML5</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".4s">
                            <i class="fa fa-css3"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Css3</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".5s">
                            <i class="fa fa-code"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Friendly Coding</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".6s">
                            <i class="fa fa-cogs"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Customization</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".7s">
                            <i class="fa fa-flag"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Font awesome</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".8s">
                            <i class="fa fa-tags"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Navigation Styling</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="faq-square">
                        <div class="icon-wrap ico-bg round-five wow pulse" data-wow-duration="2s" data-wow-delay=".9s">
                            <i class="fa fa-random"></i>
                        </div>
                        <div class="content">
                            <h3 class="title wow flipInX">Slider</h3>
                            <p>Suspendisse dignissim in sem eget pulvinar. lorem ipsum dolor sit amet..</p>
                        </div>
                    </div>
                </div><!-- end col-lg-4 -->

            </div>
    </div>

</section>

<div id="newsletter-faq">


    <div class="container">
        <div class="row">

            <div class="col-md-6">
                <p class="lead wow fadeInLeft">Stay in the loop with our newsletter!</p>
            </div>

            <div class="col-md-6">

                <!--////////// Newsletter Form //////////-->
                <form id="newsletter-signup">
                    <div class="input-group wow fadeInRight">
                      <input type="text" name="e-mail" id="e-mail" class="form-control newsletter-input">
                      <span class="input-group-btn">
                        <button class="btn btn-inverse btn-hg" type="submit" name="submit">Sign Up</button>
                      </span>
                    </div><!-- /input-group -->
                </form>
                <!--////////// end of Newsletter Form ///////////-->

                 <div id="error-info"></div><!-- Error notification for newsletter signup form -->

            </div>

        </div><!-- /row -->
    </div><!-- /container -->


</div>

<!--clients start-->
     <div class="container">
        <div class="row mar-b-50 our-clients">
            <div class="col-md-3">
                <h2><a href="#">Our Clients</a></h2>
                <p>Lorem dipsum folor margade sitede lametep eiusmod psumquis dolore.Margade sitede lametep eiusmod.
                lametep eiusmod psumquis dolore.</p>
            </div>
            <div class="col-md-9">
                <div class="outside">
                  <p><span id="slider-prev"></span> | <span id="slider-next"></span></p>
                </div>
                <ul class="bxslider1 clients-list">
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />
                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />
                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />
                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />
                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />
                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />
                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="img/clients/graylogo6.png" alt="" />
                            <img src="img/clients/newlogo6.png" class="color-img" alt="" />
                        </a>
                    </li>

                </ul>


            </div>
        </div>
        <!-- END CLIENTS -->
     </div>
     <!--clients end-->

<!--container end-->
<!-- 본문 끝 -->
        
<%@ include file="../footer.jsp" %>
