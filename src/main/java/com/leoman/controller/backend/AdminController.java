package com.leoman.controller.backend;

import com.leoman.common.DataTableFactory;
import com.leoman.controller.common.CommonController;
import com.leoman.entity.FbAdmin;
import com.leoman.service.FbAdminService;
import com.leoman.utils.JsonUtil;
import com.leoman.utils.WebUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 管理员管理
 * Created by 涂奕恒 on 2016/10/21.
 */
@Controller
@RequestMapping(value = "backend/admin")
public class AdminController extends CommonController {

    @Autowired
    private FbAdminService fbAdminService;

    @RequestMapping("index")
    public String index() {
        return "backend/管理员列表";
    }

    @RequestMapping("/list")
    public void list(HttpServletResponse response,
                     String account,
                     String company,
                     Integer draw,
                     Integer start,
                     Integer length) {
        if (null == start || start == 0) {
            start = 1;
        }
        int pageNum = getPageNum(start, length);
        Page<FbAdmin> page = fbAdminService.pageByParams(account, company, pageNum, length);

        Map<String, Object> result = DataTableFactory.fitting(draw, page);
        WebUtil.printJson(response, result);
    }

    @RequestMapping("add")
    public String add(ModelMap model, Integer adminId) {
        model.addAttribute("competenceList", fbAdminService.competenceList());

        if (null != adminId) {
            FbAdmin fbAdmin = fbAdminService.getById(adminId);
            model.addAttribute("admin", fbAdmin);

            if (null != fbAdmin && null != fbAdmin.getGroup()) {
                model.addAttribute("groupId", fbAdmin.getGroup().getId());
                model.addAttribute("departmentId", fbAdmin.getGroup().getDepartment().getId());
                model.addAttribute("companyId", fbAdmin.getGroup().getDepartment().getCompany().getId());
            }
        }

        return "backend/新增管理人员";
    }

    /**
     * 新增 or 修改管理员信息
     *
     * @param adminId    管理员ID
     * @param account    账号
     * @param password   密码
     * @param groupId    班组id
     * @param competence 权限
     * @return 返回管理员ID
     */
    @RequestMapping("/save")
    @ResponseBody
    public Integer save(Integer adminId, String account, String password, Integer groupId, String competence) {
        try {
            return fbAdminService.saveAdminUser(adminId, account, password, groupId, competence);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 删除管理员信息
     *
     * @param adminId 管理员ID
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Integer delete(HttpServletRequest request, Integer adminId) {
        try {
            return fbAdminService.deleteAdminUser(request, adminId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 重置管理员密码
     *
     * @param adminId 管理员ID
     */
    @RequestMapping("/resetPwd")
    @ResponseBody
    public Integer resetPwd(HttpServletRequest request, Integer adminId) {
        try {
            return fbAdminService.reSetAdminUserPassword(request, adminId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 批量删除管理员信息
     */
    @RequestMapping("/batchDel")
    @ResponseBody
    public Integer batchDel(HttpServletRequest request, String ids) {
        try {
            Integer[] arrayId = JsonUtil.json2Obj(ids, Integer[].class);
            return fbAdminService.batchDeleteAdminUser(request, arrayId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
