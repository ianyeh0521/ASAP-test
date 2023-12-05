package com.asap.course.entity;
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

import com.asap.coach.CoachVO;
import com.asap.member.MemberVO;

@Entity
@Table(name="MbrCourse")
public class MbrCourseVO{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MbrCourseNo", updatable = false)
	private Integer mbrCourseNo;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="CourseVO", referencedColumnName = "CourseNo")
	private CourseVO courseVO;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="MemberVO", referencedColumnName = "MbrNo")
	private MemberVO memberVO;
	
	@Column(name = "MbrCourseTime")
	private Timestamp mbrCourseTime;
	
	@Column(name = "MbrCourseStat")
	private Boolean mbrCourseStat;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "coachNo", referencedColumnName = "coachNo")
	private CoachVO coachVO;
	
	public MbrCourseVO() {
	}



	public MbrCourseVO(Integer mbrCourseNo, CourseVO courseVO, MemberVO memberVO, Timestamp mbrCourseTime,
			Boolean mbrCourseStat, CoachVO coachVO) {
		super();
		this.mbrCourseNo = mbrCourseNo;
		this.courseVO = courseVO;
		this.memberVO = memberVO;
		this.mbrCourseTime = mbrCourseTime;
		this.mbrCourseStat = mbrCourseStat;
		this.coachVO = coachVO;
	}



	public Integer getMbrCourseNo() {
		return mbrCourseNo;
	}

	public void setMbrCourseNo(Integer mbrCourseNo) {
		this.mbrCourseNo = mbrCourseNo;
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

	

	public CourseVO getCourseVO() {
		return courseVO;
	}



	public void setCourseVO(CourseVO courseVO) {
		this.courseVO = courseVO;
	}



	public MemberVO getMemberVO() {
		return memberVO;
	}



	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}



	public CoachVO getCoachVO() {
		return coachVO;
	}



	public void setCoachVO(CoachVO coachVO) {
		this.coachVO = coachVO;
	}



	@Override
	public String toString() {
		return "MbrCourseVO [mbrCourseNo=" + mbrCourseNo + ", courseVO=" + courseVO + ", memberVO=" + memberVO
				+ ", mbrCourseTime=" + mbrCourseTime + ", mbrCourseStat=" + mbrCourseStat + ", coachVO=" + coachVO
				+ "]";
	}




	
	
}
