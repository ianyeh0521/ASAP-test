package com.asap.group.entity;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GrpInfo")
public class GrpInfoVO {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "GrpNo", updatable = false)
	private Integer grpNo;
	@Column(name = "OrgMbrNo")
	private String orgMbrNo;
	@Column(name = "SportTypeNo")
	private Integer sportTypeNo;
	@Column(name = "GrpName")
	private String grpName;
	@Column(name = "GrpDate")
	private Date grpDate;
	@Column(name = "GrpStartTime")
	private Time grpStartTime;
	@Column(name = "GrpEndTime")
	private Time grpEndTime;
	@Column(name = "GrpAddress")
	private String grpAddress;
	@Column(name = "GrpPplLimit")
	private Integer grpPplLimit;
	@Column(name = "GrpPplMin")
	private Integer grpPplMin;
	@Column(name = "GrpSignStrTime")
	private Timestamp grpSignStrTime;
	@Column(name = "GrpSignEndTime")
	private Timestamp grpSignEndTime;
	@Column(name = "GrpNote")
	private String grpNote;

	@Column(name = "GrpImg", columnDefinition = "longblob")
	private byte[] grpImg;
	@Column(name = "GrpStat")
	private Integer grpStat;

	public GrpInfoVO() {

	}

	public GrpInfoVO(Integer grpNo, String orgMbrNo, Integer sportTypeNo, String grpName, Date grpDate,
			Time grpStartTime, Time grpEndTime, String grpAddress, Integer grpPplLimit, Integer grpPplMin,
			Timestamp grpSignStrTime, Timestamp grpSignEndTime, String grpNote, byte[] grpImg, Integer grpStat) {
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
		this.grpStat = grpStat;
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

	public int getGrpStat() {
		return grpStat;
	}

	public void setGrpStat(Integer grpStat) {
		this.grpStat = grpStat;
	}

	@Override
	public String toString() {
		return "GrpInfoVO [grpNo=" + grpNo + ", orgMbrNo=" + orgMbrNo + ", sportTypeNo=" + sportTypeNo + ", grpName="
				+ grpName + ", grpDate=" + grpDate + ", grpStartTime=" + grpStartTime + ", grpEndTime=" + grpEndTime
				+ ", grpAddress=" + grpAddress + ", grpPplLimit=" + grpPplLimit + ", grpPplMin=" + grpPplMin
				+ ", grpSignStrTime=" + grpSignStrTime + ", grpSignEndTime=" + grpSignEndTime + ", grpNote=" + grpNote
				+ ", grpImg=" + Arrays.toString(grpImg) + ", grpStat=" + grpStat + "]";
	}

}