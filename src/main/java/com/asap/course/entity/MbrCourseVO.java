package com.asap.course.entity;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MbrCourse")
public class MbrCourseVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MbrCourseNo", updatable = false)
	private Integer mbrCourseNo;
	
	@Column(name = "CourseNo")
	private Integer courseNo;
	
	@Column(name = "MbrNo")
	private String mbrNo;
	
	@Column(name = "MbrCourseTime")
	private Timestamp mbrCourseTime;
	
	@Column(name = "MbrCourseStat")
	private Boolean mbrCourseStat;
	
	@Column(name = "CoachNo")
	private String coachNo;
	
	public MbrCourseVO() {
	}

	public MbrCourseVO(Integer mbrCourseNo, Integer courseNo, String mbrNo, Timestamp mbrCourseTime,
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

	@Override
	public String toString() {
		return "MbrCourseVO [mbrCourseNo=" + mbrCourseNo + ", courseNo=" + courseNo + ", mbrNo=" + mbrNo
				+ ", mbrCourseTime=" + mbrCourseTime + ", mbrCourseStat=" + mbrCourseStat + ", coachNo=" + coachNo
				+ "]";
	}
	
	
}
