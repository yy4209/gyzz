package com.leoman.service;

import com.leoman.entity.PPPF;
import com.leoman.entity.vo.DetailVo;
import com.leoman.exception.ParamErrorException;
import com.leoman.service.common.ICommonService;

import java.util.List;
import java.util.Map;

/**
 * FbDetailService
 * Created by 涂奕恒 on 2017/2/9 0009 15:45.
 */
public interface PPPFService extends ICommonService<PPPF> {

    // 查询工步列表
    List<DetailVo> findListByParam(String code);

    // 查询工序列表
    List<DetailVo> findListByParam(String code, String step);

    // 首页数据统计
    Map<String, Object> getData(String userName) throws ParamErrorException;
}