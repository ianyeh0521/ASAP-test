package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemCollectVO;

public interface ItemCollectService_interface {

	Integer insert(ItemCollectVO entity);

	String delete(ItemCollectVO entity);

	ItemCollectVO findByPK(Integer itemCollectNo);

	List<ItemCollectVO> findByMbrNo(String mbrNo);

	ItemCollectVO findByMbrNoAndItemNo(String mbrNo, Integer itemNo);

	List<ItemCollectVO> getAll();
	
	void cleanByMbrNo(String mbrNo);
	
	public Integer checkCollect(ItemCollectVO entity);

}
