package com.leoman.service.impl;

import com.leoman.core.Constant;
import com.leoman.dao.*;
import com.leoman.entity.FbAdmin;
import com.leoman.entity.FbDetail;
import com.leoman.entity.PPPF;
import com.leoman.entity.vo.DetailVo;
import com.leoman.exception.ParamErrorException;
import com.leoman.service.*;
import com.leoman.utils.DateUtils;
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
 * FbDetailServiceImpl
 * Created by 涂奕恒 on 2017/2/9 0009 15:47.
 */
@Service
public class PPPFServiceImpl extends GenericManagerImpl<PPPF, PPPFDao> implements PPPFService {

    @Autowired
    private PPPFDao pppfDao;

    @Autowired
    private ZhiXinDao zhiXinDao;

    @Autowired
    private ZaoXingDao zaoXingDao;

    @Autowired
    private HeXiangDao heXiangDao;

    @Autowired
    private MoJuDao moJuDao;

    @Autowired
    private FbAdminDao fbAdminDao;

    @Autowired
    private ZhiXinService zhiXinService;

    @Autowired
    private ZaoXingService zaoXingService;

    @Autowired
    private HeXiangService heXiangService;

    @Autowired
    private MoJuService moJuService;

    // 新增的实体Dao引用
    // 例如：@Autowired
    //      private ZhiXinDao zhiXinDao;

    @Override
    public List<PPPF> findAll() {
        return pppfDao.findAll();
    }

