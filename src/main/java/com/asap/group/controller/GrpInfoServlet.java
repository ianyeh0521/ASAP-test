package com.asap.group.controller;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.asap.group.entity.GrpInfoVO;
import com.asap.group.entity.GrpJoinInfoVO;
import com.asap.group.entity.SportTypeVO;
import com.asap.group.service.GrpInfoService;
import com.asap.group.service.GrpInfoService_interface;
import com.asap.group.service.GrpJoinInfoService;
import com.asap.group.service.GrpJoinInfoService_interface;
import com.asap.group.service.SportTypeService;
import com.asap.group.service.SportTypeService_interface;
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

@MultipartConfig(fileSizeThreshold = 0 * 1024 * 1024, maxFileSize = 1 * 1024 * 1024, maxRequestSize = 10 * 1024 * 1024)
@WebServlet("/Grpinfo.do")
public class GrpInfoServlet extends HttpServlet {

	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	private GrpInfoService grpInfoService;
	private SportTypeService sportTypeService;
	private GrpJoinInfoService grpJoinInfoService;
	private MemberService memberService;
	private GrpInfoVO grpTempVo = new GrpInfoVO();
	private MbrActivService_interface mbrActivService_interface;
	private MbrNewsService_interface mbrNewsService_interface;
	private Integer m_GrpNo;
	private String LoginActNo;
	@Override
	public void init() throws ServletException {
		grpInfoService = new GrpInfoService_interface();
		sportTypeService = new SportTypeService_interface();
		memberService = new MemberService();
		grpJoinInfoService = new GrpJoinInfoService_interface();
		mbrActivService_interface = new MbrActivService();
		mbrNewsService_interface = new MbrNewsService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String QueryType = req.getParameter("QueryType");
		if (QueryType == null || QueryType.isEmpty()) {
			QueryType = "";
		}
		String forwardPath = "";
		
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memberVo");
		LoginActNo = memberVO.getMbrNo();
		
		
		if (action != null) {
			switch (action) {
			// 查全部
			case "getAll":
				forwardPath = getAll(req, res);
				break;
			// 我發起的揪團
			case "mycreategrp":
				forwardPath = mycreategrp(req, res);
				break;
			// 我參與的揪團
			case "myJoingrp":
				forwardPath = myJoingrp(req, res);
				break;
			// 詳細資訊
			case "detailsinfo":
				forwardPath = getGrpInfoVOBygrpNo(req, res);
				break;
			// 模糊查詢
			case "FuzzySearch":
				forwardPath = getByServiceFuzzySearch(req, res);
				break;
			// 新增揪團資訊-開啟
			case "creategroup":
				// type 0:新增 1:編輯(修改)
				String type = req.getParameter("type");
				if (type != null)
				{
					if (req.getParameter("type").equals("1")) {
						// 先把資料設定到欄位上
						creategrpupdate(req, res);
						// 傳送給creategroup.jsp 判斷某些欄位要disabled
					}
				}			
				forwardPath = "/group/creategroup.jsp";
				break;
			// 新增揪團資訊-送出
			case "insertgrpInfo":
				forwardPath = grpInfoinsert(req, res);
				break;
			// 解散揪團update
			case "updatestatGrp":
				forwardPath = grpInfoupdate(req, res);
				break;
			// 編輯揪團資訊-修改按鈕
//			case "updatecreategrp":
//				forwardPath = creategrpupdate(req, res);
//				break;
			// 首頁
			default:
				forwardPath = "/group/AllGroup.jsp";
			}
		} else {
			forwardPath = "/group/AllGroup.jsp";
		}
		
		if (QueryType.equals("1")) {
			// 將 m_GrpNo 轉換為 JSON 格式
			res.setContentType("application/json;charset=UTF-8");
		    String jsonResponse = "{\"m_GrpNo\": \"" + m_GrpNo + "\"}";
	    	System.out.print(jsonResponse);
		    // 將 JSON 物件寫入回應
		    res.getWriter().write(jsonResponse);
		}
		else {
			if (forwardPath != "strError") {
				res.setContentType("text/html; charset=UTF-8");
				RequestDispatcher dispatcher = req.getRequestDispatcher(forwardPath);
				dispatcher.forward(req, res);
			}
		}
		
	
	}

