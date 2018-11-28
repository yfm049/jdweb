<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title><fmt:message key="web.title.index"/>|<fmt:message key="company"/></title>
        <meta name="description" content="<fmt:message key="web.title.index.des"/>">
        <meta name=“keywords” content=“<fmt:message key="web.title.index.keywords"/>”>
        <meta name="author" content="jiuduan,九端">
        <jsp:include page="base/meta.jsp"/>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="base/base.jsp"/>

    </head>
    <body>
        <jsp:include page="base/nav.jsp">
            <jsp:param name="navindex" value="0"/>
        </jsp:include>

        <header class="container-fluid intro-slider">
            <div class="bg-slider-wrapper">
                <div id="bg-slider" class="flexslider bg-slider">
                    <ul class="slides">
                        <li class="slide slide-1"></li>
                        <li class="slide slide-2"></li>
                        <li class="slide slide-3"></li>
                    </ul>
                </div>
            </div>
            <!-- HOME PROMO -->
            <section class="home-promo">
                <div class="text-center wow">
                    <h2 class="titlepro">
                        <span class="upper"><fmt:message key="index.slider.welcome"/></span>
                        <span class="middle"><fmt:message key="company"/></span>
                        <span class="bottom"><fmt:message key="index.slider.product"/></span>
                    </h2>
                    <a href="https://jiuduan.en.alibaba.com" class="btn btn-transparent" target="_blank"><i class="fa fa-navicon"></i> <fmt:message key="index.slider.more"/></a>
                </div>
            </section>
        </header>

        <section class="bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-r">
                            <h2><fmt:message key="topproduct"/></h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="slick-carousel" id="product">
                            <!-- Post -->
                            <c:forEach items="${topproduct}" var="item">
                                <div>
                                    <div class="mix p5 text-center">
                                        <a title="${item.productname}" href="${lan}/${item.product_url}/p${item.product_id}">
                                            <div class="item-img-wrap">
                                                <img src="${item.coverImg}" class="img-responsive" alt="${item.productname}">
                                                <div class="item-img-overlay">
                                                    <div>
                                                        <i class="fa fa-eye"></i>
                                                        <h5>${item.productname}<br><small>${item.typename}</small></h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div><!-- /work col -->
                                </div><!-- /item - post -->
                            </c:forEach>
                        </div><!-- /news carousel -->
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>

        <section class="bg-gray">
            <div class="container text-center contact-por wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="50ms">
                <h4 class="pb10"><fmt:message key="product.download.des"/>&nbsp;&nbsp;</h4>
                <a href="assets/pdf/jdproduct.pdf" class="btn btn-default btn-primary-corp-big"><i class="fa fa-download le"></i> <fmt:message key="product.download"/>（PDF）</a>
            </div>
        </section>
        <jsp:include page="base/alibaba.jsp"/>
        <section class="bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-3 text-center home-icons">
                        <i class="fa fa-thumbs-o-up wow fadeInUp" data-wow-delay="20ms"></i>
                        <div>
                            <h4><fmt:message key="service.factory"/></h4>
                            <h5><fmt:message key="service.factory.des"/></h5>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 text-center home-icons">
                        <i class="fa fa-handshake-o wow fadeInUp" data-wow-delay="40ms"></i>
                        <div>
                            <h4><fmt:message key="service.quality"/></h4>
                            <h5><fmt:message key="service.quality.des"/></h5>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 text-center home-icons">
                        <i class="fa fa-bolt wow fadeInUp" data-wow-delay="60ms"></i>
                        <div>
                            <h4><fmt:message key="service.price"/></h4>
                            <h5><fmt:message key="service.price.des"/></h5>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-3 text-center home-icons">
                        <i class="fa fa-futbol-o wow fadeInUp" data-wow-delay="80ms"></i>
                        <div>
                            <h4><fmt:message key="service.sales"/></h4>
                            <h5><fmt:message key="service.sales.des"/></h5>
                        </div>
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="title">
                            <h2><fmt:message key="about.title"/></h2>
                        </div>
                    </div>
                    <!-- VIDEO -->
                    <div class="col-sm-12 col-md-6">
                        <div class="embed-responsive embed-responsive-16by9">
                            <video src="assets/media/movie.mp4" class="media-video" controls="controls">
                                Your browser does not support the video tag.
                            </video>
                        </div>
                        <div class="visible-xs-block visible-sm-block pt20"></div>
                    </div>
                    <!-- DESCRIPTION -->
                    <div class="col-sm-12 col-md-6">
                        <div class="blognews">
                            <a href="${lan}/about-us" class="mb20">
                                <div class="item-img-wrap">
                                    <img src="assets/img/about-home.jpg" class="img-responsive" alt="template">
                                    <div class="item-img-overlay">
                                        <div class="about">
                                            <span class="btn btn-transparent-sm"><i class="fa fa-plus"></i> Read more</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <p><strong><fmt:message key="company"/></strong> <fmt:message key="about.company.des" var="companydes"/><c:out value="${fn:substring(companydes, 0, 240)}......"/><a href="${lan}/about-us"><fmt:message key="about.more"/></a>.</p>
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-r">
                            <h2><fmt:message key="new.title"/></h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="slick-carousel" id="news">
                            <!-- Post -->
                            <c:forEach items="${topnews}" var="item">
                            <div>
                                <article class="blognews">
                                    <a href="${lan}/${item.news_url}/n${item.news_id}" class="mt5 mb15">
                                        <div class="item-img-wrap">
                                            <img src="${item.coverimg}" class="img-responsive" alt="${item.newsname}">
                                            <div class="item-img-overlay">
                                                <div class="news">
                                                    <span class="btn btn-transparent-sm"><i class="fa fa-plus"></i> <fmt:message key="new.more"/></span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <h4><a href="${lan}/${item.news_url}/n${item.news_id}">${item.newsname}</a></h4>
                                    <p class="single-line">${item.des}...
                                    </p>
                                    <p class="author">
                                        <i class="fa fa-calendar"></i> <fmt:formatDate value="${item.create_time}"/><span>/</span>
                                        <a href="${item.source}"><strong><fmt:message key="new.source"/></strong></a> <span>/</span>
                                        <a href="${lan}/${item.news_url}/n${item.news_id}" data-toggle="tooltip" data-placement="right" title="" data-original-title="Read more" class="corp-tooltip"><i class="fa fa-plus-square"></i></a>
                                    </p>
                                </article>
                            </div><!-- /item - post -->
                            </c:forEach>
                        </div><!-- /news carousel -->
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-buy parallax process-rounded" data-stellar-background-ratio="0.5">
            <div class="container-fluid">
                <div class="row text-center">
                    <div class="col-md-12">
                        <h1 class="intro-text mt30 wow fadeInUp">
                            <fmt:message key="index.contact"/>
                        </h1>
                        <p class="lead mt30">
                            <address>
                                <h3><i class="fa fa-phone"></i> <fmt:message key="tel"/></h3>
                                <h3><i class="fa fa-envelope"></i> <fmt:message key="email.1"/></h3>
                            </address>
                        </p>
                        <p><a href="mailto:<fmt:message key="email.1"/>" class="btn btn-default btn-primary-corp-big"><i class="fa fa-user le"></i> <fmt:message key="index.contact.button"/></a></p>
                    </div>
                </div><!-- /row -->
            </div><!-- /container-fluid -->
        </section>
        <section class="bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="index.partner"/></h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="slick-carousel" id="clients">
                            <div><a><img src="assets/img/logo1.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo2.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo3.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo4.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo5.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo6.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo1.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo2.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo3.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo4.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo5.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo6.png" alt="Client"></a></div>
                            <div><a><img src="assets/img/logo4.png" alt="Client"></a></div>
                        </div>
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