    @Override
    public Page<PPPF> find(int pageNum, int pageSize) {
        return pppfDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<PPPF> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public PPPF getById(int id) {
        return pppfDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        pppfDao.delete(id);
    }

    @Override
    public PPPF create(PPPF PPPF) {
        return pppfDao.save(PPPF);
    }

    @Override
    public PPPF update(PPPF PPPF) {
        return pppfDao.save(PPPF);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }

    @Override
    public List<DetailVo> findListByParam(String code) {
        List<PPPF> pppfList = pppfDao.findListByParam(code);
        List<PPPF> childList;

        // 去重
        String str = "";
        List<PPPF> tempList = new ArrayList<>();

        for (PPPF pppf : pppfList) {
            if (!str.contains(pppf.getProcess_step())) {
                str += pppf.getProcess_step();
                tempList.add(pppf);
            }
        }

        List<DetailVo> list = new ArrayList<>();
        List<DetailVo> childDetailList;
        DetailVo detailVo;
        DetailVo childDetailVo;
        Integer status;
        Integer masterStatus;

        for (PPPF pppf : tempList) {
            detailVo = new DetailVo();
            detailVo.setContent(pppf.getProcess_step());
            masterStatus = getStepStatus(code, pppf.getProcess_step());

            childList = pppfDao.findListByParam(code, pppf.getProcess_step());

            childDetailList = new ArrayList<>();

            for (PPPF tempPppf : childList) {
                childDetailVo = new DetailVo();
                childDetailVo.setContent(tempPppf.getProcess_flow());

                status = getFlowStatus(code, tempPppf.getProcess_step(), tempPppf.getProcess_flow());

                if (status == 1) {
                    // 如果是合格状态，则判断是否提交，如果没有提交，则返回0，代表进行中
                    if (tempPppf.getProcess_flow().equals("制芯")) {
                        status = zhiXinService.getCanModifyStatus(code);
                    } else if (tempPppf.getProcess_flow().equals("造型")) {
                        status = zaoXingService.getCanModifyStatus(code);
                    } else if (tempPppf.getProcess_flow().equals("合箱")) {
                        status = heXiangService.getCanModifyStatus(code);
                    } else if (tempPppf.getProcess_flow().equals("模具")) {
                        status = moJuService.getCanModifyStatus(code);
                    }
                    // 在这里增加else if，equals后面的括号里面就修改成增加的工序名称
                    // else if里面的内容跟制芯一样
                }

                childDetailVo.setStatus(status);

                childDetailList.add(childDetailVo);
            }

            if (masterStatus == 1) {
                for (DetailVo detailVo1 : childDetailList) {
                    if (detailVo1.getStatus().equals(0)) {
                        masterStatus = 0;
                    }
                }
            }

            detailVo.setStatus(masterStatus);
            detailVo.setList(childDetailList);

            list.add(detailVo);
        }

        return list;
    }

    // 获取工步完成状态
    public Integer getStepStatus(String code, String step) {
        // 获取工步列表
        List<PPPF> flowList = pppfDao.findListByParam(code, step);
        Integer result;

        for (PPPF pppf : flowList) {
            // 查询该工步下每个工序的完成状态
            // 如果合格，则继续检测下一个工序，直到所有工序全部检测完成
            result = getFlowStatus(code, step, pppf.getProcess_flow());
            if (result != 1) {
                return result;
            }
        }

        return 1;
    }

    // 获取工序完成状态（-1=不适用，0=待检测，1=合格，2=返修，3=报废）
    public Integer getFlowStatus(String code, String step, String flow) {
        // 获取工序列表
        List<PPPF> flowList = pppfDao.findListByParam(code, step, flow);

        for (PPPF pppf : flowList) {
            // 根据工序名称查询对应的数据库表，获取数据
            if (pppf.getProcess_flow().equals("制芯")) {
                // 获取对应的制芯信息
                return zhiXinService.getStatus(zhiXinDao.findListByProductId(pppf.getProduct_id()));
            } else if (pppf.getProcess_flow().equals("造型")) {
                // 跟制芯一样
                // 获取对应的造型信息
                return zaoXingService.getStatus(zaoXingDao.findListByProductId(pppf.getProduct_id()));
            } else if (pppf.getProcess_flow().equals("合箱")) {
                // 跟制芯一样
                // 获取对应的合箱信息
                return heXiangService.getStatus(heXiangDao.findListByProductId(pppf.getProduct_id()));
            } else if (pppf.getProcess_flow().equals("模具")) {
                // 跟制芯一样
                // 获取对应的模具信息
                return moJuService.getStatus(moJuDao.findListByProductId(pppf.getProduct_id()));
            }
            // 在这里增加else if，equals后面的括号里面就修改成增加的工序名称
            // else if里面的内容跟制芯一样
        }

        return 0;
    }

    // 根据结果id查询对应的状态（-1=不适用，0=待检测，1=合格，2=返修，3=报废）,供/api/index/stepList 5、查询工步列表接口使用，author:杨春 time：2017.3.8
    public static Integer getStepListResultById(FbDetailDao fbDetailDao, String id) {
        if (StringUtils.isBlank(id)) {
            // 如果没有结果id，则直接返回不适用状态
            return 0;
        }

        FbDetail fbDetail = fbDetailDao.findOne(Integer.parseInt(id));

        if (null == fbDetail) {
            // 如果查询结果不存在，则直接返回不适用状态
            return 0;
        }

        if (StringUtils.isBlank(fbDetail.getConclusion())) {
            return 0;
        } else if (fbDetail.getConclusion().equals("合格")) {
            return 1;
        } else if (fbDetail.getConclusion().equals("返修")) {
            return 2;
        } else if (fbDetail.getConclusion().equals("报废")) {
            return 3;
        } else if (fbDetail.getConclusion().equals("不适用")) {
            return 0;
        } else {
            return 0;
        }
    }

    // 根据结果id查询对应的状态（-1=不适用，0=待检测，1=合格，2=返修，3=报废）
    public static Integer getResultById(FbDetailDao fbDetailDao, String id) {
        if (StringUtils.isBlank(id)) {
            // 如果没有结果id，则直接返回不适用状态
            return 0;
        }

        FbDetail fbDetail = fbDetailDao.findOne(Integer.parseInt(id));

        if (null == fbDetail) {
            // 如果查询结果不存在，则直接返回不适用状态
            return 0;
        }

        if (StringUtils.isBlank(fbDetail.getConclusion())) {
            return 0;
        } else if (fbDetail.getConclusion().equals("合格")) {
            return 1;
        } else if (fbDetail.getConclusion().equals("返修")) {
            return 2;
        } else if (fbDetail.getConclusion().equals("报废")) {
            return 3;
        } else if (fbDetail.getConclusion().equals("不适用")) {
            return -1;
        } else {
            return 0;
        }
    }

    @Override
    public List<DetailVo> findListByParam(String code, String step) {
        List<PPPF> pppfList = pppfDao.findListByParam(code, step);

        List<DetailVo> list = new ArrayList<>();
        DetailVo detailVo;

        for (PPPF pppf : pppfList) {
            detailVo = new DetailVo();
            detailVo.setContent(pppf.getProcess_flow());
            detailVo.setStatus(getFlowStatus(code, step, pppf.getProcess_flow()));

            list.add(detailVo);
        }

        return list;
    }

    @Override
    public Map<String, Object> getData(String userName) throws ParamErrorException {
        Map<String, Object> map = new HashMap<>();

        // 获取指定操作员的权限
        FbAdmin fbAdmin = fbAdminDao.findOneByAccount(userName);

        if (null == fbAdmin) {
            throw new ParamErrorException();
        }

        // 总产品数量
        Integer allCount = 0;
        // 总报废产品数量
        Integer allScrapCount = 0;
        // 总返修产品数量
        Integer allReWorkCount = 0;

        // 本月产品数量
        Integer monthCount = 0;
        // 本月报废产品数量
        Integer monthScrapCount = 0;
        // 本月返修产品数量
        Integer monthReWorkCount = 0;

        // 获取本月第一天的开始时间
        String startTime = DateUtils.getFirstDay() + " 00:00:00";
        // 获取本月最后一天的结束时间
        String endTime = DateUtils.getEndDay() + " 23:59:59";
        Integer[] integers;

        if (fbAdmin.getCompetence().contains("制芯")) {
            // 查询制芯表的数量
            integers = zhiXinService.getCount(userName, "", "");
            allCount += integers[0];
            allScrapCount += integers[1];
            allReWorkCount += integers[2];
        }
        if (fbAdmin.getCompetence().contains("造型")) {
            // 查询造型表的数量
            integers = zaoXingService.getCount(userName, "", "");
            allCount += integers[0];
            allScrapCount += integers[1];
            allReWorkCount += integers[2];
        }
        if (fbAdmin.getCompetence().contains("合箱")) {
            // 查询合箱表的数量
            integers = heXiangService.getCount(userName, "", "");
            allCount += integers[0];
            allScrapCount += integers[1];
            allReWorkCount += integers[2];
        }
        if (fbAdmin.getCompetence().contains("模具")) {
            // 查询模具表的数量
            integers = moJuService.getCount(userName, "", "");
            allCount += integers[0];
            allScrapCount += integers[1];
            allReWorkCount += integers[2];
        }
        // 在这里增加if，contains后面的括号里面就修改成增加的工序名称
        // if里面的内容跟制芯一样

        // ******************************************分界线******************************************


        // 统计本月的产品信息
        if (fbAdmin.getCompetence().contains("制芯")) {
            // 查询制芯表的数量
            integers = zhiXinService.getCount(userName, startTime, endTime);
            monthCount += integers[0];
            monthScrapCount += integers[1];
            monthReWorkCount += integers[2];
        }
        if (fbAdmin.getCompetence().contains("造型")) {
            // 查询造型表的数量
            integers = zaoXingService.getCount(userName, startTime, endTime);
            monthCount += integers[0];
            monthScrapCount += integers[1];
            monthReWorkCount += integers[2];
        }
        if (fbAdmin.getCompetence().contains("合箱")) {
            // 查询合箱表的数量
            integers = heXiangService.getCount(userName, startTime, endTime);
            monthCount += integers[0];
            monthScrapCount += integers[1];
            monthReWorkCount += integers[2];
        }
        if (fbAdmin.getCompetence().contains("模具")) {
            // 查询模具表的数量
            integers = moJuService.getCount(userName, startTime, endTime);
            monthCount += integers[0];
            monthScrapCount += integers[1];
            monthReWorkCount += integers[2];
        }
        // 在这里增加if，contains后面的括号里面就修改成增加的工序名称
        // if里面的内容跟制芯一样

        // 总数据
        map.put("allCount", allCount);
        map.put("allScrapCount", allScrapCount);
        map.put("allReWorkCount", allReWorkCount);

        // 本月数据
        map.put("monthCount", monthCount);
        map.put("monthScrapCount", monthScrapCount);
        map.put("monthReWorkCount", monthReWorkCount);

        return map;
    }


    // **********************************************操作说明**********************************************
    /**
     * 1、在com.leoman.entity下增加跟数据库对应的实体类，例如数据库的PLM_FB_ZhiXin表对应的实体类就是com.leoman.entity.ZhiXin；
     * 2、在com.leoman.dao下增加对应的dao层（复制com.leoman.dao.ZhiXinDao，使用Ctrl+F将里面的ZhiXin替换为新增的实体类名称）；
     * 3、在com.leoman.service下增加对应的service层（复制com.leoman.service.ZhiXinService，使用Ctrl+F将里面的ZhiXin替换为新增的实体类名称）；
     * 4、在com.leoman.service.impl下增加对应的serviceImpl层（复制com.leoman.service.impl.ZhiXinServiceImpl，使用Ctrl+F将里面的ZhiXin替换为新增的实体类名称）；
     * 5、在这个class第62行处，增加新增实体Dao的引用；
     * 5、在这个class第158、225、338、373行处，增加检测代码；
     * 6、在com.leoman.controller.api.IndexApi第366行~第367行处和第506行~第507行处，增加代码；
     * 7、在com.leoman.service.impl.FbDetailServiceImpl第261行~第263行处，增加代码；
     * 8、添加工序功能完成.
     */
}