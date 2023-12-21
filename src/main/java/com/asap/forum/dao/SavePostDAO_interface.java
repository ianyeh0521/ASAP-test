package com.asap.forum.dao;

import java.util.List;

import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;


public interface SavePostDAO_interface {
	
	public Integer add (SavePostVO savepost);
	
	public Integer delete(Integer sPNo);
	
	public Integer delete(String mbrNo, PostVO postVO);
	
	public SavePostVO checkIfExist(String mbrNo, PostVO postVO);
	
	public List<SavePostVO> getbyMbrNo(String mbrNo);
	
	public List<SavePostVO> getAll();
}
