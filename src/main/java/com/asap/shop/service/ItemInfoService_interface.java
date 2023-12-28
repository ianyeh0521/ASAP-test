package com.asap.shop.service;

import java.util.List;
import java.util.Map;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ItemTypeVO;

public interface ItemInfoService_interface {

	int insert(ItemInfoVO itemInfo);

	int update(ItemInfoVO itemInfo);

	int delete(ItemInfoVO itemInfo);
	
	// 增加商品的瀏覽次數
    void increaseItemView(ItemInfoVO itemInfo);

	// 用商品編號查找單筆商品資訊
	ItemInfoVO findByItemNo(Integer id);

	// 模糊查詢(HQL)(搜尋欄位)
	List<ItemInfoVO> getByFuzzySearch(String itemInfoKeyword);

		
	// 按照商品價格排名
    List<ItemInfoVO> orderByItemPrice(boolean descending);
	
	//按造瀏覽人數排名
	List<ItemInfoVO> orderByItemView();
	
	//按照上架時間排名
	List<ItemInfoVO> orderByItemAddTime();
	
	//複合查詢
	List<ItemInfoVO> getByCompositeQuery(Map<String, String[]> map);
	
	// 查詢所有商品資訊
	List<ItemInfoVO> getAll();
	
	//找最低價
	int getLowestPrice();
	
	//找最高價
	int getHighestPrice();
	
	// 找特定分類的商品
	Map<String, Map<Integer, Integer>> getAllCountsByCategories();
	// 計算特定分類的商品數量
	Map<Integer, Integer> getItemsCountByCategory(String categoryType);
	
	ItemInfoVO checkerFindByItemNo(Integer itemNo);
	
	Integer checkerUpdate(ItemInfoVO itemInfo);
	
	List<ItemInfoVO> findbyMbrNo(String mbrNo);
	
}
