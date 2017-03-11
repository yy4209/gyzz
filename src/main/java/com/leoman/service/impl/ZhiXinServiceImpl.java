package com.leoman.service.impl;

import com.leoman.controller.common.CommonController;
import com.leoman.core.Constant;
import com.leoman.dao.FbDetailDao;
import com.leoman.dao.ZhiXinDao;
import com.leoman.entity.ZhiXin;
import com.leoman.entity.vo.CheckResultInfoVo;
import com.leoman.entity.vo.DetailInfoPlusVo;
import com.leoman.entity.vo.DetailInfoVo;
import com.leoman.service.ZhiXinService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * ZhiXinServiceImpl
 * Created by 涂奕恒 on 2017/2/9 0009 15:48.
 */
@Service
public class ZhiXinServiceImpl extends GenericManagerImpl<ZhiXin, ZhiXinDao> implements ZhiXinService {

    @Autowired
    private ZhiXinDao zhiXinDao;

    @Autowired
    private FbDetailDao fbDetailDao;

    @Override
    public List<ZhiXin> findAll() {
        return zhiXinDao.findAll();
    }

    @Override
    public Page<ZhiXin> find(int pageNum, int pageSize) {
        return zhiXinDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<ZhiXin> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public ZhiXin getById(int id) {
        return zhiXinDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        zhiXinDao.delete(id);
    }

    @Override
    public ZhiXin create(ZhiXin zhiXin) {
        return zhiXinDao.save(zhiXin);
    }

    @Override
    public ZhiXin update(ZhiXin zhiXin) {
        return zhiXinDao.save(zhiXin);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }

    @Override
    public Map<String, Object> findListByParam(String code) {
        Map<String, Object> map = new HashMap<>();

        List<CheckResultInfoVo> list = new ArrayList<>();
        CheckResultInfoVo checkResultInfoVo;
        DetailInfoVo detailInfoVo;
        List<DetailInfoPlusVo> childList;
        DetailInfoPlusVo detailInfoPlusVo;
        // 检测所有需要检测的字段
        List<ZhiXin> zhiXinList = zhiXinDao.findListByProductId(code);
        Integer passCount; // 合格数
        Integer status;

        // 通过序号分组然后再查询
        String numStr = "";
        List<ZhiXin> tempList;
        for (ZhiXin zhiXin : zhiXinList) {
            if (!numStr.contains(zhiXin.getjCNR())) {
                numStr += zhiXin.getjCNR() + ",";
            }
        }

        if (StringUtils.isNotBlank(numStr) && numStr.length() > 1) {
            numStr = numStr.substring(0, numStr.length() - 1);

            String[] jCNRStr = numStr.split(",");

            for (String str : jCNRStr) {
                // 根据jCNR查询对应的序号信息，此时有多个jCNR，全部放在同一个list中
                checkResultInfoVo = new CheckResultInfoVo();
                tempList = zhiXinDao.findListByProductIdAndJCNR(code, str);
                for (ZhiXin temp : tempList) {
                    passCount = 0;
                    detailInfoVo = new DetailInfoVo();

                    childList = new ArrayList<>();

                    // ###################################防止懵逼###################################
                    // 将每个需要检测的步骤查询并加入list集合中
                    // 例如，制芯表需要查询的检测步骤字段为：gZ、jSZL、jD、cQ、sT、bCPZL、gYJL
                    // 注意：content字段中这样写，方便IndexApi中第九个接口的逻辑执行
                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getgZ());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getgZ());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getjSZL());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getjSZL());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getjD());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getjD());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getcQ());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getcQ());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getsT());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getsT());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getbCPZL());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getbCPZL());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getgYJL());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getgYJL());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);
                    // ###################################防止懵逼###################################

                    detailInfoVo.setChildList(childList);
                    detailInfoVo.setPassRate(CommonController.getRate(passCount, 7));
                    detailInfoVo.setId(temp.getId());

                    // 封装最外层list的元素数据
                    checkResultInfoVo.setCanModify(temp.getCanModify());
                    checkResultInfoVo.getDetailList().add(detailInfoVo);
                }

                checkResultInfoVo.setNum(str);
                list.add(checkResultInfoVo);
            }
        }

        // 将制芯表所有的字段放入list中
        List<String> titleList = new ArrayList<>();
        titleList.add("工装-gZ");
        titleList.add("紧实质量-jSZL");
        titleList.add("浇道-jD");
        titleList.add("出气-cQ");
        titleList.add("施涂-sT");
        titleList.add("半成品质量-bCPZL");
        titleList.add("工艺纪律-gYJL");

        map.put("titleList", titleList);
        map.put("dataList", list);

        return map;
    }

    @Override
    public void submitCheckInfo(String code, String userName) {
        List<ZhiXin> zhiXinList = zhiXinDao.findListByProductId(code);

        for (ZhiXin zhiXin : zhiXinList) {
            zhiXin.setCanModify("1");
            zhiXin.setUserName(userName);

            zhiXinDao.save(zhiXin);
        }
    }

    @Override
    public Integer getStatus(List<ZhiXin> zhiXinList) {
        Integer result = 0;
        for (ZhiXin zhiXin : zhiXinList) {
            result = getStatus(zhiXin);
        }

        return result;
    }

    @Override
    public Integer getCanModifyStatus(String code) {
        Integer result = 1;
        List<ZhiXin> list = zhiXinDao.findListByProductId(code);

        for (ZhiXin zhiXin : list) {
            if (zhiXin.getCanModify().equals("0")) {
                result = 0;
            }
        }

        return result;
    }

    @Override
    public Integer[] getCount(String userName, String startTime, String endTime) {
        Integer[] integers = new Integer[3];

        String sql = "SELECT * FROM PLM_FB_ZhiXin WHERE canModify = '1' AND userName = '" + userName + "'";
        if (StringUtils.isNotBlank(startTime)) {
            sql += " AND DATEDIFF(ss,'" + startTime + "', CreateTime) >= 0 AND DATEDIFF(ss, CreateTime,'" + endTime + "') >= 0";
        }
        List<ZhiXin> list = queryBySql(sql, ZhiXin.class);

        // 报废的数量
        Integer scrapCount = 0;
        // 返修的数量
        Integer reWorkCount = 0;

        for (ZhiXin zhiXin : list) {
            if (null == zhiXin || StringUtils.isBlank(zhiXin.getReason())) {
                continue;
            }
            if (zhiXin.getReason().contains("报废")) {
                scrapCount++;
            }
            if (zhiXin.getReason().contains("返修")) {
                reWorkCount++;
            }
        }

        integers[0] = list.size();  // 总产品数量
        integers[1] = scrapCount;
        integers[2] = reWorkCount;

        return integers;
    }

    private Integer getStatus(ZhiXin zhiXin) {
        // 查询制芯表每个需要检测的步骤对应的结果
        // 例如，制芯表需要查询的检测步骤字段为：gZ、jSZL、jD、cQ、sT、bCPZL、gYJL
        Integer result = PPPFServiceImpl.getStepListResultById(fbDetailDao, zhiXin.getgZ());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getStepListResultById(fbDetailDao, zhiXin.getjSZL());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getStepListResultById(fbDetailDao, zhiXin.getjD());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getStepListResultById(fbDetailDao, zhiXin.getcQ());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getStepListResultById(fbDetailDao, zhiXin.getsT());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getStepListResultById(fbDetailDao, zhiXin.getbCPZL());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getStepListResultById(fbDetailDao, zhiXin.getgYJL());
        if (result != 1) {
            return result;
        }

        return 1;
    }
}