package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ShoppingCartDAO;
import com.asap.shop.dao.ShoppingCartDAO_interface;
import com.asap.shop.entity.ItemCollectVO;
import com.asap.shop.entity.ShoppingCartVO;

public class ShoppingCartService implements ShoppingCartService_interface {

	private ShoppingCartDAO_interface dao;

	public ShoppingCartService() {
		dao = new ShoppingCartDAO();
	}

	@Override
	public Integer insert(String mbrNo, int itemNo) {
		// 檢查是否有相同的記錄
		ShoppingCartVO vo = dao.findByMemberAndItemNo(mbrNo, itemNo);
		if (vo != null) {
			// 如果有存在相同的記錄，數量加一
			vo.setItemShopQty(vo.getItemShopQty() + 1);
			int result = dao.update(vo);
			return result;
		}else {
			ShoppingCartVO newVo = new ShoppingCartVO();
			newVo.setMbrNo(mbrNo);
			newVo.setItemNo(itemNo);
			newVo.setItemShopQty(1);
			
			return dao.insert(newVo);
		}
		
	}

	@Override
	public Integer update(ShoppingCartVO entity) {
		return dao.update(entity);
	}

	@Override
	public String delete(Integer shoppingCartNo) {
		return dao.delete(shoppingCartNo);
	}

	@Override
	public ShoppingCartVO findByPK(Integer shoppingCartNo) {
		return dao.findByPK(shoppingCartNo);
	}

	@Override
	public List<ShoppingCartVO> findByMember(String mbrNo) {
		return dao.findByMember(mbrNo);
	}

	@Override
	public List<ShoppingCartVO> getAll() {
		return dao.getAll();
	}

	@Override
	public long getTotal() {
		return dao.getTotal();
	}

}
