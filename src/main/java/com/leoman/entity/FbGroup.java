package com.leoman.entity;

import javax.persistence.*;

/**
 * 班组
 */
@Entity
@Table(name = "PLM_FB_Group")
public class FbGroup {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "department_id")
    private FbDepartment department;

    @Column(name = "name")
    private String name;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public FbDepartment getDepartment() {
        return department;
    }

    public void setDepartment(FbDepartment department) {
        this.department = department;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
