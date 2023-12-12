package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemTypeVO;

public interface ItemTypeService_interface {

    int addType(ItemTypeVO itemType);

    int updateType(ItemTypeVO itemType);

    int deleteType(Integer itemTypeNo);

    ItemTypeVO findTypeByNo(Integer itemTypeNo);

    List<ItemTypeVO> getAllTypes();
}