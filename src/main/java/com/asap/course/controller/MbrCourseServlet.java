package com.asap.course.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ListModel;

import com.asap.coach.entity.CoachNewsVO;
import com.asap.coach.service.CoachNewsService;
import com.asap.coach.service.CoachNewsService_interface;
import com.asap.course.entity.CourseVO;
import com.asap.course.entity.MbrCourseVO;
import com.asap.course.service.CourseService;
import com.asap.course.service.CourseService_interface;
import com.asap.course.service.MbrCourseService;
import com.asap.course.service.MbrCourseService_interface;
import com.asap.member.entity.MbrNewsVO;
import com.asap.member.entity.MemberVO;
import com.asap.member.service.MbrActivService;
import com.asap.member.service.MbrActivService_interface;
import com.asap.member.service.MbrNewsService;
import com.asap.member.service.MbrNewsService_interface;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.asap.util.JedisPoolUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.protobuf.Timestamp;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@WebServlet("/course/mbrCourseServlet")
public class MbrCourseServlet extends HttpServlet{

	public static AllInOne all;
	private static JedisPool pool = JedisPoolUtil.getJedisPool();
	private MbrCourseService_interface mbrCourseService_interface;
	private CourseService_interface courseService_interface;
	private MemberService_interface memberService_interface;
	private MbrNewsService_interface mbrNewsSvc;
	private CoachNewsService_interface coachNewsSvc;
	private MbrActivService_interface mbrActivService_interface;
	

	
	@Override
	public void init() throws ServletException {
		all = new AllInOne("");
		mbrCourseService_interface = new MbrCourseService();
		courseService_interface = new CourseService();
		memberService_interface = new MemberService();
		mbrNewsSvc = new MbrNewsService();
		coachNewsSvc = new CoachNewsService();
		mbrActivService_interface = new MbrActivService();

		
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("order".equals(action)) {
			String mbrNo = req.getParameter("mbrNo");
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			CourseVO courseVO = courseService_interface.findByPK(courseNo);
			MemberVO memberVO = memberService_interface.findByMbrNo(mbrNo);
			
			// 判斷是否預約過此課程
			List<MbrCourseVO> mbrOrderList = mbrCourseService_interface.findByMember(mbrNo);
			Boolean checkOrder = false;
			for(MbrCourseVO mbrCourseVO: mbrOrderList) {
				if(mbrCourseVO.getCourseVO().getCourseNo() == courseNo && mbrCourseVO.getMbrCourseStat() == true) {
					checkOrder = true;
				}
			}
			
			if(!checkOrder) {
				// 寫入會員課程訂單
				MbrCourseVO mbrCourseVO = new MbrCourseVO();
				mbrCourseVO.setCourseVO(courseVO);
				mbrCourseVO.setCoachVO(courseVO.getCoachVO());
				mbrCourseVO.setMemberVO(memberVO);
				mbrCourseVO.setMbrCourseStat(false);
				java.sql.Timestamp orderTime = new java.sql.Timestamp(System.currentTimeMillis());
				mbrCourseVO.setMbrCourseTime(orderTime);
				Integer mbrCousreOrderNo =  mbrCourseService_interface.insert(mbrCourseVO);
				
				// 處理綠界要用的格式
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String formattedTradeDate = dateFormat.format(orderTime);
				java.sql.Timestamp startTime = courseVO.getCourseStartTime();
				java.sql.Timestamp endTime = courseVO.getCourseEndTime();
				SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm");
				SimpleDateFormat df2 = new SimpleDateFormat("HH:mm");
			    String start = df.format(startTime);
			    String end = df2.format(endTime);
				
				// 呼叫綠界付款
				AioCheckOutALL obj = new AioCheckOutALL();
				int currentYear = getCurrentYear();
				int merchantTradeNoSet = 10000 + mbrCousreOrderNo;
				obj.setMerchantTradeNo("ST" + currentYear + merchantTradeNoSet);			// 注意之後上線後訂單編號重複問題
				obj.setMerchantTradeDate(formattedTradeDate);
				obj.setTradeDesc(courseVO.getCourseName());
				obj.setItemName(courseVO.getCourseName() + "  " + start + "~" + end);
				obj.setTotalAmount(String.valueOf(courseVO.getCoursePrice()));
				obj.setCustomField1(String.valueOf(courseNo)); // 訂單成立接收到courseNo
				obj.setCustomField2(String.valueOf(mbrCousreOrderNo)); // 訂單成立接收到mbrCousreOrderNo
				obj.setCustomField4(mbrNo); // 會員編號
				obj.setReturnURL("https://0485-114-24-160-162.ngrok-free.app/ASAP/course/courseEcPayReturn.do");	// 使用時要記得換成外網
				obj.setOrderResultURL("http://localhost:8081/ASAP/course/course_paymentSuccess.jsp");  // 使用者付款完成跳轉頁面
				obj.setNeedExtraPaidInfo("N");
				String form = all.aioCheckOut(obj, null);
				System.out.println(form);
				
				res.setCharacterEncoding("UTF-8");
				res.setContentType("text/html");
				try(PrintWriter out = res.getWriter()){
					out.print(form);
				}
			
			}
			
			
			
		}else if("check".equals(action)) {
			// 檢查此課程是否額滿
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			CourseVO thisCourseVO = courseService_interface.findByPK(courseNo);
			
			List<MbrCourseVO> allList = mbrCourseService_interface.findByCourseNo(courseNo);
			List<MbrCourseVO> checkList = new ArrayList<>();
			for(MbrCourseVO mbrCourseVO: allList) {
				if(mbrCourseVO.getMbrCourseStat() == true) {
					checkList.add(mbrCourseVO);
				}
			}
			
			String checkString;
			if(checkList.size() == thisCourseVO.getCoursePplLimit()) {
				checkString = "full";
			}else {
				checkString = "available";
			}
			
			res.getWriter().write(checkString);
			
		}else if("checkInMain".equals(action)) {
			
			// 檢查此課程是否額滿，return 報名人數
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			
			List<MbrCourseVO> allList = mbrCourseService_interface.findByCourseNo(courseNo);
			List<MbrCourseVO> checkList = new ArrayList<>();
			for(MbrCourseVO mbrCourseVO: allList) {
				if(mbrCourseVO.getMbrCourseStat() == true) {
					checkList.add(mbrCourseVO);
				}
			}
			
			System.out.println(checkList.size());
			
			res.getWriter().write(String.valueOf(checkList.size()));
			
		}else if ("getByMember".equals(action)) {
			
			String mbrNo = req.getParameter("mbrNo");
			List<MbrCourseVO> mbrCourseVOs = mbrCourseService_interface.findByMember(mbrNo);
			
			GsonBuilder builder = new GsonBuilder();
			builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
			Gson gson = builder.create();
			
			
			String jsonObj = gson.toJson(mbrCourseVOs);
			
			res.setContentType("application/json");
	        res.setCharacterEncoding("UTF-8");
	        res.getWriter().write(jsonObj);
	        
		}else if ("cancel".equals(action)) {
			Integer mbrCourseNo = Integer.valueOf(req.getParameter("mbrCourseNo"));
			
			MbrCourseVO mbrCourseUpdate = mbrCourseService_interface.findByPK(mbrCourseNo);
			
			mbrCourseUpdate.setMbrCourseStat(false);
			
			mbrCourseService_interface.update(mbrCourseUpdate);
			
			// 通知會員已取消，寫入會員消息
			String mbrNo = mbrCourseUpdate.getMemberVO().getMbrNo();
			String courseName = mbrCourseUpdate.getCourseVO().getCourseName();
			MbrNewsVO vo2 = new MbrNewsVO();
			vo2.setMbrNo(mbrNo);
			vo2.setNewsSubj("課程取消預約通知");
			vo2.setNewsText("您已取消預約單編號：" + mbrCourseNo + "之「" + courseName + "」課程" );
			vo2.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
			mbrNewsSvc.add(vo2);
			
			// 移除會員活動
			Jedis jedis = pool.getResource();
			jedis.select(2);
			Integer mbrActivNo = Integer.valueOf(jedis.get("course" + mbrCourseNo));
			mbrActivService_interface.delete(mbrActivService_interface.findByPK(mbrActivNo));
			
			// 通知教練已取消，寫入教練消息
			String coachNo = mbrCourseUpdate.getCoachVO().getCoachNo();
			CoachNewsVO coachNewsVO = new CoachNewsVO();
			coachNewsVO.setCoachNo(coachNo);
			coachNewsVO.setNewsSubj("會員取消課程預約通知");
			coachNewsVO.setNewsText("會員： " + mbrNo + " 取消了您的課程 - " + courseName + "，請至所有課程查看");
			coachNewsVO.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
			coachNewsSvc.add(coachNewsVO);
		
		}else if("findMembers".equals(action)) {
			Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));
			List<MbrCourseVO> mbrCourseVOs = mbrCourseService_interface.findByCourseNo(courseNo);
			List<MemberVO> memberVOs = new ArrayList<>();
			for(MbrCourseVO mbrCourseVO: mbrCourseVOs) {
				memberVOs.add(mbrCourseVO.getMemberVO());
			}
			
			GsonBuilder builder = new GsonBuilder();
			builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
			Gson gson = builder.create();
			
			String memberJson = gson.toJson(memberVOs);
			res.setContentType("application/json");
	        res.setCharacterEncoding("UTF-8");
	        res.getWriter().write(memberJson);
			
		}
	}
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	private int getCurrentYear() {
        return LocalDate.now().getYear();
    }
	
}
