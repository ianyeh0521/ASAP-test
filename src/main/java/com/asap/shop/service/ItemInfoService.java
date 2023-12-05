package com.asap.shop.service;

import static com.asap.util.Constants.PAGE_MAX_RESULT;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.asap.shop.dao.ItemInfoDAO;
import com.asap.shop.dao.ItemInfoDAO_interface;
import com.asap.shop.entity.ItemInfoVO;

public class ItemInfoService implements ItemInfoService_interface {
	// 一個 service 實體對應一個 dao 實體
		private ItemInfoDAO_interface dao;
		
		public ItemInfoService() {
			dao = new ItemInfoDAO();
		}
		
		@Override
		public ItemInfoVO addItem(ItemInfoVO ItemInfo) {

			return null;
		}

		@Override
		public ItemInfoVO updateItem(ItemInfoVO ItemInfo) {

			return null;
		}

		@Override
		public void deleteItem(Integer itemNo) {
			
		}

		@Override
		public ItemInfoVO getItemInfoByItemNo(Integer ItemNo) {

			return null;
		}

		@Override
		public List<ItemInfoVO> getAllItemInfos(int currentPage) {
			return dao.getAll(currentPage);
		}

		@Override
		public List<ItemInfoVO> getItemInfosByCompositeQuery(Map<String, String[]> map) {
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
				String value = row.getValue()[0]; // getValue拿到一個String陣列, 接著[0]取得第一個元素檢查
				if (value == null || value.isEmpty()) {
					continue;
				}
				query.put(key, value);
			}
			
			System.out.println(query);
			
			return dao.getByCompositeQuery(query);
		}

		@Override
		public int getPageTotal() {
			long total = dao.getTotal();
			// 計算Emp數量每頁3筆的話總共有幾頁
			int pageQty = (int)(total % PAGE_MAX_RESULT == 0 ? (total / PAGE_MAX_RESULT) : (total / PAGE_MAX_RESULT + 1));
			return pageQty;
		}

	}