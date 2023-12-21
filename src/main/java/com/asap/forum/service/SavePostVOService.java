package com.asap.forum.service;

import java.util.List;

import com.asap.forum.entity.PostVO;
import com.asap.forum.entity.SavePostVO;

public interface SavePostVOService {
	
	public Integer saveCheck(String mbrNo,PostVO postVO);
	
	public Integer delete(Integer sPNo);

	public Integer save(String mbrNo, PostVO postVO);
	public List<SavePostVO> getByMbrNo(String mbrNo);
	
}
