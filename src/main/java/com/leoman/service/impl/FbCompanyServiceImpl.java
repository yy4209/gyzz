package com.leoman.service.impl;

import com.leoman.core.Constant;
import com.leoman.dao.FbCompanyDao;
import com.leoman.entity.FbCompany;
import com.leoman.service.FbCompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * FbCompanyServiceImpl
 * Created by 涂奕恒 on 2017/2/16 0016 12:02.
 */
@Service
public class FbCompanyServiceImpl implements FbCompanyService {

    @Autowired
    private FbCompanyDao fbCompanyDao;

    @Override
    public List<FbCompany> findAll() {
        return fbCompanyDao.findAll();
    }

    @Override
    public Page<FbCompany> find(int pageNum, int pageSize) {
        return fbCompanyDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<FbCompany> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public FbCompany getById(int id) {
        return fbCompanyDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        fbCompanyDao.delete(id);
    }

    @Override
    public FbCompany create(FbCompany fbCompany) {
        return fbCompanyDao.save(fbCompany);
    }

    @Override
    public FbCompany update(FbCompany fbCompany) {
        return fbCompanyDao.save(fbCompany);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }
}