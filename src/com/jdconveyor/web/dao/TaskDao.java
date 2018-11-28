package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import org.springframework.stereotype.Repository;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by lenovo on 2017/3/23.
 */
@Repository
public class TaskDao extends BaseDao {

    private static Map<Integer,String> status=new LinkedHashMap<>();
    static {
        status.put(0,"未开始");
        status.put(1,"正在执行");
        status.put(2,"执行完成");
        status.put(3,"执行失败");
        status.put(4,"已停止");
    }

    public Map<Integer,String> getStatus(){
        return status;
    }


    public DataResult getAllTask(int p){
        String sql="select * FROM task a order by a.id DESC";
        return queryResult(sql,p,15);
    }
}
