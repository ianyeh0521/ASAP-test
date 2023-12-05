package com.asap.coach.dao;

import java.util.List;

import com.asap.coach.entity.SportCertVO;

public interface SportCertDAO_interface {
	
	/*新增教練證照
	 * 輸入 : 教練證照VO
	 * 輸出成功 : 教練證照編號
	 * 輸出失敗 : -1
	 * */ 
	int add(SportCertVO SportCert);
	
	/*更新教練證照
	 * 輸入 : 教練證照VO
	 * 輸出成功 : 更新成功
	 * 輸出失敗 : 更新失敗 
	 * */ 
	String delete(SportCertVO SportCert);
	
	/*用主鍵查找教練證照
	 * 輸入 : 教練證照編號
	 * 輸出成功 : 教練證照VO
	 * 輸出失敗 : null 
	 * */ 
	SportCertVO findByPK(int sportCertNo);
	
	/*用教練編號查找教練證照
	 * 輸入 : 教練編號
	 * 輸出成功 : 教練證照VO表單
	 * 輸出失敗 : null 
	 * */ 
	List<SportCertVO> findByCoachNo(String coachNo);

	/*用運動種類編號查找教練證照
	 * 輸入 : 運動種類編號
	 * 輸出成功 : 教練證照VO表單
	 * 輸出失敗 : null 
	 * */ 
	List<SportCertVO> findBySportTypeNo(int sportTypeNo);

	/*用教練編號、運動種類編號查找教練證照
	 * 輸入 : 教練編號、運動種類編號
	 * 輸出成功 : 教練證照VO
	 * 輸出失敗 : null 
	 * */ 
	SportCertVO findVO(String coachNo,int sportTypeNo);
}
