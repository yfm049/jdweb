<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <jsp:include page="../base/base.jsp"/>

</head>
<body>
<div id="wrapper">
    <jsp:include page="../base/nav.jsp">
        <jsp:param name="navindex" value="3"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">修改交易</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="/admin/trade/update/${dataitem.id}" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label>产品</label>
                                <select class="form-control" name="product_id" id="type">
                                    <c:forEach items="${products}" var="item">
                                        <option value="${item.id}" <c:if test="${fn:contains(dataitem.product_id,item.id)}">selected</c:if>>${item.product}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>区域</label>
                                <select class="form-control" name="area" required id="area">
                                    <c:forEach items="${state}" var="item">
                                        <option value="${item.state}" <c:if test="${fn:contains(dataitem.area,item.state)}">selected</c:if>>${item.state}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>国家</label>
                                <select class="form-control" name="country" required id="country">
                                    <c:forEach items="${country}" var="item">
                                        <option value="${item.country}" <c:if test="${fn:contains(dataitem.country,item.country)}">selected</c:if>>${item.country}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>价格(美元)</label>
                                <input class="form-control " type="number" name="price" value="${dataitem.price}" required step="0.01">
                            </div>
                            <div class="form-group">
                                <label>重量(KG)</label>
                                <input class="form-control" type="number" name="weight" value="${dataitem.weight}" required step="0.01">
                                <input type="hidden" name="language" value="${dataitem.language}">
                            </div>
                            <div class="form-group">
                                <label>交易日期</label>
                                <input class="form-control " type="date" name="date" value="${dataitem.date}" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <input type="submit" class="btn btn-default" value="提交">
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>