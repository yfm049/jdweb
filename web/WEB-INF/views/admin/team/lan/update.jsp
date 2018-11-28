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
    <jsp:include page="../../base/base.jsp"/>

</head>
<body>
<div id="wrapper">
    <jsp:include page="../../base/nav.jsp">
        <jsp:param name="navindex" value="5"/>
    </jsp:include>
    <div id="page-wrapper" >
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">修改交易</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="/admin/team/lan/update/${dataitem.id}/${dataitem.team_id}" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label>国家</label>
                                <input class="form-control " name="job" value="${dataitem.job}" required>
                            </div>
                            <div class="form-group">
                                <label>区域</label>
                                <textarea class="form-control" rows="3" name="des" required>${dataitem.des}</textarea>
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