package com.asap.shop.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ItemSizeVO;
import com.asap.shop.entity.ItemStatVO;
import com.asap.shop.entity.ItemTypeVO;
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
		try {
			return (Integer) getSession().save(itemInfo);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}

	}

	@Override
	public int update(ItemInfoVO itemInfo) {
		try {
			getSession().update(itemInfo);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int delete(ItemInfoVO itemInfo) {
		try {
			if (itemInfo != null) {
				getSession().delete(itemInfo);
				// 回傳給 service，1代表刪除成功
			}
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}

	}

	// 增加商品的瀏覽次數
//	@Override
//	public void increaseItemView(Integer itemId) {
//
//		ItemInfoVO itemInfo = getSession().get(ItemInfoVO.class, itemId);
//		if (itemInfo != null) {
//
//			itemInfo.setItemView(itemInfo.getItemView() + 1);
//
////            session.update(itemInfo);
//		}
//
//	}

	@Override
//	 商品編號查找單筆商品資訊
	public ItemInfoVO findByItemNo(Integer id) {
		try {
			return getSession().get(ItemInfoVO.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	// 使用HQL模糊查詢(搜尋商品欄位)
	public List<ItemInfoVO> getByFuzzySearch(String itemInfoKeyword) {
		try {
			Query<ItemInfoVO> query;
			if (itemInfoKeyword == null || itemInfoKeyword.isEmpty()) {
				query = getSession().createQuery("FROM ItemInfoVO", ItemInfoVO.class);
			} else {
				query = getSession().createQuery(
						"FROM ItemInfoVO WHERE ItemName LIKE :keyword OR ItemText LIKE :keyword", ItemInfoVO.class);
				query.setParameter("keyword", "%" + itemInfoKeyword + "%");
			}
			List<ItemInfoVO> resultList = query.getResultList();
			return resultList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// **********************(HQL)用某個欄位來找商品資訊(商品分類欄位)****************************
	// column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 小提醒->如果你的Keyword值是String以外的型別請轉成String
	// 成功回傳VO,失敗不會回傳任何資料;
	// *********************************************************************
//	@Override
//	public List<ItemInfoVO> getItemInfoByCategory(String column, Integer Keyword) {
//		String hqlQuery;
//		Query query;
//		List<ItemInfoVO> resultList = new ArrayList<>();
////		Transaction transaction = null;
////		try {
//		Session session = getSession();
////			transaction = session.beginTransaction();
//		if (column == null || column.isEmpty() || Keyword == null) {
//
//			hqlQuery = "FROM ItemInfoVO";
//			query = session.createQuery(hqlQuery);
//		} else {
//			hqlQuery = "FROM ItemInfoVO WHERE " + column + "= :keyword ";
//			query = session.createQuery(hqlQuery);
//			query.setParameter("keyword", Keyword);
//		}

//		resultList = query.getResultList();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return resultList;
//	}

	// 按造商品價格範圍查詢
//	@Override
//	public List<ItemInfoVO> findByPriceRange(Integer minPrice, Integer maxPrice) {
//		String hqlQuery = "FROM ItemInfoVO WHERE itemPrice BETWEEN :minPrice AND :maxPrice";
//		Query<ItemInfoVO> query = getSession().createQuery(hqlQuery, ItemInfoVO.class);
//		query.setParameter("minPrice", minPrice);
//		query.setParameter("maxPrice", maxPrice);
//
//		return query.getResultList();
//	}

	// 按照商品價格排名(條件表達式)
	@Override
	public List<ItemInfoVO> orderByItemPrice(boolean descending) {
		try {
			String hqlQuery = "FROM ItemInfoVO ORDER BY itemPrice " + (descending ? "DESC" : "ASC");
			Query<ItemInfoVO> query = getSession().createQuery(hqlQuery, ItemInfoVO.class);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// 按造瀏覽人數排名
	@Override
	public List<ItemInfoVO> orderByItemView() {
		try {
			String hqlQuery = "FROM ItemInfoVO ORDER BY itemView DESC";
			Query<ItemInfoVO> query = getSession().createQuery(hqlQuery, ItemInfoVO.class);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 按照上架時間排名
	@Override
	public List<ItemInfoVO> orderByItemAddTime() {
		try {
			String hqlQuery = "FROM ItemInfoVO ORDER BY itemAddTime DESC";
			Query<ItemInfoVO> query = getSession().createQuery(hqlQuery, ItemInfoVO.class);
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 複合查詢
	@Override
	public List<ItemInfoVO> getByCompositeQuery(Map<String, String> map) {

		if (map.isEmpty()) {
			return getAll();
		}
		try {
			
//		getSession().beginTransaction();
		CriteriaBuilder builder = getSession().getCriteriaBuilder();
		CriteriaQuery<ItemInfoVO> criteria = builder.createQuery(ItemInfoVO.class);
		Root<ItemInfoVO> root = criteria.from(ItemInfoVO.class);

		List<Predicate> predicates = new ArrayList<>();

		if (map.containsKey("minPrice") && map.containsKey("maxPrice")) {
			predicates.add(builder.between(root.get("itemPrice"), new BigDecimal(map.get("minPrice")),
					new BigDecimal(map.get("maxPrice"))));
		}

		for (Map.Entry<String, String> row : map.entrySet()) {
			 
			if ("itemType".equals(row.getKey())) {
				ItemTypeVO itemTypeVo = new ItemTypeVO();
				itemTypeVo.setItemTypeNo(Integer.parseInt(row.getValue()));
				predicates.add(builder.equal(root.get("itemTypeVO"), itemTypeVo));
			}
			if ("itemSize".equals(row.getKey())) {
				ItemSizeVO itemSizeVo = new ItemSizeVO();
				itemSizeVo.setItemSizeNo(Integer.parseInt(row.getValue()));
				predicates.add(builder.equal(root.get("itemSizeVO"), itemSizeVo));
			}
			if ("itemStat".equals(row.getKey())) {
				ItemStatVO itemStatVo = new ItemStatVO();
				itemStatVo.setItemStatNo(Integer.parseInt(row.getValue()));
				predicates.add(builder.equal(root.get("itemStatVO"), itemStatVo));
			}

		}

		criteria.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		TypedQuery<ItemInfoVO> query = getSession().createQuery(criteria);
		List<ItemInfoVO> list = query.getResultList();
//		getSession().getTransaction().commit();
		return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
//		if (map.containsKey("itemType")) {
//			predicates.add(builder.equal(root.get("itemType"), Integer.valueOf(map.get("itemType"))));
//		}
//
//		// 如果僅有最小或最大價格
//		if (map.containsKey("minPrice") && !map.containsKey("maxPrice")) {
//			predicates.add(
//					builder.greaterThanOrEqualTo(root.get("itemPrice"), new BigDecimal(map.get("minPrice"))));
//		}
//
//		if (!map.containsKey("minPrice") && map.containsKey("maxPrice")) {
//			predicates
//					.add(builder.lessThanOrEqualTo(root.get("itemPrice"), new BigDecimal(map.get("maxPrice"))));
//		}

	}

	@Override
	public List<ItemInfoVO> getAll() {
		try {
//			getSession().beginTransaction();
			List<ItemInfoVO> list = getSession().createQuery("from ItemInfoVO", ItemInfoVO.class).list();
//			getSession().getTransaction().commit();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int getLowestPrice() {
		try {
//			getSession().beginTransaction();
			String hqlQuery = "SELECT MIN(itemPrice) FROM ItemInfoVO";
			int minPrice = getSession().createQuery(hqlQuery, Integer.class).uniqueResult();
//			getSession().getTransaction().commit();
			return minPrice;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int getHighestPrice() {
		try {
			String hqlQuery = "SELECT MAX(itemPrice) FROM ItemInfoVO";
			int maxPrice = getSession().createQuery(hqlQuery,  Integer.class).uniqueResult();
			return maxPrice;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

//	public static void main(String[] args) {
//		ItemInfoDAO dao = new ItemInfoDAO();
		
//		Map<String, String> map = new HashMap<>();
//		map.put("minPrice", "80");
//		map.put("maxPrice", "3000");
////		map.put("itemType", "2");
//		map.put("itemSize", "1");
//		map.put("itemStat", "2");
//
//		List<ItemInfoVO> list = dao.getByCompositeQuery(map);
//		for (ItemInfoVO vo : list) {
//			System.out.println(vo);
//
//		}
//	}

}