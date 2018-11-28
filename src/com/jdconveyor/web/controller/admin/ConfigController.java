package com.jdconveyor.web.controller.admin;

import com.jdconveyor.web.utils.MessageProperties;
import com.jdconveyor.web.utils.Setting;
import com.jdconveyor.web.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.*;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Created by lenovo on 2017/3/7.
 */
@Controller
@RequestMapping("admin")
public class ConfigController {

    File dir=new File(Setting.class.getResource("/config/"+Setting.getLanConfig()).getPath());

    @RequestMapping(value = {"config"})
    public String home(Map<String,Object> map){
        Map<Object,Object> lanfiles=new LinkedHashMap<>();
        for(File file:dir.listFiles()){
            String name=file.getName();
            String key=name.substring(0,name.indexOf(".properties"));
            String value=name.substring(name.indexOf("message_")+8,name.indexOf(".properties")).replaceAll("_","-");
            lanfiles.put(key,value);
        }
        map.put("lanfiles",Utils.sortMap(lanfiles));
        return "admin/config/list";
    }

    @RequestMapping(value = {"config/totrans"},method = RequestMethod.GET)
    public String totrans(Map<String,Object> map) throws Exception {
        File zhfile=new File(dir,"message_zh_CN.properties");
        Properties properties=new Properties();
        properties.load(new InputStreamReader(new FileInputStream(zhfile),"UTF-8"));
        for(String lkey:Utils.getLans().keySet()) {
            MessageProperties npro=new MessageProperties();
            for (Object key : properties.keySet()) {
                Object v = properties.get(key);
                String t=null;
                if(!lkey.startsWith("zh")&&"河北九端进出口贸易有限公司".equals(v)){
                    t = "HEBEI JIUDUAN IMP & EXP CO.,LTD";
                }else{
                    t = Utils.toTran(v, "zh-CN", lkey);
                }
                npro.put(key,t);
            }
            File outfile=new File(dir,"message_"+lkey.replace("-","_")+".properties");
            OutputStream fos=new FileOutputStream(outfile);
            Writer writer= new OutputStreamWriter(fos,"UTF-8");
            npro.store(writer,lkey);
        }
        return home(map);
    }
    @RequestMapping(value = {"config/totrans/{lan}"},method = RequestMethod.GET)
    public String totrans(Map<String,Object> map,@PathVariable String lan) throws Exception {
        File zhfile=new File(dir,"message_zh_CN.properties");
        Properties properties=new Properties();
        properties.load(new InputStreamReader(new FileInputStream(zhfile),"UTF-8"));
        String lkey=lan.substring(lan.indexOf("message_")+8,lan.length()).replaceAll("_","-");
        MessageProperties npro=new MessageProperties();
        for (Object key : properties.keySet()) {
            Object v = properties.get(key);
            String t=null;
            if(!lkey.startsWith("zh")&&"河北九端进出口贸易有限公司".equals(v)){
                t = "HEBEI JIUDUAN IMP & EXP CO.,LTD";
            }else{
                t = Utils.toTran(v, "zh-CN", lkey);
            }
            npro.put(key,t);
        }
        File outfile=new File(dir,"message_"+lkey.replace("-","_")+".properties");
        OutputStream fos=new FileOutputStream(outfile);
        Writer writer= new OutputStreamWriter(fos,"UTF-8");
        npro.store(writer,lkey);
        return home(map);
    }


    @RequestMapping(value = {"config/toupdate/{lan}"},method = RequestMethod.GET)
    public String toupdate(Map<String,Object> map,@PathVariable String lan) throws Exception {
        File file=new File(dir,lan+".properties");
        Properties properties=new Properties();
        properties.load(new InputStreamReader(new FileInputStream(file),"UTF-8"));
        map.put("dataitem",Utils.sortMap(properties));
        map.put("lanconfig",lan);
        return "admin/config/update";
    }

    @RequestMapping(value = {"config/update/{lan}"},method = RequestMethod.POST)
    public String toupdate(Map<String,Object> map,@PathVariable String lan,String[] key,String[] value) throws Exception {
        File file=new File(Setting.class.getResource("/config/"+Setting.getLanConfig()+"/"+lan+".properties").getPath());
        Properties properties=new Properties();
        for(int i=0;i<key.length;i++){
            properties.put(key[i],value[i]);
        }
        properties.store(new OutputStreamWriter(new FileOutputStream(file),"UTF-8"),lan);
        return home(map);
    }
}
