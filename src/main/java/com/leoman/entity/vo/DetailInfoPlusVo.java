package com.leoman.entity.vo;

/**
 * 工步or工序VO类
 * Created by 涂奕恒 on 2017/2/13 0013.
 */
public class DetailInfoPlusVo {

    // 完成状态
    private Integer status;

    // 检测结果id
    private String checkResultId;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getCheckResultId() {
        return checkResultId;
    }

    public void setCheckResultId(String checkResultId) {
        this.checkResultId = checkResultId;
    }
}
