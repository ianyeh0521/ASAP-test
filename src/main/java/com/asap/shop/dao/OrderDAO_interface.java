package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.OrderVO;

public interface OrderDAO_interface {

	int insert(OrderVO entity);

	int update(OrderVO entity);
	
	// 更新訂單的狀態
	String updateOrderStatus(Integer orderNo, Integer orderStat);

	OrderVO findByPK(Integer orderNo);

	List<OrderVO> findByMbrNo(String mbrNo);

	List<OrderVO> findByOrderStat(Integer orderStat);

	List<OrderVO> getAll();

	int getTotal();
}
