package com.asap.member.service;

import com.asap.member.entity.MemberVO;

public interface MemberService_interface {
	String addMem(MemberVO member);

	String updateMen(MemberVO member);

	MemberVO findByMbrNo(String mbrNo);

	MemberVO findByMbrPhone(String mbrPhone);

	MemberVO findByMbrEmail(String mbrEmail);

	String addCmtByMbrNo(int cmtScore, String mbrNo);

	String updatePwd(MemberVO member);

	String addMemByGoogle(MemberVO member);
}
