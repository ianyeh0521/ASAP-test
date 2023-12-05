package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.ItemInfoVO;

public interface ItemInfoDAO_interface {
	// 新增商品資訊

	int insert(ItemInfoVO grpInfo);

	int update(ItemInfoVO grpInfo);

	int delete(Integer id);

	// 用商品編號查找單筆商品資訊
	List<ItemInfoVO> findByItemNo(Integer id);

	// 模糊查詢(HQL)(搜尋欄位)
	List<ItemInfoVO> getByFuzzySearch(String itemInfoKeyword);

	// (HQL)用某個欄位來找商品資訊--->column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 小提醒->如果你的Keyword值是String以外的型別請轉成String
	List<ItemInfoVO> getQuery(String column, String Keyword);
	
	//按造商品價格範圍查詢
	List<ItemInfoVO> findByPriceRange(Integer minPrice, Integer maxPrice);
	
	// 按照商品價格排名
    List<ItemInfoVO> orderByItemPrice(boolean descending);
	
	//按造瀏覽人數排名
	List<ItemInfoVO> orderByItemView(boolean descending);

	// 查詢所有商品資訊
	List<ItemInfoVO> getALL();

}