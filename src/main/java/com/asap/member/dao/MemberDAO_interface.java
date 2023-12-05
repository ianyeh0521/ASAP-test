package com.asap.member.dao;

import java.util.List;

import com.asap.member.entity.MemberVO;

public interface MemberDAO_interface {
	
	/*新增一名會員
	 * 輸入 : 會員VO
	 * 輸出成功 : 會員編號
	 * 輸出失敗 : fail 
	 * */ 
	String add(MemberVO mem);
	
	/*更新會員資料
	 * 輸入 : 會員VO
	 * 輸出成功 : 更新成功
	 * 輸出失敗 : 更新失敗 
	 * */ 
	String update(MemberVO mem);
	
	/*用編號查找會員資料
	 * 輸入 : 會員編號
	 * 輸出成功 : 會員VO
	 * 輸出失敗 : null 
	 * */ 
	MemberVO findByPK(String mbrNo);
	
	
	/*用Email查找會員資料
	 * 輸入 : 會員Email
	 * 輸出成功 : 會員VO
	 * 輸出失敗 : null 
	 * */
	MemberVO findByMbrEmail(String mbrEmail);
	
	
	/*用手機查找會員資料
	 * 輸入 : 會員手機
	 * 輸出成功 : 會員VO
	 * 輸出失敗 : null 
	 * */ 
	MemberVO findByMbrPhone(String mbrPhone);

	/*列出所有會員資料
	 * 輸入 : 無
	 * 輸出成功 : 會員VO組成的list
	 * 輸出失敗 : null 
	 * */ 
	List<MemberVO> getAll();
	

	/*計算所有會員資料筆數
	 * 輸入 : 無
	 * 輸出成功 : 會員資料數
	 * 輸出失敗 : -1
	 * */ 
	int countAll();
}
