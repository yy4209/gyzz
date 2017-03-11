package com.leoman.service.impl;

import com.leoman.controller.common.CommonController;
import com.leoman.core.Constant;
import com.leoman.dao.FbDetailDao;
import com.leoman.dao.MoJuDao;
import com.leoman.entity.MoJu;
import com.leoman.entity.vo.CheckResultInfoVo;
import com.leoman.entity.vo.DetailInfoPlusVo;
import com.leoman.entity.vo.DetailInfoVo;
import com.leoman.service.MoJuService;
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
 * MoJuServiceImpl
 * Created by 涂奕恒 on 2017/2/9 0009 15:47.
 */
@Service
public class MoJuServiceImpl extends GenericManagerImpl<MoJu, MoJuDao> implements MoJuService {

    @Autowired
    private MoJuDao moJuDao;

    @Autowired
    private FbDetailDao fbDetailDao;

    @Override
    public List<MoJu> findAll() {
        return moJuDao.findAll();
    }

    @Override
    public Page<MoJu> find(int pageNum, int pageSize) {
        return moJuDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<MoJu> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public MoJu getById(int id) {
        return moJuDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        moJuDao.delete(id);
    }

    @Override
    public MoJu create(MoJu moJu) {
        return moJuDao.save(moJu);
    }

    @Override
    public MoJu update(MoJu moJu) {
        return moJuDao.save(moJu);
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
        List<MoJu> moJuList = moJuDao.findListByProductId(code);
        Integer passCount; // 合格数
        Integer status;

        // 通过序号分组然后再查询
        String numStr = "";
        List<MoJu> tempList;
        for (MoJu moJu : moJuList) {
            if (!numStr.contains(moJu.getjCNR())) {
                numStr += moJu.getjCNR() + ",";
            }
        }

        if (StringUtils.isNotBlank(numStr) && numStr.length() > 1) {
            numStr = numStr.substring(0, numStr.length() - 1);

            String[] jCNRStr = numStr.split(",");

            for (String str : jCNRStr) {
                // 根据jCNR查询对应的序号信息，此时有多个jCNR，全部放在同一个list中
                checkResultInfoVo = new CheckResultInfoVo();
                tempList = moJuDao.findListByProductIdAndJCNR(code, str);
                for (MoJu temp : tempList) {
                    passCount = 0;
                    detailInfoVo = new DetailInfoVo();

                    childList = new ArrayList<>();

                    // ###################################防止懵逼###################################
                    // 将每个需要检测的步骤查询并加入list集合中
                    // 例如，模具表需要查询的检测步骤字段为：mJZL、bMZL、dWBS
                    // 注意：content字段中这样写，方便IndexApi中第九个接口的逻辑执行
                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getmJZL());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getmJZL());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getbMZL());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getbMZL());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);

                    detailInfoPlusVo = new DetailInfoPlusVo();
                    detailInfoPlusVo.setCheckResultId(temp.getdWBS());
                    status = PPPFServiceImpl.getResultById(fbDetailDao, temp.getdWBS());
                    if (status == 1) {
                        passCount++;
                    }
                    detailInfoPlusVo.setStatus(status);
                    childList.add(detailInfoPlusVo);
                    // ###################################防止懵逼###################################

                    detailInfoVo.setChildList(childList);
                    detailInfoVo.setPassRate(CommonController.getRate(passCount, 3));
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
        titleList.add("模具质量-mJZL");
        titleList.add("表面质量-bMZL");
        titleList.add("定位标识-dWBS");

        map.put("titleList", titleList);
        map.put("dataList", list);

        return map;
    }

    @Override
    public void submitCheckInfo(String code, String userName) {
        List<MoJu> moJuList = moJuDao.findListByProductId(code);

        for (MoJu moJu : moJuList) {
            moJu.setCanModify("1");
            moJu.setUserName(userName);

            moJuDao.save(moJu);
        }
    }

    @Override
    public Integer[] getCount(String userName, String startTime, String endTime) {
        Integer[] integers = new Integer[3];

        String sql = "SELECT * FROM PLM_FB_MoJu WHERE canModify = '1' AND userName = '" + userName + "'";
        if (StringUtils.isNotBlank(startTime)) {
            sql += " AND DATEDIFF(ss,'" + startTime + "', CreateTime) >= 0 AND DATEDIFF(ss, CreateTime,'" + endTime + "') >= 0";
        }
        List<MoJu> list = queryBySql(sql, MoJu.class);

        // 报废的数量
        Integer scrapCount = 0;
        // 返修的数量
        Integer reWorkCount = 0;

        for (MoJu moJu : list) {
            if (null == moJu || StringUtils.isBlank(moJu.getReason())) {
                continue;
            }
            if (moJu.getReason().contains("报废")) {
                scrapCount++;
            }
            if (moJu.getReason().contains("返修")) {
                reWorkCount++;
            }
        }

        integers[0] = list.size();  // 总产品数量
        integers[1] = scrapCount;
        integers[2] = reWorkCount;

        return integers;
    }

    @Override
    public Integer getStatus(List<MoJu> moJuList) {
        Integer result = 0;
        for (MoJu moJu : moJuList) {
            result = getStatus(moJu);
        }

        return result;
    }

    @Override
    public Integer getCanModifyStatus(String code) {
        Integer result = 1;
        List<MoJu> list = moJuDao.findListByProductId(code);

        for (MoJu moJu : list) {
            if (moJu.getCanModify().equals("0")) {
                result = 0;
            }
        }

        return result;
    }

    private Integer getStatus(MoJu moJu) {
        // 查询模具表每个需要检测的步骤对应的结果
        // 例如，模具表需要查询的检测步骤字段为：mJZL、bMZL、dWBS
        Integer result = PPPFServiceImpl.getResultById(fbDetailDao, moJu.getmJZL());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, moJu.getbMZL());
        if (result != 1) {
            return result;
        }

        result = PPPFServiceImpl.getResultById(fbDetailDao, moJu.getdWBS());
        if (result != 1) {
            return result;
        }

        return 1;
    }
}