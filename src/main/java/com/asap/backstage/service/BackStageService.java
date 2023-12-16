package com.asap.backstage.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;

import com.asap.backstage.dao.BackStageDAO;
import com.asap.backstage.dao.BackStageDAO_interface;
import com.asap.backstage.entity.BackStageVO;

public class BackStageService implements BackStageService_interface {

	private BackStageDAO_interface dao;

	public BackStageService() {
		dao = new BackStageDAO();
	}

	public String hashPassword(String password) {
		String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
		return hashedPassword;
	}

	@Override
	public String addBack(BackStageVO backstage) {
		// 產生序號
		Date dNow = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("MMddyyyy");
		String newBackNo = "B" + ft.format(dNow) + String.format("%05d", dao.countAll() + 1);
		backstage.setBackNo(newBackNo);
		// 密碼加密
		backstage.setBackPwd(hashPassword(backstage.getBackPwd()));
		// 設定時間及更新時間預設為現在
//		backstage.setBackSetTime(Timestamp.valueOf(LocalDateTime.now()));
//		backstage.setBackUpdTime(Timestamp.valueOf(LocalDateTime.now()));
		// 預設狀態為啟用
		backstage.setBackStat(true);
		String backNo = dao.add(backstage);
		return backNo;
	}

	@Override
	public String updateBack(BackStageVO backstage) {
		// 設定更新時間為現在
		backstage.setBackUpdTime(Timestamp.valueOf(LocalDateTime.now()));
		return dao.update(backstage);
	}

	@Override
	public String suspendBack(BackStageVO backstage) {
		// 設定更新時間為現在
//		backstage.setBackUpdTime(Timestamp.valueOf(LocalDateTime.now()));
		// 預設狀態為停用
		backstage.setBackStat(false);
		return dao.update(backstage);
	}

	@Override
	public BackStageVO findByBackNo(String backNo) {

		return dao.findByPK(backNo);
	}

	@Override
	public BackStageVO findByBackPhone(String backPhone) {

		return dao.findByBackPhone(backPhone);
	}

	@Override
	public BackStageVO findByBackEmail(String backEmail) {

		return dao.findByBackEmail(backEmail);
	}

	@Override
	public List<BackStageVO> getAllBack() {

		return dao.getAll();
	}

}
