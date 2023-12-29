package com.asap.course.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.asap.coach.entity.CoachNewsVO;
import com.asap.coach.entity.CoachVO;
import com.asap.coach.service.CoachNewsService;
import com.asap.coach.service.CoachNewsService_interface;
import com.asap.group.entity.SportTypeVO;
import com.asap.member.entity.MbrNewsVO;
import com.asap.member.service.MbrNewsService;
import com.asap.member.service.MbrNewsService_interface;
import com.asap.util.HibernateProxyTypeAdapter;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.asap.course.entity.CourseVO;
import com.asap.course.entity.MbrCourseVO;
import com.asap.course.service.CourseService;
import com.asap.course.service.CourseService_interface;
import com.asap.course.service.MbrCourseService;
import com.asap.course.service.MbrCourseService_interface;
import com.asap.court.entity.CourtVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 30 * 1024 * 1024)
@WebServlet("/course/course.do")
public class CourseServlet extends HttpServlet {
	private CourseService_interface courseSvc;
	private MbrCourseService_interface mbrCourseSvc;
	private MbrNewsService_interface mbrNewsSvc;
	private CoachNewsService_interface coachNewsSvc;

	@Override
	public void init() throws ServletException {
		courseSvc = new CourseService();
		mbrCourseSvc = new MbrCourseService();
		mbrNewsSvc = new MbrNewsService();
		coachNewsSvc = new CoachNewsService();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		switch (action) {
		case "add":
			addCourse(req, res);
			break;
		case "update":
			updateCourse(req, res);
			break;
		case "getAll":
			getAll(req, res);
			break;
		case "getByCoach":
			getByCoach(req, res);
			break;
		case "getByCompositeQuery":
			getByCompositeQuery(req, res);
			break;
		default:

			break;
		}

	}

	private void getByCompositeQuery(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		Map<String, String[]> map = req.getParameterMap();
		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();

		if (map != null) {
			List<CourseVO> courseList = courseSvc.getByCompositeQuery(map);
			String json = gson.toJson(courseList);

			req.setAttribute("courseData", json);

			System.out.println(courseList);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(json);
		} else {
			res.setContentType("text/html; charset=UTF-8");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/course/course_main.jsp");
			dispatcher.forward(req, res);
		}

	}

	private void getByCoach(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String coachNo = req.getParameter("coachNo");

		List<CourseVO> courseVOs = courseSvc.findByCoach(coachNo);
		Timestamp currentTimestamp = new Timestamp(System.currentTimeMillis());

		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();

		String purpose = req.getParameter("purpose");
		if ("finished".equals(purpose)) {

			List<CourseVO> beforeCurrentTime = courseVOs.stream()
					.filter(course -> course.getCourseEndTime().before(currentTimestamp)).collect(Collectors.toList());

			String beforeCurrentTimeString = gson.toJson(beforeCurrentTime);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(beforeCurrentTimeString);

		} else if ("current".equals(purpose)) {

			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			List<CourseVO> afterCurrentTime = courseVOs.stream()
					.filter(course -> course.getCourseEndTime().after(currentTimestamp)).collect(Collectors.toList());

			for (CourseVO courseVO : afterCurrentTime) {

				List<MbrCourseVO> mbrCourseVOs = mbrCourseSvc.findByCourseNo(courseVO.getCourseNo());
				String htmlString = "";
				for (MbrCourseVO mbrCourseVO : mbrCourseVOs) {
					String mbrName = mbrCourseVO.getMemberVO().getMbrName();
					String mbrNo = mbrCourseVO.getMemberVO().getMbrNo();
					String mbrEmail = mbrCourseVO.getMemberVO().getMbrEmail();
					htmlString += "<div class=\"mega_parent\" >\r\n" + "<div class=\"parent\">\r\n"
							+ "<div class=\"holder\">\r\n"
							+ "    <div class=\"holder_options\" style=\"display:inline-block\">\r\n"
							+ "        <span class=\"holder_options_1\">會員名稱-" + mbrName
							+ "</span><span><span></span><span></span></span><span></span> \r\n"
							+ "        <span class=\"holder_options_2\">會員編號-" + mbrNo
							+ "</span><span><span></span><span></span></span><span></span> \r\n"
							+ "        <span class=\"holder_options_3\">Email-" + mbrEmail + "</span>\r\n"
							+ "    </div>\r\n" + "</div>\r\n" + "</div>\r\n" + "</div>";

				}

				JSONObject item = new JSONObject();

				item.put("courseNo", courseVO.getCourseNo());
				item.put("courseName", courseVO.getCourseName());
				item.put("sportTypeName", courseVO.getSportTypeVO().getSportTypeName());
				item.put("courseAddress", courseVO.getCourseAddress());
				item.put("courseText", courseVO.getCourseText());
				item.put("coursePrice", courseVO.getCoursePrice());
				item.put("courseStartTime", courseVO.getCourseStartTime());
				item.put("courseEndTime", courseVO.getCourseEndTime());
				item.put("coursePplLimit", courseVO.getCoursePplLimit());
				item.put("courseStat", courseVO.getCourseStat());
				item.put("head", "<h5>預約會員名單</h5>");
				item.put("htmlString", htmlString);

				array.put(item);

			}

			json.put("data", array);

			System.out.println(json);

			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			String output = json.toString();
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();

//			String afterCurrentTimeString = gson.toJson(afterCurrentTime);
//			res.setContentType("application/json");
//	        res.setCharacterEncoding("UTF-8");
//	        res.getWriter().write(afterCurrentTimeString);

		}

	}

