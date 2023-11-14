package com.asap.member;

import java.io.Serializable;

public class ChatroomVO implements Serializable {
	private Integer chatroomNo;
	private String mbrNo1, mbrNo2;

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

}
