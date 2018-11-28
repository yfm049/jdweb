package com.jdconveyor.web.interceptor;

import com.jdconveyor.web.utils.Setting;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by lenovo on 2017/2/27.
 */
public class AdminInterceptor extends  WebInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        double total = Runtime.getRuntime().totalMemory() / (1024.0 * 1024);
        double max = Runtime.getRuntime().maxMemory()/(1024.0 * 1024);
        double free = Runtime.getRuntime().freeMemory()/(1024.0 * 1024);

        request.setAttribute("max",String .format("%.2f",max));
        request.setAttribute("total",String .format("%.2f",total));
        request.setAttribute("free",String .format("%.2f",free));
        request.setAttribute("themes", Setting.getThemes());
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
        Object name=request.getSession().getAttribute("name");
        if(name==null||"".equals(name)){
            response.sendRedirect(basePath+"login");
            return false;
        }
        return true;
    }
}
