package com.asap.coach.entity;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "coach")
public class CoachVO implements Serializable {

	@Id
	@Column(name = "CoachNo", updatable = false)
	private String coachNo;
	@Column(name = "CoachEmail")
	private String coachEmail;
	@Column(name = "CoachPwd")
	private String coachPwd;
	@Column(name = "CoachName")
	private String coachName;
	@Column(name = "CoachPhone")
	private String coachPhone;
	@Column(name = "CoachImg", columnDefinition = "longblob")
	private byte[] coachImg;
	@Column(name = "CoachExp")
	private Integer coachExp;
	@Column(name = "CoachStat")
	private Boolean coachStat;
	@Column(name = "EmailStat")
	private Boolean emailStat;
	@Column(name = "CoachIntro")
	private String coachIntro;

	public CoachVO() {
	}

	public CoachVO(String coachNo, String coachEmail, String coachPwd, String coachName, String coachPhone,
			byte[] coachImg, Integer coachExp, Boolean coachStat, Boolean emailStat, String coachIntro) {
		this.coachNo = coachNo;
		this.coachEmail = coachEmail;
		this.coachPwd = coachPwd;
		this.coachName = coachName;
		this.coachPhone = coachPhone;
		this.coachImg = coachImg;
		this.coachExp = coachExp;
		this.coachStat = coachStat;
		this.emailStat = emailStat;
		this.coachIntro = coachIntro;
	}

	public String getCoachNo() {
		return coachNo;
	}

	public String getCoachEmail() {
		return coachEmail;
	}

	public String getCoachPwd() {
		return coachPwd;
	}

	public String getCoachName() {
		return coachName;
	}

	public String getCoachPhone() {
		return coachPhone;
	}

	public byte[] getCoachImg() {
		return coachImg;
	}

	public Integer getCoachExp() {
		return coachExp;
	}

	public Boolean getCoachStat() {
		return coachStat;
	}

	public Boolean getEmailStat() {
		return emailStat;
	}

	public String getCoachIntro() {
		return coachIntro;
	}

	public void setCoachNo(String coachNo) {
		this.coachNo = coachNo;
	}

	public void setCoachEmail(String coachEmail) {
		this.coachEmail = coachEmail;
	}

	public void setCoachPwd(String coachPwd) {
		this.coachPwd = coachPwd;
	}

	public void setCoachName(String coachName) {
		this.coachName = coachName;
	}

	public void setCoachPhone(String coachPhone) {
		this.coachPhone = coachPhone;
	}

	public void setCoachImg(byte[] coachImg) {
		this.coachImg = coachImg;
	}

	public void setCoachExp(Integer coachExp) {
		this.coachExp = coachExp;
	}

	public void setCoachStat(Boolean coachStat) {
		this.coachStat = coachStat;
	}

	public void setEmailStat(Boolean emailStat) {
		this.emailStat = emailStat;
	}

	public void setCoachIntro(String coachIntro) {
		this.coachIntro = coachIntro;
	}

	@Override
	public String toString() {
		return "CoachVO [coachNo=" + coachNo + ", coachEmail=" + coachEmail + ", coachPwd=" + coachPwd + ", coachName="
				+ coachName + ", coachPhone=" + coachPhone + ", coachImg=" + Arrays.toString(coachImg) + ", coachExp="
				+ coachExp + ", coachStat=" + coachStat + ", emailStat=" + emailStat + ", coachIntro=" + coachIntro
				+ "]";
	}

}
