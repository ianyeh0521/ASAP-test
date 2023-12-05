package com.asap.member.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "chatroom")
public class ChatroomVO implements Serializable {
     
	@Id
	@Column(name = "ChatroomNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer chatroomNo;
	@Column(name = "MbrNo1")
	private String mbrNo1;
	@Column(name = "MbrNo2")
	private String mbrNo2;

	public ChatroomVO() {
	}

	public ChatroomVO(Integer chatroomNo, String mbrNo1, String mbrNo2) {
		this.chatroomNo = chatroomNo;
		this.mbrNo1 = mbrNo1;
		this.mbrNo2 = mbrNo2;
	}

	public Integer getChatroomNo() {
		return chatroomNo;
	}

	public void setChatroomNo(Integer chatroomNo) {
		this.chatroomNo = chatroomNo;
	}

	public String getMbrNo1() {
		return mbrNo1;
	}

	public void setMbrNo1(String mbrNo1) {
		this.mbrNo1 = mbrNo1;
	}

	public String getMbrNo2() {
		return mbrNo2;
	}

	public void setMbrNo2(String mbrNo2) {
		this.mbrNo2 = mbrNo2;
	}

	@Override
	public String toString() {
		return "ChatroomVO [chatroomNo=" + chatroomNo + ", mbrNo1=" + mbrNo1 + ", mbrNo2=" + mbrNo2 + "]";
	}
}
