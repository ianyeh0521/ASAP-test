package com.asap.member.dao;


import java.util.List;
import com.asap.member.entity.MbrActivVO;

public interface MbrActivDAO_interface {
      
	/*新增會員活動
	 * 輸入 : 會員活動VO
	 * 輸出成功 : 會員活動編號
	 * 輸出失敗 : -1
	 * */ 
	int add(MbrActivVO mbrActiv);
	
	
	/*刪除會員活動
	 * 輸入 : 會員活動VO
	 * 輸出成功 : 成功
	 * 輸出失敗 : 失敗
	 * */ 
	String delete(MbrActivVO mbrActiv);
	
	/*尋找某位會員的所有會員活動
	 * 輸入 : 會員編號
	 * 輸出成功 : 會員活動VO表單
	 * 輸出失敗 : null
	 * */ 
	List<MbrActivVO> findByMbrNo(String mbrNo);
	
	/*用主鍵尋找會員活動
	 * 輸入 : 主鍵編號
	 * 輸出成功 : 會員活動VO表單
	 * 輸出失敗 : null
	 * */ 
	MbrActivVO findByPK(Integer mbrActivNo);
}
