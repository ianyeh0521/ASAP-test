package com.asap.member.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chatroomtext")
public class ChatroomTextVO implements Serializable {
	@Id
	@Column(name = "ChatTextNo")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer chatTextNo;
	@Column(name = "MbrNo", updatable = false)
	private String mbrNo;
	@Column(name = "ChatText")
	private String chatText;
	@Column(name = "ChatroomNo")
	private Integer chatroomNo;
	@Column(name = "ChatTime")
	private Timestamp chatTime;

	public ChatroomTextVO() {
	}

	public ChatroomTextVO(String mbrNo, String chatText, Integer chatTextNo, Integer chatroomNo, Timestamp chatTime) {
		this.mbrNo = mbrNo;
		this.chatText = chatText;
		this.chatTextNo = chatTextNo;
		this.chatroomNo = chatroomNo;
		this.chatTime = chatTime;
	}

	public Timestamp getChatTime() {
		return chatTime;
	}

	public void setChatTime(Timestamp chatTime) {
		this.chatTime = chatTime;
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

	@Override
	public String toString() {
		return "ChatroomTextVO [mbrNo=" + mbrNo + ", chatText=" + chatText + ", chatTextNo=" + chatTextNo
				+ ", chatroomNo=" + chatroomNo + ", chatTime=" + chatTime + "]";
	}

}
