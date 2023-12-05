package com.asap.backstage.dao;

import java.util.List;

import com.asap.backstage.entity.CustMsgVO;

public interface CustMsgDAO_interface {
	
	/*新增客服訊息
	 * 輸入 : 客服訊息VO
	 * 輸出成功 : 客服訊息編號
	 * 輸出失敗 : -1
	 * */ 
	int add(CustMsgVO custMsg);
	
	/*更新客服訊息
	 * 輸入 : 客服訊息VO
	 * 輸出成功 : 更新成功
	 * 輸出失敗 : 更新失敗 
	 * */ 
	String update(CustMsgVO custMsg);
	
	/*用主鍵尋找客服訊息
	 * 輸入 : 客服訊息編號
	 * 輸出成功 : 客服訊息VO
	 * 輸出失敗 : null
	 * */ 
	CustMsgVO findByPK(int custMsgNo);
	
	/*用會員尋找某會員的客服訊息
	 * 輸入 : 會員編號
	 * 輸出成功 : 客服訊息VO表單
	 * 輸出失敗 : null
	 * */ 
	List<CustMsgVO> findByMbrNo(String mbrNo);
	
	/*用會員尋找某教練的客服訊息
	 * 輸入 : 教練編號
	 * 輸出成功 : 客服訊息VO表單
	 * 輸出失敗 : null
	 * */ 
	List<CustMsgVO> findByCoachNo(String coachNo);
	
	
	
	

}
