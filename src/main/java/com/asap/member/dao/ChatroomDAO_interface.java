package com.asap.member.dao;

import java.util.List;

import com.asap.member.entity.ChatroomVO;

public interface ChatroomDAO_interface {
	
	/*新增聊天室
	 * 輸入 : 聊天室VO
	 * 輸出成功 : 聊天室編號
	 * 輸出失敗 : -1
	 * */
	int add(ChatroomVO chatroomVO);
		
	/*用會員編號尋找聊天室
	 * 輸入 : 會員編號
	 * 輸出成功 : 聊天室VO表單
	 * 輸出失敗 : null
	 * */
	List<ChatroomVO> findByMbrNo(String mbrNo);

}
