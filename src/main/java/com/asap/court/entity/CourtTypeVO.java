package com.asap.court.entity;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name="CourtType")
public class CourtTypeVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtTypeNo", updatable = false)
	@Expose
	private Integer courtTypeNo;
	
	@Column(name = "CourtType")
	@Expose
	private String courtType;
	
	// 先用單向模式去找
//	@OneToMany(mappedBy = "courtTypeVO",fetch = FetchType.EAGER, cascade = CascadeType.ALL)
//	private Set<CourtVO> courtVOs;
	
	public CourtTypeVO() {
	}

	public CourtTypeVO(Integer courtTypeNo, String courtType) {
		super();
		this.courtTypeNo = courtTypeNo;
		this.courtType = courtType;
	}

	public CourtTypeVO(Integer courtTypeNo) {
		this.courtTypeNo = courtTypeNo;
	}

	public Integer getCourtTypeNo() {
		return courtTypeNo;
	}

	public void setCourtTypeNo(Integer courtTypeNo) {
		this.courtTypeNo = courtTypeNo;
	}

	public String getCourtType() {
		return courtType;
	}

	public void setCourtType(String courtType) {
		this.courtType = courtType;
	}
	

//	public Set<CourtVO> getCourtVOs() {
//		return courtVOs;
//	}
//
//	public void setCourtVOs(Set<CourtVO> courtVOs) {
//		this.courtVOs = courtVOs;
//	}

	@Override
	public String toString() {
		return "CourtTypeVO [courtTypeNo=" + courtTypeNo + ", courtType=" + courtType + "]";
	}
	
	
	
}
