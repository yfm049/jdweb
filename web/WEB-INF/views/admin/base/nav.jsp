<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!-- Sidebar -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">后台管理 &nbsp;&nbsp;&nbsp;&nbsp;<small class="text-danger">最大可用内存${max}MB ,当前使用内存${total}MB ，空闲内存${free}MB</small></a>
        </div>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li><a href="admin/home"><i class="fa fa-edit"></i> 留言管理</a></li>
                <li><a href="admin/news"><i class="fa fa-edit"></i> 最新消息</a></li>
                <li><a href="admin/product"><i class="fa fa-edit"></i> 产品管理</a></li>
                <li><a href="admin/trade"><i class="fa fa-edit"></i> 交易管理</a></li>
                <li><a href="admin/contact"><i class="fa fa-edit"></i> 客户管理 </a></li>
                <li><a href="admin/team"><i class="fa fa-edit"></i> 团队管理 </a></li>
                <li><a href="admin/problem"><i class="fa fa-edit"></i> 常见问题 </a></li>
                <li><a href="admin/config"><i class="fa fa-edit"></i> 多语言文件 </a></li>
                <li><a href="admin/task"><i class="fa fa-edit"></i> 定时邮件 </a></li>
            </ul>
            <script>
                $($(".side-nav > li").get(${param.navindex})).addClass("active");
            </script>
            <ul class="nav navbar-nav navbar-right navbar-user">
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-themeisle"></i> ${theme} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <c:forEach items="${themes}" var="item">
                        <li><a href="admin/theme/${item}"><i class="fa fa-themeisle"></i> ${item}</a></li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="dropdown user-dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 系统管理员 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="admin/loginout"><i class="fa fa-power-off"></i> 退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

