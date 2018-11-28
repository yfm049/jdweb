package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.utils.Utils;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by lenovo on 2017/2/13.
 */
public class BaseDao {
    @Autowired
    public JdbcTemplate jdbcTemplate;

    public DataResult queryResult(String sql,int pnum,int limit){
        DataResult result=new DataResult();
        result.setLimit(limit);
        result.setTotal(getCount(sql));
        result.setData(queryForPager(sql,pnum,limit));
        return result;
    }

    public List<Map<String,Object>> queryForPager(String sql,int pnum,int limit){
        String psql="select * from ("+sql+") c limit "+pnum+","+limit;
        System.out.println(psql);
        return jdbcTemplate.queryForList(psql);
    }


    public int getCount(String sql){
        Integer count= jdbcTemplate.queryForObject("SELECT count(*) from ("+sql+") c",Integer.class);
        return count==null?0:count;
    }



}
