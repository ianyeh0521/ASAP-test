package com.asap.member.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "member")
public class MemberVO implements Serializable {

	@Id
	@Column(name = "MbrNo", updatable = false)
	private String mbrNo;

	@Column(name = "MbrEmail",updatable = false)
	private String mbrEmail;

	@Column(name = "MbrPwd")
	private String mbrPwd;

	@Column(name = "MbrName")
	private String mbrName;

	@Column(name = "MbrPhone")
	private String mbrPhone;

	@Column(name = "SellerIntro")
	private String sellerIntro;

	@Column(name = "CmtReScore")
	private Integer cmtReScore;

	@Column(name = "CmtReNum")
	private Integer cmtReNum;
	
	@Column(name = "EmailStat")
	private Boolean emailStat;

	public MemberVO() {
	}

	public MemberVO(String mbrNo, String mbrEmail, String mbrPwd, String mbrName, String mbrPhone, String sellerIntro,
			Integer cmtReScore, Integer cmtReNum, Boolean emailStat) {
		this.mbrNo = mbrNo;
		this.mbrEmail = mbrEmail;
		this.mbrPwd = mbrPwd;
		this.mbrName = mbrName;
		this.mbrPhone = mbrPhone;
		this.sellerIntro = sellerIntro;
		this.cmtReScore = cmtReScore;
		this.cmtReNum = cmtReNum;
		this.emailStat = emailStat;
	}

	public String getMbrNo() {
		return mbrNo;
	}

	public String getMbrEmail() {
		return mbrEmail;
	}

	public String getMbrPwd() {
		return mbrPwd;
	}

	public String getMbrName() {
		return mbrName;
	}

	public String getMbrPhone() {
		return mbrPhone;
	}

	public String getSellerIntro() {
		return sellerIntro;
	}

	public Integer getCmtReScore() {
		return cmtReScore;
	}

	public Integer getCmtReNum() {
		return cmtReNum;
	}

	public Boolean getEmailStat() {
		return emailStat;
	}

	public void setMbrNo(String mbrNo) {
		this.mbrNo = mbrNo;
	}

	public void setMbrEmail(String mbrEmail) {
		this.mbrEmail = mbrEmail;
	}

	public void setMbrPwd(String mbrPwd) {
		this.mbrPwd = mbrPwd;
	}

	public void setMbrName(String mbrName) {
		this.mbrName = mbrName;
	}

	public void setMbrPhone(String mbrPhone) {
		this.mbrPhone = mbrPhone;
	}

	public void setSellerIntro(String sellerIntro) {
		this.sellerIntro = sellerIntro;
	}

	public void setCmtReScore(Integer cmtReScore) {
		this.cmtReScore = cmtReScore;
	}

	public void setCmtReNum(Integer cmtReNum) {
		this.cmtReNum = cmtReNum;
	}

	public void setEmailStat(Boolean emailStat) {
		this.emailStat = emailStat;
	}

	@Override
	public String toString() {
		return "MemberVO [mbrNo=" + mbrNo + ", mbrEmail=" + mbrEmail + ", mbrPwd=" + mbrPwd + ", mbrName=" + mbrName
				+ ", mbrPhone=" + mbrPhone + ", sellerIntro=" + sellerIntro + ", cmtReScore=" + cmtReScore
				+ ", cmtReNum=" + cmtReNum + ", emailStat=" + emailStat + "]";
	}

	

}
