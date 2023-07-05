<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title>${product.productname}|${product.product_url}|<fmt:message key="web.title.product.item"/>|<fmt:message key="company"/></title>
        <meta name="description" content="${product.des}">
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
                    <li><a href="${lan}/product"><fmt:message key="nav.product"/></a></li>
                    <li class="active">${product.productname} <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <jsp:include page="base/alibaba.jsp"/>
        <section id="portfolio-section" class="bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div id="productImg" class="carousel slide" data-interval="8000" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <c:forEach items="${fn:split(product.images,',')}" var="image" varStatus="status">
                                <li data-target="#productImg" data-slide-to="${status.index}" class="<c:if test="${status.index==0}">active</c:if>"></li>
                                </c:forEach>
                            </ol>
                            <div class="carousel-inner">
                                <c:forEach items="${fn:split(product.images,',')}" var="image" varStatus="status">
                                <div class="item <c:if test="${status.index==0}">active</c:if>">
                                    <img src="${image}" alt="${product.name}">
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="visible-xs-block visible-sm-block pt20"></div>
                    </div>
                    <!-- Description -->
                    <div class="col-sm-6">
                        <h4 class="color5 m0 text-uppercase wow fadeInLeft"><a href="https://jiuduan.en.alibaba.com" target="_blank">${product.productname}&nbsp; <span class="color-alibaba">(<fmt:message key="web.alibaba.more"/>)</span></a></h4>
                        <h5 class="wow fadeInLeft fa fa-usd" data-wow-delay="120ms"> ${product.price}</h5>
                        <p><a href="mailto:<fmt:message key="email.1"/>" target="_blank" class="btn btn-primary-corp mt10"><i class="fa fa-external-link le"></i> <fmt:message key="product.item.inquiry"/></a></p>
                        <p>${item.des}</p>
                        <h5 class="color5 m0 pb10 wow fadeInLeft"><fmt:message key="product.item.feature"/></h5>
                        <ul class="listicon-check">
                            <c:forEach items="${fn:split(product.features,',')}" var="feature">
                            <li>${feature}</li>
                            </c:forEach>
                        </ul>
                    </div>
                </div><!-- /row -->
                <div class="row mt10">
                    <div class="col-sm-12">
                        ${product.detail}
                    </div>
                </div>
            </div><!-- /container -->
        </section>
        <section class="bg-white">
            <div class="container text-center contact-por wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="50ms">
                <h4 class="pb10"><fmt:message key="product.download.des"/>&nbsp;&nbsp;</h4>
                <a href="assets/pdf/jdproduct.pdf" class="btn btn-default btn-primary-corp-big"><i class="fa fa-download le"></i> <fmt:message key="product.download"/>（PDF）</a>
            </div>
        </section>
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
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
