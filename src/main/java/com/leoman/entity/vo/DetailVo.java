package com.leoman.entity.vo;

import java.util.ArrayList;
import java.util.List;

/**
 * 工步or工序VO类
 * Created by 涂奕恒 on 2017/2/13 0013.
 */
public class DetailVo {

    // 工步
    private String content;

    // 完成状态
    private Integer status;

    // 检测结果id
    private String checkResultId;

    private List<DetailVo> list = new ArrayList<>();

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

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

    public List<DetailVo> getList() {
        return list;
    }

    public void setList(List<DetailVo> list) {
        this.list = list;
    }
}
