package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.data.NewsReq;
import com.jdconveyor.web.data.ProductReq;
import com.jdconveyor.web.utils.Utils;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/2/13.
 */
@Repository
public class ProductDao extends BaseDao{

    /**
     *
     * @param lan 语言
     * @return
     */
    public List<Map<String,Object>> queryByLanguage(String lan){
        String sql="SELECT a.* FROM product_query a where a.status=1";
        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        sql+=" and a.top_time is not null order by a.top_time DESC limit 10";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     *
     * @param lan 语言
     * @return
     */
    public List<Map<String,Object>> topByLanguage(String lan,int limit){
        String sql="SELECT a.* FROM product_query a where a.status=1";
        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        sql+=" and a.top_time is not null order by RAND() limit "+limit;
        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String,Object>> queryAllProduct(String lan){
        String sql="SELECT a.* FROM product_query a where a.status=1";
        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        return jdbcTemplate.queryForList(sql);
    }

    /**
     *
     * @param lan 语言
     * @return
     */
    public List<Map<String,Object>> allProduct(String lan){
        String sql="SELECT a.* FROM product_query a where a.status=1";
        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        return jdbcTemplate.queryForList(sql);
    }
    public List<Map<String,Object>> allProduct(){
        String sql="SELECT a.* FROM product a where a.status=1";
        return jdbcTemplate.queryForList(sql);
    }

    /**
     *
     * @param lan 语言
     * @return
     */
    public List<Map<String,Object>> allProductType(String lan){
        String sql="SELECT a.* FROM product_type_view a where 1=1";
        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        return jdbcTemplate.queryForList(sql);
    }

    public Map<String,Object> getProductById(String lan,int id){
        String sql="SELECT a.* FROM product_query a where a.product_id='"+id+"' and a.language='"+lan+"'";
        return jdbcTemplate.queryForMap(sql);
    }


    public DataResult query(int p){
        String sql="SELECT a.*,b.type as typename FROM product a left join product_type b on a.type_id=b.id order by a.id desc";
        return queryResult(sql,p,15);
    }

    public void change(int id,Boolean delete,Boolean top,Boolean status){
        if(delete!=null&&delete){
            jdbcTemplate.update("delete FROM product_language where product_id='"+id+"'");
            jdbcTemplate.update("delete FROM product where id='"+id+"'");
        }
        if(top!=null){
            jdbcTemplate.update("update product set top_time="+(top?"now()":"NULL")+" where id='"+id+"'");
        }
        if(status!=null){
            jdbcTemplate.update("update product set status="+(status?"1":"0")+" where id='"+id+"'");
        }
    }

    public List<Map<String,Object>> getAllType(){
        return jdbcTemplate.queryForList("select * from product_type");
    }

    public int saveProduct(ProductReq productReq){
        String sql="insert into product(product,product_url,coverimg,des,detail,type_id,features,price,images) values(?,?,?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql,productReq.getProduct(),productReq.getProduct_url(),productReq.getCoverimg(),productReq.getDes(),productReq.getDetail(),productReq.getType_id(),productReq.getFeatures(),productReq.getPrice(),productReq.getImages());
    }

    public List<Map<String,Object>> getAllLanList(int product_id){
        String sql="SELECT * FROM product_language where product_id="+product_id;
        return jdbcTemplate.queryForList(sql);
    }
    @Async
    public List<Map<String,Object>> trans(int id){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from product where id="+id);
        if(item!=null){
            jdbcTemplate.execute("delete from product_language where product_id="+id);
            Object product=item.get("product");
            Object des=item.get("des");
            Object detail=item.get("detail");
            Object features=item.get("features");
            for(String key:Utils.getLans().keySet()){
                String productlan=Utils.toTran(product,"auto",key);
                String deslan=Utils.toTran(des,"auto",key);
                String detaillan=Utils.toTran(detail,"auto",key);
                String featureslan=Utils.toTran(features,"auto",key);
                saveNewsLanguage(id,productlan,deslan,detaillan,featureslan,key);
            }
        }
        return getAllLanList(id);
    }

    public void saveNewsLanguage(int id,String productlan,String des,String detail,String features,String lan){
        jdbcTemplate.update("insert into product_language(productname,des,detail,features,language,product_id) values(?,?,?,?,?,?)",productlan,des,detail,features,lan,id);
    }

    public List<Map<String,Object>> getAllProductType(){
        return jdbcTemplate.queryForList("SELECT * FROM `product_type`");
    }

    public List<Map<String,Object>> getAllProductLanType(int type_id){
        return jdbcTemplate.queryForList("SELECT * FROM `product_type_language` where type_id="+type_id);
    }

    public void transType(int type_id){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from product_type where id="+type_id);
        if(item!=null){
            jdbcTemplate.execute("delete from product_type_language where type_id="+type_id);
            Object type=item.get("type");
            for(String key:Utils.getLans().keySet()){
                String typelan=Utils.toTran(type,"auto",key);
                saveProductTypeLanguage(type_id,typelan,key);
            }
        }
    }

    public void saveProductTypeLanguage(int id,String typename,String lan){
        jdbcTemplate.update("insert into product_type_language(typename,language,type_id) values(?,?,?)",typename,lan,id);
    }

    public Map<String,Object> getProductById(int id){
        return jdbcTemplate.queryForMap("select * from product where id="+id);
    }

    public int updateProduct(ProductReq productReq,Integer id){
        String sql="update product set product=?,product_url=?,coverimg=?,des=?,detail=?,type_id=?,features=?,price=?,images=? where id=?";
        return jdbcTemplate.update(sql,productReq.getProduct(),productReq.getProduct_url(),productReq.getCoverimg(),productReq.getDes(),productReq.getDetail(),productReq.getType_id(),productReq.getFeatures(),productReq.getPrice(),productReq.getImages(),id);
    }

    public Map<String,Object> getProductLanById(int id){
        return jdbcTemplate.queryForMap("select * from product_language where id="+id);
    }

    public Map<String,Object> getProductTypeLanById(int id){
        return jdbcTemplate.queryForMap("select * from product_type_language where id="+id);
    }


    public void updateProductLan(int id, String productname,String des,String detail,String features){
        jdbcTemplate.update("update product_language set productname=?,des=?,detail=?,features=? where id=?",productname,des,detail,features,id);
    }

    public void saveProductType(String type,String type_url){
        jdbcTemplate.update("insert into product_type(type,type_url) values(?,?)",type,type_url);
    }

    public Map<String,Object> getProductTypeItem(int id){
        return jdbcTemplate.queryForMap("select * from product_type where id="+id);
    }



    public void updateProductType(int id,String type,String type_url){
        jdbcTemplate.update("update product_type set type=?,type_url=? where id=?",type,type_url,id);
    }

    public void updateProductLanType(int id,String typename){
        jdbcTemplate.update("update product_type_language set typename=? where id=?",typename,id);
    }

    public void deleteProductType(int id){
        jdbcTemplate.update("DELETE from product_type where id=?",id);
    }

    public void transField(int id,String from,String to,String lan){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from product where id="+id);
        if(item!=null){
            Object fieldstr=item.get(from);
            String fieldlan=Utils.toTran(fieldstr,"auto",lan);
            String sql="update product_language set "+to+"=? where product_id=? and language=?";
            jdbcTemplate.update(sql,fieldlan,id,lan);

        }
    }

    public void transFieldAll(int id,String from,String to){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from product where id="+id);
        if(item!=null){
            Object fieldstr=item.get(from);
            for(String lan:Utils.getLans().keySet()) {
                String fieldlan = Utils.toTran(fieldstr, "auto", lan);
                String sql = "update product_language set " + to + "=? where product_id=? and language=?";
                jdbcTemplate.update(sql, fieldlan, id, lan);
            }

        }
    }


}
