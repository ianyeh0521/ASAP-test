package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemStatVO;

public interface ItemStatService_interface {

	// 以編號來進行增刪查改
	int insert(ItemStatVO itemStat);

	int delete(ItemStatVO itemStat);

	// 編號查找單筆商品狀態名稱(PK)
	ItemStatVO findByItemStatNo(Integer itemStatNo);

	List<ItemStatVO> getALL();
}