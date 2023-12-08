package com.asap.forum.service;

import java.util.List;

import com.asap.forum.entity.SavePostVO;

public interface SavePostVOService {
	
	public List<SavePostVO> getAll();
	
	public List<SavePostVO> getbyMbrNo();
	
	public Integer delete();
	
	
}
