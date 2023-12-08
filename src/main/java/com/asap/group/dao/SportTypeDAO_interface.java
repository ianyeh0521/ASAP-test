package com.asap.group.dao;

import java.util.List;

import com.asap.group.entity.SportTypeVO;

public interface SportTypeDAO_interface {
	// 新增運動種類

	int insert(SportTypeVO sportType);

	int update(SportTypeVO sportType);

	// 運動種類編號查找單筆運動種類名稱(PK)
	SportTypeVO findBySportTypeNo(Integer sportTypeNo);

	List<SportTypeVO> getALL();


}
