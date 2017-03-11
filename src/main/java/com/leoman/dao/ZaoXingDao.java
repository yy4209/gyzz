package com.leoman.dao;

import com.leoman.entity.ZaoXing;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * ZaoXingDao
 * Created by 涂奕恒 on 2017/2/9 0009 15:45.
 */
public interface ZaoXingDao extends IBaseJpaRepository<ZaoXing> {

    @Query("select a from ZaoXing a where a.productId = ?1")
    List<ZaoXing> findListByProductId(String productId);

    @Query("select a from ZaoXing a where a.productId = ?1 and a.jCNR = ?2 order by a.id desc")
    List<ZaoXing> findListByProductIdAndJCNR(String productId, String jCNR);
}