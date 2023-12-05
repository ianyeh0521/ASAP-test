package com.asap.backstage.service;

import java.util.ArrayList;
import java.util.List;

import com.asap.backstage.dao.BackAccessDAO;
import com.asap.backstage.dao.BackAccessDAO_interface;
import com.asap.backstage.entity.BackAccessVO;

public class BackAccessService implements BackAccessService_interface {

	private BackAccessDAO_interface dao;

	public BackAccessService() {
		dao = new BackAccessDAO();
	}

	/*
	 * public static void main(String[] args) { BackAccessDAO dao = new
	 * BackAccessDAO(); // BackAccessVO vo = new BackAccessVO(); //
	 * vo.setBackAceTypeNo(3); // vo.setBackNo("B1202230001"); //
	 * System.out.println(dao.add(vo)); // System.out.println(dao.delete(1));
	 * 
	 * // List<BackAccessVO> list = dao.findByBackNo("B1202230001");
	 * List<BackAccessVO> list = dao.findByBackAceTypeNo(4);
	 * 
	 * for (BackAccessVO v : list) { System.out.println(v); }
	 * 
	 * }
	 */

	@Override
	public int add(BackAccessVO backAce) {

		return dao.add(backAce);
	}

	@Override
	public String delete(BackAccessVO backAce) {

		return dao.delete(backAce);
	}

	@Override
	public List<Integer> findByBackNo(String backNo) {
		List<BackAccessVO> list = dao.findByBackNo(backNo);
		List<Integer> backAceTypeList = new ArrayList<>();
		if (!list.isEmpty()) {
			for (BackAccessVO vo : list) {
				backAceTypeList.add(vo.getBackAceTypeNo());
			}
		}
		return backAceTypeList;
	}

	@Override
	public List<String> findByBackAceTypeNo(int backAceTypeNo) {
		List<BackAccessVO> list = dao.findByBackAceTypeNo(backAceTypeNo);
		List<String> backNoList = new ArrayList<>();
		if (!list.isEmpty()) {
			for (BackAccessVO vo : list) {
				backNoList.add(vo.getBackNo());
			}
		}

		return backNoList;
	}

	@Override
	public BackAccessVO findVo(String backNo, int backAceTypeNo) {

		return dao.findVo(backNo, backAceTypeNo);
	}

	@Override
	public void suspend(String backNo) {
		List<Integer> backAceTypeList = findByBackNo(backNo);
		if (!backAceTypeList.isEmpty()) {
			for (Integer i : backAceTypeList) {
				BackAccessVO vo = findVo(backNo, i);
				dao.delete(vo);
			}
		}

	}

}
