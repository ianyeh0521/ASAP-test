package com.asap.group.service;

import java.util.List;

import com.asap.group.entity.GrpJoinInfoVO;

public interface GrpJoinInfoService {
	GrpJoinInfoVO insert(GrpJoinInfoVO grpJoinInfo);

	GrpJoinInfoVO update(GrpJoinInfoVO grpJoinInfo);

	void delete(Integer grpJoinInfoNo);
	
	GrpJoinInfoVO findByGrpJoinInfoNo(Integer grpJoinInfoNo);
	
	List<GrpJoinInfoVO> getgrpjoinserviceQuery(String column, String Keyword);
	
	List<GrpJoinInfoVO> getALL();
}
