package com.asap.forum;

import java.sql.Timestamp;

public class ForumReportVO {
	private Integer fRptNo;
	private Integer postNo;
	private Integer cmtNo;
	private String  mbrNo;
	private Integer fRptTypeNo;
	private String  fRptMsg;
	private Timestamp  fRptTime;
	private Integer backNo;
	private String  fRptReply;
	private Timestamp  fRptReplyTime;
	
	public ForumReportVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ForumReportVO(Integer fRptNo, Integer postNo, Integer cmtNo, String mbrNo, Integer fRptTypeNo,
			String fRptMsg, Timestamp fRptTime, Integer backNo, String fRptReply, Timestamp fReplyTime) {
		super();
		this.fRptNo = fRptNo;
		this.postNo = postNo;
		this.cmtNo = cmtNo;
		this.mbrNo = mbrNo;
		this.fRptTypeNo = fRptTypeNo;
		this.fRptMsg = fRptMsg;
		this.fRptTime = fRptTime;
		this.backNo = backNo;
		this.fRptReply = fRptReply;
		this.fRptReplyTime = fReplyTime;
	}

	public Integer getfRptNo() {
		return fRptNo;
	}

	public void setfRptNo(Integer fRptNo) {
		this.fRptNo = fRptNo;
	}

	public Integer getPostNo() {
		return postNo;
	}

	public void setPostNo(Integer postNo) {
		this.postNo = postNo;
	}

	public Integer getCmtNo() {
		return cmtNo;
	}

	public void setCmtNo(Integer cmtNo) {
		this.cmtNo = cmtNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public Integer getfRptTypeNo() {
		return fRptTypeNo;
	}

	public void setfRptTypeNo(Integer fRptTypeNo) {
		this.fRptTypeNo = fRptTypeNo;
	}

	public String getfRptMsg() {
		return fRptMsg;
	}

	public void setfRptMsg(String fRptMsg) {
		this.fRptMsg = fRptMsg;
	}

	public Timestamp getfRptTime() {
		return fRptTime;
	}

	public void setfRptTime(Timestamp fRptTime) {
		this.fRptTime = fRptTime;
	}

	public Integer getBackNo() {
		return backNo;
	}

	public void setBackNo(Integer backNo) {
		this.backNo = backNo;
	}

	public String getfRptReply() {
		return fRptReply;
	}

	public void setfRptReply(String fRptReply) {
		this.fRptReply = fRptReply;
	}

	public Timestamp getfRptReplyTime() {
		return fRptReplyTime;
	}

	public void setfRptReplyTime(Timestamp fRptReplyTime) {
		this.fRptReplyTime = fRptReplyTime;
	}

	
	
	
}
