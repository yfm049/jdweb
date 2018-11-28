package com.jdconveyor.web.controller;

import com.jdconveyor.web.dao.*;
import com.jdconveyor.web.data.*;
import com.jdconveyor.web.utils.Setting;
import com.jdconveyor.web.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by lenovo on 2017/2/13.
 */
@Controller
public class WebController {


    @Autowired
    ProductDao productDao;
    @Autowired
    NewsDao newsDao;

    @Autowired
    TradeDao tradeDao;
    @Autowired
    TeamDao teamDao;
    @Autowired
    ProblemDao problemDao;
    @Autowired
    LeaveDao leaveDao;
    @Autowired
    SystemDao systemDao;


    @RequestMapping(value = {"/", "/{lan}"})
    public String home(@PathVariable(required = false) String lan, Map<String, Object> map, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        lan=parseLocale(lan,locale,map,request,response);
        map.put("topproduct",productDao.topByLanguage(lan,10));
        map.put("topnews",newsDao.queryByLanguage(lan));
        return "web/index";
    }

    @RequestMapping(value = {"{lan}/about-us","about-us"})
    public String aboutus(@PathVariable(required = false) String lan, Map<String, Object> map,Pager pager, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        lan=parseLocale(lan,locale,map,request,response);
        map.put("problems",problemDao.getAllProblem(lan));
        map.put("trades",tradeDao.queryByLanguage(lan,pager.getOffset()));
        map.put("totaltrade",tradeDao.getTotalTrade(lan));
        map.put("toptrades",tradeDao.getTopTrade(lan));
        map.put("teams",teamDao.getAllTeam(lan));
        return "web/about-us";
    }

    @RequestMapping(value = {"{lan}/services","services"})
    public String services(@PathVariable(required = false) String lan,Map<String, Object> map,Locale locale, HttpServletRequest request, HttpServletResponse response) {
        parseLocale(lan,locale,map,request,response);
        return "web/services";
    }

    @RequestMapping(value = {"{lan}/product","product"})
    public String product(@PathVariable(required = false) String lan, Map<String, Object> map, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        lan=parseLocale(lan,locale,map,request,response);
        map.put("products",productDao.allProduct(lan));
        map.put("types",productDao.allProductType(lan));
        return "web/product";
    }

    @RequestMapping(value = {"{lan}/{name}/p{id}","{name}/p{id}"})
    public String productitem(@PathVariable(required = false) String lan,@PathVariable int id, Map<String, Object> map, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        lan=parseLocale(lan,locale,map,request,response);
        map.put("topproduct",productDao.topByLanguage(lan,10));
        map.put("product",productDao.getProductById(lan,id));
        return "web/product-item";
    }

    @RequestMapping(value = {"{lan}/news","news"})
    public String news(@PathVariable(required = false) String lan,String s, Map<String, Object> map,  Pager pager, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        lan=parseLocale(lan,locale,map,request,response);
        map.put("s", s);
        map.put("topproduct",productDao.topByLanguage(lan,25));
        map.put("types",newsDao.allNewsType(lan));
        map.put("topnews",newsDao.queryByLanguage(lan));
        map.put("news",newsDao.queryByLanguage(lan,pager.getOffset(),null,s));
        return "web/news";
    }

    @RequestMapping(value = {"{lan}/{name}/n{id}","{name}/n{id}"})
    public String newsitem(@PathVariable(required = false) String lan,@PathVariable Integer id, Map<String, Object> map, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        lan=parseLocale(lan,locale,map,request,response);
        map.put("topproduct",productDao.topByLanguage(lan,5));
        map.put("types",newsDao.allNewsType(lan));
        map.put("topnews",newsDao.queryByLanguage(lan));
        map.put("newitem",newsDao.getNewsById(lan,id));
        map.put("newleave",newsDao.getNewsLeave(id));
        return "web/news-item";
    }

    @RequestMapping(value = {"{lan}/{name}/nt{id}","{name}/nt{id}"})
    public String newstype(@PathVariable(required = false) String lan,@PathVariable String id,Map<String,Object> map,Pager pager, Locale locale, HttpServletRequest request, HttpServletResponse response){
        lan=parseLocale(lan,locale,map,request,response);
        map.put("types",newsDao.allNewsType(lan));
        map.put("topnews",newsDao.queryByLanguage(lan));
        map.put("news",newsDao.queryByLanguage(lan,pager.getOffset(),id,null));
        return "web/news";
    }

