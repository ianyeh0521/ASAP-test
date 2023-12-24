package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ShoppingCartDAO;
import com.asap.shop.dao.ShoppingCartDAO_interface;
import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ShoppingCartVO;

public class ShoppingCartService implements ShoppingCartService_interface {

	private ShoppingCartDAO_interface dao;

	public ShoppingCartService() {
		dao = new ShoppingCartDAO();
	}

	@Override
	public Integer insert(String mbrNo, ItemInfoVO itemInfoVO, int itemShopQty) {
		// 檢查是否有相同的記錄
		ShoppingCartVO vo = dao.findByMemberAndItemNo(mbrNo, itemInfoVO.getItemNo());
		if (vo != null) {
			// 如果有存在相同的記錄，數量加一
			Integer max = itemInfoVO.getItemStockQty();
			System.out.println("max is "+max);
			Integer qty = vo.getItemShopQty() + itemShopQty;
			if(max>qty) {
				vo.setItemShopQty(qty);
				int result = dao.update(vo);
				return result;
			} else {
				return -2;
			}

		} else {
			ShoppingCartVO newVo = new ShoppingCartVO();
			newVo.setMbrNo(mbrNo);
			newVo.setItemInfoVO(itemInfoVO);
			newVo.setItemShopQty(itemShopQty);
			
			return dao.insert(newVo);
		}

	}

	@Override
	public Integer update(ShoppingCartVO entity) {
		return dao.update(entity);
	}

	@Override
	public String delete(ShoppingCartVO entity) {
		return dao.delete(entity);
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
	public ShoppingCartVO findByMemberAndItemNo(String mbrNo, Integer itemNo) {

		return dao.findByMemberAndItemNo(mbrNo, itemNo);
	}

	@Override
	public List<ShoppingCartVO> getAll() {
		return dao.getAll();
	}

	@Override
	public int getTotal() {
		return dao.getTotal();
	}

	@Override
	public void cleanByMbrNo(String mbrNo) {

		List<ShoppingCartVO> list = dao.findByMember(mbrNo);
		if (list != null && list.size() != 0) {
			for (ShoppingCartVO shoppingCartVO : list) {
				dao.delete(shoppingCartVO);
			}
		}
	}
}
