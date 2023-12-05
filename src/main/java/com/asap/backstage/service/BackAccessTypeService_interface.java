package com.asap.backstage.service;

import java.util.List;

import com.asap.backstage.entity.BackAccessTypeVO;

public interface BackAccessTypeService_interface {
	int add(BackAccessTypeVO backType);

	String update(BackAccessTypeVO backType);

	String findByPK(int backTypeNo);

	List<BackAccessTypeVO> getAll();
	
	int countAll();

}
