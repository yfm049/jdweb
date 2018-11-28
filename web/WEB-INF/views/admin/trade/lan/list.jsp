<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager"%>
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
        <jsp:param name="navindex" value="3"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">交易记录</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 blockquote-reverse">
                <a href="/admin/trade/lan/create/${trade_id}" class="btn btn-primary btn-sm">生成多语言</a>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>国家</th>
                            <th>区域</th>
                            <th>语言</th>
                            <th class="text-right">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${data}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.country}</td>
                                <td>${item.area}</td>
                                <td nowrap>${language[item.language].language}-${item.language}</td>
                                <td class="text-right" nowrap>
                                    <a class="btn btn-primary btn-xs" href="admin/trade/lan/toupdate/${item.id}/${trade_id}"><i class="fa fa-edit "></i> 编辑</a>
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