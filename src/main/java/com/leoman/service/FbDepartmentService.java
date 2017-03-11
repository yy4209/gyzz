package com.leoman.service;

import com.leoman.entity.FbDepartment;
import com.leoman.service.common.ICommonService;

import java.util.List;

/**
 * FbDepartmentService
 * Created by 涂奕恒 on 2017/2/16 0016 12:02.
 */
public interface FbDepartmentService extends ICommonService<FbDepartment> {

    // 根据公司id查询该公司的所有部门信息
    List<FbDepartment> findListByCompanyId(Integer companyId);
}