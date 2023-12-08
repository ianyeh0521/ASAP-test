package com.asap.group.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="SportType")
public class SportTypeVO  {
	
	@Id
	@Column(name="SportTypeNo",updatable = false)
	private Integer sportTypeNo;
	
	@Column(name="SportTypeName")
	private String sportTypeName;
	
	public SportTypeVO() {
		
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

	@Override
	public String toString() {
		return "SportTypeVO [sportTypeNo=" + sportTypeNo + ", sportTypeName=" + sportTypeName + "]";
	}
	
	
	
	
}
