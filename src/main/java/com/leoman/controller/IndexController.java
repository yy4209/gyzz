package com.leoman.controller;

import com.leoman.common.exception.GeneralExceptionHandler;
import com.leoman.controller.common.CommonController;
import com.leoman.core.Constant;
import com.leoman.core.ErrorType;
import com.leoman.core.bean.Result;
import com.leoman.entity.FbAdmin;
import com.leoman.service.FbAdminService;
import com.leoman.utils.WebUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 初始化控制层
 * Created by 涂奕恒 on 2016/10/18.
 */
@Controller
@RequestMapping(value = "")
public class IndexController extends CommonController {

    @Autowired
    private FbAdminService fbAdminService;

    @RequestMapping(value = "/login")
    public String login(String error, ModelMap model) {
        if (StringUtils.isNotBlank(error)) {
            model.addAttribute("error", error);
        }
        return "登录";
    }

    @RequestMapping(value = "/login/register")
    public String register(HttpServletRequest request) {
        request.getSession().removeAttribute("error");
        return "注册";
    }

    @RequestMapping(value = "/login/check")
    public String checkLogin(HttpServletRequest request,
                             String account,
                             String password,
                             ModelMap model) {
        FbAdmin fbAdmin = fbAdminService.loginIn(request, account, password);
        if (null != fbAdmin) {
            return "redirect:/backend/dashboard";
        }

        model.addAttribute("error", "用户名或密码错误!");
        return "redirect:/login";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request) {
        fbAdminService.loginOut(request);

        return "登录";
    }

    @RequestMapping(value = "/backend")
    public String indexBackend() {
        return "redirect:/backend/dashboard";
    }

    @RequestMapping(value = "/")
    public String index() {
        return "redirect:/backend/dashboard";
    }

    /**
     * 检测当前登录人旧密码是否正确
     */
    @RequestMapping("/check/oldPwd")
    public void checkOldPwd(HttpServletRequest request,
                            HttpServletResponse response,
                            String oldPwd) {
        Map<String, String> result = new HashMap<>();
        FbAdmin fbAdmin = (FbAdmin) request.getSession().getAttribute(Constant.CURRENT_ADMIN_USER);
        if (!fbAdmin.getPassword().equals(oldPwd)) {
            result.put("error", "旧密码不正确!");
        } else {
            result.put("ok", "");
        }

        WebUtil.print(response, result);
    }

    @RequestMapping("/modifyPwd")
    public void modifyPwd(HttpServletRequest request,
                          HttpServletResponse response,
                          String oldPwd,
                          String newPwd) {
        Boolean flag = false;

        try {
            FbAdmin fbAdmin = (FbAdmin) request.getSession().getAttribute(Constant.CURRENT_ADMIN_USER);
            // 管理员
            if (null != fbAdmin) {
                if (fbAdmin.getPassword().equals(oldPwd)) {
                    fbAdmin.setPassword(newPwd);
                    fbAdminService.update(fbAdmin);
                    System.out.println("管理员修改密码");
                    flag = true;
                }
            }

            if (null != fbAdmin) {
                if (flag) {
                    fbAdminService.loginOut(request);
                    WebUtil.printApi(response, Result.successApi("修改密码成功！请重新登录！"));
                } else {
                    WebUtil.printApi(response, Result.failureApi("旧密码错误，修改密码失败！"));
                }
            } else {
                WebUtil.printApi(response, Result.failureApi("当前用户未登录！"));
            }
        } catch (Exception e) {
            GeneralExceptionHandler.log("修改密码失败", e);
            WebUtil.print(response, Result.failureApi(ErrorType.ERROR_BASE));
        }
    }
}