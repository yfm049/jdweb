package com.jdconveyor.web.data;


import com.jdconveyor.web.utils.Utils;

/**
 * Created by lenovo on 2016/12/22.
 */
public class ProductReq {
    private String product;
    private String product_url;
    private String des;
    private String detail;
    private float price;
    private int type_id;
    private String coverimg;
    private String[] images;
    private String features;

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getProduct_url() {
        return product_url;
    }

    public void setProduct_url(String product_url) {
        this.product_url = product_url;
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

    public String getCoverimg() {
        return coverimg;
    }

    public void setCoverimg(String coverimg) {
        if(!Utils.isEmpty(coverimg)){
            this.coverimg = coverimg;
        }

    }

    public String getImages() {
        return Utils.getAllString(images);
    }

    public void setImages(String[] images) {
        this.images = images;
    }

    public void changeImages(String[] images) {
        for(int i=0;i<images.length;i++){
            if(!Utils.isEmpty(images[i])){
                this.images[i]=images[i];
            }
        }
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = features;
    }
}
