<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title><fmt:message key="web.title.about"/>|<fmt:message key="company"/></title>
        <meta name="description" content="<fmt:message key="web.title.about.des"/>">
        <meta name=“keywords” content=“<fmt:message key="web.title.about.keywords"/>”>
        <meta name="author" content="jiuduan,九端">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="base/base.jsp"/>
    </head>
    <body>
        <jsp:include page="base/nav.jsp">
            <jsp:param name="navindex" value="1"/>
        </jsp:include>
        <div class="breadcrumb-container">
            <div class="container text-right">
                <ol class="breadcrumb">
                    <li><a href="${lan}"><fmt:message key="nav.home"/></a></li>
                    <li class="active"><fmt:message key="nav.about-us"/> <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <jsp:include page="base/alibaba.jsp"/>
        <section class="bg-white" data-wow-duration="1200ms" data-wow-delay="100ms">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="about.title"/></h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <p><img src="assets/img/150.jpg" alt="Photo" class="pull-left mr20 mt5 mb20"><strong><fmt:message key="company"/></strong> <fmt:message key="about.company.des"/></p>
                    </div>
                    <!-- ACCORDION -->
                    <div class="col-md-6">
                        <h4 class="color5"><fmt:message key="about.questions"/></h4>
                        <!-- Panel Group -->
                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                            <!-- Panel -->
                            <c:forEach items="${problems}" var="item" varStatus="status">
                            <div class="panel panel-default wow fadeInUp">
                                <div class="panel-heading" role="tab" id="headingTwo_${status.index}">
                                    <h4 class="panel-title">
                                        <a class="<c:if test="${status.index!=0}">collapsed</c:if>" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo_${status.index}" aria-expanded="false" aria-controls="collapseTwo_${status.index}">${status.index+1}. ${item.question}</a>
                                    </h4>
                                </div>
                                <div id="collapseTwo_${status.index}" class="panel-collapse collapse <c:if test="${status.index==0}">in</c:if>" role="tabpanel" aria-labelledby="headingTwo_${status.index}">
                                    <div class="panel-body">
                                            ${item.answer}
                                    </div>
                                </div>
                            </div><!-- /panel -->
                            </c:forEach>

                        </div><!-- /panel-group -->
                    </div><!-- /accordion -->
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-r">
                            <h2><fmt:message key="about.trading"/></h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="table-container">
                            <table id="example" class="table table-striped table-theme-1 table-bordered">
                                <!-- Table header -->
                                <thead>
                                <tr>
                                    <th><fmt:message key="about.trading.country"/></th>
                                    <th><fmt:message key="about.trading.product"/></th>
                                    <th><fmt:message key="about.trading.price"/></th>
                                    <th><fmt:message key="about.trading.date"/></th>
                                </tr>
                                </thead>
                                <!-- Table footer.reg -->
                                <tfoot>
                                <tr>
                                    <th><fmt:message key="about.trading.country"/></th>
                                    <th><fmt:message key="about.trading.product"/></th>
                                    <th><fmt:message key="about.trading.price"/></th>
                                    <th><fmt:message key="about.trading.date"/></th>
                                </tr>
                                </tfoot>
                                <!-- Table body -->
                                <tbody>
                                <c:forEach items="${trades.data}" var="item">
                                <tr>
                                    <td>${item.country}</td>
                                    <td><a href="${lan}/${item.product_url}/p${item.product_id}">${item.productname}</a></td>
                                    <td>${item.price}</td>
                                    <td><fmt:formatDate value="${item.date}"/></td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <ul class="pagination mt10 pull-right">
                                <pg:pager url="${url}" items="${trades.total}" maxIndexPages="5" maxPageItems="${trades.limit}" export="currentPageNumber=pageNumber">
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
                        </div>

                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="about.trade"/></h2>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <img src="assets/img/skills.jpg" alt="Skills" class="img-responsive">
                        <p><br><fmt:message key="about.trade.des"/></p>
                    </div>
                    <div class="visible-xs-block pt20"></div>
                    <div class="col-md-6 skills">
                        <!-- Skill -->
                        <c:forEach items="${toptrades}" var="item">
                        <h5 class="pt0">${item.area}</h5>
                        <div class="progress wow fadeInUp">
                            <div class="progress-bar progress-bar-striped" role="progressbar" data-value="${item.proportion}" style="width: ${item.proportion}%;">${item.proportion}%<span></span></div>
                        </div>
                        </c:forEach>
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-gray">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title-r">
                            <h2><fmt:message key="about.team"/></h2>
                        </div>
                    </div>
                    <!-- Member -->

                    <c:forEach items="${teams}" var="item" varStatus="status">
                    <div class="col-sm-6 col-md-3 wow fadeIn" data-wow-duration="1000ms" data-wow-delay="300ms">
                        <figure class="item-img-wrap">
                            <img src="${item.avatar}" class="img-responsive" alt="team">
                            <div class="item-img-overlay">
                                <div class="team-social">
                                    <p>
                                        <strong class="color4 text-uppercase">${item.name}</strong><br>
                                            ${item.des}
                                    </p>
                                </div>
                            </div>
                        </figure>
                        <div class="team-name">
                            <h4 class="h-underline2">${item.name}</h4>
                            <h5>${item.job}</h5>
                            <ul class="list-inline socialstaff">
                                <li>
                                    <a href="${item.facebook}" data-toggle="tooltip" data-placement="bottom" data-original-title="Facebook" class="corp-tooltip" target="_blank">
                                        <i class="fa fa-facebook-square fa-2x"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="${item.twitter}" data-toggle="tooltip" data-placement="bottom" data-original-title="Twitter" class="corp-tooltip" target="_blank">
                                        <i class="fa fa-twitter-square fa-2x"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="${item.linkin}" data-toggle="tooltip" data-placement="bottom" data-original-title="Linkedin" class="corp-tooltip" target="_blank">
                                        <i class="fa fa-linkedin-square fa-2x"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="mailto:${item.email}" data-toggle="tooltip" data-placement="bottom" data-original-title="Email" class="corp-tooltip" target="_blank">
                                        <i class="fa fa-envelope-square fa-2x"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="visible-xs-block visible-sm-block pt20"></div>
                    </div>
                    </c:forEach>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <section class="bg-white" id="counterUp">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="about.statistics"/></h2>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <!-- Fact -->
                            <div class="col-sm-6 col-md-3 text-center">
                                <figure class="home-icons">
                                    <i class="fa fa-usd le"></i>
                                </figure>
                                <h3 class="facts-title"><span class="count">${totaltrade.price}</span></h3>
                                <h6 class="color4"><fmt:message key="about.total.trade"/></h6>
                            </div>
                            <!-- Fact -->
                            <div class="col-sm-6 col-md-3 text-center">
                                <figure class="home-icons">
                                    <i class="fa fa-users le"></i>
                                </figure>
                                <h3 class="facts-title"><span class="count">${totaltrade.country}</span></h3>
                                <h6 class="color4"><fmt:message key="about.total.country"/></h6>
                            </div>
                            <!-- Fact -->
                            <div class="col-sm-6 col-md-3 text-center">
                                <figure class="home-icons">
                                    <i class="fa fa-clock-o le"></i>
                                </figure>
                                <h3 class="facts-title"><span class="count">${totaltrade.amount}</span></h3>
                                <h6 class="color4"><fmt:message key="about.total.volume"/></h6>
                            </div>
                            <!-- Fact -->
                            <div class="col-sm-6 col-md-3 text-center">
                                <figure class="home-icons">
                                    <i class="fa fa-code le"></i>
                                </figure>
                                <h3 class="facts-title"><span class="count">${totaltrade.weight}</span></h3>
                                <h6 class="color4"><fmt:message key="about.total.weight"/></h6>
                            </div>
                        </div>
                    </div>
                </div><!-- /row -->
            </div><!-- /container -->
        </section>
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
