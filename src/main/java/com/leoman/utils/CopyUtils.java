package com.leoman.utils;

import org.apache.commons.lang.StringUtils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;

/**
 * 实体类属性复制工具类
 * Created by 涂奕恒 on 2017/2/14 0014.
 */
public class CopyUtils {

    public static void Copy(Object source, Object dest, Boolean saveId) throws Exception {
        // 获取属性
        BeanInfo sourceBean = Introspector.getBeanInfo(source.getClass(), java.lang.Object.class);
        PropertyDescriptor[] sourceProperty = sourceBean.getPropertyDescriptors();

        BeanInfo destBean = Introspector.getBeanInfo(dest.getClass(), java.lang.Object.class);
        PropertyDescriptor[] destProperty = destBean.getPropertyDescriptors();

        try {
            for (int i = 0; i < sourceProperty.length; i++) {
                for (int j = 0; j < destProperty.length; j++) {
                    if (sourceProperty[i].getName().equals(destProperty[j].getName())) {
                        // 调用source的getter方法和dest的setter方法
                        destProperty[j].getWriteMethod().invoke(dest, sourceProperty[i].getReadMethod().invoke(source));
                        break;
                    }
                }
            }
        } catch (Exception e) {
            throw new Exception("属性复制失败:" + e.getMessage());
        }
    }

    @SuppressWarnings("rawtypes")
    public static void main(String args[]) throws IllegalArgumentException, IllegalAccessException {

    }

    /**
     * 属性复制
     */
    @SuppressWarnings("rawtypes")
    public static void copyProperty(Object oldObj, Object newObj, Boolean saveId, String fieldInfo, Object value) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
        //新的class
        Class newClass = newObj.getClass();
        //老的class
        Class oldClass = oldObj.getClass();
        //该类所有的属性
        Field[] newFields = newClass.getDeclaredFields();
        //新的属性
        Field newField;
        //老的属性
        Field oldField;
        for (Field f : newFields) {
            //类中的属性名称
            String fieldName = f.getName();
            if (!saveId && fieldName.equals("id")) {
                continue;
            }
            //通过属性名称获取属性
            newField = newClass.getDeclaredField(fieldName);
            //获取属性的值时需要设置为 true 则指示反射的对象在使用时应该取消 Java 语言访问检查。
            //值为 false 则指示反射的对象应该实施 Java 语言访问检查。
            newField.setAccessible(true);
            //根据属性获取对象上的值
            Object newObject;
            if (StringUtils.isNotBlank(fieldInfo) && fieldName.equals(fieldInfo)) {
                newObject = value;
            } else {
                newObject = newField.get(newObj);
                //过滤空的属性或者一些默认值
                if (isContinue(newObject)) {
                    continue;
                }
            }
            oldField = oldClass.getDeclaredField(fieldName);
            oldField.setAccessible(true);
            oldField.set(oldObj, newObject);
        }
    }

    /**
     * 是否跳出本次循环
     *
     * @param object
     * @return true 是 有null或者默认值
     * false 否 有默认值
     * @author 2014-11-6 上午11:37:22
     */
    private static boolean isContinue(Object object) {
        if (object == null || "".equals(object)) {
            return true;
        }
        String valueStr = object.toString();
        if ("0".equals(valueStr) || "0.0".equals(valueStr)) {
            return true;
        }
        return false;
    }
}
