package com.leoman.dao;

import com.leoman.entity.FbCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * FbCompanyDao
 * Created by 涂奕恒 on 2017/2/16 0016 12:01.
 */
public interface FbCompanyDao extends JpaRepository<FbCompany, Integer>, JpaSpecificationExecutor<FbCompany> {

}