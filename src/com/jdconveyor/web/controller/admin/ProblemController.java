package com.jdconveyor.web.controller.admin;


import com.jdconveyor.web.dao.ProblemDao;
import com.jdconveyor.web.data.Pager;
import com.jdconveyor.web.data.ProblemReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/21.
 */
@Controller
@RequestMapping("admin")
public class ProblemController {


    @Autowired
    ProblemDao problemDao;



    @RequestMapping(value = {"problem"})
    public String trade(Map<String,Object> map, Pager pager){
        map.put("data",problemDao.query(pager.getOffset()));
        map.put("p",pager);
        return "admin/problem/list";
    }
    @RequestMapping(value = {"problem/{id}/change"},method = RequestMethod.GET)
    public String change(@PathVariable int id, Map<String,Object> map, Pager pager, Boolean delete, Boolean status){
        map.put("p",pager);
        problemDao.change(id,delete,status);
        return trade(map,pager);
    }

    @RequestMapping(value = {"problem/toadd"})
    public String add(Map<String,Object> map){
        return "admin/problem/add";
    }


    @RequestMapping(value = {"problem/add"},method = RequestMethod.POST)
    public String addNews(HttpServletRequest request, ProblemReq problemReq)throws Exception{
        problemDao.saveproblem(problemReq);
        return "redirect:/admin/problem";
    }

    @RequestMapping(value = {"problem/toupdate/{id}"})
    public String toupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",problemDao.getproblemById(id));
        return "admin/problem/update";
    }

    @RequestMapping(value = {"problem/update/{id}"},method = RequestMethod.POST)
    public String updateNews(HttpServletRequest request, @PathVariable Integer id, ProblemReq problemReq)throws Exception{
        problemDao.updateproblem(problemReq,id);
        return "redirect:/admin/problem";
    }

    @RequestMapping(value = {"problem/lan/list/{id}"},method = RequestMethod.GET)
    public String lanList(@PathVariable int id,Map<String,Object> map){
        map.put("problem_id",id);
        map.put("data",problemDao.getAllLanList(id));
        return "admin/problem/lan/list";
    }

    @RequestMapping(value = {"problem/lan/create/{id}"},method = RequestMethod.GET)
    public String lanCreate(@PathVariable int id,Map<String,Object> map){
        problemDao.trans(id);
        return "redirect:/admin/problem/lan/list/"+id;
    }
    @RequestMapping(value = {"problem/lan/toupdate/{id}"})
    public String tolanupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",problemDao.getproblemLanById(id));
        return "admin/problem/lan/update";
    }

    @RequestMapping(value = {"problem/lan/update/{id}/{trade_id}"},method = RequestMethod.POST)
    public String updateNewsLan(@PathVariable int id,@PathVariable int trade_id, String question,String answer)throws Exception{
        problemDao.updateproblemLan(id,question,answer);
        return "redirect:/admin/problem/lan/list/"+trade_id;
    }
    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }
}
