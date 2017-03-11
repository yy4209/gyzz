package com.leoman.dao;

import com.leoman.entity.MoJu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * MoJuDao
 * Created by 涂奕恒 on 2017/2/9 0009 15:45.
 */
public interface MoJuDao extends IBaseJpaRepository<MoJu> {

    @Query("select a from MoJu a where a.productId = ?1")
    List<MoJu> findListByProductId(String productId);

    @Query("select a from MoJu a where a.productId = ?1 and a.jCNR = ?2 order by a.id desc")
    List<MoJu> findListByProductIdAndJCNR(String productId, String jCNR);
}