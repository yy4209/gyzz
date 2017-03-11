package com.leoman.dao;

import com.leoman.entity.FbGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * FbGroupDao
 * Created by 涂奕恒 on 2017/2/16 0016 12:02.
 */
public interface FbGroupDao extends JpaRepository<FbGroup, Integer>, JpaSpecificationExecutor<FbGroup> {

    @Query("select a from FbGroup a where a.department.id = ?1")
    List<FbGroup> findListByDepartmentId(Integer departmentId);
}