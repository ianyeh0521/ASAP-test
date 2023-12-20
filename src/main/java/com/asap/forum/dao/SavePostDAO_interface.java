package com.asap.forum.dao;

import java.util.List;

import com.asap.forum.entity.SavePostVO;


public interface SavePostDAO_interface {
	
	public Integer add (SavePostVO savepost);
	
	public Integer delete(String mbrNo, Integer postNo);
	
	public List<SavePostVO> getbyMbrNo(String mbrNo);
	
	public List<SavePostVO> getAll();
}
