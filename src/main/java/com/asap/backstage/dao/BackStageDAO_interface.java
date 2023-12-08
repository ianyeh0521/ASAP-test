package com.asap.backstage.dao;

import java.util.List;

import com.asap.backstage.entity.BackStageVO;


public interface BackStageDAO_interface {
	/*新增一名後台人員
	 * 輸入 : 後台人員VO
	 * 輸出成功 : 後台人員編號
	 * 輸出失敗 : fail 
	 * */ 
	String add(BackStageVO back);
	
	/*更新後台人員資料
	 * 輸入 : 後台人員VO
	 * 輸出成功 : 更新成功
	 * 輸出失敗 : 更新失敗 
	 * */ 
	String update(BackStageVO back);
	
	/*用編號查找後台人員資料
	 * 輸入 : 後台人員編號
	 * 輸出成功 : 後台人員VO
	 * 輸出失敗 : null 
	 * */ 
	BackStageVO findByPK(String backNo);
	
	/*用Email查找後台人員資料
	 * 輸入 : 後台人員Email
	 * 輸出成功 : 後台人員VO
	 * 輸出失敗 : null 
	 * */ 
	BackStageVO findByBackEmail(String backEmail);
	
	/*用手機查找後台人員資料
	 * 輸入 : 後台人員手機
	 * 輸出成功 : 後台人員VO
	 * 輸出失敗 : null 
	 * */ 
	BackStageVO findByBackPhone(String backPhone);
    
	/*列出所有後台人員資料
	 * 輸入 : 無
	 * 輸出成功 : 後台人員VO組成的list
	 * 輸出失敗 : null 
	 * */ 
	List<BackStageVO> getAll();
	
	/*計算所有後台人員資料筆數
	 * 輸入 : 無
	 * 輸出成功 : 後台人員資料數
	 * 輸出失敗 : -1
	 * */ 
	int countAll();
}
