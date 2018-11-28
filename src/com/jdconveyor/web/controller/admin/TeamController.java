package com.jdconveyor.web.controller.admin;


import com.jdconveyor.web.dao.ImagesDao;
import com.jdconveyor.web.dao.ProductDao;
import com.jdconveyor.web.dao.TeamDao;
import com.jdconveyor.web.dao.TradeDao;
import com.jdconveyor.web.data.Pager;
import com.jdconveyor.web.data.TeamReq;
import com.jdconveyor.web.data.TradeReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/21.
 */
@Controller
@RequestMapping("admin")
public class TeamController {

    @Autowired
    TradeDao tradeDao;
    @Autowired
    ProductDao productDao;

    @Autowired
    TeamDao teamDao;

    @Autowired
    ImagesDao imagesDao;


    @RequestMapping(value = {"team"})
    public String trade(Map<String,Object> map, Pager pager){
        map.put("data",teamDao.query(pager.getOffset()));
        map.put("p",pager);
        return "admin/team/list";
    }
    @RequestMapping(value = {"team/{id}/change"},method = RequestMethod.GET)
    public String change(@PathVariable int id, Map<String,Object> map, Pager pager, Boolean delete, Boolean status){
        map.put("p",pager);
        teamDao.change(id,delete,status);
        return trade(map,pager);
    }

    @RequestMapping(value = {"team/toadd"})
    public String add(Map<String,Object> map){
        return "admin/team/add";
    }

    @RequestMapping(value = {"team/add"},method = RequestMethod.POST)
    public String addNews(HttpServletRequest request, TeamReq teamReq, MultipartFile file)throws Exception{
        teamReq.setAvatar(imagesDao.imageUpload(request,file));
        teamDao.saveTeam(teamReq);
        return "redirect:/admin/team";
    }

    @RequestMapping(value = {"team/toupdate/{id}"})
    public String toupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",teamDao.getTeamById(id));
        return "admin/team/update";
    }

    @RequestMapping(value = {"team/update/{id}"},method = RequestMethod.POST)
    public String updateNews(HttpServletRequest request, @PathVariable Integer id, TeamReq teamReq,MultipartFile file)throws Exception{
        teamReq.changeAvatar(imagesDao.imageUpload(request,file));
        teamDao.updateTeam(teamReq,id);
        return "redirect:/admin/team";
    }

    @RequestMapping(value = {"team/lan/list/{id}"},method = RequestMethod.GET)
    public String lanList(@PathVariable int id,Map<String,Object> map){
        map.put("team_id",id);
        map.put("data",teamDao.getAllLanList(id));
        return "admin/team/lan/list";
    }

    @RequestMapping(value = {"team/lan/create/{id}"},method = RequestMethod.GET)
    public String lanCreate(@PathVariable int id,Map<String,Object> map){
        teamDao.trans(id);
        return "redirect:/admin/team/lan/list/"+id;
    }
    @RequestMapping(value = {"team/lan/toupdate/{id}"})
    public String tolanupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",teamDao.getTeamLanById(id));
        return "admin/team/lan/update";
    }

    @RequestMapping(value = {"team/lan/update/{id}/{trade_id}"},method = RequestMethod.POST)
    public String updateNewsLan(@PathVariable int id,@PathVariable int trade_id, String job,String des)throws Exception{
        teamDao.updateTeamLan(id,job,des);
        return "redirect:/admin/team/lan/list/"+trade_id;
    }
    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }
}
