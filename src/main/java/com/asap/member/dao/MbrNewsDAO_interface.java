package com.asap.member.dao;


import java.util.List;
import com.asap.member.entity.MbrNewsVO;

public interface MbrNewsDAO_interface {
      
	/*新增會員消息
	 * 輸入 : 會員消息VO
	 * 輸出成功 : 會員消息編號
	 * 輸出失敗 : -1
	 * */ 
	int add(MbrNewsVO mbrNews);
	
	
	/*刪除會員消息
	 * 輸入 : 會員消息VO
	 * 輸出成功 : 成功
	 * 輸出失敗 : 失敗
	 * */ 
	String delete(MbrNewsVO mbrNews);
	
	/*尋找某位會員看到的所有會員消息
	 * 輸入 : 會員編號
	 * 輸出成功 : 會員消息VO表單
	 * 輸出失敗 : null
	 * */ 
	List<MbrNewsVO> findByMbrNo(String mbrNo);
	
	/*用主鍵尋找會員消息
	 * 輸入 : 主鍵編號
	 * 輸出成功 : 會員消息VO表單
	 * 輸出失敗 : null
	 * */ 
	MbrNewsVO findByPK(String mbrNewsNo);
}
