<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title><fmt:message key="web.title.new"/>|<fmt:message key="company"/></title>
        <meta name="description" content="<fmt:message key="web.title.new.des"/>">
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
                    <li class="active"><fmt:message key="nav.new"/> <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <jsp:include page="base/alibaba.jsp"/>
        <section class="bg-white">
            <div class="container">
                <div id="content" class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="new.title"/></h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <!-- SIDEBAR -->
                            <aside class="col-md-4 sidebar sidebar-left">
                                <!-- Search form -->
                                <div class="well widget">
                                    <form action="${lan}/news" method="post">
                                    <div class="input-group search-form" role="form">
                                        <label class="sr-only">Search...</label>
                                        <input type="text" class="form-control" name="s" id="search" value="${s}" placeholder="<fmt:message key="new.search"/>">
                                        <span class="input-group-btn">
                                            <button type="submit" class="btn"><i class="fa fa-search"></i></button>
                                        </span>
                                    </div>
                                    </form>
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
                                <!-- Recent posts -->
                                <div class="well widget">
                                    <h2><fmt:message key="new.title.recent"/></h2>
                                    <ul class="list-unstyled">
                                        <c:forEach items="${topnews}" var="item">
                                        <li><a href="${lan}/${item.news_url}/n${item.news_id}">${item.newsname}</a></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <!-- Recent posts -->
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
                                <c:forEach items="${news.data}" var="item">
                                <article>
                                    <header>
                                        <div class="post-thumbnail">
                                            <img src="${item.coverImg}" alt="${item.newsname}">
                                        </div>
                                        <h2 class="entry-title"><a href="${lan}/${item.news_url}/n${item.news_id}">${item.newsname}</a><a href="${item.source}" target="_blank">&nbsp; <span class="color-alibaba">(<fmt:message key="web.alibaba.more"/>)</span></a></h2>
                                        <p class="author">
                                            <i class="fa fa-calendar"></i>
                                            <fmt:formatDate value="${item.create_time}"></fmt:formatDate> <span>/</span> <a href="${lan}/${item.type_url}/nt${item.type_id}"><strong>${item.type_name}</strong></a>
                                        </p>
                                    </header>
                                    <div class="post_content">
                                        <p>${item.des}...</p>
                                        <a href="${lan}/${item.news_url}/n${item.news_id}" class="btn btn-primary-corp"><i class="fa fa-plus"></i> <fmt:message key="new.more"/></a>
                                    </div>
                                </article>
                                <hr>
                                </c:forEach>

                                <!-- Pagination -->
                                <ul class="pagination mt10">

                                <pg:pager url="${url}" items="${news.total }" maxIndexPages="5" maxPageItems="${news.limit }" export="currentPageNumber=pageNumber">
                                    <c:if test="${!empty s}">
                                    <pg:param name="s" value="${s}"/>
                                    </c:if>
                                    <pg:first>
                                    <li><a href="${pageUrl }" title="First"><i class="fa fa-angle-double-left small"></i></a></li>
                                    </pg:first>
                                    <pg:prev>
                                    <li><a href="${pageUrl }" title="Previous"><i class="fa fa-angle-left small"></i></a></li>
                                    </pg:prev>
                                    <pg:pages>
                                        <c:choose>
                                            <c:when test="${currentPageNumber eq pageNumber}">
                                                <li class="active"><a href="${pageUrl }">${pageNumber }</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li><a href="${pageUrl }">${pageNumber }</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </pg:pages>
                                    <pg:next>
                                    <li><a href="${pageUrl }" title="Next"><i class="fa fa-angle-right small"></i></a></li>
                                    </pg:next>
                                    <pg:last>
                                    <li><a href="${pageUrl }" title="Last"><i class="fa fa-angle-double-right small"></i></a></li>
                                    </pg:last>
                                </pg:pager>
                                </ul>
                                <div class="visible-xs-block visible-sm-block pt20"></div>
                            </div><!-- /main -->
                        </div>
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
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
