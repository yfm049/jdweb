<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title><fmt:message key="web.title.service"/>|<fmt:message key="company"/></title>
        <meta name="description" content="<fmt:message key="web.title.service.des"/>">
        <meta name=“keywords” content=“<fmt:message key="web.title.service.keywords"/>”>
        <meta name="author" content="jiuduan,九端">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="base/base.jsp"/>
    </head>
    <body>
        <jsp:include page="base/nav.jsp">
            <jsp:param name="navindex" value="3"/>
        </jsp:include>
        <div class="breadcrumb-container">
            <div class="container text-right">
                <ol class="breadcrumb">
                    <li><a href="${lan}"><fmt:message key="nav.home"/></a></li>
                    <li class="active"><fmt:message key="nav.service"/> <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <jsp:include page="base/alibaba.jsp"/>
        <section class="bg-white">
            <!-- CORPORATE -->
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="service.sales.after"/></h2>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6 wow fadeIn" data-wow-duration="1200ms" data-wow-delay="100ms">
                        <img src="assets/img/serv1.jpg" alt="Services" class="img-responsive img-center">
                        <p class="mt15"><strong><fmt:message key="company"/></strong><fmt:message key="service.sales.after.des"/></p>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="row wow fadeInRight" data-wow-duration="600ms" data-wow-delay="100ms">
                            <div class="col-xs-2 text-center">
                                <i class="fa fa-code fa-4x ico-services"></i>
                            </div>
                            <div class="col-xs-10 servdesc">
                                <h3><fmt:message key="service.sales.after.quality"/></h3>
                                <p><fmt:message key="service.sales.after.quality.des"/>
                                </p>
                            </div>
                        </div>
                        <div class="row wow fadeInRight" data-wow-duration="600ms" data-wow-delay="200ms">
                            <div class="col-xs-2 text-center">
                                <i class="fa fa-mobile fa-5x ico-services"></i>
                            </div>
                            <div class="col-xs-10 servdesc">
                                <h3><fmt:message key="service.sales.after.price"/></h3>
                                <p><fmt:message key="service.sales.after.price.des"/>
                                </p>
                            </div>
                        </div>
                        <div class="row wow fadeInRight" data-wow-duration="600ms" data-wow-delay="300ms">
                            <div class="col-xs-2 text-center">
                                <i class="fa fa-html5 fa-4x ico-services"></i>
                            </div>
                            <div class="col-xs-10 servdesc">
                                <h3><fmt:message key="service.sales.after.date"/></h3>
                                <p><fmt:message key="service.sales.after.date.des"/>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-r">
                            <h2><fmt:message key="service.sales.packs"/></h2>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="row wow fadeInLeft" data-wow-duration="600ms" data-wow-delay="100ms">
                            <div class="col-xs-2 text-center">
                                <i class="fa fa-rocket fa-4x ico-services"></i>
                            </div>
                            <div class="col-xs-10 servdesc">
                                <h3><fmt:message key="service.sales.packs.repair"/></h3>
                                <p><fmt:message key="service.sales.packs.repair.des"/>
                                </p>
                            </div>
                        </div>
                        <div class="row wow fadeInLeft" data-wow-duration="600ms" data-wow-delay="200ms">
                            <div class="col-xs-2 text-center">
                                <i class="fa fa-pencil-square-o fa-4x ico-services"></i>
                            </div>
                            <div class="col-xs-10 servdesc">
                                <h3><fmt:message key="service.sales.packs.exchange"/></h3>
                                <p><fmt:message key="service.sales.packs.exchange.des"/>
                                </p>
                            </div>
                        </div>
                        <div class="row wow fadeInLeft" data-wow-duration="600ms" data-wow-delay="300ms">
                            <div class="col-xs-2 text-center">
                                <i class="fa fa-puzzle-piece fa-4x ico-services"></i>
                            </div>
                            <div class="col-xs-10 servdesc">
                                <h3><fmt:message key="service.sales.packs.return"/></h3>
                                <p><fmt:message key="service.sales.packs.return.des"/>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6 wow fadeIn" data-wow-duration="1200ms" data-wow-delay="100ms">
                        <img src="assets/img/serv2.jpg" alt="Services" class="img-responsive img-center">
                        <p class="mt15 wow fadeIn" data-wow-duration="1200ms" data-wow-delay="100ms"><fmt:message key="service.sales.packs.des"/></p>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
