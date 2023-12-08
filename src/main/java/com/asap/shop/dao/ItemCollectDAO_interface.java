package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.ItemCollectVO;

public interface ItemCollectDAO_interface {
	
	Integer insert(ItemCollectVO entity);
	
	Integer update(ItemCollectVO entity);
	
	String delete(Integer itemCollectNo);
	
	ItemCollectVO findByPK(Integer itemCollectNo);
	
	List<ItemCollectVO> findByMember(String mbrNo);
	
	ItemCollectVO findByMemberAndItemNo(String mbrNo, Integer itemNo);
	
	List<ItemCollectVO> getAll();

	Integer getTotal();
}