	// 首頁全部資料
	private String getAll(HttpServletRequest req, HttpServletResponse res) {
		//抓取VOList的全部資料
		List<GrpInfoVO> grpVOList = grpInfoService.getALL();
		List<SportTypeVO> strSportList = sportTypeService.getALL();	
		req.setAttribute("grpVOList", grpVOList);
		return "/group/AllGroup.jsp";
	}

	// 我發起的揪團
	private String mycreategrp(HttpServletRequest req, HttpServletResponse res) {
		List<GrpInfoVO> grpVOList = grpInfoService.getALL();
		List<GrpInfoVO> grpVOTempList = new ArrayList<>();
		for (GrpInfoVO Vo : grpVOList) {
			String OrgMbrNo = Vo.getOrgMbrNo();

			if (OrgMbrNo.equals(LoginActNo)) {
				grpVOTempList.add(Vo);
			}
		}
		grpVOList = grpVOTempList;
		req.setAttribute("grpVOList", grpVOList);

		return "/group/mycreateGroup.jsp";
	}
	// 我參加的揪團
	private String myJoingrp(HttpServletRequest req, HttpServletResponse res) {
		List<GrpJoinInfoVO> grpJoinVOList = grpJoinInfoService.getALL();
		List<GrpInfoVO> GrpInfoVOList = new ArrayList<>();
		
		for (GrpJoinInfoVO JoinVo : grpJoinVOList) {
			String PartiMbrNo = JoinVo.getPartiMbrNo();
			//當參與人資訊裡面的參與人編號等於目前登入的帳號
			//要抓揪團編號出來，再去查揪團資訊
			if (PartiMbrNo.equals(LoginActNo) && JoinVo.getGrpJoinStat()) {
				GrpInfoVO grpVODetail = grpInfoService.getGrpInfoVOBygrpNo(JoinVo.getGrpNo());
				GrpInfoVOList.add(grpVODetail);
			}
		}
		
		req.setAttribute("grpVOList", GrpInfoVOList);
		
		return "/group/myJoinGroup.jsp";
	}

	// 揪團首頁搜尋框
	private String getByServiceFuzzySearch(HttpServletRequest req, HttpServletResponse res) {
		String searchkey = req.getParameter("grpInfoKeyword");
		List<GrpInfoVO> grpVOList;
		String type = req.getParameter("type");// 0:全部 1:我的發起 2:我參加的

		if (searchkey != null && !searchkey.isEmpty()) {
			grpVOList = grpInfoService.getByServiceFuzzySearch(searchkey);

		} else {
			grpVOList = grpInfoService.getALL();
		}
		if (type.equals("1")) {

			List<GrpInfoVO> grpVOTempList = new ArrayList<>();
			for (GrpInfoVO vo : grpVOList) {
				String OrgMbrNo = vo.getOrgMbrNo();
				if (OrgMbrNo.equals(LoginActNo)) {
					grpVOTempList.add(vo);
				}
			}
			grpVOList = grpVOTempList;
		}
		else if (type.equals("2")) {

			List<GrpInfoVO> grpVOTempList = new ArrayList<>();
			
			for (GrpInfoVO vo : grpVOList) {
				
				List<GrpJoinInfoVO> grpJoInfoList = grpJoinInfoService.getgrpjoinserviceQuery("grpNo",
						String.valueOf(vo.getGrpNo()));
				
				for(GrpJoinInfoVO JoinVo : grpJoInfoList) {
					if (LoginActNo.equals(JoinVo.getPartiMbrNo()) && JoinVo.getGrpJoinStat()) {
						grpVOTempList.add(vo);
					}
				}				
			}
			grpVOList = grpVOTempList;
		}

		req.setAttribute("grpVOList", grpVOList);
		req.setAttribute("Skip", true);
		if (type.equals("1")) {
			return "/group/mycreateGroup.jsp";
		}
		else if (type.equals("2")) {
			return "/group/myJoinGroup.jsp";
		}
		return "/group/AllGroup.jsp";
	}

