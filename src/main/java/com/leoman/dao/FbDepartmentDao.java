package com.leoman.dao;

import com.leoman.entity.FbDepartment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * FbDepartmentDao
 * Created by 涂奕恒 on 2017/2/16 0016 12:01.
 */
public interface FbDepartmentDao extends JpaRepository<FbDepartment, Integer>, JpaSpecificationExecutor<FbDepartment> {

    @Query("select a from FbDepartment a where a.company.id = ?1")
    List<FbDepartment> findListByCompanyId(Integer companyId);
}