package com.asap.member.dao;

import java.util.List;



import com.asap.member.entity.NewsVO;

public interface NewsDAO_interface {
	
	/*新增消息
	 * 輸入 : 消息VO
	 * 輸出成功 : 消息編號
	 * 輸出失敗 : -1
	 * */ 
	int add(NewsVO news);
	
	/*刪除消息
	 * 輸入 : 消息VO
	 * 輸出成功 : 成功
	 * 輸出失敗 : 失敗
	 * */ 
	String delete(NewsVO news);
	
	/*用主鍵搜尋消息
	 * 輸入 : 消息編號
	 * 輸出成功 : 消息VO
	 * 輸出失敗 : null
	 * */ 
	NewsVO findByPK(int newsNo);
	
	/*模糊比對搜尋消息主旨
	 * 輸入 : 欲尋找的關鍵字
	 * 輸出成功 : 消息VO表單
	 * 輸出失敗 : null
	 * */ 
	List<NewsVO> findByNewsSubj(String keyword);
	
	/*模糊比對搜尋消息內文
	 * 輸入 : 欲尋找的關鍵字
	 * 輸出成功 : 消息VO表單
	 * 輸出失敗 : null
	 * */ 
	List<NewsVO> findByNewsText(String keyword);

}
