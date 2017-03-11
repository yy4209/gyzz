package com.leoman.service;

import com.leoman.entity.FbDetail;
import com.leoman.service.common.ICommonService;

/**
 * VmDetailService
 * Created by 涂奕恒 on 2017/2/9 0009 15:46.
 */
public interface FbDetailService extends ICommonService<FbDetail> {

    // 更新检测结果
    void updateInfo(Integer checkResultId,
                    String userName,
                    String remark,
                    String conclusion,
                    String fBfile,
                    String checkResult,
                    Integer updateId,
                    String updateFlow,
                    String updateModule);
}