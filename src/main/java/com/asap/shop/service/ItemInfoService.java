package com.asap.shop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Entity;

import com.asap.shop.dao.ItemInfoDAO;
import com.asap.shop.dao.ItemInfoDAO_interface;
import com.asap.shop.entity.ItemInfoVO;

/**
 * 商品資訊服務類別，實作商品資訊服務介面(ItemInfoService_interface)。
 */
public class ItemInfoService implements ItemInfoService_interface {

	private ItemInfoDAO_interface dao;

	public ItemInfoService() {
		dao = new ItemInfoDAO();
	}

	@Override
	public int insert(ItemInfoVO itemInfo) {
		itemInfo.setItemAddTime(new java.sql.Timestamp(System.currentTimeMillis()));
		itemInfo.setItemUpdTime(new java.sql.Timestamp(System.currentTimeMillis()));
		return dao.insert(itemInfo);
	}

	@Override
	public int update(ItemInfoVO itemInfo) {		
		itemInfo.setItemUpdTime(new java.sql.Timestamp(System.currentTimeMillis()));
		return dao.update(itemInfo);
	}

	@Override
	public int delete(ItemInfoVO itemInfo) {
		// 呼叫 DAO 的刪除方法
		return dao.delete(itemInfo);
	}

	@Override
	public void increaseItemView(ItemInfoVO itemInfo) {
		int view = itemInfo.getItemView();
		itemInfo.setItemView(view + 1);
		dao.update(itemInfo);

	}

	@Override
	public ItemInfoVO findByItemNo(Integer id) {
		// 呼叫 DAO 的根據商品編號查詢方法
		return dao.findByItemNo(id);
	}

	@Override
	public List<ItemInfoVO> getByFuzzySearch(String keyword) {
		// 呼叫 DAO 的模糊搜尋方法
		return dao.getByFuzzySearch(keyword);
	}

	@Override
	public List<ItemInfoVO> orderByItemPrice(boolean descending) {
		// 呼叫 DAO 的依價格排序方法
		return dao.orderByItemPrice(descending);
	}

	@Override
	public List<ItemInfoVO> orderByItemView() {
		// 呼叫 DAO 的依瀏覽次數排序方法
		return dao.orderByItemView();
	}

	@Override
	public List<ItemInfoVO> orderByItemAddTime() {
		// TODO Auto-generated method stub
		return dao.orderByItemAddTime();
	}

	@Override
	public List<ItemInfoVO> getByCompositeQuery(Map<String, String[]> map) {
		
		Map<String, String> query = new HashMap<>();
		// Map.Entry即代表一組key-value
		Set<Map.Entry<String, String[]>> entry = map.entrySet();
		
		for (Map.Entry<String, String[]> row : entry) {
			String key = row.getKey();
			// 因為請求參數裡包含了action，做個去除動作
			if ("action".equals(key)) {
				continue;
			}
			// 若是value為空即代表沒有查詢條件，做個去除動作
			String value = row.getValue()[0];
			if (value.isEmpty() || value == null) {
				continue;
			}
			query.put(key, value);
		}
		return dao.getByCompositeQuery(query);
	}

	@Override
	public List<ItemInfoVO> getAll() {

		return dao.getAll();
	}

	@Override
	public int getLowestPrice() {

		return dao.getLowestPrice();
	}

	@Override
	public int getHighestPrice() {

		return dao.getHighestPrice();
	}

	@Override
	public ItemInfoVO checkerFindByItemNo(Integer itemNo) {
		return dao.checkerFindByItemNo(itemNo);
	}

	@Override
	public Integer checkerUpdate(ItemInfoVO itemInfo) {
		// TODO Auto-generated method stub
		return dao.checkerUpdate(itemInfo);
	}
	
	@Override
    public int countItemsByCategory(String categoryType, int categoryId) {
        return dao.countItemsByCategory(categoryType, categoryId);
    }

}