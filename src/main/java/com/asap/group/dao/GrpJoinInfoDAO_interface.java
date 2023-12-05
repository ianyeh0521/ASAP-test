package com.asap.group.dao;

import java.util.List;

import com.asap.group.entity.GrpJoinInfoVO;

public interface GrpJoinInfoDAO_interface {
	// 新增參與人資訊

	int insert(GrpJoinInfoVO grpJoinInfo);

	int update(GrpJoinInfoVO grpJoinInfo);

	int delete(Integer id);

	// 用參與人資訊單編號查找參與人資訊
	GrpJoinInfoVO findByGrpJoinInfoNo(Integer id);

	//**********************(HQL)用某個欄位來找揪團資訊****************************
	// 	column是你要帶入的欄位名稱,Keyword是你欄位的值
	// 	小提醒->如果你的Keyword值是String以外的型別請轉成String
	// 	成功回傳VO,失敗不會回傳任何資料;可參考TestGrpJoinInfoVO.java測試
	//*********************************************************************
	List<GrpJoinInfoVO> getQuery(String column, String Keyword);
	
	// 查詢所有參與人資訊
	List<GrpJoinInfoVO> getALL();
}
