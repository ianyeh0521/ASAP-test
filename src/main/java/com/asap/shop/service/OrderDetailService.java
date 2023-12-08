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
	public String updateCmtText(Integer orderDetailNo, String cmtText, Timestamp cmtTime) {
		OrderDetailVO vo = dao.findByPK(orderDetailNo);
		if (vo != null) {
			vo.setCmtText(cmtText);
			vo.setCmtTime(Timestamp.from(Instant.now()));

			dao.update(vo);

			return "評論成功";
		} else {
			return "評論失敗";
		}
	}

	@Override
	public String updateCmtReText(Integer orderDetailNo, String cmtReText, Timestamp cmtReTime) {
		OrderDetailVO vo = dao.findByPK(orderDetailNo);
		if (vo != null) {
			vo.setCmtReText(cmtReText);
			vo.setCmtReTime(Timestamp.from(Instant.now()));

			dao.update(vo);

			return "回覆成功";
		} else {
			return "回覆失敗";
		}
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
	public List<OrderDetailVO> findByCmtScore(Integer cmtScore) {
		return dao.findByCmtScore(cmtScore);
	}

	@Override
	public List<OrderDetailVO> getAll() {
		return dao.getAll();
	}

	@Override
	public Double getAvgScore() {
		Integer sum = 0;
		List<Integer> list = dao.getAllCmtScore();
		for (Integer i : list) {
			sum += i;
		}
		Integer total = dao.getTotal();
		return (double) sum / total;
	}

}
