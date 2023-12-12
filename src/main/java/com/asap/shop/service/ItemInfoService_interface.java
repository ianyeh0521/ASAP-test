package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemInfoVO;

public interface ItemInfoService_interface {

    int insertItemInfo(ItemInfoVO itemInfo);

    int updateItemInfo(ItemInfoVO itemInfo);

    int deleteItemInfo(Integer id);

    ItemInfoVO getItemInfoById(Integer id);

    List<ItemInfoVO> getByFuzzySearch(String keyword);

    List<ItemInfoVO> getItemInfoByCategory(String category);

    List<ItemInfoVO> getItemInfoByPriceRange(Integer minPrice, Integer maxPrice);

    List<ItemInfoVO> getItemInfoByPriceOrder(boolean descending);

    List<ItemInfoVO> getItemInfoByViewOrder();

    List<ItemInfoVO> getAllItemInfo();
}
