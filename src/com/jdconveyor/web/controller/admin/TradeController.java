package com.jdconveyor.web.controller.admin;


import com.jdconveyor.web.dao.ProductDao;
import com.jdconveyor.web.dao.TradeDao;
import com.jdconveyor.web.data.NewsReq;
import com.jdconveyor.web.data.Pager;
import com.jdconveyor.web.data.TradeReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/21.
 */
@Controller
@RequestMapping("admin")
public class TradeController {

    @Autowired
    TradeDao tradeDao;
    @Autowired
    ProductDao productDao;


    @RequestMapping(value = {"trade"})
    public String trade(Map<String,Object> map, Pager pager){
        map.put("data",tradeDao.query(pager.getOffset()));
        map.put("p",pager);
        return "admin/trade/list";
    }
    @RequestMapping(value = {"trade/{id}/change"},method = RequestMethod.GET)
    public String change(@PathVariable int id, Map<String,Object> map, Pager pager, Boolean delete, Boolean status){
        map.put("p",pager);
        tradeDao.change(id,delete,status);
        return trade(map,pager);
    }

    @RequestMapping(value = {"trade/toadd"})
    public String add(Map<String,Object> map){
        List<Map<String,Object>> state= tradeDao.getAllCountryState();
        map.put("state",state);
        if(state.size()>0){
            map.put("country",tradeDao.getAllCountry(state.get(0).get("state")));
        }
        map.put("products",productDao.allProduct());
        return "admin/trade/add";
    }
    @ResponseBody
    @RequestMapping(value = {"trade/country"})
    public List<Map<String,Object>> getAllCountry(String area){
        return tradeDao.getAllCountry(area);
    }

    @RequestMapping(value = {"trade/add"},method = RequestMethod.POST)
    public String addNews(HttpServletRequest request, TradeReq tradeReq)throws Exception{
        tradeDao.saveTrade(tradeReq);
        return "redirect:/admin/trade";
    }

    @RequestMapping(value = {"trade/toupdate/{id}"})
    public String toupdate(@PathVariable int id,Map<String,Object> map){

        Map<String,Object> trade=tradeDao.getTradeById(id);

        List<Map<String,Object>> state= tradeDao.getAllCountryState();
        map.put("state",state);
        if(state.size()>0){
            map.put("country",tradeDao.getAllCountry(trade.get("area")));
        }
        map.put("products",productDao.allProduct());
        map.put("dataitem",trade);
        return "admin/trade/update";
    }

    @RequestMapping(value = {"trade/update/{id}"},method = RequestMethod.POST)
    public String updateNews(HttpServletRequest request, @PathVariable Integer id, TradeReq tradeReq)throws Exception{
        tradeDao.updateTrade(tradeReq,id);
        return "redirect:/admin/trade";
    }

    @RequestMapping(value = {"trade/lan/list/{id}"},method = RequestMethod.GET)
    public String lanList(@PathVariable int id,Map<String,Object> map){
        map.put("trade_id",id);
        map.put("data",tradeDao.getAllLanList(id));
        return "admin/trade/lan/list";
    }

    @RequestMapping(value = {"trade/lan/create/{id}"},method = RequestMethod.GET)
    public String lanCreate(@PathVariable int id,Map<String,Object> map){
        map.put("data",tradeDao.trans(id));
        return "admin/trade/lan/list";
    }

    

    @RequestMapping(value = {"trade/lan/toupdate/{id}/{trade_id}"})
    public String tolanupdate(@PathVariable int id,@PathVariable int trade_id,Map<String,Object> map){
        map.put("trade_id",trade_id);
        map.put("dataitem",tradeDao.gettradeLanById(id));
        return "admin/trade/lan/update";
    }

    @RequestMapping(value = {"trade/lan/update/{id}/{trade_id}"},method = RequestMethod.POST)
    public String updateNewsLan(@PathVariable int id,@PathVariable int trade_id, String country,String area)throws Exception{
        tradeDao.updatetradeLan(id,country,area);
        return "redirect:/admin/trade/lan/list/"+trade_id;
    }
    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }
}
