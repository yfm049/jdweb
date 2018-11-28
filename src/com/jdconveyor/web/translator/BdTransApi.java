package com.jdconveyor.web.translator;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jdconveyor.web.data.TransResult;
import com.jdconveyor.web.utils.Utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class BdTransApi implements TranslatorApi{
    private static final String TRANS_API_HOST = "http://api.fanyi.baidu.com/api/trans/vip/translate";
    private static BdTransApi transApi;
    private ObjectMapper mapper = new ObjectMapper();
    private String appid="20170209000038805";
    private String securityKey="BVJFzZgGHwtedF_zpvm6";

    public BdTransApi(){

    }

    public BdTransApi(String appid, String securityKey) {
        this.appid = appid;
        this.securityKey = securityKey;
    }

    public synchronized static BdTransApi getTransApi(){
        if(transApi==null){
            transApi=new BdTransApi();
        }
        return transApi;
    }

    public TransResult getTransResult(String query, String from, String to) {
        TransResult result=null;
        String str=toTrans(query,from,to);
        if(!Utils.isEmpty(str)){
            try {
                result = mapper.readValue(str,TransResult.class);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public String toTrans(String query, String from, String to) {
        Map<String, String> params = buildParams(query, from, to);
        return HttpGet.get(TRANS_API_HOST, params);
    }

    private Map<String, String> buildParams(String query, String from, String to) {
        Map<String, String> params = new HashMap<String, String>();
        params.put("q", query);
        params.put("from", from);
        params.put("to", to);

        params.put("appid", appid);

        // 随机数
        String salt = String.valueOf(System.currentTimeMillis());
        params.put("salt", salt);

        // 签名
        String src = appid + query + salt + securityKey; // 加密前的原文
        params.put("sign", MD5.md5(src));

        return params;
    }


    public static Map<String,String> lans=new LinkedHashMap<>();
    static {
        lans.put("zh","中文");
        lans.put("en","英语");
        lans.put("yue","粤语");
        lans.put("jp","日语");
        lans.put("kor","韩语");
        lans.put("fra","法语");
        lans.put("spa","西班牙语");
        lans.put("th","泰语");
        lans.put("ara","阿拉伯语");
        lans.put("ru","俄语");
        lans.put("pt","葡萄牙语");
        lans.put("de","德语");
        lans.put("it","意大利语");
        lans.put("el","希腊语");
        lans.put("nl","荷兰语");
        lans.put("pl","波兰语");
        lans.put("bul","保加利亚语");
        lans.put("est","爱沙尼亚语");
        lans.put("dan","丹麦语");
        lans.put("fin","芬兰语");
        lans.put("cs","捷克语");
        lans.put("rom","罗马尼亚语");
        lans.put("slo","斯洛文尼亚语");
        lans.put("swe","瑞典语");
        lans.put("hu","匈牙利语");
        lans.put("cht","繁体中文");
        lans.put("vie","越南语");


    }

}
