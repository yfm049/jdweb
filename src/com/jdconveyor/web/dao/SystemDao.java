package com.jdconveyor.web.dao;

import org.springframework.stereotype.Repository;

/**
 * Created by lenovo on 2016/12/20.
 */
@Repository
public class SystemDao extends BaseDao{

    public boolean login(String name,String pass){
        String sql="select count(*) from admin where name=? and pass=?";
        return jdbcTemplate.queryForObject(sql,Integer.class,name,pass)>0;
    }

}
