package com.asap.coach.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "coachsporttype")
public class CoachSportTypeVO implements Serializable {
	@Id
	@Column(name = "CoachSportTypeNo", updatable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer coachSportTypeNo;
	@Column(name = "SportTypeNo", updatable = false)
	private Integer sportTypeNo;
	@Column(name = "CoachNo", updatable = false)
	private String coachNo;

	public CoachSportTypeVO() {
	}

	public CoachSportTypeVO(Integer coachSportTypeNo, Integer sportTypeNo, String coachNo) {
		this.coachSportTypeNo = coachSportTypeNo;
		this.sportTypeNo = sportTypeNo;
		this.coachNo = coachNo;
	}

	public Integer getCoachSportTypeNo() {
		return coachSportTypeNo;
	}

	public Integer getSportTypeNo() {
		return sportTypeNo;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public void setCoachSportTypeNo(Integer coachSportTypeNo) {
		this.coachSportTypeNo = coachSportTypeNo;
	}

	public void setSportTypeNo(Integer sportTypeNo) {
		this.sportTypeNo = sportTypeNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}

	@Override
	public String toString() {
		return "CoachSportTypeVO [coachSportTypeNo=" + coachSportTypeNo + ", sportTypeNo=" + sportTypeNo + ", coachNo="
				+ coachNo + "]";
	}

}
