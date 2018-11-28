package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.data.TeamReq;
import com.jdconveyor.web.data.TradeReq;
import com.jdconveyor.web.utils.Utils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2016/12/20.
 */
@Service
public class TeamDao extends BaseDao{

    public List<Map<String,Object>> getAllTeam(String language){
        String sql="select * from team_view where status=1 AND language=? ";
        return jdbcTemplate.queryForList(sql,language);
    }

    /**
     *
     * @return
     */
    public DataResult query(int p){
        String sql="SELECT * from team order by id desc";
        return queryResult(sql,p,15);
    }

    public void change(int id,Boolean delete,Boolean status){
        if(delete!=null&&delete){
            jdbcTemplate.update("delete FROM team_language where team_id='"+id+"'");
            jdbcTemplate.update("delete FROM team where id='"+id+"'");
        }
        if(status!=null){
            jdbcTemplate.update("update team set status="+(status?"1":"0")+" where id='"+id+"'");
        }
    }

    public int saveTeam(TeamReq teamReq){
        String sql="insert into team(avatar,name,job,des,facebook,twitter,linkin,email) values(?,?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql,teamReq.getAvatar(),teamReq.getName(),teamReq.getJob(),teamReq.getDes(),teamReq.getFacebook(),teamReq.getTwitter(),teamReq.getLinkin(),teamReq.getEmail());
    }

    public Map<String,Object> getTeamById(int id){
        return jdbcTemplate.queryForMap("select * from team where id="+id);
    }

    public int updateTeam(TeamReq teamReq,Integer id){
        String sql="update team set avatar=?,name=?,job=?,des=?,facebook=?,twitter=?,linkin=?,email=? where id=?";
        return jdbcTemplate.update(sql,teamReq.getAvatar(),teamReq.getName(),teamReq.getJob(),teamReq.getDes(),teamReq.getFacebook(),teamReq.getTwitter(),teamReq.getLinkin(),teamReq.getEmail(),id);
    }

    public List<Map<String,Object>> getAllLanList(int id){
        String sql="SELECT * FROM team_language where team_id="+id;
        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String,Object>> trans(int id){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from team where id="+id);
        if(item!=null){
            jdbcTemplate.execute("delete from team_language where team_id="+id);
            Object job=item.get("job");
            Object des=item.get("des");

            for(String key: Utils.getLans().keySet()){
                String joblan=Utils.toTran(job,"auto",key);
                String deslan=Utils.toTran(des,"auto",key);
                saveTeamLanguage(id,joblan,deslan,key);
            }
        }
        return getAllLanList(id);
    }

    public void saveTeamLanguage(int id,String joblan,String deslan,String lan){
        jdbcTemplate.update("insert into team_language(job,des,language,team_id) values(?,?,?,?)",joblan,deslan,lan,id);
    }

    public Map<String,Object> getTeamLanById(int id){
        return jdbcTemplate.queryForMap("select * from team_language where id="+id);
    }
    public void updateTeamLan(int id, String joblan,String deslan){
        jdbcTemplate.update("update team_language set job=?,des=? where id=?",joblan,deslan,id);
    }
}
