package com.jdconveyor.web.controller.admin;

import com.jdconveyor.web.dao.ImagesDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/22.
 */
@Controller
@RequestMapping("admin")
public class ImageController {
    @Autowired
    ImagesDao imagesDao;

    public String path="assets/upload";
    public String thumbs=path+"/thumbs";

    @ResponseBody
    @RequestMapping(value = {"imageUpload"},method = RequestMethod.POST)
    public Map<String,Object> imageUpload(HttpServletRequest request, MultipartFile file) throws Exception {
        Map<String,Object> result=new HashMap();
        result.put("link",imagesDao.imageUpload(request,file));
        return result;
    }

    @ResponseBody
    @RequestMapping(value = {"load-files"},method = RequestMethod.GET)
    public List<Map<String,Object>> loadFiles() throws Exception {
        return imagesDao.getAllFile();
    }
    @ResponseBody
    @RequestMapping(value = {"fileUpload"},method = RequestMethod.POST)
    public Map<String,Object> fileUpload(HttpServletRequest request, MultipartFile file) throws Exception {
        Map<String,Object> result=new HashMap();
        result.put("link",imagesDao.fileUpload(request,file));
        return result;
    }
    @InitBinder("pager")
    public void initBinder(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("pager.");
    }
}
