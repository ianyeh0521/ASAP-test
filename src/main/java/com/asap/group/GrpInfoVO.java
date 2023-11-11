package com.asap.group;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;


public class GrpInfoVO implements Serializable{
	private static final long serialVersionUID=1L;
	private Integer grpNo;
	private String orgMbrNo;
	private Integer sportTypeNo;
	private String grpName;
	private Date grpDate;
	private Time grpStartTime;
	private Time grpEndTime; 
	private String grpAddress;
	private Integer grpPplLimit;
	private Integer grpPplMin;
	private Timestamp grpSignStrTime; 
	private Timestamp grpSignEndTime; 
	private String grpNote;
	private byte[] grpImg;
	
	public GrpInfoVO() {
		super();
	}
	
	public GrpInfoVO(Integer grpNo, String orgMbrNo, Integer sportTypeNo, String grpName, Date grpDate, Time grpStartTime,
			Time grpEndTime, String grpAddress, Integer grpPplLimit, Integer grpPplMin, Timestamp grpSignStrTime,
			Timestamp grpSignEndTime, String grpNote, byte[] grpImg) {
		super();
		this.grpNo = grpNo;
		this.orgMbrNo = orgMbrNo;
		this.sportTypeNo = sportTypeNo;
		this.grpName = grpName;
		this.grpDate = grpDate;
		this.grpStartTime = grpStartTime;
		this.grpEndTime = grpEndTime;
		this.grpAddress = grpAddress;
		this.grpPplLimit = grpPplLimit;
		this.grpPplMin = grpPplMin;
		this.grpSignStrTime = grpSignStrTime;
		this.grpSignEndTime = grpSignEndTime;
		this.grpNote = grpNote;
		this.grpImg = grpImg;
	}

	public Integer getGrpNo() {
		return grpNo;
	}

	public void setGrpNo(Integer grpNo) {
		this.grpNo = grpNo;
	}

	public String getOrgMbrNo() {
		return orgMbrNo;
	}

	public void setOrgMbrNo(String orgMbrNo) {
		this.orgMbrNo = orgMbrNo;
	}

	public Integer getSportTypeNo() {
		return sportTypeNo;
	}

	public void setSportTypeNo(Integer sportTypeNo) {
		this.sportTypeNo = sportTypeNo;
	}

	public String getGrpName() {
		return grpName;
	}

	public void setGrpName(String grpName) {
		this.grpName = grpName;
	}

	public Date getGrpDate() {
		return grpDate;
	}

	public void setGrpDate(Date grpDate) {
		this.grpDate = grpDate;
	}

	public Time getGrpStartTime() {
		return grpStartTime;
	}

	public void setGrpStartTime(Time grpStartTime) {
		this.grpStartTime = grpStartTime;
	}

	public Time getGrpEndTime() {
		return grpEndTime;
	}

	public void setGrpEndTime(Time grpEndTime) {
		this.grpEndTime = grpEndTime;
	}

	public String getGrpAddress() {
		return grpAddress;
	}

	public void setGrpAddress(String grpAddress) {
		this.grpAddress = grpAddress;
	}

	public Integer getGrpPplLimit() {
		return grpPplLimit;
	}

	public void setGrpPplLimit(Integer grpPplLimit) {
		this.grpPplLimit = grpPplLimit;
	}

	public Integer getGrpPplMin() {
		return grpPplMin;
	}

	public void setGrpPplMin(Integer grpPplMin) {
		this.grpPplMin = grpPplMin;
	}

	public Timestamp getGrpSignStrTime() {
		return grpSignStrTime;
	}

	public void setGrpSignStrTime(Timestamp grpSignStrTime) {
		this.grpSignStrTime = grpSignStrTime;
	}

	public Timestamp getGrpSignEndTime() {
		return grpSignEndTime;
	}

	public void setGrpSignEndTime(Timestamp grpSignEndTime) {
		this.grpSignEndTime = grpSignEndTime;
	}

	public String getGrpNote() {
		return grpNote;
	}

	public void setGrpNote(String grpNote) {
		this.grpNote = grpNote;
	}

	public byte[] getGrpImg() {
		return grpImg;
	}

	public void setGrpImg(byte[] grpImg) {
		this.grpImg = grpImg;
	}
	
	
	
}