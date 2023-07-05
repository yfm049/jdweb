<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
    <head>
        <title>后台登录</title>
        <meta name="author" content="jiuduan,九端">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="base/base.jsp"/>
    </head>
    <body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="title">
                    <h2>后台管理 登录</h2>
                </div>
            </div>
            <div class="col-sm-6 col-sm-offset-3 col-md-4 col-md-offset-4 login-form">
                <div class="corp-pricing login-box">
                    <div class="corpboot-price-title">
                        <h3>LOGIN</h3>
                    </div>
                    <div class="panel-body">
                        <form action="${lan}/login" method="post">
                            <input type="text" class="form-control mb10" name="name" placeholder="账号" style="background:#fff">
                            <input type="password" class="form-control mb10" name="pass" placeholder="密码" style="background:#fff">
                            <div class="checkbox text-left color4">
                                <label>
                                    ${msg}
                                </label>
                            </div>
                            <button type="submit" name="go" class="btn btn-primary-corp btn-block"><i class="fa fa-sign-in"></i> Sign in</button>

                        </form>
                    </div>
                </div>
            </div>
        </div><!-- /row -->
    </div>
    </body>
</html>
