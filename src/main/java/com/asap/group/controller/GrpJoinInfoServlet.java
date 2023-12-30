package com.asap.group.controller;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asap.group.entity.GrpInfoVO;
import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.group.service.GrpInfoService;
import com.asap.group.service.GrpInfoService_interface;
import com.asap.group.service.GrpJoinInfoService_interface;
import com.asap.member.entity.MbrActivVO;
import com.asap.member.entity.MbrNewsVO;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MbrActivService;
import com.asap.member.service.MbrActivService_interface;
import com.asap.member.service.MbrNewsService;
import com.asap.member.service.MbrNewsService_interface;
import com.asap.member.service.MemberService;
import com.asap.util.JavaMail;
import com.asap.util.JedisPoolUtil;
import com.asap.util.MailFormat;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@WebServlet("/GrpJoinInfo.do")
public class GrpJoinInfoServlet extends HttpServlet {
	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	private GrpJoinInfoService_interface grpJoinInfoService_interface;
	private GrpInfoService grpInfoService;
	private MemberService memberService;
	private MbrActivService_interface mbrActivService_interface;
	private MbrNewsService_interface mbrNewsService_interface;
	private String LoginActNo;

	@Override
	public void init() throws ServletException {

		grpJoinInfoService_interface = new GrpJoinInfoService_interface();
		grpInfoService = new GrpInfoService_interface();
		memberService = new MemberService();
		mbrActivService_interface = new MbrActivService();
		mbrNewsService_interface = new MbrNewsService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String forwardPath = "";

		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVo");
		LoginActNo = memberVO.getMbrNo();

		switch (action) {
		// 報名-新增到參與人資訊
		case "insertGrpJoinInfoNo":
			forwardPath = grpJoinInfoinsert(req, res);
			break;
		// 退出-修改參與人狀態
		case "updateGrpJoinInfoNo":
			forwardPath = grpJoinInfoupdate(req, res);
			break;
		// 我參加的揪團
		case "myJoingrp":
			forwardPath = myJoingrp(req, res);
			break;

		default:
			forwardPath = "/group/AllGroup.jsp";
		}

		res.setContentType("text/html; charset=UTF-8");
		RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
		dispatcher.forward(req, res);
	}

