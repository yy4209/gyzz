package com.leoman.entity.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 检测结果VO类
 * Created by 涂奕恒 on 2017/2/13 0013.
 */
public class CheckResultVo {

    // id
    private Integer id;

    // 序号
    private String num;

    // 是否提交，0=否，1=是
    private String canModify;

    // 检测结果集合
    private List<DetailVo> detailList = new ArrayList<>();

    // 合格率
    private Double passRate = 100.0;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public List<DetailVo> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<DetailVo> detailList) {
        this.detailList = detailList;
    }

    public Double getPassRate() {
        return passRate;
    }

    public void setPassRate(Double passRate) {
        this.passRate = passRate;
    }
}
