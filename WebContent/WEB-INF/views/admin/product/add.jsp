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
        <jsp:param name="navindex" value="2"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">添加产品</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="admin/product/add" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>标题</label>
                                <input class="form-control" name="product" type="text" required>
                            </div>
                            <div class="form-group">
                                <label>描述</label>
                                <textarea class="form-control" rows="3" name="des" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>URL</label>
                                <input class="form-control" name="product_url" type="text" required>
                            </div>
                            <div class="form-group">
                                <label>分类</label>
                                <select class="form-control" name="type_id" id="type">
                                    <c:forEach items="${types}" var="item">
                                        <option value="${item.id}">${item.type}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>价格</label>
                                <input class="form-control" name="price" type="number" required step="0.01">
                            </div>
                            <div class="form-group">
                                <label>特点(逗号分隔)</label>
                                <textarea class="form-control" rows="3" name="features"></textarea>
                            </div>

                        </div>
                        <div class="col-lg-9">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>封面图(900px * 600px)</label>
                                        <input type="file" name="coverfile" class="dropify "/>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>滚动图(1)(900px * 600px)</label>
                                        <input type="file" name="file" class="dropify"/>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>滚动图(2)(900px * 600px)</label>
                                        <input type="file" name="file" class="dropify"/>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>滚动图(3)(900px * 600px)</label>
                                        <input type="file" name="file" class="dropify"/>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>滚动图(4)(900px * 600px)</label>
                                        <input type="file" name="file" class="dropify"/>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label>滚动图(5)(900px * 600px)</label>
                                        <input type="file" name="file" class="dropify"/>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
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