package com.leoman.entity.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 工步or工序VO类
 * Created by 涂奕恒 on 2017/2/13 0013.
 */
public class DetailInfoVo {

    // 更新id
    private Integer id;

    // 合格率
    private Double passRate = 100.0;

    private List<DetailInfoPlusVo> childList = new ArrayList<>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getPassRate() {
        return passRate;
    }

    public void setPassRate(Double passRate) {
        this.passRate = passRate;
    }

    public List<DetailInfoPlusVo> getChildList() {
        return childList;
    }

    public void setChildList(List<DetailInfoPlusVo> childList) {
        this.childList = childList;
    }
}
