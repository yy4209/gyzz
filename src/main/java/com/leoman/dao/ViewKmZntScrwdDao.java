package com.leoman.dao;

import com.leoman.entity.ViewKmZntScrwd;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

/**
 * ViewKmZntScrwdDao
 * Created by 涂奕恒 on 2017/2/9 0009 15:45.
 */
public interface ViewKmZntScrwdDao extends JpaRepository<ViewKmZntScrwd, Integer>, JpaSpecificationExecutor<ViewKmZntScrwd> {

    @Query("select a from ViewKmZntScrwd a")
    Page<ViewKmZntScrwd> iPageByParams(Pageable pageable);

    @Query("select a from ViewKmZntScrwd a where a.type = ?1")
    Page<ViewKmZntScrwd> iPageByParamsPlus(String type, Pageable pageable);
}