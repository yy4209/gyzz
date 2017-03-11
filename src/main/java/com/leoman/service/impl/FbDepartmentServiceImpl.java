package com.leoman.service.impl;

import com.leoman.core.Constant;
import com.leoman.dao.FbDepartmentDao;
import com.leoman.entity.FbDepartment;
import com.leoman.service.FbDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * FbDepartmentServiceImpl
 * Created by 涂奕恒 on 2017/2/16 0016 12:02.
 */
@Service
public class FbDepartmentServiceImpl implements FbDepartmentService {

    @Autowired
    private FbDepartmentDao fbDepartmentDao;

    @Override
    public List<FbDepartment> findAll() {
        return fbDepartmentDao.findAll();
    }

    @Override
    public Page<FbDepartment> find(int pageNum, int pageSize) {
        return fbDepartmentDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<FbDepartment> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public FbDepartment getById(int id) {
        return fbDepartmentDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        fbDepartmentDao.delete(id);
    }

    @Override
    public FbDepartment create(FbDepartment fbDepartment) {
        return fbDepartmentDao.save(fbDepartment);
    }

    @Override
    public FbDepartment update(FbDepartment fbDepartment) {
        return fbDepartmentDao.save(fbDepartment);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }

    @Override
    public List<FbDepartment> findListByCompanyId(Integer companyId) {
        return fbDepartmentDao.findListByCompanyId(companyId);
    }
}