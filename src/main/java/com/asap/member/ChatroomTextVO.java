package com.asap.member;

import java.io.Serializable;

public class ChatroomTextVO implements Serializable {

	private String mbrNo, chatText;
	private Integer chatTextNo, chatroomNo;

	public ChatroomTextVO() {
	}

	public ChatroomTextVO(String mbrNo, String chatText, Integer chatTextNo, Integer chatroomNo) {
		this.mbrNo = mbrNo;
		this.chatText = chatText;
		this.chatTextNo = chatTextNo;
		this.chatroomNo = chatroomNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public String getChatText() {
		return chatText;
	}

	public void setChatText(String chatText) {
		this.chatText = chatText;
	}

	public Integer getChatTextNo() {
		return chatTextNo;
	}

	public void setChatTextNo(Integer chatTextNo) {
		this.chatTextNo = chatTextNo;
	}

	public Integer getChatroomNo() {
		return chatroomNo;
	}

	public void setChatroomNo(Integer chatroomNo) {
		this.chatroomNo = chatroomNo;
	}

}
