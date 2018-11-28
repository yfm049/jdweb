package com.jdconveyor.web.utils;

import java.io.*;
import java.text.Collator;
import java.util.*;

/**
 * Created by lenovo on 2017/2/23.
 */
public class MessageProperties extends Properties {
    private final List<Object> keys = new ArrayList<>();
    public Enumeration<Object> keys() {
        return Collections.<Object> enumeration(keys);
    }

    public void sort(){
        keys.addAll(super.keySet());
        Collections.sort(keys, Collator.getInstance(Locale.ENGLISH));
    }



}
