package com.asap.shop.service;

import java.util.List;
import com.asap.shop.entity.ItemImgVO;

public interface ItemImgService_interface {

	// 以編號來進行增刪查改
	int insert(ItemImgVO itemImg);

	int delete(ItemImgVO itemImg);

	// 主鍵查找商品圖片
	ItemImgVO findByPK(Integer itemImgNo);

	List<ItemImgVO> findByItemNo(Integer itemNo);

	// 全部的商品的照片
	List<ItemImgVO> getALL();
	
	int cleanByItemNo(Integer itemNo);

}