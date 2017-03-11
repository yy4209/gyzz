package com.leoman.service;

import com.leoman.entity.FbGroup;
import com.leoman.service.common.ICommonService;

import java.util.List;

/**
 * FbGroupService
 * Created by 涂奕恒 on 2017/2/16 0016 12:02.
 */
public interface FbGroupService extends ICommonService<FbGroup> {

    // 根据部门id查询该部门的所有班组信息
    List<FbGroup> findListByDepartmentId(Integer departmentId);
}