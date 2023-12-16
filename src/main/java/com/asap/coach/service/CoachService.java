package com.asap.coach.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.asap.coach.dao.CoachDAO;
import com.asap.coach.dao.CoachDAO_interface;
import com.asap.coach.entity.CoachVO;

public class CoachService implements CoachService_interface {

	private CoachDAO_interface dao;

	public CoachService() {
		dao = new CoachDAO();
	}

	public String hashPassword(String password) {
		String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		return hashedPassword;
	}

	@Override
	public String add(CoachVO coach) {
		// 產生序號
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("MMddyyyy");
		String newCoachNo = "C" + ft.format(dNow) + String.format("%05d", dao.countAll() + 1);
		coach.setCoachNo(newCoachNo);
		// 密碼加密
		coach.setCoachPwd(hashPassword(coach.getCoachPwd()));
		// 啟用狀態、email驗證預設為0
		coach.setCoachStat(false);
		coach.setEmailStat(false);
		String coachNo = dao.add(coach);

		return coachNo;
	}
	
	

	@Override
	public String update(CoachVO coach) {

		return dao.update(coach);
	}

	@Override
	public CoachVO findByPK(String coachNo) {

		return dao.findByPK(coachNo);
	}

	@Override
	public CoachVO findByCoachEmail(String coachEmail) {

		return dao.findByCoachEmail(coachEmail);
	}

	@Override
	public CoachVO findByCoachPhone(String coachPhone) {

		return dao.findByCoachPhone(coachPhone);
	}

	@Override
	public List<CoachVO> getAll() {

		return dao.getAll();
	}

}
