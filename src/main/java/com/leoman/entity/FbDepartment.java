package com.leoman.entity;

import javax.persistence.*;

/**
 * 部门
 */
@Entity
@Table(name = "PLM_FB_Department")
public class FbDepartment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private FbCompany company;

    @Column(name = "name")
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public FbCompany getCompany() {
        return company;
    }

    public void setCompany(FbCompany company) {
        this.company = company;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
