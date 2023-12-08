package com.asap.shop.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.util.HibernateUtil;

public class ItemInfoDAO implements ItemInfoDAO_interface {

	private SessionFactory factory;

	public ItemInfoDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int insert(ItemInfoVO itemInfo) {

		return (Integer) getSession().save(itemInfo);
	}

	@Override
	public int update(ItemInfoVO itemInfo) {

		try {
			getSession().update(itemInfo);
			return 1;
		} catch (Exception e) {
			return -1;
		}
	}

	@Override
	public int delete(Integer id) {
		ItemInfoVO itemInfo = getSession().get(ItemInfoVO.class, id);
		if (itemInfo != null) {
			getSession().delete(itemInfo);
			// 回傳給 service，1代表刪除成功
			return 1;
		} else {
			// 回傳給 service，-1代表刪除失敗
			return -1;
		}
	}

	@Override
//	 商品編號查找單筆商品資訊
	public List<ItemInfoVO> findByItemNo(Integer id) {
		return (List<ItemInfoVO>) getSession().get(ItemInfoVO.class, id);
	}



	@Override
	// 使用HQL模糊查詢(搜尋商品欄位)
	public List<ItemInfoVO> getByFuzzySearch(String itemInfoKeyword) {
	    String hqlQuery;
	    Query query;
	    List<ItemInfoVO> resultList = new ArrayList<>();
	    Transaction transaction = null;
	    try {
	        Session session = getSession();
	        transaction = session.beginTransaction();
	        if (itemInfoKeyword == null || itemInfoKeyword.isEmpty()) {
	            hqlQuery = "FROM ItemInfoVO";
	            query = session.createQuery(hqlQuery);
	        } else {
	            hqlQuery = "FROM ItemInfoVO WHERE "
	                    + "ItemName LIKE :keyword OR "
	                    + "ItemTypeNo LIKE :keyword OR "
	                    + "ItemStatNo LIKE :keyword OR "
	                    + "ItemSizeNo LIKE :keyword OR "
	                    + "ItemText LIKE :keyword  ";

	            query = session.createQuery(hqlQuery);
	            query.setParameter("keyword", "%" + itemInfoKeyword + "%");
	        }
	        resultList = query.getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return resultList;
	}

	// **********************(HQL)用某個欄位來找商品資訊(商品分類欄位)****************************
	// column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 小提醒->如果你的Keyword值是String以外的型別請轉成String
	// 成功回傳VO,失敗不會回傳任何資料;
	// *********************************************************************
	@Override
	public List<ItemInfoVO> getQuery(String column, String Keyword) {
		String hqlQuery;
		Query query;
		List<ItemInfoVO> resultList = new ArrayList<>();
		Transaction transaction = null;
		try {
			Session session = getSession();
			transaction = session.beginTransaction();
			if (column == null || column.isEmpty() || Keyword == null || Keyword.isEmpty()) {

				hqlQuery = "FROM ItemInfoVO";
				query = session.createQuery(hqlQuery);
			} else {
				hqlQuery = "FROM ItemInfoVO WHERE " + column + "= :keyword ";
				query = session.createQuery(hqlQuery);
				query.setParameter("keyword", Keyword);
			}

			resultList = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	
	//按造商品價格範圍查詢
	@Override
	public List<ItemInfoVO> findByPriceRange(Integer minPrice, Integer maxPrice) {
	    String hqlQuery = "FROM ItemInfoVO WHERE itemPrice BETWEEN :minPrice AND :maxPrice";
	    Query<ItemInfoVO> query = getSession().createQuery(hqlQuery, ItemInfoVO.class);
	    query.setParameter("minPrice", minPrice);
	    query.setParameter("maxPrice", maxPrice);

	    return query.getResultList();
	}
	
	// 按照商品價格排名(條件表達式)
	@Override
    public List<ItemInfoVO> orderByItemPrice(boolean descending) {
        String hqlQuery = "FROM ItemInfoVO ORDER BY itemPrice " + (descending ? "DESC" : "ASC");
        Query<ItemInfoVO> query = getSession().createQuery(hqlQuery, ItemInfoVO.class);

        return query.getResultList();
    }
	
	//按造瀏覽人數排名
	@Override
    public List<ItemInfoVO> orderByItemView(boolean descending) {
        String hqlQuery = "FROM ItemInfoVO ORDER BY itemView " + (descending ? "DESC" : "ASC");
        Query<ItemInfoVO> query = getSession().createQuery(hqlQuery, ItemInfoVO.class);

        return query.getResultList();
    }
	
	@Override
	public List<ItemInfoVO> getALL() {
//		Transaction transaction = null;
//		try {
//			Session session = getSession();
//			transaction = session.beginTransaction();
			List<ItemInfoVO> list = getSession().createQuery("from ItemInfoVO", ItemInfoVO.class).list();

			return list;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
	}
	
}