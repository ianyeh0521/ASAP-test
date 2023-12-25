package com.asap.court.entity;

import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import com.asap.member.entity.MemberVO;

@Entity
@Table(name="CourtOrder")
public class CourtOrderVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourtOrdNo", updatable = false)
	private Integer courtOrdNo;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="MbrNo", referencedColumnName = "MbrNo")
	private MemberVO memberVO;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="CourtNo", referencedColumnName = "CourtNo")
	private CourtVO courtVO;
	
	@Column(name = "CourtOrdStat")
	private Integer courtOrdStat;
	
	@Column(name = "CourtOrdCrtTime",  nullable = false, updatable = false)
	@CreationTimestamp
	private Timestamp courtOrdCrtTime;
	
	@Column(name = "CourtOrdDate")
	private Date courtOrdDate;
	
	@Column(name = "CourtOrdTime")
	private Integer courtOrdTime;
	
	@Column(name = "CourtOrdTimeEnd")
	private Integer courtOrdTimeEnd;
	
	@Column(name = "TotalPrice")
	private Integer totalPrice;
	
	public CourtOrderVO() {
	}

	public CourtOrderVO(Integer courtOrdNo, MemberVO memberVO, CourtVO courtVO, Integer courtOrdStat,
			Timestamp courtOrdCrtTime, Date courtOrdDate, Integer courtOrdTime, Integer courtOrdTimeEnd,
			Integer totalPrice) {
		super();
		this.courtOrdNo = courtOrdNo;
		this.memberVO = memberVO;
		this.courtVO = courtVO;
		this.courtOrdStat = courtOrdStat;
		this.courtOrdCrtTime = courtOrdCrtTime;
		this.courtOrdDate = courtOrdDate;
		this.courtOrdTime = courtOrdTime;
		this.courtOrdTimeEnd = courtOrdTimeEnd;
		this.totalPrice = totalPrice;
	}

	public CourtOrderVO(MemberVO memberVO, CourtVO courtVO, Integer courtOrdStat, Date courtOrdDate,
			Integer courtOrdTime, Integer courtOrdTimeEnd, Integer totalPrice) {
		super();
		this.memberVO = memberVO;
		this.courtVO = courtVO;
		this.courtOrdStat = courtOrdStat;
		this.courtOrdDate = courtOrdDate;
		this.courtOrdTime = courtOrdTime;
		this.courtOrdTimeEnd = courtOrdTimeEnd;
		this.totalPrice = totalPrice;
	}
	

	public CourtOrderVO(CourtVO courtVO, Date courtOrdDate, Integer courtOrdTime, Integer courtOrdTimeEnd) {
		super();
		this.courtVO = courtVO;
		this.courtOrdDate = courtOrdDate;
		this.courtOrdTime = courtOrdTime;
		this.courtOrdTimeEnd = courtOrdTimeEnd;
	}

	public Integer getCourtOrdNo() {
		return courtOrdNo;
	}

	public void setCourtOrdNo(Integer courtOrdNo) {
		this.courtOrdNo = courtOrdNo;
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

	

	public Integer getCourtOrdStat() {
		return courtOrdStat;
	}

	public void setCourtOrdStat(Integer courtOrdStat) {
		this.courtOrdStat = courtOrdStat;
	}

	public Timestamp getCourtOrdCrtTime() {
		return courtOrdCrtTime;
	}

	public void setCourtOrdCrtTime(Timestamp courtOrdCrtTime) {
		this.courtOrdCrtTime = courtOrdCrtTime;
	}

	public Date getCourtOrdDate() {
		return courtOrdDate;
	}

	public void setCourtOrdDate(Date courtOrdDate) {
		this.courtOrdDate = courtOrdDate;
	}

	public Integer getCourtOrdTime() {
		return courtOrdTime;
	}

	public void setCourtOrdTime(Integer courtOrdTime) {
		this.courtOrdTime = courtOrdTime;
	}
	

	public Integer getCourtOrdTimeEnd() {
		return courtOrdTimeEnd;
	}

	public void setCourtOrdTimeEnd(Integer courtOrdTimeEnd) {
		this.courtOrdTimeEnd = courtOrdTimeEnd;
	}

	public Integer getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Integer totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "CourtOrderVO [courtOrdNo=" + courtOrdNo + ", memberVO=" + memberVO + ", courtVO=" + courtVO
				+ ", courtOrdStat=" + courtOrdStat + ", courtOrdCrtTime=" + courtOrdCrtTime + ", courtOrdDate="
				+ courtOrdDate + ", courtOrdTime=" + courtOrdTime + ", courtOrdTimeEnd=" + courtOrdTimeEnd
				+ ", totalPrice=" + totalPrice + "]";
	}


	
	
}
