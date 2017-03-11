package com.leoman.service;

import com.leoman.entity.ViewKmZntScrwd;
import com.leoman.service.common.ICommonService;
import org.springframework.data.domain.Page;

import java.util.Map;

/**
 * ViewKmZntScrwdService
 * Created by 涂奕恒 on 2017/2/9 0009 15:46.
 */
public interface ViewKmZntScrwdService extends ICommonService<ViewKmZntScrwd> {

    // 分页查询
    Page<ViewKmZntScrwd> iPageByParams(Integer pageNum, Integer pageSize);

    // 分页查询
    Page<ViewKmZntScrwd> iPageByParams(String type, Integer pageNum, Integer pageSize);
}