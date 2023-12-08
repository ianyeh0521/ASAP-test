package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.ItemCollectVO;
import com.asap.shop.entity.ShoppingCartVO;

public interface ShoppingCartDAO_interface {
	
	Integer insert(ShoppingCartVO entity);
	
	Integer update(ShoppingCartVO entity);

	String delete(Integer shoppingCartNo);

	ShoppingCartVO findByPK(Integer shoppingCartNo);
	
	List<ShoppingCartVO> findByMember(String mbrNo);
	
	ShoppingCartVO findByMemberAndItemNo(String mbrNo, Integer itemNo);

	List<ShoppingCartVO> getAll();

	long getTotal();
}
