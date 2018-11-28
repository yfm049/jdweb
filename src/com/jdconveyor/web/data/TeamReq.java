package com.jdconveyor.web.data;

import com.jdconveyor.web.utils.Utils;

/**
 * Created by lenovo on 2017/2/28.
 */
public class TeamReq {
    private String name;
    private String job;
    private String des;
    private String facebook;
    private String twitter;
    private String linkin;
    private String email;
    private String avatar;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getTwitter() {
        return twitter;
    }

    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    public String getLinkin() {
        return linkin;
    }

    public void setLinkin(String linkin) {
        this.linkin = linkin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public void changeAvatar(String avatar){
        if(!Utils.isEmpty(avatar)){
            this.avatar = avatar;
        }
    }
}
