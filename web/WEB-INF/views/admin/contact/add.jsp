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
        <jsp:param name="navindex" value="4"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">添加客户</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="admin/contact/add" method="post">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label>邮箱</label>
                                <input class="form-control " type="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label>国家</label>
                                <input class="form-control " type="text" name="country">
                            </div>
                            <div class="form-group">
                                <label>信任值</label>
                                <input class="form-control " type="number" name="favorite">
                            </div>
                            <div class="form-group">
                                <label>网址</label>
                                <input class="form-control " type="url" name="url">
                            </div>
                            <div class="form-group">
                                <label>名称</label>
                                <input class="form-control " type="text" name="name">
                            </div>
                            <div class="form-group">
                                <label>关键词</label>
                                <input class="form-control " type="text" name="keyword">
                            </div>
                            <div class="form-group">
                                <label>类型</label>
                                <input class="form-control " type="text" name="type">
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