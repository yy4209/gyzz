package com.leoman.dao;

import com.leoman.entity.PPPF;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * PPPFDao
 * Created by 涂奕恒 on 2017/2/13 0013 13:37.
 */
public interface PPPFDao extends IBaseJpaRepository<PPPF> {

    @Query("select a from PPPF a where a.product_id = ?1")
    List<PPPF> findListByParam(String code);

    @Query("select a from PPPF a where a.product_id = ?1 and a.process_step = ?2")
    List<PPPF> findListByParam(String code, String step);

    @Query("select a from PPPF a where a.product_id = ?1 and a.process_step = ?2 and a.process_flow = ?3")
    List<PPPF> findListByParam(String code, String step, String flow);

    @Query("select a from PPPF a where a.CreateTime >= ?1 and a.CreateTime < ?2")
    List<PPPF> findListByTime(String startTime, String endTime);
}