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
    public int addImage(ItemImgVO itemImg) {
        return dao.insert(itemImg);
    }

    @Override
    public int updateImage(ItemImgVO itemImg) {
        return dao.update(itemImg);
    }

    @Override
    public int deleteImage(Integer itemImgNo) {
        return dao.delete(itemImgNo);
    }

    @Override
    public ItemImgVO findImageByNo(Integer itemImgNo) {
        return dao.findByItemImgNo(itemImgNo);
    }

    @Override
    public List<ItemImgVO> getAllImages() {
        return dao.getALL();
    }
}