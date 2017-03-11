package com.leoman.entity;

import javax.persistence.*;

/**
 * 检测结果
 */
@Entity
@Table(name = "PLM_FB_Detail")
public class FbDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "standard")
    private String standard;

    @Column(name = "content")
    private String content;

    @Column(name = "remark")
    private String remark;

    @Column(name = "conclusion")
    private String conclusion;

    @Column(name = "fBfile")
    private String fBfile;

    @Column(name = "checkResult")
    private String checkResult;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStandard() {
        return standard;
    }

    public void setStandard(String standard) {
        this.standard = standard;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public String getfBfile() {
        return fBfile;
    }

    public void setfBfile(String fBfile) {
        this.fBfile = fBfile;
    }

    public String getCheckResult() {
        return checkResult;
    }

    public void setCheckResult(String checkResult) {
        this.checkResult = checkResult;
    }
}
