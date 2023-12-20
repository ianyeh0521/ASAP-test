package com.asap.forum.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


@Entity
@Table(name="ForumReport")
public class ForumReportVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "fRptNo", updatable = false)
	private Integer fRptNo;
	
	@Column(name = "PostNo")
	private Integer postNo;
	
	@Column(name = "CmtNo")
	private Integer cmtNo;
	
	@Column(name = "MbrNo")
	private String  mbrNo;
	
//	@Column(name = "FRptTypeNo")
//	private Integer fRptTypeNo;
	
	@ManyToOne
	@JoinColumn(name = "fRptTypeNo", referencedColumnName = "fRptTypeNo")
	private ForumReportTypeVO forumReportTypeVO;	
	
	@Column(name = "FRptMsg")
	private String  fRptMsg;
	
	@CreationTimestamp
	@Column(name = "FRptTime")
	private Timestamp  fRptTime;
	
	@Column(name = "BackNo")
	private String backNo;
	
	@Column(name = "FRptReply")
	private String  fRptReply;
	
	@Column(name = "FRptReplyTime")
	private Timestamp  fRptReplyTime;
	
	public ForumReportVO() {
		super();
		// TODO Auto-generated constructor stub
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

	public ForumReportTypeVO getForumReportTypeVO() {
		return forumReportTypeVO;
	}


	public void setForumReportTypeVO(ForumReportTypeVO forumReportTypeVO) {
		this.forumReportTypeVO = forumReportTypeVO;
	}


	@Override
	public String toString() {
		return "ForumReportVO [fRptNo=" + fRptNo + ", postNo=" + postNo + ", cmtNo=" + cmtNo + ", mbrNo=" + mbrNo
				+ ", forumReportTypeVO=" + forumReportTypeVO + ", fRptMsg=" + fRptMsg + ", fRptTime=" + fRptTime
				+ ", backNo=" + backNo + ", fRptReply=" + fRptReply + ", fRptReplyTime=" + fRptReplyTime + "]";
	}


	public ForumReportVO(Integer fRptNo, Integer postNo, Integer cmtNo, String mbrNo,
			ForumReportTypeVO forumReportTypeVO, String fRptMsg, Timestamp fRptTime, String backNo, String fRptReply,
			Timestamp fRptReplyTime) {
		super();
		this.fRptNo = fRptNo;
		this.postNo = postNo;
		this.cmtNo = cmtNo;
		this.mbrNo = mbrNo;
		this.forumReportTypeVO = forumReportTypeVO;
		this.fRptMsg = fRptMsg;
		this.fRptTime = fRptTime;
		this.backNo = backNo;
		this.fRptReply = fRptReply;
		this.fRptReplyTime = fRptReplyTime;
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

	public String getBackNo() {
		return backNo;
	}

	public void setBackNo(String backNo) {
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
