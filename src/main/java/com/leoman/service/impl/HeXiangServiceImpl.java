package com.leoman.service.impl;

import com.leoman.controller.common.CommonController;
import com.leoman.core.Constant;
import com.leoman.dao.FbDetailDao;
import com.leoman.dao.HeXiangDao;
import com.leoman.entity.HeXiang;
import com.leoman.entity.vo.*;
import com.leoman.service.HeXiangService;
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
 * HeXiangServiceImpl
 * Created by 涂奕恒 on 2017/2/9 0009 15:47.
 */
@Service
public class HeXiangServiceImpl extends GenericManagerImpl<HeXiang, HeXiangDao> implements HeXiangService {

    @Autowired
    private HeXiangDao heXiangDao;

    @Autowired
    private FbDetailDao fbDetailDao;

    @Override
    public List<HeXiang> findAll() {
        return heXiangDao.findAll();
    }

    @Override
    public Page<HeXiang> find(int pageNum, int pageSize) {
        return heXiangDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<HeXiang> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public HeXiang getById(int id) {
        return heXiangDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        heXiangDao.delete(id);
    }

    @Override
    public HeXiang create(HeXiang heXiang) {
        return heXiangDao.save(heXiang);
    }

    @Override
    public HeXiang update(HeXiang heXiang) {
        return heXiangDao.save(heXiang);
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
        List<HeXiang> heXiangList = heXiangDao.findListByProductId(code);
        Integer passCount; // 合格数
        Integer status;

        // 通过序号分组然后再查询
        String numStr = "";
        List<HeXiang> tempList;
        for (HeXiang heXiang : heXiangList) {
            if (!numStr.contains(heXiang.getjCNR())) {
                numStr += heXiang.getjCNR() + ",";
            }
        }

        if (StringUtils.isNotBlank(numStr) && numStr.length() > 1) {
            numStr = numStr.substring(0, numStr.length() - 1);

            String[] jCNRStr = numStr.split(",");

            for (String str : jCNRStr) {
                // 根据jCNR查询对应的序号信息，此时有多个jCNR，全部放在同一个list中
                checkResultInfoVo = new CheckResultInfoVo();
                tempList = heXiangDao.findListByProductIdAndJCNR(code, str);
                for (HeXiang temp : tempList) {
                    passCount = 0;
                    detailInfoVo = new DetailInfoVo();

                    childList = new ArrayList<>();

                    // ###################################防止懵逼###################################
                    // 将每个需要检测的步骤查询并加入list集合中
                    // 例如，合箱表需要查询的检测步骤字段为：jCNR_、tYXM、zXJCNR、gJCC
                    // 注意：content字段中这样写，方便IndexApi中第九个接口的逻辑执行
                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getjCNR_());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getjCNR_());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.gettYXM());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.gettYXM());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getzXJCNR());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getzXJCNR());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getgJCC());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getgJCC());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);
                    // ###################################防止懵逼###################################

                    detailInfoVo.setChildList(childList);
                    detailInfoVo.setPassRate(CommonController.getRate(passCount, 4));
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
        titleList.add("基础内容-jCNR_");
        titleList.add("通用内容-tYXM");
        titleList.add("专项检查内容-zXJCNR");
        titleList.add("关键参数-gJCC");

        map.put("titleList", titleList);
        map.put("dataList", list);

        return map;
    }

    @Override
    public void submitCheckInfo(String code, String userName) {
        List<HeXiang> heXiangList = heXiangDao.findListByProductId(code);

        for (HeXiang heXiang : heXiangList) {
            heXiang.setCanModify("1");
            heXiang.setUserName(userName);

            heXiangDao.save(heXiang);
        }
    }

    @Override
    public Integer[] getCount(String userName, String startTime, String endTime) {
        Integer[] integers = new Integer[3];

        String sql = "SELECT * FROM PLM_FB_HeXiang WHERE canModify = '1' AND userName = '" + userName + "'";
        if (StringUtils.isNotBlank(startTime)) {
            sql += " AND DATEDIFF(ss,'" + startTime + "', CreateTime) >= 0 AND DATEDIFF(ss, CreateTime,'" + endTime + "') >= 0";
        }
        List<HeXiang> list = queryBySql(sql, HeXiang.class);

        // 报废的数量
        Integer scrapCount = 0;
        // 返修的数量
        Integer reWorkCount = 0;

        for (HeXiang heXiang : list) {
            if (null == heXiang || StringUtils.isBlank(heXiang.getReason())) {
                continue;
            }
            if (heXiang.getReason().contains("报废")) {
                scrapCount++;
            }
            if (heXiang.getReason().contains("返修")) {
                reWorkCount++;
            }
        }

        integers[0] = list.size();  // 总产品数量
        integers[1] = scrapCount;
        integers[2] = reWorkCount;

        return integers;
    }

    @Override
    public Integer getStatus(List<HeXiang> heXiangList) {
        Integer result = 0;
        for (HeXiang heXiang : heXiangList) {
            result = getStatus(heXiang);
        }

        return result;
    }

    @Override
    public Integer getCanModifyStatus(String code) {
        Integer result = 1;
        List<HeXiang> list = heXiangDao.findListByProductId(code);

        for (HeXiang heXiang : list) {
            if (heXiang.getCanModify().equals("0")) {
                result = 0;
            }
        }

        return result;
    }

    private Integer getStatus(HeXiang heXiang) {
        // 查询合箱表每个需要检测的步骤对应的结果
        // 例如，合箱表需要查询的检测步骤字段为：jCNR_、tYXM、zXJCNR、gJCC
        Integer result = PPPFServiceImpl.getResultById(fbDetailDao, heXiang.getjCNR_());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, heXiang.gettYXM());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, heXiang.getzXJCNR());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, heXiang.getgJCC());
        if (result != 1) {
            return result;
        }

        return 1;
    }
}