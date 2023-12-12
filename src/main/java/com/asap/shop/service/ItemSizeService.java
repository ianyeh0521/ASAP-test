package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ItemSizeDAO;
import com.asap.shop.dao.ItemSizeDAO_interface;
import com.asap.shop.entity.ItemSizeVO;

public class ItemSizeService implements ItemSizeService_interface {

    private ItemSizeDAO_interface dao;

    public ItemSizeService() {
        dao = new ItemSizeDAO(); // Assuming ItemSizeDAO is the implementation of ItemSizeDAO_interface
    }

    @Override
    public int addSize(ItemSizeVO itemSize) {
        return dao.insert(itemSize);
    }

    @Override
    public int updateSize(ItemSizeVO itemSize) {
        return dao.update(itemSize);
    }

    @Override
    public int deleteSize(Integer itemSizeNo) {
        return dao.delete(itemSizeNo);
    }

    @Override
    public ItemSizeVO findSizeByNo(Integer itemSizeNo) {
        return dao.findByItemSizeNo(itemSizeNo);
    }

    @Override
    public List<ItemSizeVO> getAllSizes() {
        return dao.getALL();
    }
}