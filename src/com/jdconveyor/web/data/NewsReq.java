package com.jdconveyor.web.data;


import com.jdconveyor.web.utils.Utils;

/**
 * Created by lenovo on 2016/12/22.
 */
public class NewsReq {
    private String news;
    private String news_url;
    private String des;
    private String detail;
    private int type_id;
    private String tags;
    private String coverimg;
    private String source;

    public String getNews() {
        return news;
    }

    public void setNews(String news) {
        this.news = news;
    }

    public String getNews_url() {
        return news_url;
    }

    public void setNews_url(String news_url) {
        this.news_url = news_url;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getCoverimg() {
        return coverimg;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public void setCoverimg(String coverimg) {
        if(!Utils.isEmpty(coverimg)){
            this.coverimg = coverimg;
        }

    }
}
