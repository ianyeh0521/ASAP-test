package com.asap.member.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.member.entity.ChatroomVO;

import com.asap.util.HibernateUtil;

public class ChatroomDAO implements ChatroomDAO_interface {

	private SessionFactory factory;

	public ChatroomDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(ChatroomVO chatroomVO) {
		try {

			Integer id = (Integer) getSession().save(chatroomVO);

			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public List<ChatroomVO> findByMbrNo(String mbrNo) {
		try {

			Query<ChatroomVO> query = getSession()
					.createQuery("from ChatroomVO where mbrNo1 = :mbrNo1 or mbrNo2 = :mbrNo2", ChatroomVO.class);
			query.setParameter("mbrNo1", mbrNo);
			query.setParameter("mbrNo2", mbrNo);
			List<ChatroomVO> list = query.list();

			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
