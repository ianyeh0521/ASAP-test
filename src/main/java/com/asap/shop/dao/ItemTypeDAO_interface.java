package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.ItemTypeVO;

public interface ItemTypeDAO_interface {

	// 以編號來進行增刪查改
	int insert(ItemTypeVO itemType);

	int delete(ItemTypeVO itemType);

	// 編號查找單筆商品分類名稱(PK)
	ItemTypeVO findByItemTypeNo(Integer itemTypeNo);

	List<ItemTypeVO> getALL();

}