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
                <h3 class="page-header">修改产品</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="admin/product/update/${dataitem.id}" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>标题</label>
                                <input class="form-control" name="product" value="${dataitem.product}" required>
                            </div>
                            <div class="form-group">
                                <label>描述</label>
                                <textarea class="form-control " rows="3" name="des" required>${dataitem.des}</textarea>
                            </div>
                            <div class="form-group">
                                <label>URL</label>
                                <input class="form-control" name="product_url" value="${dataitem.product_url}" type="text" required>
                            </div>
                            <div class="form-group">
                                <label>分类</label>
                                <select class="form-control" name="type_id" id="type">
                                    <c:forEach items="${types}" var="item">
                                        <option value="${item.id}" <c:if test="${fn:contains(dataitem.type_id,item.id)}">selected</c:if>>${item.type}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>价格</label>
                                <input class="form-control " name="price" type="number" value="${dataitem.price}" required>
                            </div>
                            <div class="form-group">
                                <label>特点(逗号分隔)</label>
                                <textarea class="form-control required" rows="3" name="features">${dataitem.features}</textarea>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>封面图(900px * 600px)</label>
                                        <input type="hidden" name="coverimg" value="${dataitem.coverimg}" id="coverimg">
                                        <input type="file" name="coverfile" class="dropify" data-target="#coverimg" data-default-file="${dataitem.coverimg}"/>
                                    </div>
                                </div>
                                <c:forEach items="${fn:split(dataitem.images,',')}" var="item" varStatus="status">
                                    <c:set var="count" property="request" value="${status.index+1}"></c:set>
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>滚动图(${status.index+1})(900px * 600px)</label>
                                            <input type="hidden" name="images" value="${item}" id="images_${status.index+1}">
                                            <input type="file" name="file" class="dropify" data-target="#images_${status.index+1}" data-default-file="${item}"/>
                                        </div>
                                    </div>
                                </c:forEach>
                                <c:forEach begin="${count+1}" end="5" var="index">
                                    <div class="col-sm-4">
                                        <div class="form-group">
                                            <label>滚动图(${index})(900px * 600px)</label>
                                            <input type="hidden" name="images">
                                            <input type="file" name="file" class="dropify"/>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
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