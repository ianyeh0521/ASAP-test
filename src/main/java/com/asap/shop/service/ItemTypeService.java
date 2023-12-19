package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ItemTypeDAO;
import com.asap.shop.dao.ItemTypeDAO_interface;
import com.asap.shop.entity.ItemTypeVO;

public class ItemTypeService implements ItemTypeService_interface {

    private ItemTypeDAO_interface dao;

    public ItemTypeService() {
        dao = new ItemTypeDAO(); // Assuming ItemTypeDAO is the implementation of ItemTypeDAO_interface
    }

    @Override
    public int insert(ItemTypeVO itemType) {
        return dao.insert(itemType);
    }

    @Override
    public int delete(ItemTypeVO itemType) {
        return dao.delete(itemType);
    }

    @Override
    public ItemTypeVO findByItemTypeNo(Integer itemTypeNo) {
        return dao.findByItemTypeNo(itemTypeNo);
    }

    @Override
    public List<ItemTypeVO> getALL() {
        return dao.getALL();
    }
}