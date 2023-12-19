package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.ItemCollectVO;

public interface ItemCollectDAO_interface {

	Integer insert(ItemCollectVO entity);

	String delete(ItemCollectVO entity);

	ItemCollectVO findByPK(Integer itemCollectNo);

	List<ItemCollectVO> findByMbrNo(String mbrNo);

	ItemCollectVO findByMbrNoAndItemNo(String mbrNo, Integer itemNo);

	List<ItemCollectVO> getAll();

}
