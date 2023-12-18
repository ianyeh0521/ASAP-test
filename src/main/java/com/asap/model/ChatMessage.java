package com.asap.chat.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ChatMessage {
	private String type;
	private String sender;
	private String receiver;
	private String message;
//	private Date msgDate;
//	private String msgDateStr;

	public ChatMessage(String type, String sender, String receiver, String message) {
		this.type = type;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

//	public Date getMsgDate() {
//		return msgDate;
//	}
//
//	public String getMsgDateStr() {
//		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd HH:mm:");
//		msgDateStr = sdf.format(msgDate);
//		return msgDateStr;
//	}
//
//	public void setMsgDate(Date msgDate) {
//		this.msgDate = msgDate;
//	}
//
//	public void setMsgDateStr(String msgDateStr) {
//		this.msgDateStr = msgDateStr;
//	}
}
