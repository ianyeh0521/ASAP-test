package com.asap.group.service;

import java.util.List;

import com.asap.group.entity.GrpInfoVO;

public interface GrpInfoService {
	GrpInfoVO insert(GrpInfoVO grpInfo);

	GrpInfoVO update(GrpInfoVO grpInfo);

	void delete(Integer grpNo);

	List<GrpInfoVO> getGrpInfoVOBygrpNo(Integer grpNo);
	
	List<GrpInfoVO> getByServiceFuzzySearch(String grpInfoKeyword);
	
	List<GrpInfoVO> getServiceQuery(String column, String Keyword);

	List<GrpInfoVO> getALL();
}
