package com.leoman.service.impl;

import com.leoman.controller.common.CommonController;
import com.leoman.core.Constant;
import com.leoman.dao.FbDetailDao;
import com.leoman.dao.ZaoXingDao;
import com.leoman.entity.ZaoXing;
import com.leoman.entity.vo.*;
import com.leoman.service.ZaoXingService;
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
 * ZaoXingServiceImpl
 * Created by 涂奕恒 on 2017/2/9 0009 15:48.
 */
@Service
public class ZaoXingServiceImpl extends GenericManagerImpl<ZaoXing, ZaoXingDao> implements ZaoXingService {

    @Autowired
    private ZaoXingDao zaoXingDao;

    @Autowired
    private FbDetailDao fbDetailDao;

    @Override
    public List<ZaoXing> findAll() {
        return zaoXingDao.findAll();
    }

    @Override
    public Page<ZaoXing> find(int pageNum, int pageSize) {
        return zaoXingDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<ZaoXing> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public ZaoXing getById(int id) {
        return zaoXingDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        zaoXingDao.delete(id);
    }

    @Override
    public ZaoXing create(ZaoXing zaoXing) {
        return zaoXingDao.save(zaoXing);
    }

    @Override
    public ZaoXing update(ZaoXing zaoXing) {
        return zaoXingDao.save(zaoXing);
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
        List<ZaoXing> zaoXingList = zaoXingDao.findListByProductId(code);
        Integer passCount; // 合格数
        Integer status;

        // 通过序号分组然后再查询
        String numStr = "";
        List<ZaoXing> tempList;
        for (ZaoXing zaoXing : zaoXingList) {
            if (!numStr.contains(zaoXing.getjCNR())) {
                numStr += zaoXing.getjCNR() + ",";
            }
        }

        if (StringUtils.isNotBlank(numStr) && numStr.length() > 1) {
            numStr = numStr.substring(0, numStr.length() - 1);

            String[] jCNRStr = numStr.split(",");

            for (String str : jCNRStr) {
                // 根据jCNR查询对应的序号信息，此时有多个jCNR，全部放在同一个list中
                checkResultInfoVo = new CheckResultInfoVo();
                tempList = zaoXingDao.findListByProductIdAndJCNR(code, str);
                for (ZaoXing temp : tempList) {
                    passCount = 0;
                    detailInfoVo = new DetailInfoVo();

                    childList = new ArrayList<>();

                    // ###################################防止懵逼###################################
                    // 将每个需要检测的步骤查询并加入list集合中
                    // 例如，造型表需要查询的检测步骤字段为：gZ、lT、jMXT、jS、zX、bCPZL
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
                    detailInfoPlusVo.setCheckResultId(temp.getlT());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getlT());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getjMXT());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getjMXT());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getjS());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getjS());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getzX());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getzX());
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
                    // ###################################防止懵逼###################################

                    detailInfoVo.setChildList(childList);
                    detailInfoVo.setPassRate(CommonController.getRate(passCount, 6));
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
        titleList.add("冷铁-lT");
        titleList.add("浇注系统-jMXT");
        titleList.add("紧实-jS");
        titleList.add("粘芯-zX");
        titleList.add("半成品质量-bCPZL");

        map.put("titleList", titleList);
        map.put("dataList", list);

        return map;
    }

    @Override
    public void submitCheckInfo(String code, String userName) {
        List<ZaoXing> zaoXingList = zaoXingDao.findListByProductId(code);

        for (ZaoXing zaoXing : zaoXingList) {
            zaoXing.setCanModify("1");
            zaoXing.setUserName(userName);

            zaoXingDao.save(zaoXing);
        }
    }

    @Override
    public Integer[] getCount(String userName, String startTime, String endTime) {
        Integer[] integers = new Integer[3];

        String sql = "SELECT * FROM PLM_FB_ZaoXing WHERE canModify = '1' AND userName = '" + userName + "'";
        if (StringUtils.isNotBlank(startTime)) {
            sql += " AND DATEDIFF(ss,'" + startTime + "', CreateTime) >= 0 AND DATEDIFF(ss, CreateTime,'" + endTime + "') >= 0";
        }
        List<ZaoXing> list = queryBySql(sql, ZaoXing.class);

        // 报废的数量
        Integer scrapCount = 0;
        // 返修的数量
        Integer reWorkCount = 0;

        for (ZaoXing zaoXing : list) {
            if (null == zaoXing || StringUtils.isBlank(zaoXing.getReason())) {
                continue;
            }
            if (zaoXing.getReason().contains("报废")) {
                scrapCount++;
            }
            if (zaoXing.getReason().contains("返修")) {
                reWorkCount++;
            }
        }

        integers[0] = list.size();  // 总产品数量
        integers[1] = scrapCount;
        integers[2] = reWorkCount;

        return integers;
    }

    @Override
    public Integer getStatus(List<ZaoXing> zaoXingList) {
        Integer result = 0;
        for (ZaoXing zaoXing : zaoXingList) {
            result = getStatus(zaoXing);
        }

        return result;
    }

    @Override
    public Integer getCanModifyStatus(String code) {
        Integer result = 1;
        List<ZaoXing> list = zaoXingDao.findListByProductId(code);

        for (ZaoXing zaoXing : list) {
            if (zaoXing.getCanModify().equals("0")) {
                result = 0;
            }
        }

        return result;
    }

    private Integer getStatus(ZaoXing zaoXing) {
        // 查询造型表每个需要检测的步骤对应的结果
        // 例如，造型表需要查询的检测步骤字段为：gZ、lT、jMXT、jS、zX、bCPZL
        Integer result = PPPFServiceImpl.getResultById(fbDetailDao, zaoXing.getgZ());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, zaoXing.getlT());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, zaoXing.getjMXT());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, zaoXing.getjS());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, zaoXing.getzX());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, zaoXing.getbCPZL());
        if (result != 1) {
            return result;
        }

        return 1;
    }
}