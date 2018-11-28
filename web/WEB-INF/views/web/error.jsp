<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title><fmt:message key="web.title.error"/>|<fmt:message key="company"/></title>
        <meta name="author" content="jiuduan,九端">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="base/base.jsp"/>
    </head>
    <body>
        <jsp:include page="base/nav.jsp">
            <jsp:param name="navindex" value="404"/>
        </jsp:include>
        <div class="breadcrumb-container">
            <div class="container text-right">
                <ol class="breadcrumb">
                    <li><a href="${lan}"><fmt:message key="nav.home"/></a></li>
                    <li class="active"><fmt:message key="error"/> <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <section class="bg-white">
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
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="error"/></h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <p class="text-center color4">
                                <span class="fa-stack fa-5x mb15">
                                    <i class="fa fa-file-o fa-stack-2x"></i>
                                    <strong class="fa-stack-1x fa-stack-text file-text fs404">404</strong>
                                </span>
                            </p>
                            <h3 class="text-center text-uppercase color5"><fmt:message key="error.title"/></h3>
                            <p class="text-center"><fmt:message key="error.des"/></p>
                            <div class="text-center">
                                <p><br>
                                    <a class="btn btn-primary-corp" href="${lan}"><i class="fa fa-home le"></i> <fmt:message key="nav.home"/></a> &nbsp;
                                    <a class="btn btn-primary-corp" href="${lan}/contact-us"><i class="fa fa-envelope le"></i> <fmt:message key="nav.contact"/></a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
