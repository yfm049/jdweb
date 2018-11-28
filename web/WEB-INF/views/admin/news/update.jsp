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
        <jsp:param name="navindex" value="1"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">修改消息</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="/admin/news/update/${dataitem.id}" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label>标题</label>
                                <input class="form-control " name="news" value="${dataitem.news}" required>
                            </div>
                            <div class="form-group">
                                <label>描述</label>
                                <textarea class="form-control " rows="3" name="des" required>${dataitem.des}</textarea>
                            </div>
                            <div class="form-group">
                                <label>阿里巴巴URL</label>
                                <input class="form-control " name="source" value="${dataitem.source}" required>
                            </div>

                            <div class="form-group">
                                <label>访问URL</label>
                                <input class="form-control " name="news_url" value="${dataitem.news_url}" required>
                            </div>



                        </div>
                        <div class="col-lg-5">
                            <div class="form-group">
                                <label>封面图</label>
                                <input type="hidden" name="coverimg" id="coverimg" value="${dataitem.coverimg}">
                                <input type="file" name="file" class="dropify" data-target="#coverimg" data-default-file="${dataitem.coverimg}"/>
                            </div>

                            <div class="form-group">
                                <label>分类</label>
                                <select class="form-control" name="type_id" id="type">
                                    <c:forEach items="${types}" var="item">
                                        <option value="${item.id}" <c:if test="${fn:contains(dataitem.type_id,item.id)}">selected</c:if>>${item.type}</option>
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
                                            <input type="checkbox" name="tags" value="${item.name}" <c:if test="${fn:contains(dataitem.tags,item.name)}">checked="checked"</c:if>>${item.name}
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>详细描述</label>
                                <textarea id="txtEditor" name="detail">${dataitem.detail}</textarea>
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