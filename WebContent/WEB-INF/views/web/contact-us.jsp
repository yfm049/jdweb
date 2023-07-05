<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html lang="${lan}">
    <head>
        <title><fmt:message key="web.title.contact"/>|<fmt:message key="company"/></title>
        <meta name="description" content="<fmt:message key="web.title.contact.des"/>">
        <meta name=“keywords” content=“<fmt:message key="web.title.contact.keywords"/>”>
        <meta name="author" content="jiuduan,九端">

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <jsp:include page="base/base.jsp"/>
    </head>
    <body>
        <jsp:include page="base/nav.jsp">
            <jsp:param name="navindex" value="5"/>
        </jsp:include>
        <div class="breadcrumb-container">
            <div class="container text-right">
                <ol class="breadcrumb">
                    <li><a href="<fmt:message key="${lan}"/>"><fmt:message key="nav.home"/></a></li>
                    <li class="active"><fmt:message key="nav.contact"/> <i class="fa fa-arrow-down ml5"></i></li>
                </ol>
            </div>
        </div>
        <jsp:include page="base/alibaba.jsp"/>
        <section class="bg-white">
            <div class="container">
                <div class="row wow fadeIn">
                    <div class="col-md-12">
                        <div class="title">
                            <h2><fmt:message key="contact.title"/></h2>
                        </div>
                    </div>
                    <!-- CONTACT INFO -->
                    <div class="col-sm-12 col-md-5 cinfo">
                        <div id="map-canvas">
                            <iframe src="http://www.google.cn/maps/embed?pb=!1m18!1m12!1m3!1d3142.171280031397!2d114.50989831469015!3d38.04309520445058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35e6de17fe8bedc3%3A0xc73c396293e4bebb!2z5rKz5YyX55yB55-z5a625bqE5biC6ZW_5a6J5Yy65bu66K6-5Y2X5aSn6KGXMeWPtyDpgq7mlL_nvJbnoIE6IDA1MDAwMA!5e0!3m2!1szh-CN!2scn!4v1482916695188" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                        <address>
                            <p><i class="fa fa-map-marker"></i> <fmt:message key="address"/></p>
                            <p><i class="fa fa-phone"></i> <fmt:message key="tel"/></p>
                            <p><i class="fa fa-envelope"></i><a href="mailto:<fmt:message key="email.1"/>"> <fmt:message key="email.1"/></a></p>
                            <p><i class="fa fa-envelope"></i><a href="mailto:<fmt:message key="email.2"/>"> <fmt:message key="email.2"/></a></p>
                            <p><i class="fa fa-skype"></i><a href="skype:<fmt:message key="skype"/>?chat"> <fmt:message key="skype"/></a></p>
                        </address>
                        <div class="visible-xs-block visible-sm-block pt20"></div>
                    </div><!-- /Contact Info -->
                    <!-- CONTACT FORM -->
                    <div class="col-sm-12 col-md-7">
                        <form name="contactform" class="contactform" method="post" action="${lan}/contact-us/leave">
                            <fieldset>
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="form-group">
                                            <label class="sr-only" for="name">Name<br></label>
                                            <div class="inner-addon left-addon">
                                                <i class="fa fa-user"></i>
                                                <input type="text" class="form-control required" placeholder="<fmt:message key="contact.name"/>" name="name" id="name" data-name="Name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row row-lg">
                                            <div class="col-lg-7">
                                                <div class="form-group">
                                                    <label class="sr-only" for="email">Email<br></label>
                                                    <div class="inner-addon left-addon">
                                                        <i class="fa fa-envelope"></i>
                                                        <input type="text" class="form-control required required-email" placeholder="<fmt:message key="contact.email"/>" name="email" id="email" data-name="Email">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="form-group">
                                                    <label class="sr-only" for="name">Phone<br></label>
                                                    <div class="inner-addon left-addon">
                                                        <i class="fa fa-phone"></i>
                                                        <input type="text" class="form-control" placeholder="<fmt:message key="contact.phone"/>" name="phone" id="phone" data-name="Phone">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="message">Message<br></label>
                                            <div class="inner-addon left-addon">
                                                <i class="fa fa-comment"></i>
                                                <textarea rows="13" name="message" id="message" class="form-control" placeholder="<fmt:message key="contact.message"/>" data-name="Message"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row actions">
                                    <div class="col-sm-12 col-md-6">
                                        <input type="submit" value="&#xf1d9; &nbsp;<fmt:message key="contact.send"/>" name="submit" id="submitButton" class="btn btn-default btn-primary-corp-big" title="Click here to submit your message!"/>
                                    </div>
                                    <div class="col-sm-12 col-md-6">
                                        <div class="alert alert-danger" role="alert" id="alertform">...</div>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                        <p>&nbsp;</p>
                    </div><!-- /Contact Form -->
                </div><!-- /row -->

            </div><!-- /container -->
        </section>
        <section class="bg-gray">
            <div class="container text-center contact-por wow fadeInUp" data-wow-duration="1000ms" data-wow-delay="50ms">
                <h4 class="pb10"><fmt:message key="product.download.des"/>&nbsp;&nbsp;</h4>
                <a href="assets/pdf/jdproduct.pdf" class="btn btn-default btn-primary-corp-big"><i class="fa fa-download le"></i> <fmt:message key="product.download"/>（PDF）</a>
            </div>
        </section>
        <c:if test="${dialog==true}">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                <fmt:message key="contact.dialog.title"/>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <fmt:message key="contact.dialog.content"/>
                            <p class="text-center">
                                <span class="line"><i class="fa fa-circle-thin"></i></span>
                                <a href="tel:<fmt:message key="tel"/>"><i class="fa fa-phone"></i> <fmt:message key="tel"/></a>
                                <span class="text-muted m5">/</span>
                                <a href="mailto:<fmt:message key="email.1"/>"><i class="fa fa-envelope"></i> <fmt:message key="email.1"/></a>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-dismiss="modal">
                                <fmt:message key="contact.dialog.button"/>
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
            <script>$('#myModal').modal('show')</script>
        </c:if>
        <jsp:include page="base/footer.jsp"/>
    </body>
</html>
