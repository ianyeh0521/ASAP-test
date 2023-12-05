package com.asap.coach.dao;

import java.util.List;

import com.asap.coach.entity.CoachVO;


public interface CoachDAO_interface {

	/*新增一名教練
	 * 輸入 : 教練VO
	 * 輸出成功 : 教練編號
	 * 輸出失敗 : fail 
	 * */ 
	String add(CoachVO coach);
	
	/*更新教練資料
	 * 輸入 : 教練VO
	 * 輸出成功 : 更新成功
	 * 輸出失敗 : 更新失敗 
	 * */ 
	String update(CoachVO coach);
	
	/*用編號查找教練資料
	 * 輸入 : 教練編號
	 * 輸出成功 : 教練VO
	 * 輸出失敗 : null 
	 * */ 
	CoachVO findByPK(String coachNo);
	
	
	/*用Email查找教練資料
	 * 輸入 : 教練Email
	 * 輸出成功 : 教練VO
	 * 輸出失敗 : null 
	 * */
	CoachVO findByCoachEmail(String coachEmail);
	
	
	/*用手機查找教練資料
	 * 輸入 : 教練手機
	 * 輸出成功 : 教練VO
	 * 輸出失敗 : null 
	 * */ 
	CoachVO findByCoachPhone(String coachPhone);

	/*列出所有教練資料
	 * 輸入 : 無
	 * 輸出成功 : 教練VO組成的list
	 * 輸出失敗 : null 
	 * */ 
	List<CoachVO> getAll();
	

	/*計算所有教練資料筆數
	 * 輸入 : 無
	 * 輸出成功 : 教練資料數
	 * 輸出失敗 : -1
	 * */ 
	int countAll();
}
