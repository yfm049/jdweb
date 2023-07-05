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
    <jsp:include page="../../base/base.jsp"/>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../../base/nav.jsp">
        <jsp:param name="navindex" value="2"/>
    </jsp:include>
    <div id="page-wrapper" >

        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">产品列表</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 blockquote-reverse">
                <a href="/admin/product/lan/create/${product_id}" class="btn btn-primary btn-sm">生成多语言</a>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>产品</th>
                            <th>语言</th>
                            <th class="text-right">
                                <strong>操作</strong>
                                <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${product_id}/product/productname"> 翻译名称</a>
                                <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${product_id}/des/des"> 翻译描述</a>
                                <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${product_id}/detail/detail"> 翻译详细</a>
                                <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${product_id}/features/features"> 翻译特征</a>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${data}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.productname}</td>
                                <td nowrap>${language[item.language].language}-${item.language}</td>
                                <td  class="text-right" nowrap>
                                    <a class="btn btn-primary btn-xs" href="admin/product/lan/toupdate/${item.id}/${item.product_id}"> 编辑</a>
                                    <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${item.product_id}/${item.language}/product/productname"> 翻译名称</a>
                                    <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${item.product_id}/${item.language}/des/des"> 翻译描述</a>
                                    <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${item.product_id}/${item.language}/detail/detail"> 翻译详细</a>
                                    <a class="btn btn-primary btn-xs" href="admin/product/lan/totrans/${item.product_id}/${item.language}/features/features"> 翻译特征</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>