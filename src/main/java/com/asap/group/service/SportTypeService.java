package com.asap.group.service;

import java.util.List;

import com.asap.group.entity.SportTypeVO;

public interface SportTypeService {
	SportTypeVO insert(SportTypeVO sportType);

	SportTypeVO update(SportTypeVO sportType);

	SportTypeVO findBySportPK(Integer sportTypeNo);

	List<SportTypeVO> getALL();

}
