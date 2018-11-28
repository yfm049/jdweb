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
    <jsp:include page="base/base.jsp"/>
</head>
<body>
<div id="wrapper">
    <jsp:include page="base/nav.jsp">
        <jsp:param name="navindex" value="0"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">留言管理</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>姓名</th>
                            <th>邮箱</th>
                            <th>联系电话</th>
                            <th>留言内容</th>
                            <th>留言日期</th>
                            <th class="text-right">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${leaves.data}" var="item">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td>${item.email}</td>
                                <td>${item.phone}</td>
                                <td>${item.message}</td>
                                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${item.date}"/></td>
                                <td class="text-right">
                                    <a class="btn btn-danger btn-xs" href="admin/leave/delete/${item.id}" onclick="if(confirm('确定删除?')==false)return false;"><i class="fa fa-pencil"></i> 删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- Pagination -->
                <ul class="pagination mt10 pull-right">
                    <pg:pager url="${url}" items="${leaves.total }" maxIndexPages="5" maxPageItems="${leaves.limit }" export="currentPageNumber=pageNumber">
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