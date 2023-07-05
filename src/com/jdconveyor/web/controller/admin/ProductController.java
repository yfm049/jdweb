package com.jdconveyor.web.controller.admin;


import com.jdconveyor.web.dao.ImagesDao;
import com.jdconveyor.web.dao.NewsDao;
import com.jdconveyor.web.dao.ProductDao;
import com.jdconveyor.web.data.NewsReq;
import com.jdconveyor.web.data.Pager;
import com.jdconveyor.web.data.ProductReq;
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
public class ProductController {

    @Autowired
    NewsDao newsDao;

    @Autowired
    ProductDao productDao;

    @Autowired
    ImagesDao imagesDao;

    @RequestMapping(value = {"product"})
    public String news(Map<String,Object> map,Pager pager){
        map.put("data",productDao.query(pager.getOffset()));
        map.put("p",pager);
        return "admin/product/list";
    }
    @RequestMapping(value = {"product/{id}/change"},method = RequestMethod.GET)
    public String change(@PathVariable int id,Map<String,Object> map,Pager pager,Boolean delete,Boolean top,Boolean status){
        productDao.change(id,delete,top,status);
        return news(map,pager);
    }
    @RequestMapping(value = {"product/toadd"})
    public String add(Map<String,Object> map){
        map.put("types",productDao.getAllType());
        return "admin/product/add";
    }


    @RequestMapping(value = {"product/add"},method = RequestMethod.POST)
    public String addNews(HttpServletRequest request, ProductReq productReq, MultipartFile coverfile, MultipartFile[] file)throws Exception{
        productReq.setCoverimg(imagesDao.imageUpload(request,coverfile));
        productReq.setImages(imagesDao.imageUpload(request,file));
        productDao.saveProduct(productReq);
        return "redirect:/admin/product";
    }
    @RequestMapping(value = {"product/lan/list/{id}"},method = RequestMethod.GET)
    public String lanList(@PathVariable int id,Map<String,Object> map){
        map.put("product_id",id);
        map.put("data",productDao.getAllLanList(id));
        return "admin/product/lan/list";
    }

    @RequestMapping(value = {"product/lan/create/{id}"},method = RequestMethod.GET)
    public String lanCreate(@PathVariable int id,Map<String,Object> map){
        map.put("data",productDao.trans(id));
        return "redirect:/admin/product/lan/list/"+id;
    }

    @RequestMapping(value = {"producttype"})
    public String producttype(Map<String,Object> map,Locale locale){
        map.put("types",productDao.getAllProductType());
        return "admin/producttype/list";
    }
    @RequestMapping(value = {"producttype/lan/list/{id}"},method = RequestMethod.GET)
    public String lanTypeList(@PathVariable int id,Map<String,Object> map){
        map.put("type_id",id);
        map.put("data",productDao.getAllProductLanType(id));
        return "admin/producttype/lan/list";
    }

    @RequestMapping(value = {"producttype/lan/create/{id}"},method = RequestMethod.GET)
    public String lanTypeCreate(@PathVariable int id,Map<String,Object> map){
        productDao.transType(id);
        return "redirect:/admin/producttype/lan/list/"+id;
    }

    @RequestMapping(value = {"product/toupdate/{id}"})
    public String toupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",productDao.getProductById(id));
        map.put("types",productDao.getAllProductType());
        return "admin/product/update";
    }

    @RequestMapping(value = {"product/lan/toupdate/{id}/{product_id}"})
    public String tolanupdate(@PathVariable int id,@PathVariable int product_id,Map<String,Object> map){
        map.put("product_id",product_id);
        map.put("dataitem",productDao.getProductLanById(id));
        return "admin/product/lan/update";
    }

    @RequestMapping(value = {"producttype/lan/toupdate/{id}"})
    public String toTypelanupdate(@PathVariable int id,Map<String,Object> map){
        map.put("dataitem",productDao.getProductTypeLanById(id));
        return "admin/producttype/lan/update";
    }

    @RequestMapping(value = {"product/update/{id}"},method = RequestMethod.POST)
    public String updateProduct(HttpServletRequest request, @PathVariable Integer id, ProductReq productReq, MultipartFile coverfile, MultipartFile[] file)throws Exception{
        productReq.setCoverimg(imagesDao.imageUpload(request,coverfile));
        productReq.changeImages(imagesDao.imageUpload(request,file));
        productDao.updateProduct(productReq,id);
        return "redirect:/admin/product";
    }


    @RequestMapping(value = {"producttype/toadd"})
    public String toaddnewstype(Map<String,Object> map,Locale locale){
        return "admin/producttype/add";
    }

    @RequestMapping(value = {"producttype/add"},method = RequestMethod.POST)
    public String addNewstype(String type,String type_url)throws Exception{
        productDao.saveProductType(type,type_url);
        return "redirect:/admin/producttype";
    }

    @RequestMapping(value = {"producttype/toupdate/{id}"})
    public String toproducttype(Map<String,Object> map,@PathVariable int id){
        map.put("dataitem",productDao.getProductTypeItem(id));
        return "admin/producttype/update";
    }

    @RequestMapping(value = {"producttype/update/{id}"},method = RequestMethod.POST)
    public String updateNewstype(@PathVariable int id, String type,String type_url)throws Exception{
        productDao.updateProductType(id,type,type_url);
        return "redirect:/admin/producttype";
    }

    @RequestMapping(value = {"producttype/delete/{id}"},method = RequestMethod.GET)
    public String deleteNewstype(@PathVariable int id)throws Exception{
        productDao.deleteProductType(id);
        return "redirect:/admin/producttype";
    }

    @RequestMapping(value = {"product/lan/update/{id}/{product_id}"},method = RequestMethod.POST)
    public String updateNewsLan(@PathVariable int id,@PathVariable int product_id, String productname,String des,String detail,String features)throws Exception{
        productDao.updateProductLan(id,productname,des,detail,features);
        return "redirect:/admin/product/lan/list/"+product_id;
    }

    @RequestMapping(value = {"producttype/lan/update/{id}/{producttype_id}"},method = RequestMethod.POST)
    public String updateLantype(@PathVariable int id,@PathVariable int producttype_id, String typename)throws Exception{
        productDao.updateProductLanType(id,typename);
        return "redirect:/admin/producttype/lan/list/"+producttype_id;
    }

    @RequestMapping(value = {"product/lan/totrans/{product_id}/{lan}/{from}/{to}"},method = RequestMethod.GET)
    public String updateNewsLan(@PathVariable int product_id, @PathVariable String lan,@PathVariable String from,@PathVariable String to)throws Exception{
        productDao.transField(product_id,from,to,lan);
        return "redirect:/admin/product/lan/list/"+product_id;
    }

    @RequestMapping(value = {"product/lan/totrans/{product_id}/{from}/{to}"},method = RequestMethod.GET)
    public String updateNewsLan(@PathVariable int product_id,@PathVariable String from,@PathVariable String to)throws Exception{
        productDao.transFieldAll(product_id,from,to);
        return "redirect:/admin/product/lan/list/"+product_id;
    }

    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }

}
