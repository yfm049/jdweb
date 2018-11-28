package com.jdconveyor.web.controller.admin;


import com.jdconveyor.web.dao.ContactDao;
import com.jdconveyor.web.data.ContactReq;
import com.jdconveyor.web.data.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * Created by lenovo on 2016/12/21.
 */
@Controller
@RequestMapping("admin")
public class ContactController {

    @Autowired
    ContactDao contactDao;

    @RequestMapping(value = {"contact"})
    public String news(Map<String,Object> map,Pager pager){
        map.put("data",contactDao.getAllContact(pager.getOffset()));
        return "admin/contact/list";
    }
    @RequestMapping(value = {"contact/toadd"})
    public String add(Map<String,Object> map){
        return "admin/contact/add";
    }
    @RequestMapping(value = {"contact/add"},method = RequestMethod.POST)
    public String addNews(ContactReq contactReq)throws Exception{
        contactDao.saveContact(contactReq);
        return "redirect:/admin/contact";
    }

    @RequestMapping(value = {"contact/toupdate/{id}"})
    public String add(Map<String,Object> map,@PathVariable int id){
        Map<String,Object> item=contactDao.getItemContact(id);
        map.put("dataitem",item);
        return "admin/contact/update";
    }
    @RequestMapping(value = {"contact/update/{id}"},method = RequestMethod.POST)
    public String updateNews(@PathVariable Integer id, ContactReq contactReq)throws Exception{
        contactDao.updateContact(contactReq,id);
        return "redirect:/admin/contact";
    }
    @RequestMapping(value = {"contact/delete/{id}"},method = RequestMethod.GET)
    public String deleteNews(@PathVariable Integer id){
        contactDao.deleteContact(id);
        return "redirect:/admin/contact";
    }
    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }
}
