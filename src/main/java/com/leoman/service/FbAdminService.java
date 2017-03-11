package com.leoman.service;

import com.leoman.entity.FbAdmin;
import com.leoman.exception.ParamErrorException;
import com.leoman.exception.UserNotFindException;
import com.leoman.service.common.ICommonService;
import org.springframework.data.domain.Page;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * AdminService
 * Created by 涂奕恒 on 2016/11/23 0023 下午 3:50.
 */
public interface FbAdminService extends ICommonService<FbAdmin> {

    // 操作员登录
    FbAdmin iLogin(String account, String password) throws ParamErrorException, UserNotFindException;

    // 管理员登录
    FbAdmin loginIn(HttpServletRequest request, String account, String password);

    // 注销
    void loginOut(HttpServletRequest request);

    // 查询管理员列表（分页）
    Page<FbAdmin> pageByParams(String account, String company, Integer pageNum, Integer pageSize);

    // 新增 or 修改管理员信息
    Integer saveAdminUser(Integer adminUserId, String account, String password, Integer groupId, String competence);

    // 删除管理员信息，如果删除的是当前管理员信息，则清除当前登录人的session信息
    Integer deleteAdminUser(HttpServletRequest request, Integer adminUserId);

    // 重置管理员密码，如果重置的是当前管理员密码，则清除当前登录人的session信息
    Integer reSetAdminUserPassword(HttpServletRequest request, Integer adminUserId);

    // 批量删除管理员信息，如果删除的管理员中包含当前管理员信息，则清除当前登录人的session信息
    Integer batchDeleteAdminUser(HttpServletRequest request, Integer[] adminUserIds);

    // 查询工序列表
    List<String> competenceList();
}