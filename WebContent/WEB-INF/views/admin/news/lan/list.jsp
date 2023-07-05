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
        <jsp:param name="navindex" value="1"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">多语言列表</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 blockquote-reverse">
                <a href="/admin/news/lan/create/${news_id}" class="btn btn-primary btn-sm">一键生成</a>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>标题</th>
                            <th>语言</th>
                            <th class="text-right">
                                <strong>操作</strong>
                                <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${news_id}/news/newsname"> 翻译名称</a>
                                <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${news_id}/des/des"> 翻译描述</a>
                                <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${news_id}/detail/detail"> 翻译详细</a>
                                <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${news_id}/tags/tags"> 翻译TAG</a>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${data}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.newsname}</td>
                                <td nowrap>${language[item.language].language}-${item.language}</td>
                                <td class="text-right" nowrap>
                                    <a class="btn btn-primary btn-xs" href="admin/news/lan/toupdate/${item.id}/${news_id}"> 编辑</a>
                                    <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${item.news_id}/${item.language}/news/newsname"> 翻译名称</a>
                                    <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${item.news_id}/${item.language}/des/des"> 翻译描述</a>
                                    <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${item.news_id}/${item.language}/detail/detail"> 翻译详细</a>
                                    <a class="btn btn-primary btn-xs" href="admin/news/lan/totrans/${item.news_id}/${item.language}/tags/tags"> 翻译TAG</a>
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