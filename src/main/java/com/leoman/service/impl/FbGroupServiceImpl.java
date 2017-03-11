package com.leoman.service.impl;

import com.leoman.core.Constant;
import com.leoman.dao.FbGroupDao;
import com.leoman.entity.FbGroup;
import com.leoman.service.FbGroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * FbGroupServiceImpl
 * Created by 涂奕恒 on 2017/2/16 0016 12:02.
 */
@Service
public class FbGroupServiceImpl implements FbGroupService {

    @Autowired
    private FbGroupDao fbGroupDao;

    @Override
    public List<FbGroup> findAll() {
        return fbGroupDao.findAll();
    }

    @Override
    public Page<FbGroup> find(int pageNum, int pageSize) {
        return fbGroupDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<FbGroup> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public FbGroup getById(int id) {
        return fbGroupDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        fbGroupDao.delete(id);
    }

    @Override
    public FbGroup create(FbGroup fbGroup) {
        return fbGroupDao.save(fbGroup);
    }

    @Override
    public FbGroup update(FbGroup fbGroup) {
        return fbGroupDao.save(fbGroup);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }

    @Override
    public List<FbGroup> findListByDepartmentId(Integer departmentId) {
        return fbGroupDao.findListByDepartmentId(departmentId);
    }
}