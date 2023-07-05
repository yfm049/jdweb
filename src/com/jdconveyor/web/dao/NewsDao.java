package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.data.NewsLeaveParam;
import com.jdconveyor.web.data.NewsReq;
import com.jdconveyor.web.utils.Utils;

import cn.hutool.core.thread.ThreadUtil;
import cn.hutool.core.util.RandomUtil;

import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/2/13.
 */
@Repository
public class NewsDao extends BaseDao{

    /**
     *
     * @param lan 语言
     * @return
     */
    public List<Map<String,Object>> queryByLanguage(String lan){
        String sql="SELECT a.* FROM news_query a where a.status=1";

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
        String sql="SELECT a.* FROM news_query a where a.status=1";

        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        sql+=" and a.top_time is not null order by a.top_time DESC limit "+limit;
        return jdbcTemplate.queryForList(sql);
    }


    public List<Map<String,Object>> queryAllNews(String lan){
        String sql="SELECT a.* FROM news_query a where a.status=1";
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
    public List<Map<String,Object>> allNewsType(String lan){
        String sql="SELECT a.* FROM news_type_view a where 1=1";
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
    public DataResult queryByLanguage(String lan, int p,String type_id,String s){
        String sql="SELECT a.* FROM news_query a where a.status=1";
        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        if(!Utils.isEmpty(type_id)){
            sql+=" and a.type_id='"+type_id+"' ";
        }
        if(!Utils.isEmpty(s)){
            sql+=" and a.newsname like '%"+s+"%' ";
        }
        sql+=" order by a.create_time desc";
        return queryResult(sql,p,15);
    }

    /**
     *
     * @return
     */
    public DataResult query(int p){
        String sql="SELECT a.*,b.type as typename FROM news a left join news_type b on a.type_id=b.id order by a.create_time desc";
        return queryResult(sql,p,15);
    }


    /**
     * 获取单条记录
     * @param lan 语言
     * @return
     */
    public Map<String,Object> getNewsById(String lan, int id){
        String sql="SELECT a.* FROM news_query a where a.news_id='"+id+"' and a.language='"+lan+"' ";
        return jdbcTemplate.queryForMap(sql);
    }

    public List<Map<String,Object>> getNewsLeave(Integer id){
        String sql="SELECT * FROM news_leave where news_id=? order by id DESC ";
        return jdbcTemplate.queryForList(sql,id);
    }

    public int saveNewsLeave(NewsLeaveParam newsLeaveReq, Integer news_id){
        String sql="insert into news_leave(name,email,message,news_id) values (?,?,?,?)";
        return jdbcTemplate.update(sql,newsLeaveReq.getName(),newsLeaveReq.getEmail(),newsLeaveReq.getMessage(),news_id);
    }
    public void change(int id,Boolean delete,Boolean top,Boolean status){
        if(delete!=null&&delete){
            jdbcTemplate.update("delete FROM news_language where news_id='"+id+"'");
            jdbcTemplate.update("delete FROM news where id='"+id+"'");
        }
        if(top!=null){
            jdbcTemplate.update("update news set top_time="+(top?"now()":"NULL")+" where id='"+id+"'");
        }
        if(status!=null){
            jdbcTemplate.update("update news set status="+(status?"1":"0")+" where id='"+id+"'");
        }
    }

    public List<Map<String,Object>> getAllType(){
        return jdbcTemplate.queryForList("select * from news_type");
    }

    public List<Map<String,Object>> getAllTag(){
        return jdbcTemplate.queryForList("select * from news_tags");
    }


    public int saveNews(NewsReq newsReq){
        String sql="insert into news(news,news_url,coverimg,des,detail,type_id,tags,source,create_time) values(?,?,?,?,?,?,?,?,now())";
        return jdbcTemplate.update(sql,newsReq.getNews(),newsReq.getNews_url(),newsReq.getCoverimg(),newsReq.getDes(),newsReq.getDetail(),newsReq.getType_id(),newsReq.getTags(),newsReq.getSource());
    }

    public List<Map<String,Object>> getAllLanList(int news_id){
        String sql="SELECT * FROM news_language where news_id="+news_id+" order by id DESC ";
        return jdbcTemplate.queryForList(sql);
    }

    public Map<String,Object> getNewsById(int news_id){
        return jdbcTemplate.queryForMap("select * from news where id="+news_id);
    }

    public Map<String,Object> getNewsLanById(int id){
        return jdbcTemplate.queryForMap("select * from news_language where id="+id);
    }
    public Map<String,Object> getNewsTypeLanById(int id){
        return jdbcTemplate.queryForMap("select * from news_type_language where id="+id);
    }

    @Async
    public List<Map<String,Object>> trans(int news_id){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from news where id="+news_id);
        if(item!=null){
            Object news=item.get("news");
            Object des=item.get("des");
            Object detail=item.get("detail");
            Object tags=item.get("tags");
            for(String key:Utils.getLans().keySet()){
                String newslan=Utils.toTran(news,"auto",key);
                String deslan=Utils.toTran(des,"auto",key);
                String detaillan=Utils.toTran(detail,"auto",key);
                String tagslan=Utils.toTran(tags,"auto",key);
                saveNewsLanguage(news_id,newslan,deslan,detaillan,tagslan,key);
            }
        }
        return getAllLanList(news_id);
    }

    @Transactional
    public void saveNewsLanguage(int id,String newsname,String des,String detail,String tags,String lan){
    	jdbcTemplate.update("delete from news_language where news_id=? and language=?",id,lan);
        jdbcTemplate.update("insert into news_language(newsname,des,detail,tags,language,news_id) values(?,?,?,?,?,?)",newsname,des,detail,tags,lan,id);
    }

    public List<Map<String,Object>> getAllNewType(){
        return jdbcTemplate.queryForList("SELECT * FROM `news_type`");
    }

    public List<Map<String,Object>> getAllNewLanType(int newstype_id){
        return jdbcTemplate.queryForList("SELECT * FROM `news_type_language` where type_id="+newstype_id+" order by id DESC ");
    }

    @Async
    public List<Map<String,Object>> transType(int type_id){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from news_type where id="+type_id);
        if(item!=null){
            jdbcTemplate.execute("delete from news_type_language where type_id="+type_id);
            Object type=item.get("type");
            for(String key:Utils.getLans().keySet()){
                String typelan=Utils.toTran(type,"auto",key);
                saveNewsTypeLanguage(type_id,typelan,key);
            }
        }
        return getAllNewLanType(type_id);
    }

    public void saveNewsTypeLanguage(int id,String typename,String lan){
        jdbcTemplate.update("insert into news_type_language(type_name,language,type_id) values(?,?,?)",typename,lan,id);
    }

    public int updateNews(NewsReq newsReq,Integer id){
        String sql="update news set news=?,news_url=?,coverimg=?,des=?,detail=?,type_id=?,tags=?,source=? where id=?";
        return jdbcTemplate.update(sql,newsReq.getNews(),newsReq.getNews_url(),newsReq.getCoverimg(),newsReq.getDes(),newsReq.getDetail(),newsReq.getType_id(),newsReq.getTags(),newsReq.getSource(),id);
    }
    public int updateNewsTypeLan(String type_name,Integer id){
        String sql="update news_type_language set type_name=? where id=?";
        return jdbcTemplate.update(sql,type_name,id);
    }

    public void saveNewsType(String type,String type_url){
        jdbcTemplate.update("insert into news_type(type,type_url) values(?,?)",type,type_url);
    }

    public Map<String,Object> getNewsTypeItem(int id){
        return jdbcTemplate.queryForMap("select * from news_type where id="+id);
    }

    public void updateNewsType(int id,String type,String type_url){
        jdbcTemplate.update("update news_type set type=?,type_url=? where id=?",type,type_url,id);
    }
    public void deleteNewsType(int id){
        jdbcTemplate.update("DELETE from news_type where id=?",id);
    }

    public void updateNewsLan(int id, String newsname,String des,String detail){
        jdbcTemplate.update("update news_language set newsname=?,des=?,detail=? where id=?",newsname,des,detail,id);
    }

    @Async
    public void transField(int id,String from,String to,String lan){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from news where id="+id);
        if(item!=null){
            Object fieldstr=item.get(from);
            String fieldlan=Utils.toTran(fieldstr,"auto",lan);
            String sql="update news_language set "+to+"=? where news_id=? and language=?";
            jdbcTemplate.update(sql,fieldlan,id,lan);

        }
    }

    @Async
    public void transFieldAll(int id,String from,String to){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from news where id="+id);
        if(item!=null){
            Object fieldstr=item.get(from);
            for(String lan:Utils.getLans().keySet()){
                String fieldlan=Utils.toTran(fieldstr,"auto",lan);
                String sql="update news_language set "+to+"=? where news_id=? and language=?";
                jdbcTemplate.update(sql,fieldlan,id,lan);
            }


        }
    }
}
