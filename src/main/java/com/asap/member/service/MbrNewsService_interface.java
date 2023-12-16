package com.asap.member.service;

import java.util.List;

import com.asap.member.entity.MbrNewsVO;

public interface MbrNewsService_interface {

	int add(MbrNewsVO mbrNews);

	String delete(MbrNewsVO mbrNews);

	List<MbrNewsVO> findByMbrNo(String mbrNo);

	MbrNewsVO findByPK(String mbrNewsNo);
}
