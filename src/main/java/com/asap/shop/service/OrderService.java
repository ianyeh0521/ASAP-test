package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.OrderDAO;
import com.asap.shop.dao.OrderDAO_interface;
import com.asap.shop.entity.OrderVO;

public class OrderService implements OrderService_interface {

	private OrderDAO_interface dao;

	public OrderService() {
		dao = new OrderDAO();
	}

	@Override
	public int insert(OrderVO entity) {
		return dao.insert(entity);
	}

	@Override
	public int update(OrderVO entity) {
		return dao.update(entity);
	}

	@Override
	public String updateOrderStatus(Integer orderId, Integer orderStat) {
		return dao.updateOrderStatus(orderId, orderStat);
	}

	@Override
	public OrderVO findByPK(Integer orderNo) {
		return dao.findByPK(orderNo);
	}

	@Override
	public List<OrderVO> findByMbrNo(String mbrNo) {
		return dao.findByMbrNo(mbrNo);
	}

	@Override
	public List<OrderVO> findByOrderStat(Integer orderStat) {
		return dao.findByOrderStat(orderStat);
	}

	@Override
	public List<OrderVO> getAll() {
		return dao.getAll();
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

}
