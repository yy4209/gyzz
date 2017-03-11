package com.leoman.core;


import com.leoman.utils.ConfigUtil;

/**
 * Created by wangbin on 2014/11/27.
 */
public class Configue {

    public static String getUploadUrl() {
        return ConfigUtil.getString("upload.url");
    }

    public static String getServerUrl() {
        return ConfigUtil.getString("upload.server.path");
    }

    public static String getUploadPath() {
        return ConfigUtil.getString("upload.path");
    }

    public static String getBaseUrl() {
        return ConfigUtil.getString("base.url");
    }

    public static String getBaseDomain() {
        return ConfigUtil.getString("base.domain");
    }

    public static Integer getBaseDepartType() {
        return Integer.parseInt(ConfigUtil.getString("base.depart"));
    }
}
