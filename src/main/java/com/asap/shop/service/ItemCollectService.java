package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ItemCollectDAO;
import com.asap.shop.dao.ItemCollectDAO_interface;
import com.asap.shop.entity.ItemCollectVO;

public class ItemCollectService implements ItemCollectService_interface {

	private ItemCollectDAO_interface dao;

	public ItemCollectService() {
		dao = new ItemCollectDAO();
	}

	@Override
	public Integer insert(ItemCollectVO entity) {
		// 檢查是否有存在相同的記錄
		ItemCollectVO vo = dao.findByMemberAndItemNo(entity.getMbrNo(), entity.getItemNo());
		if (vo != null) {
			// 如果有存在相同的記錄，無法新增
			System.out.println("相同的記錄已存在，無法新增。");
		}
		return dao.insert(entity);
	}

	@Override
	public Integer update(ItemCollectVO entity) {
		return dao.update(entity);
	}

	@Override
	public String delete(Integer itemCollectNo) {
		return dao.delete(itemCollectNo);
	}

	@Override
	public ItemCollectVO findByPK(Integer itemCollectNo) {
		return dao.findByPK(itemCollectNo);
	}

	@Override
	public List<ItemCollectVO> findByMember(String mbrNo) {
		return dao.findByMember(mbrNo);
	}

	@Override
	public List<ItemCollectVO> getAll() {
		return dao.getAll();
	}

	@Override
	public Integer getTotal() {
		return dao.getTotal();
	}

}
