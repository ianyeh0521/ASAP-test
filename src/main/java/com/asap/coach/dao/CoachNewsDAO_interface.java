package com.asap.coach.dao;


import java.util.List;

import com.asap.coach.entity.CoachNewsVO;


public interface CoachNewsDAO_interface {
      
	/*新增教練消息
	 * 輸入 : 教練消息VO
	 * 輸出成功 : 教練消息編號
	 * 輸出失敗 : -1
	 * */ 
	int add(CoachNewsVO coachNews);
	
	
	/*刪除教練消息
	 * 輸入 : 教練消息VO
	 * 輸出成功 : 成功
	 * 輸出失敗 : 失敗
	 * */ 
	String delete(CoachNewsVO coachNews);
	
	/*尋找某位教練看到的所有教練消息
	 * 輸入 : 教練編號
	 * 輸出成功 : 教練消息VO表單
	 * 輸出失敗 : null
	 * */ 
	List<CoachNewsVO> findByCoachNo(String coachNo);
	
	/*用主鍵尋找教練消息
	 * 輸入 : 教練編號
	 * 輸出成功 : 教練消息VO
	 * 輸出失敗 : null
	 * */ 
	CoachNewsVO findByPK(String coachNewsNo);
}
