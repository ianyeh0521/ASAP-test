package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ItemStatDAO;
import com.asap.shop.dao.ItemStatDAO_interface;
import com.asap.shop.entity.ItemStatVO;

public class ItemStatService implements ItemStatService_interface {

    private ItemStatDAO_interface dao;

    public ItemStatService() {
        dao = new ItemStatDAO(); // Assuming ItemStatDAO is the implementation of ItemStatDAO_interface
    }

    @Override
    public int addStat(ItemStatVO itemStat) {
        return dao.insert(itemStat);
    }

    @Override
    public int updateStat(ItemStatVO itemStat) {
        return dao.update(itemStat);
    }

    @Override
    public int deleteStat(Integer itemStatNo) {
        return dao.delete(itemStatNo);
    }

    @Override
    public ItemStatVO findStatByNo(Integer itemStatNo) {
        return dao.findByItemStatNo(itemStatNo);
    }

    @Override
    public List<ItemStatVO> getAllStats() {
        return dao.getALL();
    }
}