	private void updateCourse(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		Integer courseNo = Integer.valueOf(req.getParameter("courseNo"));

		String nameError = null;
		String courseName = req.getParameter("name");
		String enameReg = "^[\\u4e00-\\u9fa5a-zA-Z\\-]{2,20}$";
		if (courseName == null || courseName.trim().length() == 0) {
			nameError = "課程名稱: 請勿空白";
		} else if (!courseName.trim().matches(enameReg)) {
			nameError = "課程名稱: 只能是中、英文字母和- , 且長度必需在2到20之間";
		}

		Integer sportTypeNo = Integer.valueOf(req.getParameter("selectedType"));
		SportTypeVO sportTypeVO = new SportTypeVO();
		sportTypeVO.setSportTypeNo(sportTypeNo);

		String addressError = null;
		String courseAddress = req.getParameter("address");
		if (courseAddress == null || courseAddress.trim().length() == 0) {
			addressError = "地址請勿空白";
		}

		String pplLimitError = null;
		Integer coursePplLimit = null;
		try {
			coursePplLimit = Integer.valueOf(req.getParameter("pplLimit"));
			if (coursePplLimit < 0) {
				pplLimitError = "人數限制不可小於零";
			}
		} catch (NumberFormatException e) {
			coursePplLimit = 0;
			pplLimitError = "請填寫人數限制";
		}

		String priceError = null;
		Integer coursePrice = null;
		try {
			coursePrice = Integer.valueOf(req.getParameter("price"));
			if (coursePrice < 0) {
				priceError = "價格不可小於零";
			}
		} catch (NumberFormatException e) {
			coursePrice = 0;
			priceError = "價格請填數字";
		}

		String timeError = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String courseStart = null;
		java.sql.Timestamp courseStartTime = null;
		try {
			courseStart = req.getParameter("start");
			Date parsedDate = dateFormat.parse(courseStart);
			courseStartTime = new Timestamp(parsedDate.getTime());
		} catch (Exception e) {
			timeError = "請填入時間";
		}

		String courseEnd = null;
		java.sql.Timestamp courseEndTime = null;
		try {
			courseEnd = req.getParameter("end");
			Date parsedDate = dateFormat.parse(courseEnd);
			courseEndTime = new Timestamp(parsedDate.getTime());
		} catch (Exception e) {
			timeError = "請填入時間";
		}

		String textError = null;
		String courseText = req.getParameter("courseText");
		if (courseText == null || courseText.trim().length() == 0) {
			textError = "課程介紹請勿空白";
		}

		Boolean courseStat = Boolean.valueOf(req.getParameter("stat"));

		String imgError = null;
		InputStream in1 = req.getPart("upFiles1").getInputStream();
		byte[] upFiles1 = null;
		if (in1.available() != 0) {
			upFiles1 = new byte[in1.available()];
			in1.read(upFiles1);
			in1.close();
		} else {
			upFiles1 = courseSvc.findByPK(courseNo).getCourseImg();
		}

		String coachNo = req.getParameter("coachNo");
		CoachVO coachVO = new CoachVO();
		coachVO.setCoachNo(coachNo);

		if (nameError == null && addressError == null && pplLimitError == null && priceError == null
				&& timeError == null && textError == null && imgError == null) {
			// 原本的課程
			CourseVO courseOriginal = courseSvc.findByPK(courseNo);

			// 修改後的課程
			CourseVO courseVO = new CourseVO();
			courseVO.setCourseNo(courseNo);
			courseVO.setCourseName(courseName);
			courseVO.setSportTypeVO(sportTypeVO);
			courseVO.setCourseAddress(courseAddress);
			courseVO.setCoursePplLimit(coursePplLimit);
			courseVO.setCoursePrice(coursePrice);
			courseVO.setCourseStartTime(courseStartTime);
			courseVO.setCourseEndTime(courseEndTime);
			courseVO.setCourseText(courseText);
			courseVO.setCourseStat(courseStat);
			courseVO.setCourseImg(upFiles1);
			courseVO.setCoachVO(coachVO);

			// 兩者不相同時，通知有預約的會員課程修改
			if (!courseVO.equals(courseOriginal)) {
				List<MbrCourseVO> orderList = mbrCourseSvc.findByCourseNo(courseNo);

				if (orderList.size() != 0) {

					for (MbrCourseVO mbrCourseVO : orderList) {
						String mbrNo = mbrCourseVO.getMemberVO().getMbrNo();
						// 寫入會員消息
						MbrNewsVO vo2 = new MbrNewsVO();
						vo2.setMbrNo(mbrNo);
						vo2.setNewsSubj("預約課程內容更改通知");
						vo2.setNewsText("您預約的課程 - " + courseName + " 已由開課教練變更上課地點或內容，請至「我的課程」查看詳細資訊");
						vo2.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
						mbrNewsSvc.add(vo2);
					}

				}

			}

			courseSvc.update(courseVO);

			res.setContentType("text/html; charset=UTF-8");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/course/listAllCourses_datatable.jsp");
			dispatcher.forward(req, res);
		} else {

			// 錯誤訊息
			req.setAttribute("nameError", nameError);
			req.setAttribute("addressError", addressError);
			req.setAttribute("pplLimitError", pplLimitError);
			req.setAttribute("priceError", priceError);
			req.setAttribute("timeError", timeError);
			req.setAttribute("textError", textError);
			req.setAttribute("imgError", imgError);

			// 保留填入資訊
			CourseVO courseVO = new CourseVO();
			courseVO.setCourseNo(courseNo);
			courseVO.setCourseName(courseName);
			courseVO.setSportTypeVO(sportTypeVO);
			courseVO.setCourseAddress(courseAddress);
			courseVO.setCoursePplLimit(coursePplLimit);
			courseVO.setCoursePrice(coursePrice);
			courseVO.setCourseStartTime(courseStartTime);
			courseVO.setCourseEndTime(courseEndTime);
			courseVO.setCourseText(courseText);
			courseVO.setCourseStat(courseStat);
			courseVO.setCourseImg(upFiles1);
			courseVO.setCoachVO(coachVO);

			req.setAttribute("courseVO", courseVO);

			res.setContentType("text/html; charset=UTF-8");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/course/updateCourse.jsp");
			dispatcher.forward(req, res);
		}

	}

