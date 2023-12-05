package com.asap.group.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="GrpJoinInfo")
public class GrpJoinInfoVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="GrpJoinInfoNo",updatable = false)
	private Integer grpJoinInfoNo;
	
	@Column(name="orgMbrNo")
	private String orgMbrNo;
	
	@Column(name="PartiMbrNo")
	private String partiMbrNo;
	
	@Column(name="GrpNo")
	private Integer grpNo;
	
	@Column(name="GrpJoinStat")
	private boolean grpJoinStat;
	
	public GrpJoinInfoVO() {

	}

	public GrpJoinInfoVO(Integer grpJoinInfoNo, String orgMbrNo, String partiMbrNo, Integer grpNo,boolean grpJoinStat) {
		super();
		this.grpJoinInfoNo = grpJoinInfoNo;
		this.orgMbrNo = orgMbrNo;
		this.partiMbrNo = partiMbrNo;
		this.grpNo = grpNo;
		this.grpJoinStat=grpJoinStat;
	}

	public Integer getGrpJoinInfoNo() {
		return grpJoinInfoNo;
	}

	public void setGrpJoinInfoNo(Integer grpJoinInfoNo) {
		this.grpJoinInfoNo = grpJoinInfoNo;
	}

	public String getOrgMbrNo() {
		return orgMbrNo;
	}

	public void setOrgMbrNo(String orgMbrNo) {
		this.orgMbrNo = orgMbrNo;
	}

	public String getPartiMbrNo() {
		return partiMbrNo;
	}

	public void setPartiMbrNo(String partiMbrNo) {
		this.partiMbrNo = partiMbrNo;
	}

	public Integer getGrpNo() {
		return grpNo;
	}

	public void setGrpNo(Integer grpNo) {
		this.grpNo = grpNo;
	}
	
	public boolean getGrpJoinStat() {
		return grpJoinStat;
	}

	public void setGrpJoinStat(boolean grpJoinStat) {
		this.grpJoinStat=grpJoinStat;
	}

	@Override
	public String toString() {
		return "GrpJoinInfoVO [grpJoinInfoNo=" + grpJoinInfoNo + ", orgMbrNo=" + orgMbrNo + ", partiMbrNo=" + partiMbrNo
				+ ", grpNo=" + grpNo + ", grpJoinStat=" + grpJoinStat + "]";
	}
	
}
