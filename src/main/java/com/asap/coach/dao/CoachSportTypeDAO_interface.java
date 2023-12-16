package com.asap.coach.dao;

import java.util.List;

import com.asap.coach.entity.CoachSportTypeVO;

public interface CoachSportTypeDAO_interface {

	/*新增教練運動種類
	 * 輸入 : 教練運動種類VO
	 * 輸出成功 : 教練運動種類編號
	 * 輸出失敗 : -1
	 * */ 
	int add(CoachSportTypeVO coachSportType);
	
	/*刪除教練運動種類
	 * 輸入 : 教練運動種類VO
	 * 輸出成功 : 成功
	 * 輸出失敗 : 失敗
	 * */ 
	String delete(CoachSportTypeVO coachSportType);
	
	
	/*尋找某位教練的某種運動種類
	 * 輸入 : 教練編號、運動種類編號
	 * 輸出成功 : 教練運動種類VO
	 * 輸出失敗 : null
	 * */ 
	CoachSportTypeVO findVo(String coachNo, int sportTypeNo);
	

	
	/*尋找某位教練擁有的運動種類
	 * 輸入 : 教練編號
	 * 輸出成功 : 教練運動種類VO表單
	 * 輸出失敗 : null
	 * */ 
	List<CoachSportTypeVO> findByCoachNo(String coachNo);
	
	/*尋找運動種類的所有教練
	 * 輸入 : 運動種類編號
	 * 輸出成功 : 教練運動種類VO表單
	 * 輸出失敗 : null
	 * */ 
	List<CoachSportTypeVO> findBySportTypeNo(int sportTypeNo);
	
	
}
