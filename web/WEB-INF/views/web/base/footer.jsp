<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<footer>
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="footer-widget col-sm-12 col-md-4">
                    <h3><fmt:message key="footer.contact-us"/></h3>
                    <p><a href="${lan}/about-us"><fmt:message key="company"/></a> <fmt:message key="footer.des"/> </p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-map-marker"></i> <fmt:message key="address"/></li>
                        <li class="number"><i class="fa fa-phone"></i> <fmt:message key="tel"/></li>
                        <li><i class="fa fa-envelope"></i><a href="mailto:<fmt:message key="email.1"/>"> <fmt:message key="email.1"/></a></li>
                        <li><i class="fa fa-envelope"></i><a href="mailto:<fmt:message key="email.2"/>"> <fmt:message key="email.2"/></a></li>
                    </ul>
                    <div class="visible-xs-block visible-sm-block pt20"></div>
                </div>
                <div class="footer-widget col-sm-6 col-md-4">
                    <h3><fmt:message key="factory.photo"/></h3>
                    <c:forEach begin="1" end="12" step="1" var="i">
                        <a href="assets/img/factory/factory_${i}.jpg" class="gallery" title="<fmt:message key="factory.photo"/>">
                            <img src="assets/img/factory/factory_${i}.jpg" alt="<fmt:message key="factory.photo"/>">
                        </a>
                    </c:forEach>
                    <div class="visible-xs-block visible-sm-block pt20"></div>
                </div>
                <div class="footer-widget col-sm-6 col-md-4">
                    <h3><fmt:message key="footer.reg"/></h3>
                    <p><fmt:message key="footer.reg.des"/></p>
                    <!-- Newsletter Form-->
                    <form method="post" action="${lan}/contact-us/leave" class="contactform">
                        <div class="input-group newsletter">
                            <label class="sr-only" for="subscribe-email"><fmt:message key="footer.email"/>...</label>
                            <input type="email" class="form-control required required-email" name="email" id="subscribe-email" placeholder="<fmt:message key="footer.email"/>...">
                            <span class="input-group-btn">
                                <button type="submit" class="btn"><i class="fa fa-paper-plane-o"></i></button>
                            </span>
                        </div>
                    </form>
                    <p class="newsletter-desc"><strong><fmt:message key="footer.note"/>:</strong> <fmt:message key="footer.note.des"/></p>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 social">
                    <ul class="list-inline social">
                        <li>
                            <a href="https://www.facebook.com/jdconveyor" target="_blank">
                                <i class="fa fa-facebook"></i>
                            </a>
                        </li>
                        <li>
                            <a href="https://twitter.com/jdconveyor" target="_blank">
                                <i class="fa fa-twitter"></i>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.linkedin.com/in/jdconveyor" target="_blank">
                                <i class="fa fa-linkedin"></i>
                            </a>
                        </li>

                    </ul>
                </div>
                <div class="col-sm-6 credits">
                    <p>&copy; JIUDUAN 2016. All Rights Reserved.<span class="hidden"><script src="http://s95.cnzz.com/z_stat.php?id=${cnzz}&web_id=${cnzz}" language="JavaScript"></script></span></p>
                    <p class="small">
                        <i class="fa fa-angle-right"></i>
                        Designed by: <a href="${lan}/sitemap.xml" target="_blank">JIUDUAN</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!--back to top-->
    <a href="#" class="scrollToTop"><i class="fa fa-angle-up"></i></a>
</footer>
