package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ItemImgDAO;
import com.asap.shop.dao.ItemImgDAO_interface;
import com.asap.shop.entity.ItemImgVO;

public class ItemImgService implements ItemImgService_interface {

	private ItemImgDAO_interface dao;

	public ItemImgService() {
		dao = new ItemImgDAO(); // Assuming ItemImgDAO is the implementation of ItemImgDAO_interface
	}

	@Override
	public int insert(ItemImgVO itemImg) {
		itemImg.setItemImgUpdTime(new java.sql.Timestamp(System.currentTimeMillis()));
		return dao.insert(itemImg);
	}

	@Override
	public int delete(ItemImgVO itemImg) {
		return dao.delete(itemImg);
	}

	@Override
	public ItemImgVO findByPK(Integer itemImgNo) {
		return dao.findByPK(itemImgNo);
	}

	@Override
	public List<ItemImgVO> getALL() {
		return dao.getALL();
	}

	@Override
	public List<ItemImgVO> findByItemNo(Integer itemNo) {

		return dao.findByItemNo(itemNo);
	}

	@Override
	public int cleanByItemNo(Integer itemNo) {
		try {
			List<ItemImgVO> list = dao.findByItemNo(itemNo);
			if (list != null && list.size() != 0) {
				for (ItemImgVO vo : list) {
					dao.delete(vo);
				}
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return-1;
		}
	
	}
}