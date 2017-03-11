package com.leoman.service.impl;

import com.leoman.core.Constant;
import com.leoman.dao.FbAdminDao;
import com.leoman.dao.PPPFDao;
import com.leoman.entity.FbAdmin;
import com.leoman.entity.FbGroup;
import com.leoman.entity.PPPF;
import com.leoman.exception.ParamErrorException;
import com.leoman.exception.UserNotFindException;
import com.leoman.service.FbAdminService;
import com.leoman.utils.Md5Util;
import com.leoman.utils.RandomUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * AdminServiceImpl
 * Created by 涂奕恒 on 2016/11/23 0023 下午 3:56.
 */
@Service
public class FbAdminServiceImpl implements FbAdminService {

    @Autowired
    private FbAdminDao fbAdminDao;

    @Autowired
    private PPPFDao pppfDao;

    @Override
    public List<FbAdmin> findAll() {
        return fbAdminDao.findAll();
    }

    @Override
    public Page<FbAdmin> find(int pageNum, int pageSize) {
        return fbAdminDao.findAll(new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Page<FbAdmin> find(int pageNum) {
        return find(pageNum, Constant.PAGE_DEF_SIZE);
    }

    @Override
    public FbAdmin getById(int id) {
        return fbAdminDao.findOne(id);
    }

    @Override
    public void deleteById(int id) {
        fbAdminDao.delete(id);
    }

    @Override
    public FbAdmin create(FbAdmin fbAdmin) {
        return fbAdminDao.save(fbAdmin);
    }

    @Override
    public FbAdmin update(FbAdmin fbAdmin) {
        return fbAdminDao.save(fbAdmin);
    }

    @Override
    @Transactional
    public void deleteAll(int[] ids) {
        for (int id : ids) {
            deleteById(id);
        }
    }

    @Override
    public FbAdmin iLogin(String account, String password) throws ParamErrorException, UserNotFindException {
        if (StringUtils.isBlank(account) || StringUtils.isBlank(password)) {
            throw new ParamErrorException();
        }

        FbAdmin fbAdmin = fbAdminDao.findOneByAccount(account);

        if (null == fbAdmin || !fbAdmin.getPassword().equals(Constant.isMd5 ? Md5Util.md5(password) : password)) {
            throw new UserNotFindException();
        }

        return fbAdmin;
    }

    @Override
    public FbAdmin loginIn(HttpServletRequest request, String account, String password) {
        FbAdmin fbAdmin = fbAdminDao.findOneByAccount(account);

        if (null != fbAdmin && fbAdmin.getPassword().equals(Constant.isMd5 ? Md5Util.md5(password) : password)) {
            request.getSession().setAttribute(Constant.CURRENT_ADMIN_USER, fbAdmin);
            return fbAdmin;
        }

        return null;
    }

    @Override
    public void loginOut(HttpServletRequest request) {
        request.getSession().removeAttribute(Constant.CURRENT_ADMIN_USER);
    }

    @Override
    public Page<FbAdmin> pageByParams(final String account, final String company, Integer pageNum, Integer pageSize) {
        return fbAdminDao.findAll(new Specification<FbAdmin>() {
            @SuppressWarnings("ToArrayCallWithZeroLengthArrayArgument")
            @Override
            public Predicate toPredicate(Root<FbAdmin> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                Predicate result = null;
                List<Predicate> predicateList = new ArrayList<>();
                if (StringUtils.isNotBlank(account)) {
                    Predicate pre = cb.like(root.get("account").as(String.class), "%" + account + "%");
                    predicateList.add(pre);
                }
                if (StringUtils.isNotBlank(company)) {
                    Predicate pre = cb.like(root.get("company").as(String.class), "%" + company + "%");
                    predicateList.add(pre);
                }
                if (predicateList.size() > 0) {
                    result = cb.and(predicateList.toArray(new Predicate[]{}));
                }

                if (result != null) {
                    query.where(result);
                }
                return query.getGroupRestriction();
            }

        }, new PageRequest(pageNum - 1, pageSize, Sort.Direction.DESC, "id"));
    }

    @Override
    public Integer saveAdminUser(Integer adminUserId, String account, String password, Integer groupId, String competence) {
        try {
            FbAdmin fbAdmin;
            FbAdmin accountFbAdmin = fbAdminDao.findOneByAccount(account);

            if (null == adminUserId) {
                fbAdmin = new FbAdmin();
            } else {
                fbAdmin = fbAdminDao.findOne(adminUserId);
                fbAdmin.setUpdateTime(System.currentTimeMillis());
            }

            if (null != accountFbAdmin) {
                if (null == fbAdmin.getId() || !fbAdmin.getId().equals(accountFbAdmin.getId())) {
                    return -1;
                }
            }

            FbGroup fbGroup = new FbGroup();
            fbGroup.setId(groupId);

            fbAdmin.setAccount(account);
            fbAdmin.setPassword(Constant.isMd5 ? Md5Util.md5(password) : password);
            fbAdmin.setGroup(fbGroup);
            fbAdmin.setCompetence(competence);

            fbAdminDao.save(fbAdmin);

            return 1;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public Integer deleteAdminUser(HttpServletRequest request, Integer adminUserId) {
        Integer flag = 1;

        try {
            FbAdmin sessionFbAdmin = (FbAdmin) request.getSession().getAttribute(Constant.CURRENT_ADMIN_USER);

            fbAdminDao.delete(adminUserId);

            if (sessionFbAdmin.getId().equals(adminUserId)) {
                request.getSession().removeAttribute(Constant.CURRENT_ADMIN_USER);
                flag = 100;
            }

            return flag;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public Integer reSetAdminUserPassword(HttpServletRequest request, Integer adminUserId) {
        Integer flag = 1;

        try {
            FbAdmin sessionFbAdminUser = (FbAdmin) request.getSession().getAttribute(Constant.CURRENT_ADMIN_USER);

            FbAdmin fbAdminUser = fbAdminDao.findOne(adminUserId);

            if (sessionFbAdminUser.getId().equals(adminUserId)) {
                request.getSession().removeAttribute(Constant.CURRENT_ADMIN_USER);
                flag = 100;
            }

            String newPassword = RandomUtil.getCode();
            fbAdminUser.setPassword(newPassword);

            fbAdminDao.save(fbAdminUser);

            return flag;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public Integer batchDeleteAdminUser(HttpServletRequest request, Integer[] adminUserIds) {
        Integer flag = 1;

        try {
            FbAdmin sessionFbAdminUser = (FbAdmin) request.getSession().getAttribute(Constant.CURRENT_ADMIN_USER);

            for (Integer adminUserId : adminUserIds) {
                if (null == adminUserId) {
                    continue;
                }
                if (sessionFbAdminUser.getId().equals(adminUserId)) {
                    request.getSession().removeAttribute(Constant.CURRENT_ADMIN_USER);
                    flag = 100;
                }

                fbAdminDao.delete(adminUserId);
            }

            return flag;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<String> competenceList() {
        List<PPPF> pppfList = pppfDao.findAll();
        List<String> list = new ArrayList<>();
        String str = "";

        for (PPPF pppf : pppfList) {
            if (!str.contains(pppf.getProcess_flow())) {
                str += pppf.getProcess_flow();
                list.add(pppf.getProcess_flow());
            }
        }

        return list;
    }
}