package com.leoman.service;

import com.leoman.entity.ZaoXing;
import com.leoman.service.common.ICommonService;

import java.util.List;
import java.util.Map;

/**
 * ZaoXingService
 * Created by 涂奕恒 on 2017/2/9 0009 15:46.
 */
public interface ZaoXingService extends ICommonService<ZaoXing> {

    // 根据产品代码查询对应的工序信息记录
    Map<String, Object> findListByParam(String code);

    // 提交产品检测信息
    void submitCheckInfo(String code, String userName);

    // 获取所有制芯记录信息
    Integer[] getCount(String userName, String startTime, String endTime);

    // 获取检测状态
    Integer getStatus(List<ZaoXing> zaoXingList);

    // 获取提交状态
    Integer getCanModifyStatus(String code);
}