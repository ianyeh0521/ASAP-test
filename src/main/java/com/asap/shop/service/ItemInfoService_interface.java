package com.asap.shop.service;

import java.util.List;
import java.util.Map;

import com.asap.shop.entity.ItemInfoVO;

public interface ItemInfoService_interface {

	ItemInfoVO addItem(ItemInfoVO ItemInfo);

	ItemInfoVO updateItem(ItemInfoVO ItemInfo);

	void deleteItem(Integer ItemNo);

	ItemInfoVO getItemInfoByItemNo(Integer ItemNo);
	
	List<ItemInfoVO> getAllItemInfos(int currentPage);
	
	List<ItemInfoVO> getItemInfosByCompositeQuery(Map<String, String[]> map);

	int getPageTotal();


}
