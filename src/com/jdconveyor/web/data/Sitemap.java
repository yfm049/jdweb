package com.jdconveyor.web.data;
import com.jdconveyor.web.utils.Utils;

import javax.xml.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/3/8.
 */

@XmlRootElement(name = "urlset")
public class Sitemap {

    public List<Url> getUrl() {
        return url;
    }
    public List<Url> url=new ArrayList<>();

    public void addUrl(String loc,String changefreq,float priority){
        Url item=new Url(loc,changefreq,priority);
        url.add(item);
    }
    public void addUrl(String loc){
        String endurl=loc.substring(loc.indexOf("com"),loc.length());
        int l= endurl.split("/").length-2;
        float j=l>0?l*0.1f:0f;
        Url item=new Url(loc,ChangeFreq.hourly.name(),1-j);
        url.add(item);
    }


    public enum ChangeFreq{
        hourly,
        daily,
        weekly,
        monthly,
        yearly,
        always;
    }

    public static class Url{
        public String loc;
        public String changefreq;
        public float priority;
        public String lastmod;

        public String getLoc() {
            return loc;
        }

        public String getChangefreq() {
            return changefreq;
        }

        public float getPriority() {
            return priority;
        }

        public String getLastmod() {
            return lastmod;
        }

        public Url(String loc, String changefreq, float priority) {
            this.loc = loc;
            this.changefreq = changefreq;
            this.priority = priority;
            this.lastmod= Utils.formatDate();
        }

    }


}
