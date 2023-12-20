package com.asap.course.entity;

import java.sql.Timestamp;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.asap.coach.entity.CoachVO;
import com.asap.group.entity.SportTypeVO;

@Entity
@Table(name="Course")
public class CourseVO{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "CourseNo", updatable = false)
	private Integer courseNo;
	
	@Column(name = "CourseName")
	private String courseName;
	
	@Column(name = "CourseStartTime")
	private Timestamp courseStartTime;
	
	@Column(name = "CourseEndTime")
	private Timestamp courseEndTime;
	
	@Column(name = "CoursePplLimit")
	private Integer coursePplLimit;
	
	@Column(name = "CourseAddress")
	private String courseAddress;
	
	@Column(name = "CoursePrice")
	private Integer coursePrice;
	
	@Column(name = "CourseText")
	private String courseText;
	
	@Column(name = "CourseImg", columnDefinition = "longblob")
	private byte[] courseImg;
	
	@ManyToOne
	@JoinColumn(name = "sportTypeNo", referencedColumnName = "sportTypeNo")
	private SportTypeVO sportTypeVO;
	
	@ManyToOne
	@JoinColumn(name = "coachNo", referencedColumnName = "coachNo")
	private CoachVO coachVO;
	
	@Column(name = "CourseStat")
	private Boolean courseStat;

	public CourseVO(){}

	public CourseVO(Integer courseNo, String courseName, Timestamp courseStartTime, Timestamp courseEndTime,
			Integer coursePplLimit, String courseAddress, Integer coursePrice, String courseText, byte[] courseImg,
			SportTypeVO sportTypeVO, CoachVO coachVO, Boolean courseStat) {
		super();
		this.courseNo = courseNo;
		this.courseName = courseName;
		this.courseStartTime = courseStartTime;
		this.courseEndTime = courseEndTime;
		this.coursePplLimit = coursePplLimit;
		this.courseAddress = courseAddress;
		this.coursePrice = coursePrice;
		this.courseText = courseText;
		this.courseImg = courseImg;
		this.sportTypeVO = sportTypeVO;
		this.coachVO = coachVO;
		this.courseStat = courseStat;
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

	public Timestamp getCourseStartTime() {
		return courseStartTime;
	}

	public void setCourseStartTime(Timestamp courseStartTime) {
		this.courseStartTime = courseStartTime;
	}

	public Timestamp getCourseEndTime() {
		return courseEndTime;
	}

	public void setCourseEndTime(Timestamp courseEndTime) {
		this.courseEndTime = courseEndTime;
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

	public byte[] getCourseImg() {
		return courseImg;
	}

	public void setCourseImg(byte[] courseImg) {
		this.courseImg = courseImg;
	}

	public SportTypeVO getSportTypeVO() {
		return sportTypeVO;
	}

	public void setSportTypeVO(SportTypeVO sportTypeVO) {
		this.sportTypeVO = sportTypeVO;
	}

	public CoachVO getCoachVO() {
		return coachVO;
	}

	public void setCoachVO(CoachVO coachVO) {
		this.coachVO = coachVO;
	}

	public Boolean getCourseStat() {
		return courseStat;
	}


	public void setCourseStat(Boolean courseStat) {
		this.courseStat = courseStat;
	}

	@Override
	public String toString() {
		return "CourseVO [courseNo=" + courseNo + ", courseName=" + courseName + ", courseStartTime=" + courseStartTime
				+ ", courseEndTime=" + courseEndTime + ", coursePplLimit=" + coursePplLimit + ", courseAddress="
				+ courseAddress + ", coursePrice=" + coursePrice + ", courseText=" + courseText + ", courseImg="
				+ Arrays.toString(courseImg) + ", sportTypeVO=" + sportTypeVO + ", coachVO=" + coachVO + ", courseStat="
				+ courseStat + "]";
	}


	

	

}
