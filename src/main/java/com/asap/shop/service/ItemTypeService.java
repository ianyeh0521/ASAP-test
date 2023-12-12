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
    public int addType(ItemTypeVO itemType) {
        return dao.insert(itemType);
    }

    @Override
    public int updateType(ItemTypeVO itemType) {
        return dao.update(itemType);
    }

    @Override
    public int deleteType(Integer itemTypeNo) {
        return dao.delete(itemTypeNo);
    }

    @Override
    public ItemTypeVO findTypeByNo(Integer itemTypeNo) {
        return dao.findByItemTypeNo(itemTypeNo);
    }

    @Override
    public List<ItemTypeVO> getAllTypes() {
        return dao.getALL();
    }
}