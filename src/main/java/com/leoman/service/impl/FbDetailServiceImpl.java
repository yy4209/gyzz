package com.leoman.service.impl;

import com.leoman.core.Constant;
import com.leoman.dao.*;
import com.leoman.entity.*;
import com.leoman.service.FbDetailService;
import com.leoman.utils.CopyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * VmDetailServiceImpl
 * Created by 涂奕恒 on 2017/2/9 0009 15:48.
 */
@Service
public class FbDetailServiceImpl implements FbDetailService {

    @Autowired
    private FbDetailDao fbDetailDao;

    @Autowired
    private ZhiXinDao zhiXinDao;

    @Autowired
    private ZaoXingDao zaoXingDao;

    @Autowired
    private HeXiangDao heXiangDao;

    @Autowired
    private MoJuDao moJuDao;

    @Override
    public List<FbDetail> findAll() {
        return fbDetailDao.findAll();
    }

    @Override
    public Page<FbDetail> find(int pageNum, int pageSize) {
        return fbDetailDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<FbDetail> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public FbDetail getById(int id) {
        return fbDetailDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        fbDetailDao.delete(id);
    }

    @Override
    public FbDetail create(FbDetail fbDetail) {
        return fbDetailDao.save(fbDetail);
    }

    @Override
    public FbDetail update(FbDetail fbDetail) {
        return fbDetailDao.save(fbDetail);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }

    @Override
    public void updateInfo(Integer checkResultId,
                           String userName,
                           String remark,
                           String conclusion,
                           String fBfile,
                           String checkResult,
                           Integer updateId,
                           String updateFlow,
                           String updateModule) {
        try {
            updateModule = updateModule.split("-")[1];

            FbDetail fbDetail = fbDetailDao.findOne(checkResultId);
            FbDetail tempDetail = new FbDetail();

            if (null != fbDetail) {
                fbDetail.setRemark(remark);
                fbDetail.setConclusion(conclusion);
                fbDetail.setfBfile(fBfile);
                fbDetail.setCheckResult(checkResult);

                fbDetailDao.save(fbDetail);

                // 如果不合格，增加一行新数据
                if (conclusion.equals("报废") || conclusion.equals("返修")) {
                    productNewDetail(tempDetail, fbDetail);
                }
            }

            if (updateFlow.equals("制芯")) {
                ZhiXin zhiXin = zhiXinDao.findOne(updateId);

                if (null != zhiXin) {
                    // 如果不合格，增加一行新数据
                    if (conclusion.equals("返修")) {
                        ZhiXin temp = new ZhiXin();
                        CopyUtils.copyProperty(temp, zhiXin, false, updateModule, tempDetail.getId() + "");
                        temp.setCanModify("0");
                        temp.setReason(conclusion);
                        temp.setUserName(userName);
                        temp.setFormId(zhiXin.getId());

                        zhiXinDao.save(temp);
                    } else if (conclusion.equals("报废")) {
                        ZhiXin temp = new ZhiXin();
                        // 如果报废，所有的工序都将变成待检测
                        CopyUtils.copyProperty(temp, zhiXin, false, "", null);

                        // 制芯表的检测步骤字段为：gZ、jSZL、jD、cQ、sT、bCPZL、gYJL
                        temp.setgZ(productNewDetail(zhiXin.getgZ()).getId() + "");
                        temp.setjSZL(productNewDetail(zhiXin.getjSZL()).getId() + "");
                        temp.setjD(productNewDetail(zhiXin.getjD()).getId() + "");
                        temp.setcQ(productNewDetail(zhiXin.getcQ()).getId() + "");
                        temp.setsT(productNewDetail(zhiXin.getsT()).getId() + "");
                        temp.setbCPZL(productNewDetail(zhiXin.getbCPZL()).getId() + "");
                        temp.setgYJL(productNewDetail(zhiXin.getgYJL()).getId() + "");

                        temp.setCanModify("0");
                        temp.setReason("");
                        temp.setUserName(userName);
                        temp.setFormId(zhiXin.getId());

                        zhiXinDao.save(temp);
                    } else {
                        zhiXin.setReason(conclusion);
                        zhiXinDao.save(zhiXin);
                    }
                }
            } else if (updateFlow.equals("造型")) {
                ZaoXing zaoXing = zaoXingDao.findOne(updateId);

                if (null != zaoXing) {
                    // 如果不合格，增加一行新数据
                    if (conclusion.equals("返修")) {
                        ZaoXing temp = new ZaoXing();
                        CopyUtils.copyProperty(temp, zaoXing, false, updateModule, tempDetail.getId() + "");
                        temp.setCanModify("0");
                        temp.setReason(conclusion);
                        temp.setUserName(userName);
                        temp.setFormId(zaoXing.getId());

                        zaoXingDao.save(temp);
                    } else if (conclusion.equals("报废")) {
                        ZaoXing temp = new ZaoXing();
                        // 如果报废，所有的工序都将变成待检测
                        CopyUtils.copyProperty(temp, zaoXing, false, "", null);

                        // 造型表的检测步骤字段为：gZ、lT、jMXT、jS、zX、bCPZL
                        temp.setgZ(productNewDetail(zaoXing.getgZ()).getId() + "");
                        temp.setlT(productNewDetail(zaoXing.getlT()).getId() + "");
                        temp.setjMXT(productNewDetail(zaoXing.getjMXT()).getId() + "");
                        temp.setjS(productNewDetail(zaoXing.getjS()).getId() + "");
                        temp.setzX(productNewDetail(zaoXing.getzX()).getId() + "");
                        temp.setbCPZL(productNewDetail(zaoXing.getbCPZL()).getId() + "");

                        temp.setCanModify("0");
                        temp.setReason("");
                        temp.setUserName(userName);
                        temp.setFormId(zaoXing.getId());

                        zaoXingDao.save(temp);
                    } else {
                        zaoXing.setReason(conclusion);
                        zaoXingDao.save(zaoXing);
                    }
                }
            } else if (updateFlow.equals("合箱")) {
                HeXiang heXiang = heXiangDao.findOne(updateId);

                if (null != heXiang) {
                    // 如果不合格，增加一行新数据
                    if (conclusion.equals("返修")) {
                        HeXiang temp = new HeXiang();
                        CopyUtils.copyProperty(temp, heXiang, false, updateModule, tempDetail.getId() + "");
                        temp.setCanModify("0");
                        temp.setReason(conclusion);
                        temp.setUserName(userName);
                        temp.setFormId(heXiang.getId());

                        heXiangDao.save(temp);
                    } else if (conclusion.equals("报废")) {
                        HeXiang temp = new HeXiang();
                        // 如果报废，所有的工序都将变成待检测
                        CopyUtils.copyProperty(temp, heXiang, false, "", null);

                        // 合箱表的检测步骤字段为：jCNR_、tYXM、zXJCNR、gJCC
                        temp.setjCNR_(productNewDetail(heXiang.getjCNR_()).getId() + "");
                        temp.settYXM(productNewDetail(heXiang.gettYXM()).getId() + "");
                        temp.setzXJCNR(productNewDetail(heXiang.getzXJCNR()).getId() + "");
                        temp.setgJCC(productNewDetail(heXiang.getgJCC()).getId() + "");

                        temp.setCanModify("0");
                        temp.setReason("");
                        temp.setUserName(userName);
                        temp.setFormId(heXiang.getId());

                        heXiangDao.save(temp);
                    } else {
                        heXiang.setReason(conclusion);
                        heXiangDao.save(heXiang);
                    }
                }
            } else if (updateFlow.equals("模具")) {
                MoJu moJu = moJuDao.findOne(updateId);

                if (null != moJu) {
                    // 如果不合格，增加一行新数据
                    if (conclusion.equals("返修")) {
                        MoJu temp = new MoJu();
                        CopyUtils.copyProperty(temp, moJu, false, updateModule, tempDetail.getId() + "");
                        temp.setCanModify("0");
                        temp.setReason(conclusion);
                        temp.setUserName(userName);
                        temp.setFormId(moJu.getId());

                        moJuDao.save(temp);
                    } else if (conclusion.equals("报废")) {
                        MoJu temp = new MoJu();
                        // 如果报废，所有的工序都将变成待检测
                        CopyUtils.copyProperty(temp, moJu, false, "", null);

                        // 模具表的检测步骤字段为：mJZL、bMZL、dWBS
                        temp.setmJZL(productNewDetail(moJu.getmJZL()).getId() + "");
                        temp.setbMZL(productNewDetail(moJu.getbMZL()).getId() + "");
                        temp.setdWBS(productNewDetail(moJu.getdWBS()).getId() + "");

                        temp.setCanModify("0");
                        temp.setReason("");
                        temp.setUserName(userName);
                        temp.setFormId(moJu.getId());

                        moJuDao.save(temp);
                    } else {
                        moJu.setReason(conclusion);
                        moJuDao.save(moJu);
                    }
                }
            }
            // 先注入新增工序的Dao
            // 在这里增加else if，equals后面的括号里面就修改成增加的工序名称
            // else if里面的内容跟制芯一样
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成新检测结果
     */
    private FbDetail productNewDetail(FbDetail tempDetail, FbDetail fbDetail) {
        try {
            CopyUtils.copyProperty(tempDetail, fbDetail, false, "", null);
            tempDetail.setRemark("");
            tempDetail.setConclusion("");
            tempDetail.setfBfile("");
            tempDetail.setCheckResult("");

            fbDetailDao.save(tempDetail);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tempDetail;
    }

    /**
     * 生成新检测结果
     */
    private FbDetail productNewDetail(String id) {
        FbDetail tempDetail = new FbDetail();
        try {
            FbDetail fbDetail = fbDetailDao.findOne(Integer.parseInt(id));
            CopyUtils.copyProperty(tempDetail, fbDetail, false, "", null);
            tempDetail.setRemark("");
            tempDetail.setConclusion("");
            tempDetail.setfBfile("");
            tempDetail.setCheckResult("");

            fbDetailDao.save(tempDetail);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return tempDetail;
    }
}