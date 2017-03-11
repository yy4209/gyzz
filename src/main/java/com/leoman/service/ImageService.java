package com.leoman.service;

import com.leoman.entity.FbDetail;
import com.leoman.entity.vo.PhotoRets;
import com.leoman.service.common.ICommonService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by 杨春 on 2017/3/10 0010.
 */
public interface ImageService {
    // 保存图片
    List<PhotoRets> save(List<MultipartFile> imageList);
}
