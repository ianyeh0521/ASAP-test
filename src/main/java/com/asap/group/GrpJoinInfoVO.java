package com.asap.group;

public class GrpJoinInfoVO {
	private static final long serialVersionUID=1L;
	private Integer grpJoinInfoNo;
	private String orgMbrNo;
	private String partiMbrNo;
	private Integer grpNo;
	
	public GrpJoinInfoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public GrpJoinInfoVO(Integer grpJoinInfoNo, String orgMbrNo, String partiMbrNo, Integer grpNo) {
		super();
		this.grpJoinInfoNo = grpJoinInfoNo;
		this.orgMbrNo = orgMbrNo;
		this.partiMbrNo = partiMbrNo;
		this.grpNo = grpNo;
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
	
}
