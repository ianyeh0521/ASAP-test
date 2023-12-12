package com.asap.group.dao;

import java.util.List;

import com.asap.group.entity.GrpInfoVO;

public interface GrpInfoDAO_interface {
	// 新增揪團資訊

	int insert(GrpInfoVO grpInfo);

	int update(GrpInfoVO grpInfo);

	int delete(Integer id);

	// 用揪團編號查找單筆揪團資訊
	GrpInfoVO findByGrpNo(Integer id);

	// 模糊查詢(HQL)
	List<GrpInfoVO> getByFuzzySearch(String grpInfoKeyword);

	// **************(HQL)用某個欄位來找揪團資訊***************
	// column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 小提醒->如果你的Keyword值是String以外的型別請轉成String
	// 成功回傳VO,失敗不會回傳任何資料
	// ************************************************
	List<GrpInfoVO> getQuery(String column, String Keyword);

	List<GrpInfoVO> getALL();

}