	private String grpJoinInfoinsert(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		GrpJoinInfoVO grpJoinInfo = new GrpJoinInfoVO();
		// 揪團編號
		String grpNoParam = req.getParameter("GrpNo");
		Integer joininfogrpNo = 0;
		// 發起人會員編號orgMbrNo
		grpJoinInfo.setOrgMbrNo(req.getParameter("OrgMbrNo"));

		// 參與人會員編號partiMbrNo
		grpJoinInfo.setPartiMbrNo(req.getParameter("PartiMbrNo"));

		if (grpNoParam != null && !grpNoParam.isEmpty()) {
			joininfogrpNo = Integer.valueOf(grpNoParam);
			grpJoinInfo.setGrpNo(joininfogrpNo);
		} else {
			return "strError";
		}

		// 參與狀態 true;false
		grpJoinInfo.setGrpJoinStat(true);

		GrpJoinInfoService_interface grpJoinInfoSvc = new GrpJoinInfoService_interface();
		grpJoinInfoSvc.insert(grpJoinInfo);

		GrpInfoVO grpVODetail = grpInfoService.getGrpInfoVOBygrpNo(joininfogrpNo);

		MemberVO MemberVoDetail = new MemberVO();
		String strOrgMbrNo = grpVODetail.getOrgMbrNo().toString();
		MemberVoDetail = memberService.findByMbrNo(strOrgMbrNo);
		req.setAttribute("grpVODetail", grpVODetail);
		req.setAttribute("MemberVoDetail", MemberVoDetail);
		// 查詢詳細資料的時候把 GrpInfoVO 存起來

		// 查詢參與人人數
		if (joininfogrpNo != 0) {
			try {
				List<GrpJoinInfoVO> grpJoInfoList = grpJoinInfoService_interface.getgrpjoinserviceQuery("grpNo",
						String.valueOf(joininfogrpNo));
				int partiMbrNoCount = 1; // 要包含發起人所以預設為1

				for (GrpJoinInfoVO Vo : grpJoInfoList) {
					if (Vo.getGrpJoinStat()) {
						partiMbrNoCount++;
					}
				}

				req.setAttribute("partiMbrNoCount", partiMbrNoCount);
				req.setAttribute("grpJoInfoList", grpJoInfoList);

			} catch (NumberFormatException e) {
				System.out.println("-------Invalid GrpNo format-------");
			}
		} else {
			System.out.println("-------IGrpNo parameter is missing-------");
		}

		// datetime 格式化為需要的形式
		String grpDate = grpVODetail.getGrpDate().toString().substring(0, 10);
		String startTime = grpVODetail.getGrpStartTime().toString();
		String endTime = grpVODetail.getGrpEndTime().toString();
		System.out.println(grpDate);
		System.out.println(startTime);
		String startDateTime = grpDate + " " + startTime;
		String endDateTime = grpDate + " " + endTime;
		System.out.println(startDateTime);

		// 寫入會員消息->報名揪團成功寫入會員消息
		MbrNewsVO vo = new MbrNewsVO();
		vo.setMbrNo(LoginActNo);
		vo.setNewsSubj("報名成功通知");
		vo.setNewsText("您已成功報名揪團(揪團名稱:" + grpVODetail.getGrpName() + ")");
		vo.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));

		mbrNewsService_interface.add(vo);

		// 寫入會員活動->報名揪團成功寫入會員活動
		MbrActivVO JoinActivVO = new MbrActivVO();

		JoinActivVO.setMbrNo(LoginActNo);
		JoinActivVO.setActivSubj("報名揪團成功-" + grpVODetail.getGrpName());
		JoinActivVO.setActivStartTime(java.sql.Timestamp.valueOf(startDateTime));
		JoinActivVO.setActivEndTime(java.sql.Timestamp.valueOf(endDateTime));

		int mbrActivNo = mbrActivService_interface.add(JoinActivVO);
		String mbrActivNoStr = String.valueOf(mbrActivNo);

		// 會員活動編號存入 Redis
		Jedis jedis = pool.getResource();
		String groupOrdNoStr = "groupJoin" + grpJoinInfo.getGrpJoinInfoNo();
		jedis.select(2);
		jedis.append(groupOrdNoStr, mbrActivNoStr);
		jedis.close();

		// 報名揪團成功通知信
		// 報名人
				MemberVO memberVo = memberService.findByMbrNo(LoginActNo);
		String grpmailtitle = "ASAP揪團預約成功通知 - [" + grpVODetail.getGrpName() + "]";
		String content = "親愛的會員您好，您已預約 " + startDateTime + "~" + endDateTime + "「"
				+ grpVODetail.getGrpName() + "」，請務必準時到達。如有任何問題或需要進一步協助，請隨時聯繫我們的客服部門。";
		MailFormat mailFormat = new MailFormat(memberVo.getMbrName(), content);
		InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
		DataSource dataSource = new ByteArrayDataSource(in, "application/png");

		// 寄出信件
		JavaMail mail = new JavaMail(memberVo.getMbrEmail(), grpmailtitle, mailFormat.getMessageTextAndImg(),
				dataSource);
		String result = mail.sendMail();
		System.out.println("SendMail : " + result);

		return "/group/grpinfoOrgMbr.jsp";
	}

	private String grpJoinInfoupdate(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {
		Integer grpjoinNo = Integer.valueOf(req.getParameter("GrpJoinfoNo"));
		GrpJoinInfoVO grpJoinInfo = grpJoinInfoService_interface.findByGrpJoinInfoNo(grpjoinNo);

		Integer joininfogrpNo = 0;
		// 揪團編號
		String grpNoParam = req.getParameter("GrpNo");

		// 參與人會員編號partiMbrNo
		grpJoinInfo.setPartiMbrNo(req.getParameter("PartiMbrNo"));
		if (grpNoParam != null && !grpNoParam.isEmpty()) {
			joininfogrpNo = Integer.valueOf(grpNoParam);
			grpJoinInfo.setGrpNo(joininfogrpNo);

		} else {
			return "strError";
		}

		// 參與狀態 true;false
		grpJoinInfo.setGrpJoinStat(false);
		GrpJoinInfoService_interface grpJoinInfoSvc = new GrpJoinInfoService_interface();
		grpJoinInfoSvc.update(grpJoinInfo);

		GrpInfoVO grpVODetail = grpInfoService.getGrpInfoVOBygrpNo(joininfogrpNo);

		MemberVO MemberVoDetail = new MemberVO();
		String strOrgMbrNo = grpVODetail.getOrgMbrNo().toString();
		MemberVoDetail = memberService.findByMbrNo(strOrgMbrNo);
		req.setAttribute("grpVODetail", grpVODetail);
		req.setAttribute("MemberVoDetail", MemberVoDetail);
		// 查詢詳細資料的時候把 GrpInfoVO 存起來

		System.out.println("=======我的grpVODetail去哪了?======" + grpVODetail);

		// 查詢參與人人數
		if (joininfogrpNo != 0) {
			try {
				List<GrpJoinInfoVO> grpJoInfoList = grpJoinInfoService_interface.getgrpjoinserviceQuery("grpNo",
						String.valueOf(joininfogrpNo));
				int partiMbrNoCount = 1; // 要包含發起人所以預設為1

				for (GrpJoinInfoVO Vo : grpJoInfoList) {
					if (Vo.getGrpJoinStat()) {
						partiMbrNoCount++;
					}
				}
				req.setAttribute("partiMbrNoCount", partiMbrNoCount);
				req.setAttribute("grpJoInfoList", grpJoInfoList);

			} catch (NumberFormatException e) {
				System.out.println("-------Invalid GrpNo format-------");
			}
		} else {
			System.out.println("-------IGrpNo parameter is missing-------");
		}

		// 寫入會員消息->退出揪團成功寫入會員消息
		MbrNewsVO vo = new MbrNewsVO();
		vo.setMbrNo(LoginActNo);
		vo.setNewsSubj("退出成功通知");
		vo.setNewsText("您已成功退出揪團(揪團名稱:" + grpVODetail.getGrpName() + ")");
		vo.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));

		mbrNewsService_interface.add(vo);

		// 退出揪團Redis
		Jedis jedis = pool.getResource();
		jedis.select(2);
		System.out.println("join infono:" + grpJoinInfo.getGrpJoinInfoNo());
		Integer mbrActivNo = Integer.valueOf(jedis.get("groupJoin" + grpJoinInfo.getGrpJoinInfoNo()));
		mbrActivService_interface.delete(mbrActivService_interface.findByPK(mbrActivNo));
		jedis.del("groupJoin" + grpJoinInfo.getGrpJoinInfoNo());
		return "/group/grpinfoOrgMbr.jsp";
	}

	// 我參加的揪團
	private String myJoingrp(HttpServletRequest req, HttpServletResponse res) {
		List<GrpJoinInfoVO> grpJoinVOList = grpJoinInfoService_interface.getALL();
		List<GrpJoinInfoVO> grpJoinVOTempList = new ArrayList<>();
		String sActNo = LoginActNo;
		for (GrpJoinInfoVO Vo : grpJoinVOList) {
			String PartiMbrNo = Vo.getPartiMbrNo();

			if (PartiMbrNo.equals(sActNo)) {
				grpJoinVOTempList.add(Vo);
			}
		}
		grpJoinVOList = grpJoinVOTempList;
		req.setAttribute("grpJoinVOList", grpJoinVOList);

		return "/group/myJoinGroup.jsp";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

}
