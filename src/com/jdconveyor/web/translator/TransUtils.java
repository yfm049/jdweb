package com.jdconveyor.web.translator;

import cn.hutool.core.util.StrUtil;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/2/20.
 */
public class TransUtils {
    private String src;
    private String from;
    private String to;
    private TranslatorApi translatorApi=GoogleTransApi.getTransApi();

    private Element body;

    public void setTranslatorApi(TranslatorApi translatorApi) {
        this.translatorApi = translatorApi;
    }
    public TransUtils(String src, String from, String to){
        this.src=src;
        this.from=from;
        this.to=to;
    }

    public TransUtils start(){
    	Map<String, String> result= translatorApi.getTransResult(src,from,to);
        body=Jsoup.parse(src).body();
        Trans(body,result);
        return this;
    }

    private void Trans(Element parent,Map<String, String> result){
        List<TextNode> textnode=parent.textNodes();
        if(textnode!=null&&textnode.size()>0){
            Iterator<TextNode> iterator=textnode.iterator();
            while(iterator.hasNext()){
                TextNode text=iterator.next();
                if(!text.isBlank()){
                    String dst=result.get(StrUtil.replace(text.text()," ",""));
                    if(StrUtil.isNotBlank(dst)){
                        text.text(dst);
                    }
                }
            }
        }
        Elements elements=parent.children();
        if(elements!=null&&elements.size()>0){
            Iterator<Element> iterator=elements.iterator();
            while(iterator.hasNext()){
                Element item=iterator.next();
                Trans(item,result);
            }
        }




    }

    public String getSrc() {
        return body.html();
    }


    public static void main(String... arg){
        for(int i=0;i<300;i++){
            TransUtils transUtils=new TransUtils("<a>&nbsp;你好呀</a>","zh","en");
            transUtils.start();
            System.out.print(transUtils.getSrc());
        }

    }
}
