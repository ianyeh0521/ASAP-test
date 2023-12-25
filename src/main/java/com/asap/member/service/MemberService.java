package com.asap.member.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Session;
import org.mindrot.jbcrypt.BCrypt;

import com.asap.member.dao.MemberDAO;
import com.asap.member.dao.MemberDAO_interface;
import com.asap.member.entity.MemberVO;
import com.asap.util.HibernateUtil;

public class MemberService implements MemberService_interface {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberDAO();
	}

	public String hashPassword(String password) {
		String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		return hashedPassword;
	}

	@Override
	public String addMem(MemberVO member) {
		// 產生序號
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("MMddyyyy");
		String newMbrNo = "M" + ft.format(dNow) + String.format("%05d", dao.countAll() + 1);
		member.setMbrNo(newMbrNo);
		// 密碼加密
		member.setMbrPwd(hashPassword(member.getMbrPwd()));
		// 評價預設為0
		member.setCmtReNum(0);
		member.setCmtReScore(0);
		member.setEmailStat(false);
		String mbrNo = dao.add(member);

		return mbrNo;
	}

	@Override
	public String updateMen(MemberVO member) {

		return dao.update(member);
	}

	@Override
	public MemberVO findByMbrNo(String mbrNo) {

		return dao.findByPK(mbrNo);
	}

	@Override
	public MemberVO findByMbrPhone(String mbrPhone) {

		return dao.findByMbrPhone(mbrPhone);
	}

	@Override
	public MemberVO findByMbrEmail(String mbrEmail) {

		return dao.findByMbrEmail(mbrEmail);
	}

	@Override
	public String addCmtByMbrNo(int cmtScore, String mbrNo) {
		MemberVO vo = dao.findByPK(mbrNo);
		int num = vo.getCmtReNum();
		int score = vo.getCmtReScore();
		num += 1;
		score += cmtScore;
		vo.setCmtReNum(num);
		vo.setCmtReScore(score);
		return dao.update(vo);
	}

}
