package com.asap.court.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.asap.member.MemberVO;

@Entity
@Table(name="CourtSaveList")
public class CourtSaveListVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtSaveNo", updatable = false)
	private Integer courtSaveNo;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="MemberVO", referencedColumnName = "MbrNo")
	private MemberVO memberVO;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CourtNo", referencedColumnName = "CourtNo")
	private CourtVO courtVO;
	
	public CourtSaveListVO() {
	}

	public CourtSaveListVO(Integer courtSaveNo, MemberVO memberVO, CourtVO courtVO) {
		super();
		this.courtSaveNo = courtSaveNo;
		this.memberVO = memberVO;
		this.courtVO = courtVO;
	}

	public Integer getCourtSaveNo() {
		return courtSaveNo;
	}

	public void setCourtSaveNo(Integer courtSaveNo) {
		this.courtSaveNo = courtSaveNo;
	}



	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public CourtVO getCourtVO() {
		return courtVO;
	}

	public void setCourtVO(CourtVO courtVO) {
		this.courtVO = courtVO;
	}

	@Override
	public String toString() {
		return "CourtSaveListVO [courtSaveNo=" + courtSaveNo + ", memberVO=" + memberVO + ", courtVO=" + courtVO + "]";
	}

}
