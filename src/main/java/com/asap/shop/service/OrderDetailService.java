package com.asap.shop.service;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

import com.asap.shop.dao.OrderDetailDAO;
import com.asap.shop.dao.OrderDetailDAO_interface;
import com.asap.shop.entity.OrderDetailVO;

public class OrderDetailService implements OrderDetailService_interface {

	private OrderDetailDAO_interface dao;

	public OrderDetailService() {
		dao = new OrderDetailDAO();
	}

	@Override
	public int insert(OrderDetailVO entity) {
		return dao.insert(entity);
	}

	@Override
	public int update(OrderDetailVO entity) {
		return dao.update(entity);
	}

	@Override
	public int delete(OrderDetailVO entity) {
		return dao.delete(entity);
	}

	@Override
	public String addCmt(OrderDetailVO entity, String cmtText) {
		entity.setCmtText(cmtText);
		entity.setCmtTime(new java.sql.Timestamp(System.currentTimeMillis()));

		dao.update(entity);

		return "評論成功";

	}

	@Override
	public OrderDetailVO findByPK(Integer orderDetailNo) {
		return dao.findByPK(orderDetailNo);
	}

	@Override
	public List<OrderDetailVO> findByOrderNo(Integer orderNo) {
		return dao.findByOrderNo(orderNo);
	}

	@Override
	public List<OrderDetailVO> findByMbrNo(String mbrNo) {
		return dao.findByMbrNo(mbrNo);
	}

	@Override
	public List<OrderDetailVO> getAll() {
		return dao.getAll();
	}

	@Override
	public Integer getTotal() {
		// TODO Auto-generated method stub
		return dao.getTotal();
	}

	@Override
	public String addReCmt(OrderDetailVO entity, String cmtReText) {
		entity.setCmtReText(cmtReText); 
		entity.setCmtReTime(new java.sql.Timestamp(System.currentTimeMillis()));

		dao.update(entity);

		return "評論成功";
	}

	@Override
	public List<OrderDetailVO> checkerFindByOrderNo(Integer orderNo) {
		return dao.checkerFindByOrderNo(orderNo);
	}

}
