package com.leoman.controller.api;

import com.leoman.core.ErrorType;
import com.leoman.core.bean.Result;
import com.leoman.entity.FbAdmin;
import com.leoman.entity.ViewKmZntScrwd;
import com.leoman.entity.vo.DetailVo;
import com.leoman.exception.ParamErrorException;
import com.leoman.exception.UserNotFindException;
import com.leoman.service.*;
import com.leoman.service.impl.ImageServiceImpl;
import com.leoman.utils.JsonUtil;
import com.leoman.utils.WebUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 基本api
 * Created by 涂奕恒 on 2016/11/23 0018.
 */
@Controller
@RequestMapping(value = "api/index")
public class IndexApi {

    @Autowired
    private FbAdminService fbAdminService;

    @Autowired
    private ViewKmZntScrwdService viewKmZntScrwdService;

    @Autowired
    private PPPFService pppfService;

    @Autowired
    private ZhiXinService zhiXinService;

    @Autowired
    private ZaoXingService zaoXingService;

    @Autowired
    private HeXiangService heXiangService;

    @Autowired
    private MoJuService moJuService;

    @Autowired
    private FbDetailService fbDetailService;

    private ImageService imageService;

    /**
     * @api {post} /api/index/login 1、登录
     * @apiVersion 0.0.1
     * @apiName index.login
     * @apiGroup index
     *
     * @apiDescription 登录
     *
     * @apiParam   {String}   account                   账号           (必填)
     * @apiParam   {String}   password                  密码           (必填)
     *
     * @apiSuccess {Object}   userInfo
     * @apiSuccess {Integer}  userInfo.id               id
     * @apiSuccess {String}   userInfo.account          账号
     * @apiSuccess {String}   userInfo.competence       权限，中间用英文逗号隔开
     * @apiSuccess {String}   userInfo.createTime       注册时间
     * @apiSuccess {String}   userInfo.updateTime       修改时间
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status": 0,
     *      "msg": "",
     *      "data": {
     *          "userInfo": {
     *              "id": 14,
     *              "account": "tu",
     *              "competence": "1,2,4",
     *              "createTime": "1474600084564",
     *              "updateTime": "1474600084564"
     *          }
     *      }
     * }
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void login(HttpServletResponse response, String account, String password) {
        try {
            FbAdmin fbAdmin = fbAdminService.iLogin(account, password);
            String result = JsonUtil.obj2ApiJson(Result.successInfoApi(fbAdmin, "userInfo"), "password", "group");
            WebUtil.printApi(response, result);
        } catch (ParamErrorException e) {
            WebUtil.printApi(response, Result.failureApi(ErrorType.ERROR_NOT_PARAM));
        } catch (UserNotFindException e) {
            WebUtil.printApi(response, Result.failureApi(ErrorType.ERROR_USER_NOT_FIND));
        }
    }

    /**
     * @api {post} /api/index/dataStatistics 2、首页数据统计
     * @apiVersion 0.0.1
     * @apiName index.dataStatistics
     * @apiGroup index
     *
     * @apiDescription 首页数据统计
     *
     * @apiParam   {String}   userName                          用户名称            （必填）
     *
     * @apiSuccess {Object}   dataInfo
     * @apiSuccess {Integer}  dataInfo.allCount                 总产品数
     * @apiSuccess {Integer}  dataInfo.allScrapCount            总报废数
     * @apiSuccess {Integer}  dataInfo.allReWorkCount           总返修数
     * @apiSuccess {Integer}  dataInfo.monthCount               本月产品数
     * @apiSuccess {Integer}  dataInfo.monthScrapCount          本月报废数
     * @apiSuccess {Integer}  dataInfo.monthReWorkCount         本月返修数
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status": 0,
     *      "msg": "",
     *      "data": {
     *          "dataInfo": {
     *              "allCount": 140,
     *              "allScrapCount": 20,
     *              "allReWorkCount": 50,
     *              "monthCount": 80,
     *              "monthScrapCount": 10,
     *              "monthReWorkCount": 20
     *          }
     *      }
     * }
     */
    @RequestMapping(value = "/dataStatistics", method = RequestMethod.POST)
    public void dataStatistics(HttpServletResponse response, String userName) {
        if (StringUtils.isBlank(userName)) {
            WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM)));
            return;
        }
        String result;
        try {
            result = JsonUtil.obj2ApiJson(Result.successInfoApi(pppfService.getData(userName), "dataInfo"));
        } catch (ParamErrorException e) {
            result = JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM));
        }

        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/productList 3、产品列表
     * @apiVersion 0.0.1
     * @apiName index.productList
     * @apiGroup index
     *
     * @apiDescription 产品列表
     *
     * @apiParam   {Integer}   pageNum               页码
     * @apiParam   {Integer}   pageSize              每页显示条数
     *
     * @apiSuccess {Object}    list
     * @apiSuccess {Integer}   list.id               产品ID
     * @apiSuccess {Integer}   list.code             产品代码
     * @apiSuccess {Integer}   list.name             产品名称
     * @apiSuccess {String}    list.type             产品型号
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{
     *          "list": [
     *              {
     *                  "id" : 1,
     *                  "code" : "21235",
     *                  "name" : "TCL电视机",
     *                  "type" : "5454-wew"
     *              }
     *          ]
     *      }
     * }
     */
    @RequestMapping(value = "/productList", method = RequestMethod.POST)
    public void productList(HttpServletResponse response, Integer pageNum, Integer pageSize) {
        Page<ViewKmZntScrwd> page = viewKmZntScrwdService.iPageByParams(pageNum, pageSize);
        Map<String, Object> dataMap = JsonUtil.fitting(page);
        String result = JsonUtil.obj2ApiJson(Result.successApi(dataMap), "customer", "unit", "weight", "material", "bgNum", "countNum", "planProductCount", "planStartDate", "planEndDate", "workShop");
        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/productListPlus 4、根据产品型号查询件号列表
     * @apiVersion 0.0.1
     * @apiName index.productListPlus
     * @apiGroup index
     *
     * @apiDescription 根据产品型号查询件号列表
     *
     * @apiParam   {String}    type                  产品型号            （必填）
     * @apiParam   {Integer}   pageNum               页码
     * @apiParam   {Integer}   pageSize              每页显示条数
     *
     * @apiSuccess {Object}    list
     * @apiSuccess {Integer}   list.id               产品ID
     * @apiSuccess {Integer}   list.name             产品名称
     * @apiSuccess {String}    list.type             产品型号
     * @apiSuccess {String}    list.countNum         铸件件号
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{
     *          "list": [
     *              {
     *                  "id" : 1,
     *                  "name" : "TCL电视机",
     *                  "type" : "5454-wew",
     *                  "countNum" : "20161222"
     *              }
     *          ]
     *      }
     * }
     */
    @RequestMapping(value = "/productListPlus", method = RequestMethod.POST)
    public void productListPlus(HttpServletResponse response, String type, Integer pageNum, Integer pageSize) {
        if (StringUtils.isBlank(type)) {
            WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM)));
            return;
        }

        Page<ViewKmZntScrwd> page = viewKmZntScrwdService.iPageByParams(type, pageNum, pageSize);
        Map<String, Object> dataMap = JsonUtil.fitting(page);
        String result = JsonUtil.obj2ApiJson(Result.successApi(dataMap), "code", "customer", "unit", "weight", "material", "bgNum", "planProductCount", "planStartDate", "planEndDate", "workShop");
        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/stepList 5、查询工步列表
     * @apiVersion 0.0.1
     * @apiName index.stepList
     * @apiGroup index
     *
     * @apiDescription 查询工步列表
     *
     * @apiParam   {String}    code                  产品代码            （必填）
     *
     * @apiSuccess {Object}    list
     * @apiSuccess {String}    list.content          工步
     * @apiSuccess {Integer}   list.status           状态（-1=不适用，0=待检测，1=合格，2=返修，3=报废）
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{
     *          "list": [
     *              {
     *                  "content" : "砂处理",
     *                  "status" : 1
     *              }
     *          ]
     *      }
     * }
     */
    @RequestMapping(value = "/stepList", method = RequestMethod.POST)
    public void stepList(HttpServletResponse response, String code) {
        if (StringUtils.isBlank(code)) {
            WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM)));
            return;
        }

        List<DetailVo> list = pppfService.findListByParam(code);
        String result = JsonUtil.obj2ApiJson(Result.successListApi(list));
        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/flowInfoList 6、查询工序检测记录列表
     * @apiVersion 0.0.1
     * @apiName index.flowInfoList
     * @apiGroup index
     *
     * @apiDescription 查询工序检测记录列表
     *
     * @apiParam   {String}    code                                             产品代码            （必填）
     * @apiParam   {String}    flow                                             工序               （必填）
     *
     * @apiSuccess {Object}    result
     * @apiSuccess {Object}    result.titleList                                        标题数组
     * @apiSuccess {Object}    result.dataList
     * @apiSuccess {String}    result.dataList.num                                     序号
     * @apiSuccess {String}    result.dataList.canModify                               是否可编辑，0=可编辑，1=不可编辑
     * @apiSuccess {Object}    result.dataList.detailList                              数据集
     * @apiSuccess {String}    result.dataList.detailList.id                           模块更新id
     * @apiSuccess {String}    result.dataList.detailList.passRate                     合格率
     * @apiSuccess {Object}    result.dataList.detailList.childList                    详情list
     * @apiSuccess {String}    result.dataList.detailList.childList.status             状态（-1=不适用，0=待检测，1=合格，2=返修，3=报废）
     * @apiSuccess {String}    result.dataList.detailList.childList.checkResultId      检测结果Id
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{
     *          "result" :{
     *              "titleList":["工装-gZ","紧实质量-jSZL","浇道-jD","出气-cQ"],
     *              "dataList": [
     *                  {
     *                      "num" : "No.1",
     *                      "canModify" : 0,
     *                      "detailList" : [
     *                          {
     *                              "id" : 1,
     *                              "passRate" : 90,
     *                              "childList" : [
     *                                  "status" : 1,
     *                                  "checkResultId" : "1"
     *                              ]
     *                          },
     *                          {
     *                              "id" : 2,
     *                              "passRate" : 80,
     *                              "childList" : [
     *                                  "status" : 0,
     *                                  "checkResultId" : "2"
     *                              ]
     *                          }
     *                      ]
     *                  }
     *              ]
     *          }
     *      }
     * }
     */
    @RequestMapping(value = "/flowInfoList", method = RequestMethod.POST)
    public void flowInfoList(HttpServletResponse response, String code, String flow) {
        if (StringUtils.isBlank(code) || StringUtils.isBlank(flow)) {
            WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM)));
            return;
        }

        String result = "";

        if (flow.equals("制芯")) {
            Map<String, Object> map = zhiXinService.findListByParam(code);
            result = JsonUtil.obj2ApiJson(Result.successInfoApi(map, "result"));
        } else if (flow.equals("造型")) {
            Map<String, Object> map = zaoXingService.findListByParam(code);
            result = JsonUtil.obj2ApiJson(Result.successInfoApi(map, "result"));
        } else if (flow.equals("合箱")) {
            Map<String, Object> map = heXiangService.findListByParam(code);
            result = JsonUtil.obj2ApiJson(Result.successInfoApi(map, "result"));
        } else if (flow.equals("模具")) {
            Map<String, Object> map = moJuService.findListByParam(code);
            result = JsonUtil.obj2ApiJson(Result.successInfoApi(map, "result"));
        }
        // 在这里增加else if，equals后面的括号里面就修改成增加的工序名称
        // else if里面的内容跟制芯一样

        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/checkResultInfo 7、查询检测结果详情
     * @apiVersion 0.0.1
     * @apiName index.checkResultInfo
     * @apiGroup index
     *
     * @apiDescription 查询检测结果详情
     *
     * @apiParam   {Integer}   checkResultId         检测结果Id            （必填）
     *
     * @apiSuccess {Object}    list
     * @apiSuccess {String}    list.id               检测结果id
     * @apiSuccess {String}    list.standard         控制标准
     * @apiSuccess {String}    list.content          控制内容
     * @apiSuccess {String}    list.remark           备注
     * @apiSuccess {String}    list.conclusion       结论
     * @apiSuccess {String}    list.fBfile           拍照图片
     * @apiSuccess {Integer}   list.checkResult      检查结果
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{
     *          "checkResultInfo": [
     *              {
     *                  "id" : 263,
     *                  "standard" : "控制标准",
     *                  "content" : "控制内容",
     *                  "remark" : "备注",
     *                  "conclusion" : "未检测",
     *                  "fBfile" : "2016/3/14.jpg",
     *                  "checkResult" : ""
     *              }
     *          ]
     *      }
     * }
     */
    @RequestMapping(value = "/checkResultInfo", method = RequestMethod.POST)
    public void checkResultInfo(HttpServletResponse response, Integer checkResultId) {
        if (null == checkResultId) {
            WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM)));
            return;
        }

        String result = JsonUtil.obj2ApiJson(Result.successInfoApi(fbDetailService.getById(checkResultId), "checkResultInfo"));
        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/updateCheckResult 8、修改检测结果
     * @apiVersion 0.0.1
     * @apiName index.updateCheckResult
     * @apiGroup index
     *
     * @apiDescription 修改检测结果
     *
     * @apiParam {Integer}   checkResultId    检测结果Id                                                              （必填）
     * @apiParam {String}    userName         检测人员姓名                                                            （必填）
     * @apiParam {String}    remark           备注
     * @apiParam {String}    conclusion       结论                                                                    （必填）
     * @apiParam {String}    fBfile           拍照图片
     * @apiParam {String}    checkResult      检查结果
     * @apiParam {Integer}   updateId         更新模块id,（第7个接口返回值list里面的id）                                 （必填）
     * @apiParam {String}    updateFlow       更新模块名称（第7个接口入参的flow）                                        （必填）
     * @apiParam {String}    updateModule     当前更新步骤名称（第7个接口返回值list.detailList里面的content）             （必填）
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{}
     * }
     */
    @RequestMapping(value = "/updateCheckResult", method = RequestMethod.POST)
    public void updateCheckResult(HttpServletResponse response,
                                  Integer checkResultId,
                                  String userName,
                                  String remark,
                                  String conclusion,
                                  String fBfile,
                                  String checkResult,
                                  Integer updateId,
                                  String updateFlow,
                                  String updateModule) {
        if (null == checkResultId || StringUtils.isBlank(userName) || StringUtils.isBlank(conclusion) || null == updateId || StringUtils.isBlank(updateFlow) || StringUtils.isBlank(updateModule)) {
            WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM)));
            return;
        }

        fbDetailService.updateInfo(checkResultId, userName, remark, conclusion, fBfile, checkResult, updateId, updateFlow, updateModule);
        String result = JsonUtil.obj2ApiJson(Result.successApi());
        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/commitCheckResult 9、提交检测结果
     * @apiVersion 0.0.1
     * @apiName index.commitCheckResult
     * @apiGroup index
     *
     * @apiDescription 提交检测结果
     *
     * @apiParam {String}    code                      产品代码            （必填）
     * @apiParam {String}    flow                      工序               （必填）
     * @apiParam {String}    userName                  检查人员名称        （必填）
     *
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{}
     * }
     */
    @RequestMapping(value = "/commitCheckResult", method = RequestMethod.POST)
    public void commitCheckResult(HttpServletResponse response, String code, String flow, String userName) {
        if (StringUtils.isBlank(code) || StringUtils.isBlank(flow) || StringUtils.isBlank(userName)) {
            WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_PARAM)));
            return;
        }

        if (flow.equals("制芯")) {
            zhiXinService.submitCheckInfo(code, userName);
        } else if (flow.equals("造型")) {
            zaoXingService.submitCheckInfo(code, userName);
        } else if (flow.equals("合箱")) {
            heXiangService.submitCheckInfo(code, userName);
        } else if (flow.equals("模具")) {
            moJuService.submitCheckInfo(code, userName);
        }
        // 在这里增加else if，equals后面的括号里面就修改成增加的工序名称
        // else if里面的内容跟制芯一样

        String result = JsonUtil.obj2ApiJson(Result.successApi());
        WebUtil.printApi(response, result);
    }

    /**
     * @api {post} /api/index/uploadFile 10、上传图片
     * @apiVersion 0.0.1
     * @apiName index.uploadFile
     * @apiGroup index
     *
     * @apiDescription 上传图片
     *
     * @apiParam {FILE}    file                      图片           （必填）
     *
     * @apiSuccessExample {json} Success-Response:
     * HTTP/1.1 200 OK
     * {
     *      "status":0,
     *      "msg":"",
     *      "data":{}
     * }
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public void uploadFile(HttpServletResponse response, MultipartRequest multipartRequest) {

        // 获取图片组
        List<MultipartFile> fileList = multipartRequest.getFiles("file");
        if (null == fileList || fileList.size() == 0) {
            WebUtil.printJson(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_IMAGE)));
            return;
        }

/*        for (MultipartFile iList : fileList) {
            // 验证图片格式
            String originalFileName = iList.getOriginalFilename().toLowerCase();
            String fileType = originalFileName.substring(originalFileName.indexOf("."));

            List<String> list = new ArrayList<>();
            list.add(".jpg");
            list.add(".gif");
            list.add(".jpeg");
            list.add(".png");
            list.add(".bmp");

            if (!list.contains(fileType)) {
                WebUtil.printApi(response, JsonUtil.obj2ApiJson(Result.failureApi(ErrorType.ERROR_NOT_IMAGE)));
                return;
            }
        }*/

        imageService = new ImageServiceImpl();
        String result = JsonUtil.obj2ApiJson(Result.successListApi(imageService.save(fileList)));
        WebUtil.printApi(response, result);
    }
}