    @RequestMapping(value = {"{lan}/news/leave/{id}","news/leave/{id}"}, method = RequestMethod.POST)
    public String newsleave(@PathVariable(required = false) String lan,@PathVariable Integer id, NewsLeaveParam param, Map<String, Object> map, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        lan=parseLocale(lan,locale,map,request,response);
        newsDao.saveNewsLeave(param,id);
        return newsitem(lan,id,map,locale,request,response);
    }

    @RequestMapping(value = {"{lan}/contact-us","contact-us"})
    public String contact(@PathVariable(required = false) String lan,Map<String, Object> map, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        parseLocale(lan,locale,map,request,response);
        return "web/contact-us";
    }

    @RequestMapping(value = {"{lan}/contact-us/leave","contact-us/leave"}, method = RequestMethod.POST)
    public String leaveMessage(@PathVariable(required = false) String lan,Leave leave, Map<String, Object> map, Locale locale, HttpServletRequest request, HttpServletResponse response) {
        parseLocale(lan,locale,map,request,response);
        leaveDao.saveLeave(leave);
        map.put("dialog",true);
        return "web/contact-us";
    }

    @RequestMapping(value = {"login","{lan}/login"},method = RequestMethod.GET)
    public String login(@PathVariable(required = false) String lan,Map<String, Object> map,Locale locale, HttpServletRequest request, HttpServletResponse response){
        parseLocale(lan,locale,map,request,response);
        return "web/login";
    }
    @RequestMapping(value = {"{lan}/login"},method = RequestMethod.POST)
    public String logining(HttpSession httpSession, Map<String,Object> map, String name, String pass){
        if(systemDao.login(name,pass)){
            httpSession.setAttribute("name",name);
            return "redirect:/admin/home";
        }
        map.put("msg","用户密码或密码错误");
        return "web/login";
    }
    @RequestMapping(value = {"error","{lan}/error"})
    public String error(Map<String,Object> map,@PathVariable(required = false) String lan,Locale locale, HttpServletRequest request, HttpServletResponse response){
        lan=parseLocale(lan,locale,map,request,response);
        map.put("topproduct",productDao.topByLanguage(lan,10));
        map.put("topnews",newsDao.queryByLanguage(lan));
        return "web/error";
    }

    @ResponseBody
    @RequestMapping(value = {"{key}/sitemap.xml"},method = RequestMethod.GET)
    public Sitemap siteMap(@PathVariable String key){
        String baseUrl="http://www."+ Setting.getLanConfig()+".com"+"/"+key;
        Sitemap sitemap=new Sitemap();
        sitemap.addUrl(baseUrl+"/about-us");
        sitemap.addUrl(baseUrl+"/product");
        sitemap.addUrl(baseUrl+"/services");
        sitemap.addUrl(baseUrl+"/news");
        sitemap.addUrl(baseUrl+"/contact-us");

        List<Map<String,Object>> allproduct= productDao.queryAllProduct(key);
        for(Map<String,Object> item:allproduct){
            sitemap.addUrl(baseUrl+"/"+item.get("product_url")+"/p"+item.get("product_id"));
        }
        List<Map<String,Object>> allnews=newsDao.queryAllNews(key);
        for(Map<String,Object> item:allnews){
            sitemap.addUrl(baseUrl+"/"+item.get("news_url")+"/n"+item.get("news_id"));
        }
        return sitemap;
    }

    @ResponseBody
    @RequestMapping(value = {"sitemap.xml"},method = RequestMethod.GET)
    public Sitemap siteLan(){
        String baseUrl="http://www."+ Setting.getLanConfig()+".com";
        Sitemap sitemap=new Sitemap();
        sitemap.addUrl(baseUrl);
        for (String key:Utils.getLans().keySet()){
            sitemap.addUrl(baseUrl+"/"+key);
        }
        return sitemap;
    }
    @ResponseBody
    @RequestMapping(value = {"sitemapindex.xml"},method = RequestMethod.GET)
    public SitemapIndex sitemapindexLan(){
        String baseUrl="http://www."+ Setting.getLanConfig()+".com";
        SitemapIndex sitemapindex=new SitemapIndex();
        sitemapindex.addUrl(baseUrl+"/sitemap.xml");
        for (String key:Utils.getLans().keySet()){
            sitemapindex.addUrl(baseUrl+"/"+key+"/sitemap.xml");
        }
        return sitemapindex;
    }


    private String parseLocale(String lan,Locale locale,Map<String, Object> map,HttpServletRequest request, HttpServletResponse response){
        if(Utils.isEmpty(lan)){
            lan=Utils.getLanguage(locale);
        }
        map.put("lan",lan);
        RequestContextUtils.getLocaleResolver(request).setLocale(request,response,Locale.forLanguageTag(lan));
        return lan;
    }




    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }

}