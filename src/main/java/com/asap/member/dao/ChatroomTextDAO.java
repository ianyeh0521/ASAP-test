package com.asap.member.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.asap.member.entity.ChatroomTextVO;

import com.asap.util.HibernateUtil;

public class ChatroomTextDAO implements ChatroomTextDAO_interface {

	private SessionFactory factory;

	public ChatroomTextDAO() {
		factory = HibernateUtil.getSessionFactory();
	}

	private Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public int add(ChatroomTextVO ChatroomTextVO) {
		try {

			Integer id = (Integer) getSession().save(ChatroomTextVO);

			return id;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public ChatroomTextVO findByPK(Integer chatTextNo) {
		try {
			return getSession().get(ChatroomTextVO.class, chatTextNo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<ChatroomTextVO> findByChatText(String chatText) {
		try {

			Query<ChatroomTextVO> query = getSession().createQuery("from ChatroomTextVO where chatText like :chatText",
					ChatroomTextVO.class);
			query.setParameter("chatText", "%" + chatText + "%");
			List<ChatroomTextVO> list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<ChatroomTextVO> findByChatroomNo(Integer chatroomNo) {
		try {

			Query<ChatroomTextVO> query = getSession().createQuery("from ChatroomTextVO where chatroomNo = :chatroomNo",
					ChatroomTextVO.class);
			query.setParameter("chatroomNo", chatroomNo);
			List<ChatroomTextVO> list = query.list();

			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
