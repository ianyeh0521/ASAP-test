package com.asap.course;

import java.io.Serializable;
import java.sql.Timestamp;

public class CourseVO implements Serializable {

	private Integer courseNo;
	private String courseName;
	private Timestamp courseTime;
	private Integer coursePplLimit;
	private String courseAddress;
	private Integer coursePrice;
	private String courseText;
	private Byte[] courseImg;
	private Integer sportTypeNo;
	private String coachNo;

	public CourseVO() {
	}

	public CourseVO(Integer courseNo, String courseName, Timestamp courseTime, Integer coursePplLimit,
			String courseAddress, Integer coursePrice, String courseText, Byte[] courseImg, Integer sportTypeNo,
			String coachNo) {
		super();
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.courseTime = courseTime;
		this.coursePplLimit = coursePplLimit;
		this.courseAddress = courseAddress;
		this.coursePrice = coursePrice;
		this.courseText = courseText;
		this.courseImg = courseImg;
		this.sportTypeNo = sportTypeNo;
		this.coachNo = coachNo;
	}

	public Integer getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(Integer courseNo) {
		this.courseNo = courseNo;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Timestamp getCourseTime() {
		return courseTime;
	}

	public void setCourseTime(Timestamp courseTime) {
		this.courseTime = courseTime;
	}

	public Integer getCoursePplLimit() {
		return coursePplLimit;
	}

	public void setCoursePplLimit(Integer coursePplLimit) {
		this.coursePplLimit = coursePplLimit;
	}

	public String getCourseAddress() {
		return courseAddress;
	}

	public void setCourseAddress(String courseAddress) {
		this.courseAddress = courseAddress;
	}

	public Integer getCoursePrice() {
		return coursePrice;
	}

	public void setCoursePrice(Integer coursePrice) {
		this.coursePrice = coursePrice;
	}

	public String getCourseText() {
		return courseText;
	}

	public void setCourseText(String courseText) {
		this.courseText = courseText;
	}

	public Byte[] getCourseImg() {
		return courseImg;
	}

	public void setCourseImg(Byte[] courseImg) {
		this.courseImg = courseImg;
	}

	public Integer getSportTypeNo() {
		return sportTypeNo;
	}

	public void setSportTypeNo(Integer sportTypeNo) {
		this.sportTypeNo = sportTypeNo;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}


}
