package com.jdconveyor.web.data;

/**
 * Created by lenovo on 2017/2/23.
 */
public class Language {

    private String locale;
    private String language;
    private String lanname;

    public Language(String locale, String language, String lanname) {
        this.locale = locale;
        this.language = language;
        this.lanname = lanname;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getLanname() {
        return lanname;
    }

    public void setLanname(String lanname) {
        this.lanname = lanname;
    }
}
