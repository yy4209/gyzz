package com.leoman.controller.common;

import com.leoman.controller.editor.*;
import com.leoman.core.Constant;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.multipart.MultipartFile;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * 公共控制层
 * Created by 涂奕恒 on 2014/12/10.
 */
public class CommonController {

    public static Map<String, Object> emptyData = null;

    static {
        emptyData = new HashMap<>();
        emptyData.put("data", new ArrayList());
        emptyData.put("iTotalRecords", 0);
        emptyData.put("iTotalDisplayRecords", 0);
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new CustomStringEditor());
        binder.registerCustomEditor(MultipartFile.class, new CustomFileEditor());
        binder.registerCustomEditor(Double.class, new CustomDoubleEditor());
        binder.registerCustomEditor(Float.class, new CustomFloatEditor());
        binder.registerCustomEditor(Integer.class, new CustomIntegerEditor());
        binder.registerCustomEditor(Long.class, new CustomLongEditor());
        binder.registerCustomEditor(Date.class, new CustomDateEditor());
    }

    public static Integer getPageNum(Integer start, Integer length) {
        if (start == null) {
            start = 0;
        }
        if (length == null) {
            length = 10;
        }

        return (start / length) + 1;
    }

    /**
     * 获取 or 转化分页需要的参数
     *
     * @param pageNum  页码
     * @param pageSize 每页显示条数
     * @return 数组
     */
    public static Integer[] getPageParams(Integer pageNum, Integer pageSize) {
        Integer[] info = new Integer[2];

        if (null == pageNum || pageNum < 0) {
            pageNum = 1;
        }

        if (null == pageSize) {
            pageSize = Constant.PAGE_DEF_SIZE;
        }

        if (pageNum > pageSize) {
            pageNum = pageSize;
        }

        info[0] = pageNum;
        info[1] = pageSize;

        return info;
    }


    public static Double getRate(Integer littleNum, Integer allNum) {
        float num = (float) littleNum / allNum;
        DecimalFormat df = new DecimalFormat("0.0");//格式化小数
        if (littleNum.equals(allNum) && littleNum == 0) {
            return 0.0;
        }
        return Double.parseDouble(df.format(num)) * 100;
    }

    public static void main(String[] args) {
        System.out.println(getRate(0, 7));
    }
}
