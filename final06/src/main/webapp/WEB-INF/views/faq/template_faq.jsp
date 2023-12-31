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
              <p class="lead wow fadeIn">You have a question? Someone else might have had the exact same one. Let's find out!</p>
            </div>

                <!--////////// Accordion Toggle //////////-->
                <div class="panel-group wow fadeInUp" id="accordion" data-wow-duration="2s">

                    <!-- PANEL 1 -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-faq">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                Is this template compatible with Bootstrap 3?
                                </a>
                            </h4>
                        </div>

                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body panel-faq">
                                <p>Absolutely! As shown with a few examples within this demo, you can use all the bootstrap goodies such as carousels, modal windows, tooltips, tabs, accordions, form elements...</p>
                            </div>
                        </div>
                    </div>

                    <!-- PANEL 2 -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-faq">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                Are there more icons available?
                                </a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                            <div class="panel-body panel-faq">
                                <p>Hell yeah! This template is built on the awesome <a href="http://designmodo.com/flat/" target="_blank">Flat UI kit by Designmodo</a>.<br>All the icons & goodies you can see on the kit presentation can be used in Acme!</p>
                            </div>
                        </div>
                    </div>

                    <!-- PANEL 3 -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-faq">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                Is it a flat design concept?
                                </a>
                            </h4>
                        </div>

                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body panel-faq">
                                <p>Off course.This theme is built on top of flat design concept.</p>
                            </div>
                        </div>
                    </div>

                    <!-- PANEL 4 -->
                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-faq">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                Does the template hack into Bootsrap core files?
                                </a>
                            </h4>
                        </div>

                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body panel-faq">
                                <p>Nooooo. Yeww, no way! The Bootsrap files are totally untouched - all the customizations are done on extra css files, so you can upgrade bootstrap versions wihout any modification losses.</p>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-faq">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
                                Is this template compatible with Bootstrap 3?
                                </a>
                            </h4>
                        </div>

                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body panel-faq">
                                <p>Absolutely! As shown with a few examples within this demo, you can use all the bootstrap goodies such as carousels, modal windows, tooltips, tabs, accordions, form elements...</p>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading panel-heading-faq">
                            <h4 class="panel-title">
                                <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">
                                Is this template responsive?
                                </a>
                            </h4>
                        </div>

                        <div id="collapseSix" class="panel-collapse collapse">
                            <div class="panel-body panel-faq">
                                <p>Absolutely! As shown with a few examples within this demo, you can see this template is fully responsive.This is built on top of Responsive Twitter Bootstrap 3 framework.Enjoy!!</p>
                            </div>
                        </div>
                    </div>
                </div>


            </div><!-- /col-md-10 -->


        </div>
    </div>

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
