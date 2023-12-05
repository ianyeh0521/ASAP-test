package com.asap.coach.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.coach.entity.CoachVO;

import com.asap.util.HibernateUtil;

public class CoachDAO implements CoachDAO_interface {

	private SessionFactory factory;

	public CoachDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public String add(CoachVO coach) {
		try {

			Serializable id = getSession().save(coach);

			return String.valueOf(id);
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@Override
	public String update(CoachVO coach) {
		try {
			getSession().update(coach);
			return "更新成功";
		} catch (Exception e) {
			e.printStackTrace();
			return "更新失敗";
		}
	}

	@Override
	public CoachVO findByPK(String coachNo) {
		try {
			Query<CoachVO> query = getSession().createQuery("from CoachVO where coachNo = :coachNo", CoachVO.class);
			query.setParameter("coachNo", coachNo);
			CoachVO coach = query.uniqueResult();
			return coach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public CoachVO findByCoachEmail(String coachEmail) {
		try {
			Query<CoachVO> query = getSession().createQuery("from CoachVO where coachEmail = :coachEmail",
					CoachVO.class);
			query.setParameter("coachEmail", coachEmail);
			CoachVO coach = query.uniqueResult();
			return coach;
			// 沒有該資料會返回null
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public CoachVO findByCoachPhone(String coachPhone) {
		try {
			Query<CoachVO> query = getSession().createQuery("from CoachVO where coachPhone = :coachPhone",
					CoachVO.class);
			query.setParameter("coachPhone", coachPhone);
			CoachVO coach = query.uniqueResult();
			return coach;
			// 沒有該資料會返回null
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<CoachVO> getAll() {
		try {
			return getSession().createQuery("from CoachVO", CoachVO.class).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int countAll() {
		try {

			int num = getSession().createQuery("select count(*) from CoachVO", Long.class).uniqueResult().intValue();

			return num;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

//	public static void main(String[] args) throws IOException {
//		CoachDAO dao = new CoachDAO();
//		CoachVO vo = new CoachVO();
//		File file = new File("C:\\Users\\T14 Gen 3\\Downloads\\logo2.png");
//		FileInputStream fis = new FileInputStream(file);
//		byte[] picture = fis.readAllBytes();
//		vo.setCoachImg(picture);
//		vo.setCoachNo("C12042300001");
//		vo.setCoachEmail("ccc@gmail.com");
//		vo.setCoachPwd("password");
//		vo.setCoachName("cname");
//		vo.setCoachStat(true);
//		vo.setCoachPhone("0912345678");
//		System.out.println(dao.add(vo));
//	}

}
