package com.asap.shop.dao;

import java.util.List;
import java.util.Map;

import com.asap.shop.entity.ItemInfoVO;

public interface ItemInfoDAO_interface {
	// 新增商品資訊

	int insert(ItemInfoVO itemInfo);

	int update(ItemInfoVO itemInfo);

	int delete(ItemInfoVO itemInfo);
	
	// 增加商品的瀏覽次數
    //void increaseItemView(Integer itemId);//x

	// 用商品編號查找單筆商品資訊
	ItemInfoVO findByItemNo(Integer id);

	// 模糊查詢(HQL)(搜尋欄位)
	List<ItemInfoVO> getByFuzzySearch(String itemInfoKeyword);

	// (HQL)用某個欄位來找商品資訊--->column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 小提醒->如果你的Keyword值是String以外的型別請轉成String
	//List<ItemInfoVO> getItemInfoByCategory(String column, Integer Keyword);//x
	
	//按造商品價格範圍查詢
	//List<ItemInfoVO> findByPriceRange(Integer minPrice, Integer maxPrice);//x
	
	// 按照商品價格排名
    List<ItemInfoVO> orderByItemPrice(boolean descending);
	
	//按造瀏覽人數排名
	List<ItemInfoVO> orderByItemView();
	
	//按照上架時間排名
	List<ItemInfoVO> orderByItemAddTime();
	
	//複合查詢
	List<ItemInfoVO> getByCompositeQuery(Map<String, String> map);
	
	// 查詢所有商品資訊
	List<ItemInfoVO> getAll();
	
	//找最低價
	int getLowestPrice();
	
	//找最高價
	int getHighestPrice();
	
	public ItemInfoVO checkerFindByItemNo(Integer itemNo);
	
	Integer checkerUpdate(ItemInfoVO itemInfo);

}