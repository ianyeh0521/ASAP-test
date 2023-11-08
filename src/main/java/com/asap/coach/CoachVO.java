package com.asap.coach;

import java.io.Serializable;

public class CoachVO implements Serializable {

	private String coachNo, coachEmail, coachPwd, coachName, coachPhone, bankNo, bankBr, bankAcct;
	private byte[] coachImg;
	private Integer coachExp;
	private Boolean coachStat;

	public CoachVO() {
	}

	public CoachVO(String coachNo, String coachEmail, String coachPwd, String coachName, String coachPhone,
			String bankNo, String bankBr, String bankAcct, byte[] coachImg, Integer coachExp, Boolean coachStat) {
		this.coachNo = coachNo;
		this.coachEmail = coachEmail;
		this.coachPwd = coachPwd;
		this.coachName = coachName;
		this.coachPhone = coachPhone;
		this.bankNo = bankNo;
		this.bankBr = bankBr;
		this.bankAcct = bankAcct;
		this.coachImg = coachImg;
		this.coachExp = coachExp;
		this.coachStat = coachStat;
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

	public String getBankNo() {
		return bankNo;
	}

	public String getBankBr() {
		return bankBr;
	}

	public String getBankAcct() {
		return bankAcct;
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

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public void setBankBr(String bankBr) {
		this.bankBr = bankBr;
	}

	public void setBankAcct(String bankAcct) {
		this.bankAcct = bankAcct;
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

}
