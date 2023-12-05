package com.asap.member.dao;

import java.util.List;

import com.asap.member.entity.ChatroomTextVO;

public interface ChatroomTextDAO_interface {
	
	/*新增聊天室訊息
	 * 輸入 : 聊天室訊息VO
	 * 輸出成功 : 聊天室訊息編號
	 * 輸出失敗 : -1
	 * */
	int add(ChatroomTextVO ChatroomTextVO);
	
	/*用主鍵尋找聊天室訊息
	 * 輸入 : 聊天室訊息編號
	 * 輸出成功 : 聊天室訊息VO
	 * 輸出失敗 : null
	 * */
	ChatroomTextVO findByPK(Integer chatTextNo);
	
	/*用訊息內容模糊尋找聊天室訊息
	 * 輸入 : 訊息內容
	 * 輸出成功 : 聊天室訊息VO表單
	 * 輸出失敗 : null
	 * */
	List<ChatroomTextVO> findByChatText(String chatText);
	
	/*用聊天室編號尋找聊天室訊息
	 * 輸入 : 聊天室編號
	 * 輸出成功 : 聊天室訊息VO表單
	 * 輸出失敗 : null
	 * */
    List<ChatroomTextVO> findByChatroomNo(Integer chatroomNo);
}
