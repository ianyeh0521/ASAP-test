package com.asap.shop.dao;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.imageio.ImageIO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.asap.shop.entity.ItemImgVO;
import com.asap.util.HibernateUtil;

public class ItemImgDAOtest {

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = null;
		Transaction tx = null;

		try {
//             1.新增商品照片
        	
//            session = factory.getCurrentSession();
//            tx = session.beginTransaction();
//
//            ItemImgVO itemImg = new ItemImgVO();
//            itemImg.setItemNo(1001); // 商品編號
//            itemImg.setItemImg(convertImageToByteArray("C:/Users/frank/OneDrive/桌面/215034120.jpg"));
//            itemImg.setItemImgfront(true); // 是否為主圖片
//            itemImg.setItemImgUpdTime(new Timestamp(System.currentTimeMillis()));
//
//            session.save(itemImg);
//            tx.commit();

			// 2.修改商品照片 	( 根據商品編號)
//        	session = factory.getCurrentSession();
//        	tx = session.beginTransaction();
//
//        	 根據商品編號查詢(也可改成照片編號)
//        	ItemImgVO imgToUpdate = (ItemImgVO) session.createQuery("from ItemImgVO where itemNo = :itemNo")
//        	        .setParameter("itemNo", 1001)
//        	        .uniqueResult();
//
//        	 使用 ImageUtil 類讀取
//        	String updatedImagePath = "C:/Users/frank/OneDrive/桌面/jpg圖檔/215034120.jpg"; 
//        	byte[] updatedImageBytes = ImageUtil.convertImageToByteArray(updatedImagePath);
//        	imgToUpdate.setItemImg(updatedImageBytes);
//
//        	session.update(imgToUpdate);
//        	tx.commit();

			// 3.删除商品照片
//			session = factory.getCurrentSession();
//			tx = session.beginTransaction();
//
//			// 根據照片編號查詢要刪除的商品照片
//			int imageIdToDelete = 1; // 替換為你的照片編號
//			ItemImgVO imgToDelete = session.get(ItemImgVO.class, imageIdToDelete);
//
//			if (imgToDelete != null) {
//			    // 如果找到了對應的照片，進行刪除
//			    session.delete(imgToDelete);
//			}
//
//			tx.commit();
			
			//4. 根據商品編號查詢
//			session = factory.getCurrentSession();
//			tx = session.beginTransaction();
//
//			int itemNoToQuery = 1003; // 替換為你的商品編號
//
//			// 根據商品編號查詢對應的商品照片
//			List<ItemImgVO> itemImages = session.createQuery("from ItemImgVO where itemNo = :itemNo", ItemImgVO.class)
//			        .setParameter("itemNo", itemNoToQuery)
//			        .list();
//
//			System.out.println("商品編號為 " + itemNoToQuery + " 的商品照片：");
//			for (ItemImgVO img : itemImages) {
//			    System.out.println(img);
//			}

			tx.commit();
			
			// 查詢全部照片
//            session = factory.getCurrentSession();
//            tx = session.beginTransaction();
//
//            List<ItemImgVO> allItemImages = session.createQuery("from ItemImgVO", ItemImgVO.class).list();
//            System.out.println("全部商品照片：");
//            for (ItemImgVO img : allItemImages) {
//                System.out.println(img);
//            }
//
//            tx.commit();
            
            

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			e.printStackTrace();
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
			HibernateUtil.shutdown();
		}
	}

	private static byte[] convertImageToByteArray(String imagePath) {
		try {
			BufferedImage bufferedImage = ImageIO.read(new File(imagePath));
			ByteArrayOutputStream baos = new ByteArrayOutputStream();

			ImageIO.write(bufferedImage, "jpg", baos);

			return baos.toByteArray();
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	// ImageUtil 类的定义
	private static class ImageUtil {
		public static byte[] convertImageToByteArray(String imagePath) {
			try {
				BufferedImage bufferedImage = ImageIO.read(new File(imagePath));
				ByteArrayOutputStream baos = new ByteArrayOutputStream();

				ImageIO.write(bufferedImage, "jpg", baos);

				return baos.toByteArray();
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
		}
	}
}