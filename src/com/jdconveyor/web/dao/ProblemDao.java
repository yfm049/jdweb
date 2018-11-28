package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.data.ProblemReq;
import com.jdconveyor.web.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/20.
 */
@Repository
public class ProblemDao extends BaseDao{


    public List<Map<String,Object>> getAllProblem(String language){
        String sql="select * from problem_view where status=1 AND language=?";
        return jdbcTemplate.queryForList(sql,language);
    }

    /**
     *
     * @return
     */
    public DataResult query(int p){
        String sql="SELECT * from problem order by id desc";
        return queryResult(sql,p,15);
    }

    public void change(int id,Boolean delete,Boolean status){
        if(delete!=null&&delete){
            jdbcTemplate.update("delete FROM problem_language where problem_id='"+id+"'");
            jdbcTemplate.update("delete FROM problem where id='"+id+"'");
        }
        if(status!=null){
            jdbcTemplate.update("update problem set status="+(status?"1":"0")+" where id='"+id+"'");
        }
    }

    public int saveproblem(ProblemReq problemReq){
        String sql="insert into problem(question,answer) values(?,?)";
        return jdbcTemplate.update(sql,problemReq.getQuestion(),problemReq.getAnswer());
    }

    public Map<String,Object> getproblemById(int id){
        return jdbcTemplate.queryForMap("select * from problem where id="+id);
    }

    public int updateproblem(ProblemReq problemReq,Integer id){
        String sql="update problem set question=?,answer=? where id=?";
        return jdbcTemplate.update(sql,problemReq.getQuestion(),problemReq.getAnswer(),id);
    }

    public List<Map<String,Object>> getAllLanList(int id){
        String sql="SELECT * FROM problem_language where problem_id="+id;
        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String,Object>> trans(int id){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from problem where id="+id);
        if(item!=null){
            jdbcTemplate.execute("delete from problem_language where problem_id="+id);
            Object question=item.get("question");
            Object answer=item.get("answer");

            for(String key: Utils.getLans().keySet()){
                String questionlan=Utils.toTran(question,"auto",key);
                String answerlan=Utils.toTran(answer,"auto",key);
                saveproblemLanguage(id,questionlan,answerlan,key);
            }
        }
        return getAllLanList(id);
    }

    public void saveproblemLanguage(int id,String questionlan,String answerlan,String lan){
        jdbcTemplate.update("insert into problem_language(question,answer,language,problem_id) values(?,?,?,?)",questionlan,answerlan,lan,id);
    }

    public Map<String,Object> getproblemLanById(int id){
        return jdbcTemplate.queryForMap("select * from problem_language where id="+id);
    }
    public void updateproblemLan(int id, String questionlan,String answerlan){
        jdbcTemplate.update("update problem_language set question=?,answer=? where id=?",questionlan,answerlan,id);
    }
}
