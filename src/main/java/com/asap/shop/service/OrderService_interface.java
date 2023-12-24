package com.asap.shop.service;

import java.util.List;

import com.asap.shop.entity.OrderVO;

public interface OrderService_interface {

	int insert(OrderVO entity);

	int update(OrderVO entity);
	
	int cancel(OrderVO entity);
	
	OrderVO findByPK(Integer orderNo);

	List<OrderVO> findByMbrNo(String mbrNo);

	List<OrderVO> findByOrderStat(Integer orderStat);

	List<OrderVO> getAll();

	int getTotal();
	
	List<OrderVO> findUnPaid(String mbrNo);
	
}
