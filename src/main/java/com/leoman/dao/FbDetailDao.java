package com.leoman.dao;

import com.leoman.entity.FbDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * VmDetailDao
 * Created by 涂奕恒 on 2017/2/9 0009 15:45.
 */
public interface FbDetailDao extends JpaRepository<FbDetail, Integer>, JpaSpecificationExecutor<FbDetail> {

}