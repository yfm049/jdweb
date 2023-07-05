package com.jdconveyor.web.translator;

import java.util.Map;

/**
 * Created by lenovo on 2017/2/22.
 */
public interface TranslatorApi {

    public Map<String, String> getTransResult(String query, String from, String to);
}
