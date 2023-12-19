package com.asap.shop.service;

import java.sql.Timestamp;
import java.util.List;

import com.asap.shop.entity.OrderDetailVO;

public interface OrderDetailService_interface {

	int insert(OrderDetailVO entity);

	int update(OrderDetailVO entity);

	int delete(OrderDetailVO entity);

	String addCmt(OrderDetailVO entity, String cmtText);
	
	String addReCmt(OrderDetailVO entity, String cmtReText);

	OrderDetailVO findByPK(Integer orderDetailNo);

	List<OrderDetailVO> findByOrderNo(Integer orderNo);

	List<OrderDetailVO> findByMbrNo(String mbrNo);

	List<OrderDetailVO> getAll();

	Integer getTotal();
	
	

}
