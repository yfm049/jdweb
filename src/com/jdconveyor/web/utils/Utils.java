package com.jdconveyor.web.utils;

import com.jdconveyor.web.data.Language;
import com.jdconveyor.web.translator.GoogleTransApi;
import com.jdconveyor.web.translator.TransUtils;
import org.springframework.util.DigestUtils;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by lenovo on 2017/2/13.
 */
public class Utils {

    private static SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

    private static Map<String,Language> lans=GoogleTransApi.language;

    private static String site=Setting.getLanConfig();

    public static Map<String,Language> getLans(){
        return lans;
    }

    public static void main(String[] args) {

        List<String> keys=new ArrayList<>();
//        keys.add("web.alibaba.wel");
//        keys.add("web.alibaba.wel.des");
//        keys.add("web.alibaba.more");
        keys.add("product.download");
        keys.add("product.download.des");

        Properties properties=new Properties();
        try {
            properties.load(new InputStreamReader(Utils.class.getResourceAsStream("/config/"+site+"/message_zh_CN.properties"), "UTF-8"));

            for(String lkey:lans.keySet()) {
                MessageProperties npro=new MessageProperties();
                npro.load(new InputStreamReader(Utils.class.getResourceAsStream("/config/"+site+"/message_"+lkey.replace("-","_")+".properties"), "UTF-8"));
                for (Object key : properties.keySet()) {
                    if(keys.contains(key)){
                        Object v = properties.get(key);
                        String t = toTran(v, "zh-CN", lkey);
                        npro.put(key,t);
                        System.out.println(key + "--" + v);
                        System.out.println(key + "--" + t);
                    }


//                    if(!lkey.startsWith("zh")&&"河北九端进出口贸易有限公司".equals(v)){
//                        t = "HEBEI JIUDUAN IMP & EXP CO.,LTD";
//                    }else{
//                        t = toTran(v, "zh-CN", lkey);
//                    }



                }
                npro.sort();
                OutputStream fos=new FileOutputStream("D://config/"+site+"/message_"+lkey.replace("-","_")+".properties");
                Writer writer= new OutputStreamWriter(fos,"UTF-8");
                npro.store(writer,lkey);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

//        String v="最新输送带,托辊,三角带行情,86-311-85190086,info@jdconveyor.com,河北九端进出口贸易有限公司-最专业的的行业知识,公司最新动态";
//        String t=toTran(v,"zh","en");
//        System.out.println(v+"--"+t);



//        for(String key:lans.keySet()){
//            Language v=lans.get(key);

//            String t=toTran(v,"zh",key);
//            System.out.println("language.put(\""+key+"\",new Language(\""+key+"\",\"" + v + "\",\"" + t + "\"));");



        //}

    }



    public static String toTran(Object src,String from,String to){
        if(src==null||"".equals(src)){
            return "";
        }
        TransUtils bdTrans=new TransUtils(src.toString(),from,to);
        bdTrans.start();
        return bdTrans.getSrc();
    }

    public static Map<Object,Object> sortMap(Map<Object,Object> smap){
        Map<Object,Object> map = new TreeMap<Object,Object>(new Comparator<Object>() {public int compare(Object obj1, Object obj2) {return obj1.toString().compareTo(obj2.toString());}});
        map.putAll(smap);
        return map;
    }





    public static String getLanguage(Locale locale){
        String language=locale.getLanguage();
        if(lans.containsKey(language)){
            return language;
        }
        return "en";
    }

    public static boolean isEmpty(String str){
        if(str==null||"".equals(str.trim())){
            return true;
        }
        return false;
    }

    public static String getFileMd5(InputStream inputStream) throws Exception{
        return DigestUtils.md5DigestAsHex(inputStream);
    }

    public static String getAllString(String[] str){
        if(str!=null){
            StringBuffer sb=new StringBuffer();
            for(String s:str){
                if(!Utils.isEmpty(s)){
                    sb.append(s+",");
                }
            }
            if(sb.length()>0){
                return sb.substring(0,sb.length()-1);
            }
        }
        return "";
    }

    public static String formatDate(){
        return sdf.format(new Date());
    }

}
