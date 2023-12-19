package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ItemCollectDAO;
import com.asap.shop.dao.ItemCollectDAO_interface;
import com.asap.shop.entity.ItemCollectVO;
import com.asap.shop.entity.ShoppingCartVO;

public class ItemCollectService implements ItemCollectService_interface {

	private ItemCollectDAO_interface dao;

	public ItemCollectService() {
		dao = new ItemCollectDAO();
	}

	@Override
	public Integer insert(ItemCollectVO entity) {
		// 檢查是否有存在相同的記錄
		ItemCollectVO vo = dao.findByMbrNoAndItemNo(entity.getMbrNo(), entity.getItemNo());
		if (vo != null) {
			// 如果有存在相同的記錄，無法新增
			System.out.println("相同的記錄已存在，無法新增。");
		}
		return dao.insert(entity);
	}

	@Override
	public String delete(ItemCollectVO entity) {
		return dao.delete(entity);
	}

	@Override
	public ItemCollectVO findByPK(Integer itemCollectNo) {
		return dao.findByPK(itemCollectNo);
	}

	@Override
	public List<ItemCollectVO> findByMbrNo(String mbrNo) {
		return dao.findByMbrNo(mbrNo);
	}

	@Override
	public List<ItemCollectVO> getAll() {
		return dao.getAll();
	}

	@Override
	public ItemCollectVO findByMbrNoAndItemNo(String mbrNo, Integer itemNo) {

		return dao.findByMbrNoAndItemNo(mbrNo, itemNo);
	}

	@Override
	public void cleanByMbrNo(String mbrNo) {

		List<ItemCollectVO> list = dao.findByMbrNo(mbrNo);
		if (list != null && list.size() != 0) {
			for (ItemCollectVO itemCollectVO : list) {
				dao.delete(itemCollectVO);
			}
		}
	}
}
