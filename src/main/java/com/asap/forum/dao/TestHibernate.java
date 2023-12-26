package com.asap.forum.dao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.asap.forum.entity.PostVO;
import com.asap.shop.entity.ItemImgVO;
import com.asap.util.HibernateUtil;



public class TestHibernate {
	
	public static void main(String[] args) throws IOException {
		
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		String imagePath = "C:\\testphoto\\shinkansen.jpg"; // 更改成實際的圖片路徑

		// 讀取圖片檔案到 byte[]
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		
		// 創建一個新的 ItemImg 物件
		ItemImgVO itemImg = new ItemImgVO();
		itemImg.setItemNo(1008); // 設定商品編號
		itemImg.setItemImgfront(false); // 設定是否為封面圖片
		itemImg.setItemImg(imageBytes); // 設定圖片的 byte[] 資料
		itemImg.setItemImgUpdTime(new Timestamp(System.currentTimeMillis())); // 設定圖片更新時間

		
		try {
		    session.beginTransaction();
		    session.save(itemImg); // 儲存圖片資料至資料庫
		    session.getTransaction().commit();
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    if (session!=null)
			session.close();
		}
		
		
		try {
			session.beginTransaction();
//			String posttitle="一";
			String hql = "from PostVO where postTitle like :posttitle";
			Query query = session.createQuery(hql);
			query.setParameter("posttitle", "%1%");
			List<PostVO> frvo= query.list();
			
			System.out.println(frvo);
			
			session.getTransaction().commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			HibernateUtil.shutdown();
		}
		
	}
}
