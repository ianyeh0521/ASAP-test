package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.OrderVO;

public interface OrderDAO_interface {

	int insert(OrderVO entity);

	int update(OrderVO entity);
	
	int delete(OrderVO entity);
	
	OrderVO findByPK(Integer orderNo);

	List<OrderVO> findByMbrNo(String mbrNo);

	List<OrderVO> findByOrderStat(Integer orderStat);

	List<OrderVO> getAll();

	int getTotal();
	
	public List<OrderVO> findUnPaid(String mbrNo);
	
	public List<OrderVO> checkUnpaid();
	
	Integer checkerUpdate(OrderVO entity);
}
