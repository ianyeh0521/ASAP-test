package com.asap.backstage.dao;

import java.util.List;

import com.asap.backstage.entity.BackAccessTypeVO;

public interface BackAccessTypeDAO_interface {
	
	/*新增後台權限種類
	 * 輸入 : 後台權限種類VO
	 * 輸出成功 : 後台權限種類編號
	 * 輸出失敗 : -1
	 * */ 
	int add(BackAccessTypeVO backType);
	
	/*更新後台權限種類
	 * 輸入 : 後台權限種類VO
	 * 輸出成功 : 更新成功
	 * 輸出失敗 : 更新失敗 
	 * */ 
	String update(BackAccessTypeVO backType);
	
	/*用編號查找後台權限種類
	 * 輸入 : 後台權限種類編號
	 * 輸出成功 : 後台權限種類VO
	 * 輸出失敗 : null 
	 * */ 
	BackAccessTypeVO findByPK(int backTypeNo);
	
	/*列出所有後台權限種類
	 * 輸入 : 無
	 * 輸出成功 : 後台權限種類VO組成的list
	 * 輸出失敗 : null 
	 * */ 
	List<BackAccessTypeVO> getAll();
	
	/*列出所有後台權限種類
	 * 輸入 : 無
	 * 輸出成功 : 後台權限種類數
	 * 輸出失敗 : -1 
	 * */ 
	int countAll();
}
