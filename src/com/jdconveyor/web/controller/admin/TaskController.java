package com.jdconveyor.web.controller.admin;

import com.jdconveyor.web.dao.TaskDao;
import com.jdconveyor.web.data.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * Created by lenovo on 2017/3/23.
 */
@Controller
@RequestMapping("admin")
public class TaskController {

    @Autowired
    TaskDao taskDao;

    @RequestMapping(value = {"task"})
    public String task(Map<String,Object> map, Pager pager){
        map.put("data",taskDao.getAllTask(pager.getOffset()));
        map.put("p",pager);
        return "admin/task/list";
    }
    @RequestMapping(value = {"task/toadd"})
    public String add(Map<String,Object> map){
        map.put("status",taskDao.getStatus());
        return "admin/task/add";
    }

}
