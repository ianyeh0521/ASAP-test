package com.asap.backstage.dao;


import java.util.List;

import com.asap.backstage.entity.BackAccessVO;

public interface BackAccessDAO_interface {

	/*新增後台人員權限
	 * 輸入 : 後台人員權限VO
	 * 輸出成功 : 後台人員權限編號
	 * 輸出失敗 : -1
	 * */ 
	int add(BackAccessVO backAce);
	
	/*刪除後台人員權限
	 * 輸入 : 後台人員權限VO
	 * 輸出成功 : 成功
	 * 輸出失敗 : 失敗
	 * */ 
	String delete(BackAccessVO backAce);
	
	
	/*尋找某位後台人員擁有的權限
	 * 輸入 : 後台人員編號、權限種類
	 * 輸出成功 : 後台人員權限VO
	 * 輸出失敗 : null
	 * */ 
	BackAccessVO findVo(String backNo, int backAceTypeNo);
	
	/*尋找某位後台人員擁有的權限
	 * 輸入 : 後台人員編號
	 * 輸出成功 : 後台人員權限VO表單
	 * 輸出失敗 : null
	 * */ 
	List<BackAccessVO> findByBackNo(String backNo);
	
	/*尋找某權限的所有後台人員
	 * 輸入 : 權限種類編號
	 * 輸出成功 : 後台人員權限VO表單
	 * 輸出失敗 : null
	 * */ 
	List<BackAccessVO> findByBackAceTypeNo(int backAceTypeNo);
}