	private void getAll(HttpServletRequest req, HttpServletResponse res) throws IOException {
		GsonBuilder builder = new GsonBuilder();
		builder.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
		Gson gson = builder.create();

		boolean getTotalPage = Boolean.parseBoolean(req.getParameter("getTotalPage"));

		if (getTotalPage) {
			int totalPage = courseSvc.getTotalPage();

			String jsonTotalPageString = gson.toJson(totalPage);
			res.setContentType("application/json");
			res.setCharacterEncoding("UTF-8");
			res.getWriter().write(jsonTotalPageString);
		} else {
			try {
				List<CourseVO> courseList = courseSvc.getAll();

				String json = gson.toJson(courseList);
				res.setContentType("application/json");
				res.setCharacterEncoding("UTF-8");
				res.getWriter().write(json);
			} catch (NumberFormatException e) {
				res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				res.getWriter().write("Invalid or missing pagination parameters.");
			}
		}
	}

	private void addCourse(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		String nameError = null;
		String courseName = req.getParameter("name");
		String enameReg = "^[\\u4e00-\\u9fa5a-zA-Z\\-]{2,20}$";
		if (courseName == null || courseName.trim().length() == 0) {
			nameError = "課程名稱: 請勿空白";
		} else if (!courseName.trim().matches(enameReg)) {
			nameError = "課程名稱: 只能是中、英文字母和- , 且長度必需在2到20之間";
		}

		Integer sportTypeNo = Integer.valueOf(req.getParameter("type"));
		SportTypeVO sportTypeVO = new SportTypeVO();
		sportTypeVO.setSportTypeNo(sportTypeNo);

		String addressError = null;
		String courseAddress = req.getParameter("address");
		if (courseAddress == null || courseAddress.trim().length() == 0) {
			addressError = "地址請勿空白";
		}

		String pplLimitError = null;
		Integer coursePplLimit = null;
		try {
			coursePplLimit = Integer.valueOf(req.getParameter("pplLimit"));
			if (coursePplLimit < 0) {
				pplLimitError = "人數限制不可小於零";
			}
		} catch (NumberFormatException e) {
			coursePplLimit = 0;
			pplLimitError = "請填寫人數限制";
		}

		String priceError = null;
		Integer coursePrice = null;
		try {
			coursePrice = Integer.valueOf(req.getParameter("price"));
			if (coursePrice < 0) {
				priceError = "價格不可小於零";
			}
		} catch (NumberFormatException e) {
			coursePrice = 0;
			priceError = "價格請填數字";
		}

		String timeError = null;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String courseStart = null;
		java.sql.Timestamp courseStartTime = null;
		try {
			courseStart = req.getParameter("start");
			Date parsedDate = dateFormat.parse(courseStart);
			courseStartTime = new Timestamp(parsedDate.getTime());
			System.out.println("courseStartTime=" + courseStartTime);
		} catch (Exception e) {
			timeError = "請填入時間";
		}

		String courseEnd = null;
		java.sql.Timestamp courseEndTime = null;
		try {
			courseEnd = req.getParameter("end");
			Date parsedDate = dateFormat.parse(courseEnd);
			courseEndTime = new Timestamp(parsedDate.getTime());
			System.out.println("courseEndTime=" + courseEndTime);
		} catch (Exception e) {
			timeError = "請填入時間";
		}

		String textError = null;
		String courseText = req.getParameter("courseText");
		if (courseText == null || courseText.trim().length() == 0) {
			textError = "課程介紹請勿空白";
		}

		Boolean courseStat = true;

		String imgError = null;
		InputStream in1 = req.getPart("upFiles1").getInputStream();
		byte[] upFiles1 = null;
		if (in1.available() != 0) {
			upFiles1 = new byte[in1.available()];
			in1.read(upFiles1);
			in1.close();
		} else {
			imgError = "請上傳照片";
			System.out.println("請上傳照片");
		}

		String coachNo = req.getParameter("coachNo");
		CoachVO coachVO = new CoachVO();
		coachVO.setCoachNo(coachNo);

		if (nameError == null && addressError == null && pplLimitError == null && priceError == null
				&& timeError == null && textError == null && imgError == null) {
			CourseVO courseVO = new CourseVO();
			courseVO.setCourseName(courseName);
			courseVO.setSportTypeVO(sportTypeVO);
			courseVO.setCourseAddress(courseAddress);
			courseVO.setCoursePplLimit(coursePplLimit);
			courseVO.setCoursePrice(coursePrice);
			courseVO.setCourseStartTime(courseStartTime);
			courseVO.setCourseEndTime(courseEndTime);
			courseVO.setCourseText(courseText);
			courseVO.setCourseStat(courseStat);
			courseVO.setCourseImg(upFiles1);
			courseVO.setCoachVO(coachVO);

			courseSvc.insert(courseVO);

			// 上架通知寫入教練消息
			CoachNewsVO coachNewsVO = new CoachNewsVO();
			coachNewsVO.setCoachNo(coachNo);
			coachNewsVO.setNewsSubj("上架課程通知");
			coachNewsVO.setNewsText("您以上架- " + courseName + " 課程，請至「課程管理」查看詳細資訊");
			coachNewsVO.setNewsTime(new java.sql.Timestamp(System.currentTimeMillis()));
			coachNewsSvc.add(coachNewsVO);

			res.setContentType("text/html; charset=UTF-8");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/course/listAllCourses_datatable.jsp");
			dispatcher.forward(req, res);
		} else {

			// 錯誤訊息
			req.setAttribute("nameError", nameError);
			req.setAttribute("addressError", addressError);
			req.setAttribute("pplLimitError", pplLimitError);
			req.setAttribute("priceError", priceError);
			req.setAttribute("timeError", timeError);
			req.setAttribute("textError", textError);
			req.setAttribute("imgError", imgError);

			// 保留填入資訊
			CourseVO courseVO = new CourseVO();
			courseVO.setCourseName(courseName);
			courseVO.setSportTypeVO(sportTypeVO);
			courseVO.setCourseAddress(courseAddress);
			courseVO.setCoursePplLimit(coursePplLimit);
			courseVO.setCoursePrice(coursePrice);
			courseVO.setCourseStartTime(courseStartTime);
			courseVO.setCourseEndTime(courseEndTime);
			courseVO.setCourseText(courseText);
			courseVO.setCourseStat(courseStat);
			courseVO.setCourseImg(upFiles1);
			courseVO.setCoachVO(coachVO);

			req.setAttribute("courseVO", courseVO);

			res.setContentType("text/html; charset=UTF-8");
			RequestDispatcher dispatcher = req.getRequestDispatcher("/course/addCourse.jsp");
			dispatcher.forward(req, res);
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

}
