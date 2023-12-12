package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemSizeVO;

public interface ItemSizeService_interface {

    int addSize(ItemSizeVO itemSize);

    int updateSize(ItemSizeVO itemSize);

    int deleteSize(Integer itemSizeNo);

    ItemSizeVO findSizeByNo(Integer itemSizeNo);

    List<ItemSizeVO> getAllSizes();
}