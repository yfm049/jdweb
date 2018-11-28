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
        <jsp:param name="navindex" value="5"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">添加队员</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="admin/team/add" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label>名字</label>
                                <input class="form-control " name="name" required>
                            </div>
                            <div class="form-group">
                                <label>职位</label>
                                <input class="form-control " name="job" required>
                            </div>
                            <div class="form-group">
                                <label>描述</label>
                                <textarea class="form-control" rows="3" name="des" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>FACEBOOK</label>
                                <input class="form-control " name="facebook">
                            </div>
                            <div class="form-group">
                                <label>TWITTER</label>
                                <input class="form-control " name="twitter">
                            </div>
                            <div class="form-group">
                                <label>LINKIN</label>
                                <input class="form-control " name="linkin">
                            </div>
                            <div class="form-group">
                                <label>EMAIL</label>
                                <input class="form-control " name="email">
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="form-group">
                                <label>头像(400*400)</label>
                                <input type="file" name="file" class="dropify "/>
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