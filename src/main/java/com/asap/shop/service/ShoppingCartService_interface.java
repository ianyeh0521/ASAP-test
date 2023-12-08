package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.ShoppingCartVO;

public interface ShoppingCartService_interface {

	Integer insert(String mbrNo, int itemNo);

	Integer update(ShoppingCartVO entity);

	String delete(Integer shoppingCartNo);

	ShoppingCartVO findByPK(Integer shoppingCartNo);

	List<ShoppingCartVO> findByMember(String mbrNo);

	List<ShoppingCartVO> getAll();

	long getTotal();
}