	// 發起揪團搜尋框
	private String getBySrvFuzzySearchcreate(HttpServletRequest req, HttpServletResponse res) {
		String searchkey = req.getParameter("grpInfoKeyword");
		List<GrpInfoVO> grpVOList;
		List<GrpInfoVO> grpVOTempList = new ArrayList<>();

		if (searchkey != null && !searchkey.isEmpty()) {
			grpVOList = grpInfoService.getByServiceFuzzySearch(searchkey);

		} else {
			grpVOList = grpInfoService.getALL();
		}
		for (GrpInfoVO vo : grpVOList) {
			String OrgMbrNo = vo.getOrgMbrNo();
			if (OrgMbrNo.equals(LoginActNo)) {
				grpVOTempList.add(vo);
			}
		}
		grpVOList = grpVOTempList;
		req.setAttribute("grpVOList", grpVOList);
		req.setAttribute("Skip", true);
		return "/group/AllGroup.jsp";
	}

	// 詳細資訊
	private String getGrpInfoVOBygrpNo(HttpServletRequest req, HttpServletResponse res) {
		String grpdetailsinfo = req.getParameter("grpdetailsinfo");
		Integer grpNo = 0;
		try {
			grpNo = Integer.parseInt(grpdetailsinfo);
		} catch (NumberFormatException e) {
			return "/group/AllGroup.jsp";
		}
		m_GrpNo = grpNo;
		GrpInfoVO grpVODetail = grpInfoService.getGrpInfoVOBygrpNo(grpNo);
		
		MemberVO MemberVoDetail = new MemberVO();
		String strOrgMbrNo = grpVODetail.getOrgMbrNo().toString();
		MemberVoDetail = memberService.findByMbrNo(strOrgMbrNo);
		//System.out.println("=======TEST/MemberVoDetail======="+MemberVoDetail);
		req.setAttribute("grpVODetail", grpVODetail);
		req.setAttribute("MemberVoDetail", MemberVoDetail);
		// 查詢詳細資料的時候把 GrpInfoVO 存起來
		// 按編輯的時候 把資料傳到發起揪團的畫面
		System.out.println("----TEST----grpVODetail:"+grpVODetail);
		grpTempVo = grpVODetail;
		
		//查詢參與人人數
		if (grpNo != 0) {
			try {
				List<GrpJoinInfoVO> grpJoInfoList = grpJoinInfoService.getgrpjoinserviceQuery("grpNo",
						String.valueOf(grpNo));
				int partiMbrNoCount = 1; // 要包含發起人所以預設為1
				
				for(GrpJoinInfoVO Vo : grpJoInfoList) {
					if (Vo.getGrpJoinStat()) {
						partiMbrNoCount ++;
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
		return "/group/grpinfoOrgMbr.jsp";
	}

	// 到新增頁面
	private String grpInfoinsert(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		
		GrpInfoVO grpInfo = new GrpInfoVO();
		Integer grpNo = 0;
		
		// type 0:新增 1:編輯(修改)
		String type = req.getParameter("type");
		
		if(type.equals("1")) {
			String strgrpNo = req.getParameter("GrpNo");
		
			if (strgrpNo != null) {
				grpNo = Integer.valueOf(strgrpNo);
			}
		}
		grpInfo = setGrpInfomethod(req);
		GrpInfoService grpInfoSvc = new GrpInfoService_interface();
		
		Integer mbrActivNo = 0;
		Jedis jedis = pool.getResource();
		MbrNewsVO NewsVO = new MbrNewsVO();
		MbrActivVO ActivVO = new MbrActivVO();
		String mbrActivNoStr = "";
		String NewsSubjmsg = "";
		String NewsTextmsg = "";
		String groupOrdNoStr = "";
		if(type.equals("1")) {
			grpInfo.setGrpNo(grpNo);
			grpInfoSvc.update(grpInfo);
			groupOrdNoStr = "group" + grpNo;
			//原始資料處理
			//編輯揪團->移除主揪原始資料的Redis
			jedis.select(2);
			
			System.out.println("------------group--------------: group" + grpTempVo.getGrpNo());
			mbrActivNo = Integer.valueOf(jedis.get("group" + grpTempVo.getGrpNo()));
			System.out.println("------------findByPK--------------:"+mbrActivService_interface.findByPK(mbrActivNo));
			mbrActivService_interface.delete(mbrActivService_interface.findByPK(mbrActivNo));
			jedis.del(groupOrdNoStr);
			System.out.println("------------mbrActivNo--------------:"+mbrActivNo);

			
			List<GrpJoinInfoVO> grpJoInfoList = grpJoinInfoService.getgrpjoinserviceQuery("grpNo",
					String.valueOf(grpNo));
	
			for(GrpJoinInfoVO InfoVO : grpJoInfoList) {
				if (InfoVO.getGrpJoinStat()) {
					//寫入會員消息->編輯揪團成功寫入會員消息
					NewsVO = new MbrNewsVO();
					NewsVO.setMbrNo(InfoVO.getPartiMbrNo());
					NewsVO.setNewsSubj("編輯揪團通知");
					NewsVO.setNewsText("您的揪團(揪團名稱:" + grpInfo.getGrpName() +")已被編輯");
					NewsVO.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
					mbrNewsService_interface.add(NewsVO);
					
					//編輯揪團->移除參與人原始資料的Redis
					jedis = pool.getResource();
					jedis.select(2);
					mbrActivNo = Integer.valueOf(jedis.get("groupJoin" + InfoVO.getGrpJoinInfoNo()));
					mbrActivService_interface.delete(mbrActivService_interface.findByPK(mbrActivNo));
					jedis.del("groupJoin" + InfoVO.getGrpJoinInfoNo());
					
					//編輯揪團->新增編輯後參與人的Redis
					//活動日期
					String grpDate = grpInfo.getGrpDate().toString().substring(0, 10);
					//活動開始時間
					String startTime = grpInfo.getGrpStartTime().toString();
					//活動結束時間
					String endTime = grpInfo.getGrpEndTime().toString();
					//活動開始
					String startDateTime = grpDate + " " + startTime;
					//活動結束
					String endDateTime = grpDate + " " + endTime;
					
					ActivVO.setMbrNo(InfoVO.getPartiMbrNo());//找到問題了
					ActivVO.setActivSubj("發起揪團-" + grpInfo.getGrpName());
					ActivVO.setActivStartTime(java.sql.Timestamp.valueOf(startDateTime));
					ActivVO.setActivEndTime(java.sql.Timestamp.valueOf(endDateTime));
					
					mbrActivNo = mbrActivService_interface.add(ActivVO);
					mbrActivNoStr = String.valueOf(mbrActivNo);
					
					// 會員活動編號存入 Redis
					jedis = pool.getResource();
					jedis.select(2);
					jedis.del("groupJoin" + InfoVO.getGrpJoinInfoNo());
					jedis.set("groupJoin" + InfoVO.getGrpJoinInfoNo(), mbrActivNoStr);
					jedis.close();
				}
			}		
			NewsSubjmsg = "編輯揪團成功通知";
			NewsTextmsg = "您的揪團(揪團名稱:" + grpInfo.getGrpName() +"已編輯)";
		}
		else 
		{

			grpInfoSvc.insert(grpInfo);
			grpNo = grpInfo.getGrpNo();
			groupOrdNoStr = "group" + grpNo;
			// datetime 格式化為需要的形式
			String grpDate = grpInfo.getGrpDate().toString().substring(0, 10);
			String startTime = grpInfo.getGrpStartTime().toString();
			String endTime = grpInfo.getGrpEndTime().toString();

			String startDateTime = grpDate + " " + startTime;
			String endDateTime = grpDate + " " + endTime;
			
			// 發起揪團成功通知信
			MemberVO MemberVoDetail = new MemberVO();
			String strOrgMbrNo = grpInfo.getOrgMbrNo().toString();
			MemberVoDetail = memberService.findByMbrNo(strOrgMbrNo);
			if (MemberVoDetail != null) {
				
				String grpmailtitle = "ASAP揪團發起成功通知 - [" + grpInfo.getGrpName() + "]";
				String content = "親愛的會員您好，您的揪團 " + startDateTime + "~" + endDateTime
							+ "「" + grpInfo.getGrpName()+ "」已發起成功。如有任何問題或需要進一步協助，請隨時聯繫我們的客服部門。";
				MailFormat mailFormat = new MailFormat(MemberVoDetail.getMbrName(), content);
				InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
				DataSource dataSource = new ByteArrayDataSource(in, "application/png");
				// 寄出信件
				JavaMail mail = new JavaMail(MemberVoDetail.getMbrEmail(), grpmailtitle, mailFormat.getMessageTextAndImg(), dataSource);
				String result = mail.sendMail();
				System.out.println("SendMail : " + result);
			}
			NewsSubjmsg = "發起揪團成功通知";
			NewsTextmsg = "您的揪團(揪團名稱:" + grpInfo.getGrpName() +"已發起成功)";
		}
		
		
		// 寫入會員消息->編輯揪團成功寫入會員消息
		NewsVO = new MbrNewsVO();
		NewsVO.setMbrNo(LoginActNo);
		NewsVO.setNewsSubj(NewsSubjmsg);
		NewsVO.setNewsText(NewsTextmsg);
		NewsVO.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
		
		mbrNewsService_interface.add(NewsVO);
		
//		//編輯揪團->新增編輯後主揪的Redis
		//活動日期
		String grpDate = grpInfo.getGrpDate().toString().substring(0, 10);
		//活動開始時間
		String startTime = grpInfo.getGrpStartTime().toString();
		//活動結束時間
		String endTime = grpInfo.getGrpEndTime().toString();
		//活動開始
		String startDateTime = grpDate + " " + startTime;
		//活動結束
		String endDateTime = grpDate + " " + endTime;

		ActivVO = new MbrActivVO();
		ActivVO.setMbrNo(LoginActNo);
		ActivVO.setActivSubj("發起揪團-" + grpInfo.getGrpName());
		ActivVO.setActivStartTime(java.sql.Timestamp.valueOf(startDateTime));
		ActivVO.setActivEndTime(java.sql.Timestamp.valueOf(endDateTime));
		
		mbrActivNo = mbrActivService_interface.add(ActivVO);
		System.out.println("------------發起揪團 mbrActivNo--------------:"+mbrActivNo);
		mbrActivNoStr = String.valueOf(mbrActivNo);
		
		jedis = pool.getResource();
		jedis.select(2);
		jedis.set(groupOrdNoStr, mbrActivNoStr);
		jedis.close();
//		
		
		return "/group/AllGroup.jsp";
	}

	private String grpInfoupdate(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		GrpInfoVO grpInfo = new GrpInfoVO();
		Integer infogrpNo = 0;
		// 揪團編號
		String grpNoParam = req.getParameter("GrpNo");
		// 發起人會員編號orgMbrNo
		if (grpNoParam != null && !grpNoParam.isEmpty()) {
			infogrpNo = Integer.valueOf(grpNoParam);
			grpInfo.setGrpNo(infogrpNo);
		} else {
			return "strError";
		}
		// 參與狀態 0正常;1取消
		grpInfo.setGrpStat(1);
		GrpInfoService_interface grpInfoSvc = new GrpInfoService_interface();
		grpInfoSvc.update(grpInfo);
		String GrpNameParam = req.getParameter("GrpName");
		//寫入會員消息->解散揪團成功寫入會員消息
		MbrNewsVO vo = new MbrNewsVO();
		vo.setMbrNo(LoginActNo);
		vo.setNewsSubj("解散揪團成功通知");
		vo.setNewsText("您已成功解散揪團(揪團名稱:" + GrpNameParam +")");
		vo.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
		
		mbrNewsService_interface.add(vo);
		
		//解散揪團->移除主揪的Redis
		Jedis jedis = pool.getResource();
		jedis.select(2);
		Integer mbrActivNo = Integer.valueOf(jedis.get("group" + grpInfo.getGrpNo()));
		mbrActivService_interface.delete(mbrActivService_interface.findByPK(mbrActivNo));
		jedis.del("groupJoin" + grpInfo.getGrpNo());
		
		
		
		//用infogrpNo查參與人資訊
		//查詢參與人人數
		if (infogrpNo != 0) {
			try {
				List<GrpJoinInfoVO> grpJoInfoList = grpJoinInfoService.getgrpjoinserviceQuery("grpNo",
						String.valueOf(infogrpNo));
				int partiMbrNoCount = 1; // 要包含發起人所以預設為1
				
				for(GrpJoinInfoVO InfoVO : grpJoInfoList) {
					if (InfoVO.getGrpJoinStat()) {
						
						//寫入會員消息->解散揪團成功寫入會員消息
						MbrNewsVO vo2 = new MbrNewsVO();
						vo2.setMbrNo(InfoVO.getPartiMbrNo());
						vo2.setNewsSubj("解散揪團通知");
						vo2.setNewsText("您的揪團已解散(揪團名稱:" + GrpNameParam +")");
						vo2.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
						mbrNewsService_interface.add(vo2);
						
						//解散揪團->移除參與人的Redis
						jedis = pool.getResource();
						jedis.select(2);
						mbrActivNo = Integer.valueOf(jedis.get("groupJoin" + InfoVO.getGrpJoinInfoNo()));
						mbrActivService_interface.delete(mbrActivService_interface.findByPK(mbrActivNo));
						jedis.del("groupJoin" + InfoVO.getGrpJoinInfoNo());
					}
				}
				req.setAttribute("partiMbrNoCount", partiMbrNoCount);
				req.setAttribute("grpJoInfoList", grpJoInfoList);
				
			} catch (NumberFormatException e) {
				System.out.println("-------Invalid GrpNo format-------");
			}
		}

		return "/group/AllGroup.jsp";
	}

	private String creategrpupdate(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException {

		// 先把資料設定到欄位上
		req.setAttribute("type", "1");
		req.setAttribute("grpVO", grpTempVo);
		
		// 從資料庫中取得圖片資料，這裡假設以 byte[] 形式儲存
	    byte[] imageData = grpTempVo.getGrpImg(); // 這裡需要實現根據你的資料庫取得圖片資料的邏輯

	    // 將圖片資料轉換成 Base64 字串
	    String base64Image = Base64.getEncoder().encodeToString(imageData);
	    req.setAttribute("base64Image", base64Image);
	    
		// 傳送給creategroup.jsp 判斷某些欄位要disabled
		return "/group/creategroup.jsp";
	}

	// 設計讓insert跟update去呼叫setGrpInfomethod方法
	private GrpInfoVO setGrpInfomethod(HttpServletRequest req) throws IOException, ServletException {
		System.out.println("setGrpInfomethod:");
		GrpInfoVO grpInfo = new GrpInfoVO();
		String strError = "";

		// 發起人(先用編號代替)(串會員資料)
		// grpInfo.setOrgMbrNo("M0059");
		grpInfo.setOrgMbrNo(LoginActNo);

		// 活動名稱OK
		// grpInfo.setGrpName("活動羽球");
		System.out.println("GrpName:" + req.getParameter("GrpName"));
		grpInfo.setGrpName(req.getParameter("GrpName"));

		// 運動種類
		// sportTypeNameParam = "8";
		System.out.println("SportTypeName:" + req.getParameter("SportTypeName"));
		String sportTypeNameParam = req.getParameter("SportTypeName");
		if (sportTypeNameParam != null && !sportTypeNameParam.isEmpty()) {
			Integer SportTypeName = Integer.valueOf(sportTypeNameParam);
			
			
			grpInfo.setSportTypeNo(SportTypeName);
		} else {
			strError = "strError";
		}
		// 活動日期
		java.sql.Date GrpDate = null;
		String grpDateParam = req.getParameter("GrpDate");

		try {
			DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // 設定日期格式
			LocalDate parsedDate = LocalDate.parse(grpDateParam, dateFormatter); // 解析字串為 LocalDate
			GrpDate = java.sql.Date.valueOf(parsedDate); // 將 LocalDate 轉換為 java.sql.Date

			grpInfo.setGrpDate(GrpDate);
		} catch (DateTimeParseException | IllegalArgumentException e) {
			GrpDate = new java.sql.Date(System.currentTimeMillis());
			strError = "strError";
		}

		// 活動開始時間
		java.sql.Time GrpStartTime = null;
		try {
			if (req.getParameter("GrpStartTime") != null && !req.getParameter("GrpStartTime").isEmpty()) {
				String grpStartTimeParam = req.getParameter("GrpStartTime");
				// User丟進時跟分
				LocalTime time = LocalTime.of(0, 0);
				if (grpStartTimeParam.length() < 6) {
					time = LocalTime.parse(grpStartTimeParam, DateTimeFormatter.ofPattern("HH:mm"));
				}
				else {
					time = LocalTime.parse(grpStartTimeParam, DateTimeFormatter.ofPattern("HH:mm:ss"));
				}
					

				// 補充秒數，這裡假設秒數為 0
				LocalTime withSeconds = time.withSecond(0);
				GrpStartTime = java.sql.Time.valueOf(withSeconds);
				grpInfo.setGrpStartTime(GrpStartTime);

			} else {
				strError = "strError";
			}
		} catch (IllegalArgumentException e) {
			GrpStartTime = new java.sql.Time(System.currentTimeMillis());
			strError = "strError";
		}

		// 活動結束時間
		// strTemp = "22:10:00";
		java.sql.Time GrpEndTime = null;
		try {
			if (req.getParameter("GrpEndTime") != null && !req.getParameter("GrpEndTime").isEmpty()) {
				String grpEndTimeParam = req.getParameter("GrpEndTime");
				// User丟進時跟分
				// 補充秒數，這裡假設秒數為 0
				LocalTime time = LocalTime.of(0, 0);
				if (grpEndTimeParam.length() < 6) {
					time = LocalTime.parse(grpEndTimeParam, DateTimeFormatter.ofPattern("HH:mm"));
				}
				else {
					time = LocalTime.parse(grpEndTimeParam, DateTimeFormatter.ofPattern("HH:mm:ss"));
				}
				LocalTime withSeconds = time.withSecond(0);
				GrpEndTime = java.sql.Time.valueOf(withSeconds);
				grpInfo.setGrpEndTime(GrpEndTime);
			} else {
				strError = "strError";
			}
		} catch (IllegalArgumentException e) {
			GrpEndTime = new java.sql.Time(System.currentTimeMillis());
			strError = "strError";
		}

		// 最低人數
		// grpPplMinParam = "6";
		String grpPplMinParam = req.getParameter("GrpPplMin");

		if (grpPplMinParam != null && !grpPplMinParam.isEmpty()) {
			Integer GrpPplMin = Integer.valueOf(grpPplMinParam);
			grpInfo.setGrpPplMin(GrpPplMin);
		} else {
			strError = "最低人數轉型錯誤";
		}

		// 最高人數
		// grpPplLimitParam = "12";
		String grpPplLimitParam = req.getParameter("GrpPplLimit");

		if (grpPplLimitParam != null && !grpPplLimitParam.isEmpty()) {
			Integer GrpPplLimit = Integer.valueOf(grpPplLimitParam);
			grpInfo.setGrpPplLimit(GrpPplLimit);
		} else {
			strError = "最高人數轉型錯誤";
		}
		// 活動地點
		// grpInfo.setGrpAddress("新北市三重");

		if (req.getParameter("GrpAddress") != null && !req.getParameter("GrpAddress").isEmpty()) {
			grpInfo.setGrpAddress(req.getParameter("GrpAddress"));

		} else {
			strError = "活動地點錯誤";
		}

		// grpInfo.setGrpSignStrTime(java.sql.Timestamp.valueOf("2023-10-01 09:00:00"));
		// grpInfo.setGrpSignEndTime(java.sql.Timestamp.valueOf("2023-10-29 09:30:00"));

		java.sql.Timestamp GrpSignStrTime = null;

		String strgrpSignStrDate = req.getParameter("GrpSignStrDate");
		String strgrpSignStrTime = req.getParameter("GrpSignStrTime");
		String strgrpSignEndDate = req.getParameter("GrpSignEndDate");
		String strgrpSignEndTime = req.getParameter("GrpSignEndTime");

		// LocalDateTime 格式化為需要的形式
		LocalDateTime startDateTime = LocalDateTime.parse(strgrpSignStrDate + "T" + strgrpSignStrTime);
//		System.out.println("====TEST=startDateTime====="+startDateTime);
		LocalDateTime endDateTime = LocalDateTime.parse(strgrpSignEndDate + "T" + strgrpSignEndTime);
//		System.out.println("====TEST=endDateTime====="+endDateTime);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedStartDateTime = startDateTime.format(formatter);
		String formattedEndDateTime = endDateTime.format(formatter);
		// 報名開始時間
		// strTemp = "2023-10-01 15:30:45";
		try {
			GrpSignStrTime = java.sql.Timestamp.valueOf(formattedStartDateTime);
			grpInfo.setGrpSignStrTime(GrpSignStrTime);
		} catch (IllegalArgumentException e) {
			GrpSignStrTime = new java.sql.Timestamp(System.currentTimeMillis());
			strError = "strError";
		}

		// 報名結束時間
		// strTemp = "2023-10-01 15:30:45";

		java.sql.Timestamp GrpSignEndTime = null;

		try {
			GrpSignEndTime = java.sql.Timestamp.valueOf(formattedEndDateTime);
			grpInfo.setGrpSignEndTime(GrpSignEndTime);
		} catch (IllegalArgumentException e) {
			GrpSignEndTime = new java.sql.Timestamp(System.currentTimeMillis());
			strError = "strError";
		}
		// 注意事項
		// grpInfo.setGrpNote("球拍");

		grpInfo.setGrpNote(req.getParameter("GrpNote"));

		// 圖片上傳

		InputStream in = req.getPart("GrpImg").getInputStream();
		byte[] GrpImg = null;
		try {
			if (in.available() != 0) {
				GrpImg = new byte[in.available()];
				in.read(GrpImg);
				in.close();
			} else {
				GrpInfoService_interface grpInfoSvc = new GrpInfoService_interface();
				GrpImg = grpInfoSvc.getGrpInfoVOBygrpNo(m_GrpNo).getGrpImg();
			}
		} catch (Exception e) {
			System.out.println("壞掉");
		}
		System.out.println(req.getPart("GrpImg"));
		grpInfo.setGrpImg(GrpImg);
		System.out.println("處理" + req.getPart("GrpImg"));
		// 活動狀態
		grpInfo.setGrpStat(0);

		return grpInfo;
	}
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);

	}
}
