package com.leoman.entity;

import javax.persistence.*;

/**
 * 产品信息
 */
@Entity
@Table(name = "view_km_znt_scrwd")
public class ViewKmZntScrwd {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "产品代码")
    private String code;

    @Column(name = "产品名称")
    private String name;

    @Column(name = "规格型号")
    private String type;

    @Column(name = "顾客")
    private String customer;

    @Column(name = "单位")
    private String unit;

    @Column(name = "单位净重")
    private String weight;

    @Column(name = "材质")
    private String material;

    @Column(name = "图号")
    private String bgNum;

    @Column(name = "件号")
    private String countNum;

    @Column(name = "计划生产数量")
    private String planProductCount;

    @Column(name = "计划开工日期")
    private String planStartDate;

    @Column(name = "计划完工日期")
    private String planEndDate;

    @Column(name = "生产车间")
    private String workShop;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getBgNum() {
        return bgNum;
    }

    public void setBgNum(String bgNum) {
        this.bgNum = bgNum;
    }

    public String getCountNum() {
        return countNum;
    }

    public void setCountNum(String countNum) {
        this.countNum = countNum;
    }

    public String getPlanProductCount() {
        return planProductCount;
    }

    public void setPlanProductCount(String planProductCount) {
        this.planProductCount = planProductCount;
    }

    public String getPlanStartDate() {
        return planStartDate;
    }

    public void setPlanStartDate(String planStartDate) {
        this.planStartDate = planStartDate;
    }

    public String getPlanEndDate() {
        return planEndDate;
    }

    public void setPlanEndDate(String planEndDate) {
        this.planEndDate = planEndDate;
    }

    public String getWorkShop() {
        return workShop;
    }

    public void setWorkShop(String workShop) {
        this.workShop = workShop;
    }
}