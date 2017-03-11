package com.leoman.controller.backend;

import com.leoman.core.Constant;
import com.leoman.entity.FbAdmin;
import com.leoman.entity.FbCompany;
import com.leoman.entity.FbDepartment;
import com.leoman.entity.FbGroup;
import com.leoman.service.FbCompanyService;
import com.leoman.service.FbDepartmentService;
import com.leoman.service.FbGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 总管理后台控制面板
 * Created by 涂奕恒 on 2016/11/23.
 */
@Controller
@RequestMapping(value = "backend")
public class BackendIndexController {

    @Autowired
    private FbCompanyService fbCompanyService;

    @Autowired
    private FbDepartmentService fbDepartmentService;

    @Autowired
    private FbGroupService fbGroupService;

    @RequestMapping(value = "/dashboard")
    public String dashboard(HttpServletRequest request, ModelMap model) {
        // 获取当前登录人信息
        FbAdmin fbAdmin = (FbAdmin) request.getSession().getAttribute(Constant.CURRENT_ADMIN_USER);

        if (null == fbAdmin) {
            return "redirect:/login";
        }

        model.addAttribute("adminUser", fbAdmin);

        return "backend/控制面板";
    }

    @RequestMapping(value = "/companyList")
    @ResponseBody
    public List<FbCompany> companyList() {
        return fbCompanyService.findAll();
    }

    @RequestMapping(value = "/departmentList")
    @ResponseBody
    public List<FbDepartment> departmentList(Integer companyId) {
        return fbDepartmentService.findListByCompanyId(companyId);
    }

    @RequestMapping(value = "/groupList")
    @ResponseBody
    public List<FbGroup> groupList(Integer departmentId) {
        return fbGroupService.findListByDepartmentId(departmentId);
    }
}
