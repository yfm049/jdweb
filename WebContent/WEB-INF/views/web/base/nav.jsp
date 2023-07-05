<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only"><fmt:message key="company"/></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"><img class="active" src="assets/img/logo.png" alt="<fmt:message key="company"/>"></a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${lan}"><fmt:message key="nav.home"/></a></li>
                <li><a href="${lan}/about-us"><fmt:message key="nav.about-us"/></a></li>
                <li><a href="${lan}/product"><fmt:message key="nav.product"/></a></li>
                <li><a href="${lan}/services"><fmt:message key="nav.service"/></a></li>
                <li><a href="${lan}/news"><fmt:message key="nav.new"/></a></li>
                <li><a href="${lan}/contact-us"><fmt:message key="nav.contact"/></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><fmt:message key="nav.language"/> <i class="fa fa-angle-down small"></i></a>
                    <div class="dropdown-menu" role="menu">
                        <div class="container">
                            <div class="row line-height2">
                                <c:forEach items="${language}" var="item">
                                <div class="col-sm-2">
                                    <a href="${item.key}">${item.value.lanname}</a>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </li>
                <script>
                    $($(".navbar-nav > li").get(${param.navindex})).addClass("active");
                </script>
            </ul>
        </div>
    </div>
</div>