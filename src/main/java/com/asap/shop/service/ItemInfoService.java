package com.asap.shop.service;

import java.util.List;

import com.asap.shop.dao.ItemInfoDAO;
import com.asap.shop.dao.ItemInfoDAO_interface;
import com.asap.shop.entity.ItemInfoVO;

/**
 * 商品資訊服務類別，實作商品資訊服務介面(ItemInfoService_interface)。
 */
public class ItemInfoService implements ItemInfoService_interface {

    private ItemInfoDAO_interface dao;

    public ItemInfoService() {
        dao = new ItemInfoDAO();
    }

	@Override
    public int insertItemInfo(ItemInfoVO itemInfo) {
        // 呼叫 DAO 的插入方法
        return dao.insert(itemInfo);
    }

    @Override
    public int updateItemInfo(ItemInfoVO itemInfo) {
        // 呼叫 DAO 的更新方法
        return dao.update(itemInfo);
    }

    @Override
    public int deleteItemInfo(Integer id) {
        // 呼叫 DAO 的刪除方法
        return dao.delete(id);
    }

    @Override
    public ItemInfoVO getItemInfoById(Integer id) {
        // 呼叫 DAO 的根據商品編號查詢方法
        List<ItemInfoVO> list = dao.findByItemNo(id);
        return list.isEmpty() ? null : list.get(0);
    }

    @Override
    public List<ItemInfoVO> searchItemInfoByKeyword(String keyword) {
        // 呼叫 DAO 的模糊搜尋方法
        return dao.getByFuzzySearch(keyword);
    }

    @Override
    public List<ItemInfoVO> getItemInfoByCategory(String category) {
        // 這裡可以根據實際需求呼叫對應的 DAO 方法
        // 例如：return dao.getQuery("ItemCategory", category);
        return null;
    }

    @Override
    public List<ItemInfoVO> getItemInfoByPriceRange(Integer minPrice, Integer maxPrice) {
        // 呼叫 DAO 的價格範圍查詢方法
        return dao.findByPriceRange(minPrice, maxPrice);
    }

    @Override
    public List<ItemInfoVO> getItemInfoByPriceOrder(boolean descending) {
        // 呼叫 DAO 的依價格排序方法
        return dao.orderByItemPrice(descending);
    }

    @Override
    public List<ItemInfoVO> getItemInfoByViewOrder(boolean descending) {
        // 呼叫 DAO 的依瀏覽次數排序方法
        return dao.orderByItemView(descending);
    }

    @Override
    public List<ItemInfoVO> getAllItemInfo() {
        // 呼叫 DAO 的取得所有商品資訊方法
        return dao.getALL();
    }
}