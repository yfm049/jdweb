package com.jdconveyor.web.data;

import java.util.List;
import java.util.Map;

/**
 * Created by lenovo on 2017/2/14.
 */
public class DataResult {

    private int limit=30;

    private int total;
    private List<Map<String,Object>> data;

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public List<Map<String, Object>> getData() {
        return data;
    }

    public void setData(List<Map<String, Object>> data) {
        this.data = data;
    }
}
