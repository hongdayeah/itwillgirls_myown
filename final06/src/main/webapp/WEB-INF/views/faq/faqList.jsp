<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp" %>

<!-- 본문 시작 template.jsp -->
<!--container start-->

<section id="faq">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 mar-b-30">
                <div id="heading">
                    <h1 class="wow flipInX">F.A.Q.</h1>
                    <p class="lead wow fadeIn">자주묻는 질문을 한번에 모았습니다! 자세한 문의는 문의게시판을 이용해주세요.</p>
                </div>
                <div class="panel-group wow fadeInUp" id="accordion" data-wow-duration="2s">
                    <c:forEach var="dto" items="${list}" varStatus="status">
                        <!-- PANEL -->
                        <div class="panel panel-default">
                            <div class="panel-heading panel-heading-faq">
                                <h4 class="panel-title">
                                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse-${status.index}">
                                        ${dto.f_question}
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse-${status.index}" class="panel-collapse collapse">
                                <div class="panel-body panel-faq">
                                    <p>${dto.f_answer}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div><!-- /panel-group -->
            </div><!-- /col-md-10 -->
        </div>
    </div>
    <c:if test="${member_dto.p_id == 'webmaster'}">
    <div align="center">
		<input type="button" value="관리자 리스트" onclick="location.href='/faq/list2.do'">
	</div>
	</c:if>
<br><br>
</section>
<br><br>

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
