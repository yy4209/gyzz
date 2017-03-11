package com.leoman.dao;

import com.leoman.entity.HeXiang;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * HeXiangDao
 * Created by 涂奕恒 on 2017/2/9 0009 15:44.
 */
public interface HeXiangDao extends IBaseJpaRepository<HeXiang> {

    @Query("select a from HeXiang a where a.productId = ?1")
    List<HeXiang> findListByProductId(String productId);

    @Query("select a from HeXiang a where a.productId = ?1 and a.jCNR = ?2 order by a.id desc")
    List<HeXiang> findListByProductIdAndJCNR(String productId, String jCNR);
}