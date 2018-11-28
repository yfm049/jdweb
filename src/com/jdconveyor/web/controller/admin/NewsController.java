package com.jdconveyor.web.controller.admin;


import com.jdconveyor.web.dao.ImagesDao;
import com.jdconveyor.web.dao.NewsDao;
import com.jdconveyor.web.data.NewsReq;
import com.jdconveyor.web.data.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Locale;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/21.
 */
@Controller
@RequestMapping("admin")
public class NewsController {

    @Autowired
    NewsDao newsDao;
    @Autowired
    ImagesDao imagesDao;

    @RequestMapping(value = {"news"})
    public String news(Map<String,Object> map,Pager pager){
        map.put("data",newsDao.query(pager.getOffset()));
        map.put("p",pager);
        return "admin/news/list";
    }
    @RequestMapping(value = {"news/{id}/change"},method = RequestMethod.GET)
    public String change(@PathVariable int id,Map<String,Object> map,Pager pager,Boolean delete,Boolean top,Boolean status){
        newsDao.change(id,delete,top,status);
        return news(map,pager);
    }
    @RequestMapping(value = {"news/toadd"})
    public String add(Map<String,Object> map){
        map.put("types",newsDao.getAllType());
        map.put("tags",newsDao.getAllTag());
        return "admin/news/add";
    }


    @RequestMapping(value = {"news/add"},method = RequestMethod.POST)
    public String addNews(HttpServletRequest request, NewsReq newsReq, MultipartFile file)throws Exception{
        newsReq.setCoverimg(imagesDao.imageUpload(request,file));
        newsDao.saveNews(newsReq);
        return "redirect:/admin/news";
    }
    @RequestMapping(value = {"news/lan/list/{id}"},method = RequestMethod.GET)
    public String lanList(@PathVariable int id,Map<String,Object> map){
        map.put("news_id",id);
        map.put("data",newsDao.getAllLanList(id));
        return "admin/news/lan/list";
    }

    @RequestMapping(value = {"news/lan/create/{id}"},method = RequestMethod.GET)
    public String lanCreate(@PathVariable int id,Map<String,Object> map){
        newsDao.trans(id);
        return "redirect:/admin/news/lan/list/"+id;
    }

    @RequestMapping(value = {"newstype"})
    public String newstype(Map<String,Object> map,Locale locale){
        map.put("types",newsDao.getAllNewType());
        return "admin/newstype/list";
    }
    @RequestMapping(value = {"newstype/lan/list/{id}"},method = RequestMethod.GET)
    public String lanTypeList(@PathVariable int id,Map<String,Object> map){
        map.put("type_id",id);
        map.put("data",newsDao.getAllNewLanType(id));
        return "admin/newstype/lan/list";
    }

    @RequestMapping(value = {"newstype/lan/create/{id}"},method = RequestMethod.GET)
    public String lanTypeCreate(@PathVariable int id,Map<String,Object> map){
        newsDao.transType(id);
        return "redirect:/admin/newstype/lan/list/"+id;
    }

    @RequestMapping(value = {"newstype/lan/toupdate/{id}"})
    public String totypelanupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",newsDao.getNewsTypeLanById(id));
        return "admin/newstype/lan/update";
    }

    @RequestMapping(value = {"newstype/lan/update/{id}/{type_id}"},method = RequestMethod.POST)
    public String updateNews(HttpServletRequest request, @PathVariable Integer id,@PathVariable Integer type_id, String type_name)throws Exception{
        newsDao.updateNewsTypeLan(type_name,id);
        return "redirect:/admin/newstype/lan/list/"+type_id;
    }


    @RequestMapping(value = {"news/toupdate/{id}"})
    public String toupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",newsDao.getNewsById(id));
        map.put("types",newsDao.getAllNewType());
        return "admin/news/update";
    }

    @RequestMapping(value = {"news/lan/toupdate/{id}/{news_id}"})
    public String tolanupdate(@PathVariable int id,@PathVariable int news_id,Map<String,Object> map){
        map.put("news_id",news_id);
        map.put("dataitem",newsDao.getNewsLanById(id));
        return "admin/news/lan/update";
    }

    @RequestMapping(value = {"news/update/{id}"},method = RequestMethod.POST)
    public String updateNews(HttpServletRequest request, @PathVariable Integer id, NewsReq newsReq, MultipartFile file)throws Exception{
        newsReq.setCoverimg(imagesDao.imageUpload(request,file));
        newsDao.updateNews(newsReq,id);
        return "redirect:/admin/news";
    }


    @RequestMapping(value = {"newstype/toadd"})
    public String toaddnewstype(Map<String,Object> map,Locale locale){
        return "admin/newstype/add";
    }

    @RequestMapping(value = {"newstype/add"},method = RequestMethod.POST)
    public String addNewstype(String type,String type_url)throws Exception{
        newsDao.saveNewsType(type,type_url);
        return "redirect:/admin/newstype";
    }

    @RequestMapping(value = {"newstype/toupdate/{id}"})
    public String tonewstype(Map<String,Object> map,@PathVariable int id){
        map.put("dataitem",newsDao.getNewsTypeItem(id));
        return "admin/newstype/update";
    }

    @RequestMapping(value = {"newstype/update/{id}"},method = RequestMethod.POST)
    public String updateNewstype(@PathVariable int id, String type,String type_url)throws Exception{
        newsDao.updateNewsType(id,type,type_url);
        return "redirect:/admin/newstype";
    }

    @RequestMapping(value = {"newstype/delete/{id}"},method = RequestMethod.GET)
    public String deleteNewstype(@PathVariable int id)throws Exception{
        newsDao.deleteNewsType(id);
        return "redirect:/admin/newstype";
    }

    @RequestMapping(value = {"news/lan/update/{id}/{news_id}"},method = RequestMethod.POST)
    public String updateNewsLan(@PathVariable int id,@PathVariable int news_id, String newsname,String des,String detail)throws Exception{
        newsDao.updateNewsLan(id,newsname,des,detail);
        return "redirect:/admin/news/lan/list/"+news_id;
    }

    @RequestMapping(value = {"news/lan/totrans/{news_id}/{lan}/{from}/{to}"},method = RequestMethod.GET)
    public String updateNewsLan(@PathVariable int news_id, @PathVariable String lan,@PathVariable String from,@PathVariable String to)throws Exception{
        newsDao.transField(news_id,from,to,lan);
        return "redirect:/admin/news/lan/list/"+news_id;
    }

    @RequestMapping(value = {"news/lan/totrans/{news_id}/{from}/{to}"},method = RequestMethod.GET)
    public String updateNewsAllLan(@PathVariable int news_id, @PathVariable String from,@PathVariable String to)throws Exception{
        newsDao.transFieldAll(news_id,from,to);
        return "redirect:/admin/news/lan/list/"+news_id;
    }

    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }
}
