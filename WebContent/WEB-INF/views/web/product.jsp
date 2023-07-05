<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title><fmt:message key="web.title.product"/>|<fmt:message key="company"/></title>
        <meta name="description" content="<fmt:message key="web.title.product.des"/>">
        <meta name=“keywords” content=“<fmt:message key="web.title.product.keywords"/>”>
        <meta name="author" content="jiuduan,九端">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="base/base.jsp"/>
    </head>
    <body>
        <jsp:include page="base/nav.jsp">
            <jsp:param name="navindex" value="2"/>
        </jsp:include>
        <div class="breadcrumb-container">
            <div class="container text-right">
                <ol class="breadcrumb">
                    <li><a href="${lan}"><fmt:message key="nav.home"/></a></li>
                    <li class="active"><fmt:message key="nav.product"/> <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <jsp:include page="base/alibaba.jsp"/>
        <section id="portfolio-section" class="bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="product.title"/></h2>
                        </div>
                    </div>
                    <div class="col-md-12 text-center">
                        <!-- PORTFOLIO INTRO TEXT -->
                        <div class="text-center">
                            <p class="lead wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="200ms">
                                <fmt:message key="product.title.des"/>
                            </p>
                        </div>
                        <!-- PORTFOLIO NAV -->
                        <ul class="portfolio-filters list-inline">
                            <li class="filter active" data-filter="all"><fmt:message key="product.all"/></li>
                            <c:forEach items="${types}" var="item">
                            <li class="filter" data-filter="type_${item.type_id}">${item.typename}</li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-12">
                        <!-- PORTFOLIO GRID -->
                        <div id="grid" class="row text-center">
                            <c:forEach items="${products}" var="item">
                            <div class="col-sm-3 mix type_${item.type_id}">
                                <a title="${item.productname}" href="${lan}/${item.product_url}/p${item.product_id}">
                                    <div class="item-img-wrap">
                                        <img src="${item.coverImg}" class="img-responsive" alt="template">
                                        <div class="item-img-overlay">
                                            <div>
                                                <i class="fa fa-eye"></i>
                                                <h5>${item.productname}<br><small>${item.typename}</small></h5>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div><!-- /work col -->
                            </c:forEach>
                        </div><!-- /row -->
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-white">
            <div class="container text-center contact-por wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="50ms">
                <h4 class="pb10"><fmt:message key="product.download.des"/>&nbsp;&nbsp;</h4>
                <a href="assets/pdf/jdproduct.pdf" class="btn btn-default btn-primary-corp-big"><i class="fa fa-download le"></i> <fmt:message key="product.download"/>（PDF）</a>
            </div>
        </section>
        <section class="bg-gray">
            <div class="container text-center contact-por wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="50ms">
                <h4 class="pb10"><fmt:message key="product.contact"/>&nbsp;&nbsp;</h4>
                <a href="${lan}/contact-us" class="btn btn-default btn-primary-corp-big"><i class="fa fa-envelope-o le"></i> CONTACT US</a>
            </div>
        </section>
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
