package com.asap.member.entity;

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
@Table(name = "mbrnews")
public class MbrActivVO implements Serializable {
	
	@Id
	@Column(name = "MbrActivNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer mbrActivNo;
	@Column(name = "MbrNo", updatable = false)
	private String mbrNo;
	@Column(name = "ActivSubj")
	private String activSubj;
	@Column(name = "ActivStartTime")
	private Timestamp activStartTime;
	@Column(name = "ActivEndTime")
	private Timestamp activEndTime;

	public MbrActivVO() {
	}

	public MbrActivVO(Integer mbrActivNo, String mbrNo, String activSubj, Timestamp activStartTime,
			Timestamp activEndTime) {
		this.mbrActivNo = mbrActivNo;
		this.mbrNo = mbrNo;
		this.activSubj = activSubj;
		this.activStartTime = activStartTime;
		this.activEndTime = activEndTime;
	}

	public Integer getMbrActivNo() {
		return mbrActivNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public String getActivSubj() {
		return activSubj;
	}

	public Timestamp getActivStartTime() {
		return activStartTime;
	}

	public Timestamp getActivEndTime() {
		return activEndTime;
	}

	public void setMbrActivNo(Integer mbrActivNo) {
		this.mbrActivNo = mbrActivNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public void setActivSubj(String activSubj) {
		this.activSubj = activSubj;
	}

	public void setActivStartTime(Timestamp activStartTime) {
		this.activStartTime = activStartTime;
	}

	public void setActivEndTime(Timestamp activEndTime) {
		this.activEndTime = activEndTime;
	}

	@Override
	public String toString() {
		return "MbrActivVO [mbrActivNo=" + mbrActivNo + ", mbrNo=" + mbrNo + ", activSubj=" + activSubj
				+ ", activStartTime=" + activStartTime + ", activEndTime=" + activEndTime + "]";
	}



	
	

}
