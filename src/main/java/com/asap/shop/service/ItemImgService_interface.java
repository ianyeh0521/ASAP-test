package com.asap.shop.service;

import java.util.List;
import com.asap.shop.entity.ItemImgVO;

public interface ItemImgService_interface {

    int addImage(ItemImgVO itemImg);

    int updateImage(ItemImgVO itemImg);

    int deleteImage(Integer itemImgNo);

    ItemImgVO findImageByNo(Integer itemImgNo);

    List<ItemImgVO> getAllImages();
}