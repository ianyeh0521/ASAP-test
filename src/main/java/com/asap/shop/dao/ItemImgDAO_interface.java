package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.ItemImgVO;

public interface ItemImgDAO_interface {

	//	以編號來進行增刪查改
	int insert(ItemImgVO itemImg);

	int update(ItemImgVO itemImg);
	
	int delete(Integer id);

	// 商品編號查找商品圖片(單筆商品的所有照片)
	ItemImgVO findByItemImgNo(Integer itemImgNo);

	//全部的商品的照片
	List<ItemImgVO> getALL();

}