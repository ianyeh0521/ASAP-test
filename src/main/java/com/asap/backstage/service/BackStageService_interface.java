package com.asap.backstage.service;

import java.util.List;

import com.asap.backstage.entity.BackStageVO;

public interface BackStageService_interface {

	String addBack(BackStageVO backstage);

	String updateBack(BackStageVO backstage);

	String suspendBack(BackStageVO backstage);

	BackStageVO findByBackNo(String backNo);

	BackStageVO findByBackPhone(String backPhone);

	BackStageVO findByBackEmail(String backEmail);
	
	List<BackStageVO> getAllBack();

}
