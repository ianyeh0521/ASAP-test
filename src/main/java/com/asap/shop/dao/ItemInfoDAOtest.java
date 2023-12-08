package com.asap.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemInfoVO;
import com.asap.util.HibernateUtil;

public class ItemInfoDAOtest {
	public static void main(String[] args) {
//		新增資料
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			
			ItemInfoVO ItemT = new ItemInfoVO();
			
			ItemT.setItemName("梅西的褲子");
			ItemT.setMbrNo("M1"); 
			ItemT.setItemTypeNo(2);
			ItemT.setItemStatNo(3);
			ItemT.setItemText("CCCCC");
			ItemT.setItemStockQty(1);
			ItemT.setItemPrice(500);
			ItemT.setPreItemPrice(250);
			ItemT.setItemSizeNo(3);
			ItemT.setItemView(1000);
			ItemT.setItemAddStat(1);
			ItemT.setItemAddTime(java.sql.Timestamp.valueOf("2023-10-01 09:00:00"));
			ItemT.setItemUpdTime(java.sql.Timestamp.valueOf("2023-10-29 09:00:00"));

			session.save(ItemT);
			
			session.getTransaction().commit();
			
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		} finally {
			HibernateUtil.shutdown();
		}
			
//		修改資料
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		try {
//			Session session1 = factory.openSession();
//			ItemInfoVO ItemT = session1.get(ItemInfoVO.class, 1003);
//			session1.close();
//
//			ItemT.setItemName("梅西的襪子");
//		    ItemT.setMbrNo("M1");   CHECK
//			ItemT.setItemTypeNo(2);
//			ItemT.setItemStatNo(3);
//			ItemT.setItemText("CCCCC");
//			ItemT.setItemStockQty(1);
//			ItemT.setItemPrice(500);
//			ItemT.setPreItemPrice(250);
//			ItemT.setItemSizeNo(3);
//			ItemT.setItemView(1000);
//			ItemT.setItemAddStat(1);
//			ItemT.setItemAddTime(java.sql.Timestamp.valueOf("2023-10-01 09:00:00"));
//			ItemT.setItemUpdTime(java.sql.Timestamp.valueOf("2023-10-29 09:00:00"));
//
//			Session session2 = factory.openSession();
//			Transaction tx = session2.beginTransaction();
//			
//			session2.update(ItemT);
//
//			tx.commit();
//			session2.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			HibernateUtil.shutdown();
//		}
		
//		刪除資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//			
//			ItemInfoVO itemInfo = session.get(ItemInfoVO.class,1013);
//			if (itemInfo != null)
//				session.delete(itemInfo);
//			
//			session.getTransaction().commit();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}
		
//		查詢資料
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//			session.beginTransaction();
//
//			ItemInfoVO itemInfo = session.get(ItemInfoVO.class, 1012);
//			System.out.println(itemInfo);
//
//			session.getTransaction().commit();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			session.getTransaction().rollback();
//		} finally {
//			HibernateUtil.shutdown();
//		}
		
//		查詢全部(以for迴圈來一行一行排列)
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//		try {
//		    session.beginTransaction();
//
//		    List<ItemInfoVO> getALL = session.createQuery("from ItemInfoVO", ItemInfoVO.class).list();
//		    for (ItemInfoVO item : getALL) {
//		        System.out.println(item);
//		    }
//
//		    session.getTransaction().commit();
//
//		} catch (Exception e) {
//		    e.printStackTrace();
//		    session.getTransaction().rollback();
//		} finally {
//		    HibernateUtil.shutdown();
//		}

//		 模糊查詢，查詢 ItemText 字段包含 "CCCCC" 的商品信息(商品搜尋欄位:可搜尋商品名稱、賣家名稱)
//        ItemInfoDAO itemInfoDAO = new ItemInfoDAO();
//        List<ItemInfoVO> resultList = itemInfoDAO.getByFuzzySearch("C");
//
//        for (ItemInfoVO result : resultList) {
//        	System.out.println("Item No " + result.getItemNo());
//            System.out.println("Item Name: " + result.getItemName());
//            System.out.println("Item Type No: " + result.getItemTypeNo());
//            // ... 其他字段
//            System.out.println("Item Text: " + result.getItemText());
//            System.out.println("===========================================");
//        }


//		(HQL)用某個欄位來找商品資訊
//		ItemInfoDAO itemInfoDAO = new ItemInfoDAO();
//
//      List<ItemInfoVO> resultList = itemInfoDAO.getQuery("ItemText","CCCCC");
//      for (ItemInfoVO result : resultList) {
//    	  System.out.println("Item Name: " + result.getItemName());
//    	  System.out.println("Item Type No: " + result.getItemTypeNo());
//    	  System.out.println("Item Stat No: " + result.getItemStatNo());
//    	  System.out.println("Item Text: " + result.getItemText());
//    	  System.out.println("Item Stock Quantity: " + result.getItemStockQty());
//    	  System.out.println("Item Price: " + result.getItemPrice());
//    	  System.out.println("Previous Item Price: " + result.getPreItemPrice());
//    	  System.out.println("Item Size No: " + result.getItemSizeNo());
//    	  System.out.println("Item View: " + result.getItemView());
//    	  System.out.println("Item Add Stat: " + result.getItemAddStat());
//    	  System.out.println("Item Add Time: " + result.getItemAddTime());
//    	  System.out.println("Item Update Time: " + result.getItemUpdTime());
//          System.out.println("===========================================");
//      }
		
		
		//按造商品價格範圍查詢
//		try {
//            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//            session.beginTransaction();
//
//            ItemInfoDAO itemInfoDAO = new ItemInfoDAO();
//
//            // Example: Find items with prices between 300 and 600
//            List<ItemInfoVO> resultList = itemInfoDAO.findByPriceRange(300, 600);
//
//            for (ItemInfoVO result : resultList) {
//                System.out.println("Item Name: " + result.getItemName());
//                System.out.println("Item Price: " + result.getItemPrice());
//                // ... (other fields)
//                System.out.println("===========================================");
//            }
//
//            session.getTransaction().commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            HibernateUtil.shutdown();
//        }
		
		
//		try {
//            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//            session.beginTransaction();
//
//            ItemInfoDAO itemInfoDAO = new ItemInfoDAO();
//
//            // 從高到低排序
//            List<ItemInfoVO> resultListDesc = itemInfoDAO.orderByItemPrice(true);
//
//            System.out.println("Items ordered by price (descending):");
//            for (ItemInfoVO result : resultListDesc) {
//                System.out.println("Item Name: " + result.getItemName());
//                System.out.println("Item Price: " + result.getItemPrice());
//                // ... (其他字段)
//                System.out.println("===========================================");
//            }

            // 從低到高排序ˋ
//            List<ItemInfoVO> resultListAsc = itemInfoDAO.orderByItemPrice(false);
//
//            System.out.println("Items ordered by price (ascending):");
//            for (ItemInfoVO result : resultListAsc) {
//                System.out.println("Item Name: " + result.getItemName());
//                System.out.println("Item Price: " + result.getItemPrice());
//                // ... (其他字段)
//                System.out.println("===========================================");
//            }
//
//            session.getTransaction().commit();
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            HibernateUtil.shutdown();
//        }
		
		//按造瀏覽人數排名
//		 try {
//	            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
//	            session.beginTransaction();
//
//	            ItemInfoDAO itemInfoDAO = new ItemInfoDAO();
//
//	            // Example: Find items ordered by views in descending order
//	            List<ItemInfoVO> resultList = itemInfoDAO.orderByItemView(true);
//
//	            for (ItemInfoVO result : resultList) {
//	                System.out.println("Item Name: " + result.getItemName());
//	                System.out.println("Item Views: " + result.getItemView());
//	                // ... (other fields)
//	                System.out.println("===========================================");
//	            }
//
//	            session.getTransaction().commit();
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        } finally {
//	            HibernateUtil.shutdown();
//	        }
		
		
	}
}