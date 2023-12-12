package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemStatVO;

public interface ItemStatService_interface {

    int addStat(ItemStatVO itemStat);

    int updateStat(ItemStatVO itemStat);

    int deleteStat(Integer itemStatNo);

    ItemStatVO findStatByNo(Integer itemStatNo);

    List<ItemStatVO> getAllStats();
}