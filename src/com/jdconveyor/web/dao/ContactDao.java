package com.jdconveyor.web.dao;


import com.jdconveyor.web.data.ContactReq;
import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.data.Pager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/20.
 */
@Repository
public class ContactDao extends BaseDao{

    public int saveContact(ContactReq contactReq){
        String sql="insert into contact(name,url,email,keyword,type,date,country,favorite) values(?,?,?,?,?,now(),?,?)";
        return jdbcTemplate.update(sql,contactReq.getName(),contactReq.getUrl(),contactReq.getEmail(),contactReq.getKeyword(),contactReq.getType(),contactReq.getCountry(),contactReq.getFavorite());
    }

    public DataResult getAllContact(int p){
        String sql="select * FROM contact a order by a.favorite DESC ,a.id DESC";
        return queryResult(sql,p,15);
    }

    public Map<String,Object> getItemContact(Integer id){
        String sql="select * from contact where id=?";
        return jdbcTemplate.queryForMap(sql,id);
    }

    public int updateContact(ContactReq contactReq,Integer id){
        String sql="update contact set name=?,url=?,email=?,keyword=?,type=?,country=?,favorite=? where id=?";
        return jdbcTemplate.update(sql,contactReq.getName(),contactReq.getUrl(),contactReq.getEmail(),contactReq.getKeyword(),contactReq.getType(),contactReq.getCountry(),contactReq.getFavorite(),id);
    }

    public int deleteContact(Integer id){
        String sql="delete from contact where id=?";
        return jdbcTemplate.update(sql,id);
    }

}
