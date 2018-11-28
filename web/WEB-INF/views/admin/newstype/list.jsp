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
        <jsp:param name="navindex" value="1"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">消息分类</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12 blockquote-reverse">
                <a href="/admin/newstype/toadd" class="btn btn-primary btn-sm">添加分类</a>
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
                            <th>分类URL</th>
                            <th style="width: 200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${types}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.type}</td>
                                <td>${item.type_url}</td>
                                <td>
                                    <a class="btn btn-primary btn-xs" href="admin/newstype/toupdate/${item.id}"> 编辑</a>
                                    <a class="btn btn-danger btn-xs" href="admin/newstype/delete/${item.id}" onclick="if(confirm('确定删除?')==false)return false;"> 删除</a>
                                    <a class="btn btn-primary btn-xs" href="admin/newstype/lan/list/${item.id}"> 多语言</a>
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