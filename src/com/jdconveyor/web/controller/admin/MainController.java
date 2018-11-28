package com.jdconveyor.web.controller.admin;


import com.jdconveyor.web.dao.LeaveDao;
import com.jdconveyor.web.data.Pager;
import com.jdconveyor.web.utils.Setting;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/21.
 */
@Controller
@RequestMapping("admin")
public class MainController {


    @Autowired
    LeaveDao leaveDao;

    @RequestMapping(value = {"home"})
    public String home(Map<String,Object> map, Pager pager, Locale locale){
        map.put("leaves",leaveDao.getAllLeave(pager.getOffset()));
        return "admin/index";
    }
    @RequestMapping(value = {"leave/delete/{id}"},method = RequestMethod.GET)
    public String deleteNews(@PathVariable Integer id, Locale locale){
        leaveDao.deleteLeave(id);
        return "redirect:/admin/home";
    }
    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }


    @RequestMapping(value = {"loginout"},method = RequestMethod.GET)
    public String loginOut(HttpServletRequest request){
        request.getSession().removeAttribute("name");
        return "redirect:/web/login";
    }
    @RequestMapping(value = {"theme/{name}"},method = RequestMethod.GET)
    public String changeTheme(@PathVariable String name){
        Setting.setCurrTheme(name);
        return "redirect:/admin/home";
    }


}
