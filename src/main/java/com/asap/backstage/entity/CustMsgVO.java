package com.asap.backstage.entity;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "custmsg")
public class CustMsgVO implements Serializable {
    @Id
    @Column(name = "CustMsgNo", updatable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer custMsgNo;
    @Column(name = "CustMsgSubj")
	private String custMsgSubj;
    @Column(name = "CustMsgText")
	private String custMsgText;
    @Column(name = "MbrNo", updatable = false)
	private String mbrNo;
    @Column(name = "CoachNo", updatable = false)
	private String coachNo;
    @Column(name = "BackNo", updatable = false)
	private String backNo;
    @Column(name = "CustReText")
	private String custReText;
    @CreationTimestamp
    @Column(name = "CustMsgTime")
	private Timestamp custMsgTime;
    @Column(name = "CustMsgReTime")
	private Timestamp custMsgReTime;

	public CustMsgVO() {
	}

	public CustMsgVO(Integer custMsgNo, String custMsgSubj, String custMsgText, String mbrNo, String coachNo,
			String backNo, String custReText, Timestamp custMsgTime, Timestamp custMsgReTime) {
		this.custMsgNo = custMsgNo;
		this.custMsgSubj = custMsgSubj;
		this.custMsgText = custMsgText;
		this.mbrNo = mbrNo;
		this.coachNo = coachNo;
		this.backNo = backNo;
		this.custReText = custReText;
		this.custMsgTime = custMsgTime;
		this.custMsgReTime = custMsgReTime;
	}

	public Integer getCustMsgNo() {
		return custMsgNo;
	}

	public void setCustMsgNo(Integer custMsgNo) {
		this.custMsgNo = custMsgNo;
	}

	public String getCustMsgSubj() {
		return custMsgSubj;
	}

	public void setCustMsgSubj(String custMsgSubj) {
		this.custMsgSubj = custMsgSubj;
	}

	public String getCustMsgText() {
		return custMsgText;
	}

	public void setCustMsgText(String custMsgText) {
		this.custMsgText = custMsgText;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}

	public String getBackNo() {
		return backNo;
	}

	public void setBackNo(String backNo) {
		this.backNo = backNo;
	}

	public String getCustReText() {
		return custReText;
	}

	public void setCustReText(String custReText) {
		this.custReText = custReText;
	}

	public Timestamp getCustMsgTime() {
		return custMsgTime;
	}

	public void setCustMsgTime(Timestamp custMsgTime) {
		this.custMsgTime = custMsgTime;
	}

	public Timestamp getCustMsgReTime() {
		return custMsgReTime;
	}

	public void setCustMsgReTime(Timestamp custMsgReTime) {
		this.custMsgReTime = custMsgReTime;
	}

	@Override
	public String toString() {
		return "CustMsgVO [custMsgNo=" + custMsgNo + ", custMsgSubj=" + custMsgSubj + ", custMsgText=" + custMsgText
				+ ", mbrNo=" + mbrNo + ", coachNo=" + coachNo + ", backNo=" + backNo + ", custReText=" + custReText
				+ ", custMsgTime=" + custMsgTime + ", custMsgReTime=" + custMsgReTime + "]";
	}

}
