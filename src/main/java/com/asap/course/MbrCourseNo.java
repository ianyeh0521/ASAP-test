package com.asap.course;

import java.io.Serializable;
import java.sql.Timestamp;

public class MbrCourseNo implements Serializable{

	private Integer mbrCourseNo;
	private Integer courseNo;
	private String mbrNo;
	private Timestamp mbrCourseTime;
	private Boolean mbrCourseStat;
	private String coachNo;
	
	public MbrCourseNo() {
	}

	public MbrCourseNo(Integer mbrCourseNo, Integer courseNo, String mbrNo, Timestamp mbrCourseTime,
			Boolean mbrCourseStat, String coachNo) {
		super();
		this.mbrCourseNo = mbrCourseNo;
		this.courseNo = courseNo;
		this.mbrNo = mbrNo;
		this.mbrCourseTime = mbrCourseTime;
		this.mbrCourseStat = mbrCourseStat;
		this.coachNo = coachNo;
	}

	public Integer getMbrCourseNo() {
		return mbrCourseNo;
	}

	public void setMbrCourseNo(Integer mbrCourseNo) {
		this.mbrCourseNo = mbrCourseNo;
	}

	public Integer getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(Integer courseNo) {
		this.courseNo = courseNo;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public Timestamp getMbrCourseTime() {
		return mbrCourseTime;
	}

	public void setMbrCourseTime(Timestamp mbrCourseTime) {
		this.mbrCourseTime = mbrCourseTime;
	}

	public Boolean getMbrCourseStat() {
		return mbrCourseStat;
	}

	public void setMbrCourseStat(Boolean mbrCourseStat) {
		this.mbrCourseStat = mbrCourseStat;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}
	
	
}
