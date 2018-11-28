package com.jdconveyor.web.interceptor;

import com.jdconveyor.web.utils.Setting;
import com.jdconveyor.web.utils.Utils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lenovo on 2017/2/13.
 */
public class WebInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        request.setAttribute("basepath",basePath);
        request.setAttribute("url",request.getRequestURI());
        request.setAttribute("language", Utils.getLans());
        request.setAttribute("theme", Setting.getCurrTheme());
        request.setAttribute("cnzz", Setting.getCnzz());
        return super.preHandle(request, response, handler);
    }
}
