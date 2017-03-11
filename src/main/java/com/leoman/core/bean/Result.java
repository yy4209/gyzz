package com.leoman.core.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 涂奕恒
 */
public final class Result {

    private Integer status;                                           // 状态 0:成功 1:失败（异常）
    private String msg;                                               // 错误信息
    private Object data = new HashMap<String, Object>();              // 数据内容

    private static final int SUCCESS = 0;                             // 成功
    private static final int FAIL = 1;                                // 失败

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static Result success(String... errorMessage) {
        Result result = new Result();
        result.status = SUCCESS;
        if (errorMessage == null || errorMessage.length == 0) {
            result.msg = "操作成功";
        } else {
            result.msg = errorMessage[0];
        }
        return result;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Result success(Object data) {
        Result result = new Result();
        result.status = SUCCESS;
        result.msg = "";
        result.data = data;
        return result;
    }

    public static Result successApi() {
        Result result = new Result();
        result.status = SUCCESS;
        result.msg = "";
        return result;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Result successApi(Object data) {
        Result result = new Result();
        result.status = SUCCESS;
        result.msg = "";
        result.data = data;
        return result;
    }

    public static Result successListApi(Object data) {
        Map<String, Object> map = new HashMap<>();
        Result result = new Result();
        result.status = SUCCESS;
        result.msg = "";
        map.put("list", data);
        result.data = map;
        return result;
    }

    public static Result failureApi(String errorInfo) {
        Result result = new Result();
        result.status = FAIL;
        result.msg = errorInfo;
        return result;
    }

    public static Result successInfoApi(Object object, String name) {
        Map<String, Object> map = new HashMap<>();
        Result result = new Result();
        map.put(name, object);
        result.status = SUCCESS;
        result.msg = "";
        result.data = map;
        return result;
    }
}