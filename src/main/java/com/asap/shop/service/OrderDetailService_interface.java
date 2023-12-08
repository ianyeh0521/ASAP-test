package com.asap.shop.service;

import java.sql.Timestamp;
import java.util.List;

import com.asap.shop.entity.OrderDetailVO;

public interface OrderDetailService_interface {

	int insert(OrderDetailVO entity);

	int update(OrderDetailVO entity);

	// 買家 撰寫評論
	String updateCmtText(Integer orderDetailNo, String cmtText, Timestamp cmtTime);

	// 賣家 回覆評論
	String updateCmtReText(Integer orderDetailNo, String cmtReText, Timestamp cmtReTime);

	OrderDetailVO findByPK(Integer orderDetailNo);

	List<OrderDetailVO> findByOrderNo(Integer orderNo);

	List<OrderDetailVO> findByCmtScore(Integer cmtScore);

	List<OrderDetailVO> getAll();
	
	// 取得平均評分
	Double getAvgScore();

}
