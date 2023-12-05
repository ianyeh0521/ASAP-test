package com.asap.coach.entity;

import java.io.Serializable;

public class SportTypeVO implements Serializable {

	private Integer sportTypeNo;
	private String sportTypeName;

	public SportTypeVO() {
	}

	public SportTypeVO(Integer sportTypeNo, String sportTypeName) {
		this.sportTypeNo = sportTypeNo;
		this.sportTypeName = sportTypeName;
	}

	public Integer getSportTypeNo() {
		return sportTypeNo;
	}

	public String getSportTypeName() {
		return sportTypeName;
	}

	public void setSportTypeNo(Integer sportTypeNo) {
		this.sportTypeNo = sportTypeNo;
	}

	public void setSportTypeName(String sportTypeName) {
		this.sportTypeName = sportTypeName;
	}

}
