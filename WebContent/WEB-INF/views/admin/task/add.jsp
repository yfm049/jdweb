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
                <h3 class="page-header">添加任务</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <form id="formid" action="admin/contact/add" method="post">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="form-group">
                                <label>任务名称</label>
                                <input class="form-control " type="email" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>任务时间</label>
                                <input class="form-control " type="datetime" name="starttime" required>
                            </div>
                            <div class="form-group">
                                <label>邮箱</label>
                                <div>
                                    <strong>已选择36个邮箱</strong> <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal">选择</a>
                                </div>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                    &times;
                                                </button>
                                                <h5 class="modal-title" id="myModalLabel">
                                                    选择邮箱
                                                </h5>
                                            </div>
                                            <div class="modal-body pre-scrollable">
                                                <table class="table table-hover table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th>
                                                            <input type="checkbox">
                                                        </th>
                                                        <th>名称</th>
                                                        <th>城市</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach begin="1" end="30000" var="item">
                                                        <tr>
                                                            <td><input type="checkbox"></td>
                                                            <td>Tanmay</td>
                                                            <td>Bangalore</td>
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                                </button>
                                                <button type="button" class="btn btn-primary">
                                                    提交更改
                                                </button>
                                            </div>
                                        </div><!-- /.modal-content -->
                                    </div><!-- /.modal -->
                                </div>
                            </div>
                            <div class="form-group">
                                <label>选择邮件内容</label>
                                <div>
                                    <strong>已选择10个邮件内容</strong> <a>选择</a>
                                </div>
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