package com.leoman.entity.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 检测结果VO类
 * Created by 涂奕恒 on 2017/2/13 0013.
 */
public class CheckResultInfoVo {

    // 序号
    private String num;

    // 是否提交，0=否，1=是
    private String canModify;

    // 检测结果集合
    private List<DetailInfoVo> detailList = new ArrayList<>();

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getCanModify() {
        return canModify;
    }

    public void setCanModify(String canModify) {
        this.canModify = canModify;
    }

    public List<DetailInfoVo> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<DetailInfoVo> detailList) {
        this.detailList = detailList;
    }
}
