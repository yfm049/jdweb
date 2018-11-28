<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title>${newitem.newsname}|${newitem.news_url}|<fmt:message key="web.title.new.item"/>|<fmt:message key="company"/></title>
        <meta name="description" content="${newitem.des}">
        <meta name=“keywords” content=“<fmt:message key="web.title.new.keywords"/>”>
        <meta name="author" content="jiuduan,九端">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="base/base.jsp"/>

    </head>
    <body>
        <jsp:include page="base/nav.jsp">
            <jsp:param name="navindex" value="4"/>
        </jsp:include>
        <div class="breadcrumb-container">
            <div class="container text-right">
                <ol class="breadcrumb">
                    <li><a href="${lan}"><fmt:message key="nav.home"/></a></li>
                    <li><a href="${lan}/news"><fmt:message key="nav.new"/></a></li>
                    <li class="active">${newitem.newsname} <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <jsp:include page="base/alibaba.jsp"/>
        <section class="bg-white">
            <div class="container">
                <div id="content" class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2>${newitem.newsname}</h2>

                        </div>
                    </div>
                    <!-- SIDEBAR -->
                    <aside class="col-md-4 sidebar sidebar-left">
                        <!-- Search form -->
                        <div class="well widget">
                            <div class="input-group search-form" role="form">
                                <label class="sr-only">Search...</label>
                                <input type="text" class="form-control" name="s" id="search" value="${keyword}" placeholder="<fmt:message key="new.search"/>">
                                <span class="input-group-btn">
                                    <button type="button" class="btn" onclick="search()"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </div>
                        <!-- Categories -->
                        <div class="well widget">
                            <h2><fmt:message key="new.title.category"/></h2>
                            <ul class="list-unstyled">
                                <c:forEach items="${types}" var="item">
                                    <li><a href="${lan}/${item.type_url}/nt${item.type_id}">${item.type_name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="well widget">
                            <h2><fmt:message key="topproduct"/></h2>
                            <ul class="list-unstyled">
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
                                    </div>
                                </c:forEach>
                            </ul>
                        </div>
                    </aside><!-- /sidebar -->
                    <!-- MAIN -->
                    <div id="main" class="col-md-8" role="main">
                        <!-- Article -->
                        <article>
                            <header>
                                <div class="post-thumbnail">
                                    <img src="${newitem.coverimg}" alt="Post image">
                                </div>
                                <h2 class="entry-title"><a href="${newitem.source}" target="_blank">${newitem.newsname} &nbsp; <span class="color-alibaba">(<fmt:message key="web.alibaba.more"/>)</span></a></h2>
                                <p class="author">
                                    <i class="fa fa-calendar"></i>
                                    <fmt:formatDate value="${newitem.date}"></fmt:formatDate> <span>/</span> <a href="${lan}/${newitem.type_url}/nt${newitem.type_id}"><strong>${newitem.type_name}</strong></a>
                                </p>
                            </header>
                            <div class="post_content">
                                ${newitem.detail}
                            </div>
                            <!-- Tags -->
                            <footer class="row entry-meta">
                                <div class="col-md-12">
                                    <p class="tags-links">
                                        <c:forEach items="${fn:split(newitem.tags,',')}" var="item">
                                        <a>${item}</a>
                                        </c:forEach>
                                    </p>
                                </div>
                            </footer>

                        </article>

                        <!-- COMMENTS -->
                        <div class="comments">
                            <ol>
                                <c:forEach items="${newleave}" var="item">
                                <li>
                                    <!-- Comment 2 -->
                                    <div class="media comment">
                                        <a class="avatar">
                                            <img class="media-object" src="assets/img/staff4.jpg" alt="">
                                        </a>
                                        <div class="media-body">
                                            <h5 class="media-heading">${item.name}</h5>
                                            <p class="small">
                                                <a>
                                                    <i class="fa fa-calendar"></i>
                                                    <span>
                                                        <fmt:formatDate value="${item.date}"/>
                                                    </span>
                                                </a>
                                            </p>
                                            <p>${item.message}</p>

                                        </div>
                                    </div>
                                </li>
                                </c:forEach>
                            </ol>
                        </div><!-- /comments -->

                        <!-- Comments form -->
                        <div class="row">
                            <div class="col-md-12 mt10">
                                <h4 class="color5"><fmt:message key="new.leave"/></h4>
                                <form class="contactform" action="${lan}/news/leave/${newitem.id}" method="post">
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="sr-only" for="name">Name<br></label>
                                                    <div class="inner-addon left-addon">
                                                        <i class="fa fa-user"></i>
                                                        <input type="text" class="form-control required" placeholder="<fmt:message key="new.leave.name"/>" name="name" id="name" data-name="Name">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 col-md-6">
                                                <div class="form-group">
                                                    <label class="sr-only" for="email">Email (required)<br></label>
                                                    <div class="inner-addon left-addon">
                                                        <i class="fa fa-envelope"></i>
                                                        <input type="email" class="form-control required required-email" placeholder="<fmt:message key="new.leave.email"/>" name="email" id="email" data-name="Email">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-12">
                                                <div class="form-group">
                                                    <label class="sr-only" for="message">Comment<br></label>
                                                    <div class="inner-addon left-addon">
                                                        <i class="fa fa-comment"></i>
                                                        <textarea rows="11" name="message" id="message" class="form-control required" placeholder="<fmt:message key="new.leave.message"/>" data-name="Comment"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row actions">
                                            <div class="col-sm-12 col-md-6">
                                                <input type="submit" value="&#xf1d9; &nbsp;<fmt:message key="new.leave.button"/>" name="submit" id="submitButton" class="btn btn-default btn-primary-corp-big" title="Click here to leave a reply!">
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                                <p>&nbsp;</p>
                            </div>
                        </div><!-- /comments form -->
                    </div><!-- /main -->
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-gray">
            <div class="container text-center contact-por wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="50ms">
                <h4 class="pb10"><fmt:message key="product.download.des"/>&nbsp;&nbsp;</h4>
                <a href="assets/pdf/jdproduct.pdf" class="btn btn-default btn-primary-corp-big"><i class="fa fa-download le"></i> <fmt:message key="product.download"/>（PDF）</a>
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
