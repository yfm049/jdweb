package com.jdconveyor.web.data;

import com.jdconveyor.web.utils.Utils;

import javax.xml.bind.annotation.XmlRootElement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/3/20.
 */
@XmlRootElement(name = "sitemapindex")
public class SitemapIndex {


    public List<Sitemap> sitemap=new ArrayList<>();

    public List<Sitemap> getSitemap() {
        return sitemap;
    }
    public void addUrl(String loc){
        sitemap.add(new Sitemap(loc, Utils.formatDate()));
    }

    public static class Sitemap{

        public String loc;
        public String lastmod;

        public Sitemap(String loc, String lastmod) {
            this.loc = loc;
            this.lastmod = lastmod;
        }

        public String getLoc() {
            return loc;
        }

        public String getLastmod() {
            return lastmod;
        }
    }
}
