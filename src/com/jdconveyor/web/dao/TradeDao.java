package com.jdconveyor.web.dao;

import com.jdconveyor.web.data.DataResult;
import com.jdconveyor.web.data.NewsReq;
import com.jdconveyor.web.data.TradeReq;
import com.jdconveyor.web.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/2/13.
 */
@Repository
public class TradeDao extends BaseDao{

    /**
     *
     * @param lan 语言
     * @return
     */
    public DataResult queryByLanguage(String lan, int p){
        String sql="SELECT a.* FROM trade_query a where a.status=1 ";
        if(!Utils.isEmpty(lan)){
            sql+=" and a.language='"+lan+"' ";
        }
        sql+=" order by date DESC";
        return queryResult(sql,p,15);
    }

    public Map<String,Object> getTotalTrade(String lan){
        String sql="SELECT sum(price) price,sum(weight) weight,count(*) amount,count(DISTINCT country) country from trade_query where status=1 and language=?";
        return jdbcTemplate.queryForMap(sql,lan);
    }

    public List<Map<String,Object>> getTopTrade(String language){
        String sql="select sum(price) FROM trade_query where status=1 AND language=?";
        Integer tprice=jdbcTemplate.queryForObject(sql,Integer.class,language);
        sql="select * from (SELECT area,round(sum(price)/"+tprice+"*100,0) proportion FROM trade_query where language=? group by area ) a order by proportion desc limit 6";
        return jdbcTemplate.queryForList(sql,language);
    }

    /**
     *
     * @return
     */
    public DataResult query(int p){
        String sql="SELECT a.*,b.product,product_url FROM trade a INNER JOIN product b on a.product_id=b.id order by a.date DESC";
        return queryResult(sql,p,15);
    }

    public void change(int id,Boolean delete,Boolean status){
        if(delete!=null&&delete){
            jdbcTemplate.update("delete FROM trade_language where trade_id='"+id+"'");
            jdbcTemplate.update("delete FROM trade where id='"+id+"'");
        }
        if(status!=null){
            jdbcTemplate.update("update trade set status="+(status?"1":"0")+" where id='"+id+"'");
        }
    }

    public int saveTrade(TradeReq tradeReq){
        String sql="insert into trade(country,area,product_id,price,weight,date) values(?,?,?,?,?,?)";
        return jdbcTemplate.update(sql,tradeReq.getCountry(),tradeReq.getArea(),tradeReq.getProduct_id(),tradeReq.getPrice(),tradeReq.getWeight(),tradeReq.getDate());
    }

    public Map<String,Object> getTradeById(int id){
        return jdbcTemplate.queryForMap("select * from trade where id="+id);
    }

    public int updateTrade(TradeReq tradeReq,Integer id){
        String sql="update trade set country=?,area=?,product_id=?,price=?,weight=?,date=? where id=?";
        return jdbcTemplate.update(sql,tradeReq.getCountry(),tradeReq.getArea(),tradeReq.getProduct_id(),tradeReq.getPrice(),tradeReq.getWeight(),tradeReq.getDate(),id);
    }

    public List<Map<String,Object>> getAllLanList(int id){
        String sql="SELECT * FROM trade_language where trade_id="+id;
        return jdbcTemplate.queryForList(sql);
    }

    public List<Map<String,Object>> trans(int id){
        Map<String,Object> item=jdbcTemplate.queryForMap("select * from trade where id="+id);
        if(item!=null){
            jdbcTemplate.execute("delete from trade_language where trade_id="+id);
            Object country=item.get("country");
            Object area=item.get("area");

            for(String key:Utils.getLans().keySet()){
                String countrylan=Utils.toTran(country,"zh",key);
                String arealan=Utils.toTran(area,"zh",key);
                savetradeLanguage(id,countrylan,arealan,key);
            }
        }
        return getAllLanList(id);
    }

    public void savetradeLanguage(int id,String countrylan,String arealan,String lan){
        jdbcTemplate.update("insert into trade_language(country,area,language,trade_id) values(?,?,?,?)",countrylan,arealan,lan,id);
    }

    public Map<String,Object> gettradeLanById(int id){
        return jdbcTemplate.queryForMap("select * from trade_language where id="+id);
    }
    public void updatetradeLan(int id, String countrylan,String arealan){
        jdbcTemplate.update("update trade_language set country=?,area=? where id=?",countrylan,arealan,id);
    }

    public List<Map<String,Object>> getAllCountryState(){
        return jdbcTemplate.queryForList("SELECT DISTINCT state FROM `country`");
    }
    public List<Map<String,Object>> getAllCountry(Object state){
        return jdbcTemplate.queryForList("SELECT * FROM `country` where state=?",state);
    }
}
