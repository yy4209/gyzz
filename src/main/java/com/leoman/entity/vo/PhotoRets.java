package com.leoman.entity.vo;

/**
 * 上传图片返回类
 * Created by 杨春 on 2017/3/10 0010.
 */
public class PhotoRets {

    // 上传文件名
    String fileName;

    // 是否上传成功
    String ret;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getRet() {
        return ret;
    }

    public void setRet(String ret) {
        this.ret = ret;
    }
}
