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
    <jsp:include page="../base/base.jsp"/>
</head>
<body>
<div id="wrapper">
    <jsp:include page="../base/nav.jsp">
        <jsp:param name="navindex" value="7"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">语言配置列表</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 blockquote-reverse">
                <a href="/admin/config/totrans" class="btn btn-primary btn-sm">一键翻译</a>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>名称</th>
                            <th>国家</th>
                            <th class="text-right">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${lanfiles}" var="item">
                            <tr>
                                <td></td>
                                <td>${item.key}</td>
                                <td nowrap>${language[item.value].language}-${item.value}</td>
                                <td class="text-right" nowrap>
                                    <a class="btn btn-primary btn-xs" href="admin/config/toupdate/${item.key}"><i class="fa fa-edit "></i> 编辑</a>
                                    <a class="btn btn-primary btn-xs" href="admin/config/totrans/${item.key}"><i class="fa fa-edit "></i> 翻译</a>
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