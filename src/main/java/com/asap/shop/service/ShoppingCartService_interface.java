package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ShoppingCartVO;

public interface ShoppingCartService_interface {

	Integer insert(String mbrNo, ItemInfoVO itemInfoVO, int itemShopQty);
	
	Integer update(ShoppingCartVO entity);

	String delete(ShoppingCartVO entity);

	ShoppingCartVO findByPK(Integer shoppingCartNo);
	
	List<ShoppingCartVO> findByMember(String mbrNo);
	
	ShoppingCartVO findByMemberAndItemNo(String mbrNo, Integer itemNo);

	List<ShoppingCartVO> getAll();

	int getTotal();
	
	void cleanByMbrNo(String mbrNo);
	
}
