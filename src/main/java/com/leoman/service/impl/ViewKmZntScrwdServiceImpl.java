package com.leoman.service.impl;

import com.leoman.controller.common.CommonController;
import com.leoman.core.Constant;
import com.leoman.dao.ViewKmZntScrwdDao;
import com.leoman.entity.ViewKmZntScrwd;
import com.leoman.service.ViewKmZntScrwdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ViewKmZntScrwdServiceImpl
 * Created by 涂奕恒 on 2017/2/9 0009 15:47.
 */
@Service
public class ViewKmZntScrwdServiceImpl implements ViewKmZntScrwdService {

    @Autowired
    private ViewKmZntScrwdDao viewKmZntScrwdDao;

    @Override
    public List<ViewKmZntScrwd> findAll() {
        return viewKmZntScrwdDao.findAll();
    }

    @Override
    public Page<ViewKmZntScrwd> find(int pageNum, int pageSize) {
        return viewKmZntScrwdDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<ViewKmZntScrwd> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public ViewKmZntScrwd getById(int id) {
        return viewKmZntScrwdDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        viewKmZntScrwdDao.delete(id);
    }

    @Override
    public ViewKmZntScrwd create(ViewKmZntScrwd viewKmZntScrwd) {
        return viewKmZntScrwdDao.save(viewKmZntScrwd);
    }

    @Override
    public ViewKmZntScrwd update(ViewKmZntScrwd viewKmZntScrwd) {
        return viewKmZntScrwdDao.save(viewKmZntScrwd);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }

    @Override
    public Page<ViewKmZntScrwd> iPageByParams(Integer pageNum, Integer pageSize) {
        Integer[] info = CommonController.getPageParams(pageNum, pageSize);
        return viewKmZntScrwdDao.iPageByParams(new PageRequest(info[0] - 1, info[1]));
    }

    @Override
    public Page<ViewKmZntScrwd> iPageByParams(String type, Integer pageNum, Integer pageSize) {
        Integer[] info = CommonController.getPageParams(pageNum, pageSize);
        return viewKmZntScrwdDao.iPageByParamsPlus(type, new PageRequest(info[0] - 1, info[1]));
    }
}