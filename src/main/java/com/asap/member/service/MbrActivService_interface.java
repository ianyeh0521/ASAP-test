package com.asap.member.service;

import java.util.List;

import com.asap.member.entity.MbrActivVO;

public interface MbrActivService_interface {

	int add(MbrActivVO mbrActiv);

	String delete(MbrActivVO mbrActiv);

	List<MbrActivVO> findByMbrNo(String mbrNo);

	MbrActivVO findByPK(Integer mbrActivNo);
}
