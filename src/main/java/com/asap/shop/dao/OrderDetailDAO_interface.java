package com.asap.shop.dao;

import java.util.List;

import com.asap.shop.entity.OrderDetailVO;
import com.asap.shop.entity.ShoppingCartVO;

public interface OrderDetailDAO_interface {

	int insert(OrderDetailVO entity);

	int update(OrderDetailVO entity);

	OrderDetailVO findByPK(Integer orderDetailNo);

	List<OrderDetailVO> findByOrderNo(Integer orderNo);

	List<OrderDetailVO> findByCmtScore(Integer cmtScore);

	List<OrderDetailVO> getAll();
	
	// 取得所有評分
	List<Integer> getAllCmtScore();
	
	Integer getTotal();

}
