package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemCollectVO;

public interface ItemCollectService_interface {

	Integer insert(ItemCollectVO entity);

	Integer update(ItemCollectVO entity);

	String delete(Integer itemCollectNo);

	ItemCollectVO findByPK(Integer itemCollectNo);

	List<ItemCollectVO> findByMember(String mbrNo);

	List<ItemCollectVO> getAll();

	Integer getTotal();

}
