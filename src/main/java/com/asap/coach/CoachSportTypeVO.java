package com.asap.coach;

import java.io.Serializable;

public class CoachSportTypeVO implements Serializable {
	private Integer coachSportTypeNo, sportTypeNo;
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

}
