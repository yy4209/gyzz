package com.leoman.core;

/**
 * 基本常量设置
 * Created by 涂奕恒 on 2015/6/24.
 */
public interface Constant {

    // 首页查询天数
    Integer days = 1;

    // 总管理后台当前登录管理员
    String CURRENT_ADMIN_USER = "";

    // 默认编码
    String ENCODING = "UTF-8";

    // 默认每页显示条数
    Integer PAGE_DEF_SIZE = 10;

    // 账户密码是否使用MD5加密
    Boolean isMd5 = false;
}
