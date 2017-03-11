package com.leoman.entity;

import javax.persistence.*;

/**
 * 合箱
 */
@Entity
@Table(name = "PLM_FB_HeXiang")
public class HeXiang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "product_id")
    private String productId;

    @Column(name = "jCNR")
    private String jCNR;

    @Column(name = "jCNR_")
    private String jCNR_;

    @Column(name = "tYXM")
    private String tYXM;

    @Column(name = "zXJCNR")
    private String zXJCNR;

    @Column(name = "gJCC")
    private String gJCC;

    @Column(name = "file1")
    private String file1;

    @Column(name = "castingNum")
    private String castingNum;

    @Column(name = "canModify")
    private String canModify;

    @Column(name = "reason")
    private String reason;

    @Column(name = "formId")
    private Integer formId;

    @Column(name = "maker_id")
    private String maker_id;

    @Column(name = "checker_id")
    private String checker_id;

    @Column(name = "quality")
    private String quality;

    @Column(name = "factoryCode")
    private String factoryCode;

    @Column(name = "weight")
    private String weight;

    @Column(name = "userName")
    private String userName;

    @Column(name = "CreateTime")
    private String CreateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getjCNR() {
        return jCNR;
    }

    public void setjCNR(String jCNR) {
        this.jCNR = jCNR;
    }

    public String getjCNR_() {
        return jCNR_;
    }

    public void setjCNR_(String jCNR_) {
        this.jCNR_ = jCNR_;
    }

    public String gettYXM() {
        return tYXM;
    }

    public void settYXM(String tYXM) {
        this.tYXM = tYXM;
    }

    public String getzXJCNR() {
        return zXJCNR;
    }

    public void setzXJCNR(String zXJCNR) {
        this.zXJCNR = zXJCNR;
    }

    public String getgJCC() {
        return gJCC;
    }

    public void setgJCC(String gJCC) {
        this.gJCC = gJCC;
    }

    public String getFile1() {
        return file1;
    }

    public void setFile1(String file1) {
        this.file1 = file1;
    }

    public String getCastingNum() {
        return castingNum;
    }

    public void setCastingNum(String castingNum) {
        this.castingNum = castingNum;
    }

    public String getCanModify() {
        return canModify;
    }

    public void setCanModify(String canModify) {
        this.canModify = canModify;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getFormId() {
        return formId;
    }

    public void setFormId(Integer formId) {
        this.formId = formId;
    }

    public String getMaker_id() {
        return maker_id;
    }

    public void setMaker_id(String maker_id) {
        this.maker_id = maker_id;
    }

    public String getChecker_id() {
        return checker_id;
    }

    public void setChecker_id(String checker_id) {
        this.checker_id = checker_id;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public String getFactoryCode() {
        return factoryCode;
    }

    public void setFactoryCode(String factoryCode) {
        this.factoryCode = factoryCode;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(String createTime) {
        CreateTime = createTime;
    }
}
