package com.jdconveyor.web.data;

import com.jdconveyor.web.utils.Utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lenovo on 2017/2/15.
 */
public class TransResult {

    /**
     * from : zh
     * to : cs
     * trans_result : [{"src":"捷克语","dst":"česky"}]
     */

    private String from;
    private String to;
    private List<Result> trans_result;
    /**
     * error_code : 58001
     * error_msg : INVALID_TO_PARAM
     * monLang : zh
     * query : 越南语
     */

    public boolean isSuccess(){
        if(Utils.isEmpty(error_code)){
            return true;
        }
        return false;
    }

    private String error_code;
    private String error_msg;
    private String monLang;
    private String query;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public Result getTransResult() {
        return trans_result.get(0);
    }

    public List<Result> getTrans_result() {
        return trans_result;
    }

    public void setTransResult(Result tresult) {
        List<Result> resultList=new ArrayList<>();
        resultList.add(tresult);
        this.trans_result = resultList;
    }

    public void setTrans_result(List<Result> trans_result) {
        this.trans_result = trans_result;
    }

    public String getError_code() {
        return error_code;
    }

    public void setError_code(String error_code) {
        this.error_code = error_code;
    }

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }

    public String getMonLang() {
        return monLang;
    }

    public void setMonLang(String monLang) {
        this.monLang = monLang;
    }

    public String getQuery() {
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }

    public static class Result {
        /**
         * src : 捷克语
         * dst : česky
         */

        private String src;
        private String dst;

        public String getSrc() {
            return src;
        }

        public void setSrc(String src) {
            this.src = src;
        }

        public String getDst() {
            return dst==null?"":dst.replaceAll("\\s\\|\\s","|").replaceAll("\\s-\\s","-");
        }

        public void setDst(String dst) {
            this.dst = dst;
        }
    }
}
