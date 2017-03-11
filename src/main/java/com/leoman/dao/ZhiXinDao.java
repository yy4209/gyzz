package com.leoman.dao;

import com.leoman.entity.ZhiXin;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * ZhiXinDao
 * Created by 涂奕恒 on 2017/2/9 0009 15:45.
 */
public interface ZhiXinDao extends IBaseJpaRepository<ZhiXin> {

    @Query("select a from ZhiXin a where a.productId = ?1")
    List<ZhiXin> findListByProductId(String productId);

    @Query("select a from ZhiXin a where a.productId = ?1 and a.jCNR = ?2 order by a.id desc")
    List<ZhiXin> findListByProductIdAndJCNR(String productId, String jCNR);
}