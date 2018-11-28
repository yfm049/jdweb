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
                <h3 class="page-header">添加消息</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="admin/news/add" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label>标题</label>
                                <input class="form-control " name="news" required>
                            </div>
                            <div class="form-group">
                                <label>描述</label>
                                <textarea class="form-control " rows="3" name="des" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>阿里巴巴URL</label>
                                <input class="form-control " name="source" required>
                            </div>

                            <div class="form-group">
                                <label>访问URL</label>
                                <input class="form-control " name="news_url" required>
                            </div>

                        </div>
                        <div class="col-lg-5">
                            <div class="form-group">
                                <label>封面图(870px * 450px)</label>
                                <input type="hidden" name="coverimg" id="coverimg">
                                <input type="file" data-target="#coverimg" name="file" class="dropify"/>
                            </div>
                            <div class="form-group">
                                <label>分类</label>
                                <select class="form-control" name="type_id" id="type">
                                    <c:forEach items="${types}" var="item">
                                        <option value="${item.id}">${item.type}</option>
                                    </c:forEach>
                                </select>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>TAG</label>
                                <div>
                                    <c:forEach items="${tags}" var="item">
                                        <label class="checkbox-inline">
                                            <input type="checkbox" name="tags" value="${item.name}">${item.name}
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>详细描述</label>
                                <textarea id="txtEditor" name="detail"></textarea>
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