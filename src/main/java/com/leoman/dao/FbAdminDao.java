package com.leoman.dao;

import com.leoman.entity.FbAdmin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * AdminDao
 * Created by 涂奕恒 on 2016/11/23 0023 下午 3:40.
 */
public interface FbAdminDao extends JpaRepository<FbAdmin, Integer>, JpaSpecificationExecutor<FbAdmin> {

    @Query("select a from FbAdmin a where a.account = ?1")
    FbAdmin findOneByAccount(String account);
}