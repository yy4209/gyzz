package com.leoman.entity;

import javax.persistence.*;

/**
 * 产品列表
 */
@Entity
@Table(name = "PLM_ProgramPlanning_FlowChart")
public class PPPF {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "product_id")
    private String product_id;

    @Column(name = "process_step")
    private String process_step;

    @Column(name = "process_flow")
    private String process_flow;

    @Column(name = "principal")
    private String principal;

    @Column(name = "time_span")
    private String time_span;

    @Column(name = "conclusion")
    private String conclusion;

    @Column(name = "CreateTime")
    private String CreateTime;

    @Column(name = "NewProductVersion")
    private String NewProductVersion;

    @Column(name = "ModelType")
    private String ModelType;

    @Column(name = "ModelVersion")
    private String ModelVersion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getProcess_step() {
        return process_step;
    }

    public void setProcess_step(String process_step) {
        this.process_step = process_step;
    }

    public String getProcess_flow() {
        return process_flow;
    }

    public void setProcess_flow(String process_flow) {
        this.process_flow = process_flow;
    }

    public String getPrincipal() {
        return principal;
    }

    public void setPrincipal(String principal) {
        this.principal = principal;
    }

    public String getTime_span() {
        return time_span;
    }

    public void setTime_span(String time_span) {
        this.time_span = time_span;
    }

    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public String getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(String createTime) {
        CreateTime = createTime;
    }

    public String getNewProductVersion() {
        return NewProductVersion;
    }

    public void setNewProductVersion(String newProductVersion) {
        NewProductVersion = newProductVersion;
    }

    public String getModelType() {
        return ModelType;
    }

    public void setModelType(String modelType) {
        ModelType = modelType;
    }

    public String getModelVersion() {
        return ModelVersion;
    }

    public void setModelVersion(String modelVersion) {
        ModelVersion = modelVersion;
    }
}
