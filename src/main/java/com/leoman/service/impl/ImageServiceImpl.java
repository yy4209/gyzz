package com.leoman.service.impl;

import com.leoman.core.Configue;
import com.leoman.entity.vo.PhotoRets;
import com.leoman.service.ImageService;
import com.leoman.utils.FileUtil;
import com.leoman.utils.UploadUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 杨春 on 2017/3/10 0010.
 */
public class ImageServiceImpl implements ImageService {

    public List<PhotoRets> save(List<MultipartFile> imageList) {

        List<PhotoRets> prsList = new ArrayList<PhotoRets>();

        for (MultipartFile iList : imageList) {
            MultipartFile file = iList;
            PhotoRets prs = new PhotoRets();
            // 默认为false
            prs.setRet("flase");
            String fileName = String.valueOf(System.currentTimeMillis());
            try {
                InputStream inputStream = file.getInputStream();
                String origFileName = file.getOriginalFilename(); //原始名称,如aa.jpg
                String ext =  FileUtil.getFileExt(origFileName); //后缀，如jpg
                String uploadPath = UploadUtil.getImagesUpladPath(); //生成日期目录 image/2014/7/21/
                String foreName = uploadPath+fileName;   //文件名称 image/2014/7/21/221144144554
                String desFilePathName = uploadPath+fileName+ext;//完整文件名称 image/2014/7/21/221144144554.jpg
                File theFile = new File(Configue.getUploadPath(),fileName + ".jpg"); //生成的文件对象

                prs.setFileName(fileName + ext);
                prs.setRet("true");

                FileUtils.copyInputStreamToFile(inputStream,theFile);
            } catch (IOException e) {
                e.printStackTrace();
            }

            prsList.add(prs);

        }

        return prsList;
    }

}
