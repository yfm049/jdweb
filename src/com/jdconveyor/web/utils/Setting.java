package com.jdconveyor.web.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * Created by lenovo on 2017/3/1.
 */
public class Setting {
    private static List<String> themes= new ArrayList<>();
    private static Properties properties=new Properties();
    private static File pfile=new File(Setting.class.getResource("/setting.properties").getPath());
    static {
        themes.add("main");
        themes.add("main-amber");
        themes.add("main-aqua");
        themes.add("main-brown");
        themes.add("main-cyan");
        themes.add("main-deep-orange");
        themes.add("main-deep-purple");
        themes.add("main-garden");
        themes.add("main-green");
        themes.add("main-indigo");
        themes.add("main-lilac");
        themes.add("main-lime");
        themes.add("main-pink");
        themes.add("main-purple");
        themes.add("main-red");
        try {
            properties.load(new FileInputStream(pfile));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<String> getThemes(){
        return themes;
    }

    public static String getCurrTheme(){
        return properties.getProperty("theme","main");
    }
    public static String getCnzz(){
        return properties.getProperty("cnzz","1261156500");
    }

    public static void setCurrTheme(String theme){
        try {
            properties.setProperty("theme",theme);
            properties.store(new FileOutputStream(pfile),"theme");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getLanConfig(){
        return properties.getProperty("lanconfig","jdconveyor");
    }

}
