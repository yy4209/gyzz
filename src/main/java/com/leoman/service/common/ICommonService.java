package com.leoman.service.common;

import org.springframework.data.domain.Page;

import java.util.List;

/**
 * 公共Service接口
 * Created by 王彬 on 2014-10-16.
 */
public interface ICommonService<T> {

    List<T> findAll();

    Page<T> find(int pageNum, int pageSize);

    Page<T> find(int pageNum);

    T getById(int id);

    void deleteById(int id);

    T create(T t);

    T update(T t);

    void deleteAll(int[] ids);
}
