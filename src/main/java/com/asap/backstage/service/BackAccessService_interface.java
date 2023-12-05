package com.asap.backstage.service;

import java.util.List;

import com.asap.backstage.entity.BackAccessVO;

public interface BackAccessService_interface {

	int add(BackAccessVO backAce);

	String delete(BackAccessVO backAce);

	BackAccessVO findVo(String backNo, int backAceTypeNo);

	List<Integer> findByBackNo(String backNo);

	List<String> findByBackAceTypeNo(int backAceTypeNo);
	
	void suspend(String backNo);

}
