package com.asap.forum.service;

import java.util.List;

import com.asap.forum.dao.SavePostDAO;
import com.asap.forum.dao.SavePostDAO_interface;
import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;

public class SavePostVOServiceImpl implements SavePostVOService{
	private SavePostDAO_interface dao;
	
	public SavePostVOServiceImpl() {
		dao = new SavePostDAO();
	}


	

	@Override
	public Integer delete(Integer sPNo) {
		return dao.delete(sPNo);
	}


	@Override
	public Integer save(String mbrNo, PostVO postVO) {
		SavePostVO save= dao.checkIfExist(mbrNo, postVO);
		if(save ==null) {
			SavePostVO savePost= new SavePostVO();
			savePost.setMbrNo(mbrNo);
			savePost.setPostVo(postVO);
			dao.add(savePost); 
			return 1;
		}else {
			dao.delete(mbrNo, postVO);
			return 0;
		}
	}


	@Override
	public Integer saveCheck(String mbrNo, PostVO postVO) {
		SavePostVO save= dao.checkIfExist(mbrNo, postVO);
		if(save ==null) {
			return 0;
		}else {
			return 1;
		}
	}
	
	public List<SavePostVO> getByMbrNo(String mbrNo) {
		return dao.getbyMbrNo(mbrNo);
	}
	
}
