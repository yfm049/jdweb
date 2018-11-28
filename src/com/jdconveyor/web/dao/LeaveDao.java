package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.data.Leave;
import org.springframework.stereotype.Repository;

/**
 * Created by lenovo on 2017/2/15.
 */
@Repository
public class LeaveDao extends BaseDao {
    public int saveLeave(Leave leave){
        String sql="insert into leavemsg(name,email,phone,message,date) values(?,?,?,?,now())";
        return jdbcTemplate.update(sql,leave.getName(),leave.getEmail(),leave.getPhone(),leave.getMessage());
    }

    public DataResult getAllLeave(int p){
        String sql="select * from leavemsg order by date desc";
        return queryResult(sql,p,30);
    }

    public int deleteLeave(Integer id){
        String sql="delete from leavemsg where id=?";
        return jdbcTemplate.update(sql,id);
    }

}
