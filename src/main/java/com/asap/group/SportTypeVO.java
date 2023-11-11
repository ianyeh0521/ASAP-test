package com.asap.group;

import java.io.Serializable;

public class SportTypeVO implements Serializable {
	private static final long serialVersionUID=1L;
	private Integer sportTypeNo;
	private String sportTypeName;
	
	public SportTypeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SportTypeVO(Integer sportTypeNo, String sportTypeName) {
		super();
		this.sportTypeNo = sportTypeNo;
		this.sportTypeName = sportTypeName;
	}

	public Integer getSportTypeNo() {
		return sportTypeNo;
	}

	public void setSportTypeNo(Integer sportTypeNo) {
		this.sportTypeNo = sportTypeNo;
	}

	public String getSportTypeName() {
		return sportTypeName;
	}

	public void setSportTypeName(String sportTypeName) {
		this.sportTypeName = sportTypeName;
	}
	
	
	
	
}
