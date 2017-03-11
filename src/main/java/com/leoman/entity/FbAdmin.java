package com.leoman.entity;

import javax.persistence.*;

/**
 * 用户
 */
@Entity
@Table(name = "PLM_FB_Master")
public class FbAdmin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "account")
    private String account;

    @Column(name = "password")
    private String password;

    @ManyToOne
    @JoinColumn(name = "group_id")
    private FbGroup group;

    @Column(name = "competence")
    private String competence;

    @Column(name = "create_time")
    private Long createTime = System.currentTimeMillis();

    @Column(name = "update_time")
    private Long updateTime;

    @Transient
    private String company;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public FbGroup getGroup() {
        return group;
    }

    public void setGroup(FbGroup group) {
        this.group = group;
    }

    public String getCompetence() {
        return competence;
    }

    public void setCompetence(String competence) {
        this.competence = competence;
    }

    public Long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long createTime) {
        this.createTime = createTime;
    }

    public Long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Long updateTime) {
        this.updateTime = updateTime;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }
}
