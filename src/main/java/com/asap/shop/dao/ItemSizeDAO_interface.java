package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.ItemSizeVO;

public interface ItemSizeDAO_interface {

	//	以編號來進行增刪查改
	int insert(ItemSizeVO itemSize);
	
	int delete(ItemSizeVO itemSize);

	// 編號查找單筆商品Size(PK)
	ItemSizeVO findByItemSizeNo(Integer itemSizeNo);

	List<ItemSizeVO> getALL();

}