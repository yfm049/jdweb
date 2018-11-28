package com.jdconveyor.web.translator;

import com.jdconveyor.web.data.TransResult;

/**
 * Created by lenovo on 2017/2/22.
 */
public interface TranslatorApi {

    public TransResult getTransResult(String query, String from, String to);
}
