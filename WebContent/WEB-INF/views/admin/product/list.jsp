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
                <a href="/admin/producttype" class="btn btn-primary btn-sm">产品分类</a>
                <a href="/admin/product/toadd" class="btn btn-primary btn-sm">添加产品</a>
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
                            <th>产品URL</th>
                            <th>分类</th>
                            <th>状态</th>
                            <th class="text-right">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${data.data}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td nowrap>${item.product}</td>
                                <td>${item.product_url}</td>
                                <td>${item.typename}</td>
                                <td>${item.status==1?"已发布":"未发布"}</td>
                                <td class="text-right" nowrap>
                                    <a class="btn btn-primary btn-xs" href="admin/product/toupdate/${item.id}"> 编辑</a>
                                    <a class="btn btn-danger btn-xs"  href="admin/product/${item.id}/change?pager.offset=${p.offset}&delete=true" onclick="if(confirm('确定删除?')==false)return false;"> 删除</a>
                                    <a class="btn btn-primary btn-xs" href="admin/product/${item.id}/change?pager.offset=${p.offset}&top=${item.top_time==null}"> ${item.top_time==null?"推荐":"取消推荐"}</a>
                                    <a class="btn btn-primary btn-xs" href="admin/product/${item.id}/change?pager.offset=${p.offset}&status=${item.status==0}"> ${item.status==0?"发布":"取消发布"}</a>
                                    <a class="btn btn-primary btn-xs" href="admin/product/lan/list/${item.id}"> 多语言</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- Pagination -->
                <ul class="pagination mt10 pull-right">
                    <pg:pager url="${url}" items="${data.total }" maxIndexPages="5" maxPageItems="${data.limit }" export="currentPageNumber=pageNumber">
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

    </div>
</div>
</body>
</html>