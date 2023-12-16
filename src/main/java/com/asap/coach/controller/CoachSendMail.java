package com.asap.coach.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.activation.DataSource;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.asap.coach.entity.CoachVO;
import com.asap.coach.service.CoachService;
import com.asap.coach.service.CoachService_interface;
import com.asap.util.JavaMail;
import com.asap.util.MailFormat;

import redis.clients.jedis.Jedis;

@WebServlet("/CoachSendMail")
public class CoachSendMail extends HttpServlet {

//	private CoachService_interface coachSvc;

//	@Override
//	public void init() throws ServletException {
//		coachSvc = new CoachService();
//
//	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		res.setContentType("application/json;charset=UTF-8");
		// 驗證Email
		if ("verifyEmail".equals(action)) {

			// 取得參數
			String coachEmail = req.getParameter("coachEmail");
			System.out.println("SendMail收到:" + coachEmail);
			String coachNo = req.getParameter("coachNo");
			System.out.println("SendMail收到:" + coachNo);
			String coachName = req.getParameter("coachName");
			System.out.println("SendMail收到:" + coachName);
//			CoachVO cVo = coachSvc.findByCoachEmail(coachEmail);

			// 產生信件內容
			String code = returnAuthCode();
			int minute = 15;
			String title = "ASAP帳號驗證信";
			String content = "您的Email帳號驗證碼為  " + code + "  ,請於 " + minute + " 分鐘內輸入，謝謝。";
			MailFormat mailFormat = new MailFormat(coachName, content);
			InputStream in = getServletContext().getResourceAsStream("/newImg/mailLogo.png");
			DataSource dataSource = new ByteArrayDataSource(in, "application/png");
			// 存入redis
			Jedis jedis = new Jedis("localhost", 6379);
			jedis.set(coachNo, code);
			jedis.expire(coachNo, minute * 60);
			// 寄出信件
			JavaMail mail = new JavaMail(coachEmail, title, mailFormat.getMessageTextAndImg(), dataSource);
			String result = mail.sendMail();
			System.out.println("SendMail : " + result);
			// 返回物件
			JSONObject json = new JSONObject();
			json.put("result", result);

			// 關閉redis
			jedis.close();
			// 轉換json
			String output = json.toString();
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;
		}
	}

	private static String returnAuthCode() {
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i <= 8; i++) {
			int condition = (int) (Math.random() * 3) + 1;
			switch (condition) {
			case 1:
				char c1 = (char) ((int) (Math.random() * 26) + 65);
				sb.append(c1);
				break;
			case 2:
				char c2 = (char) ((int) (Math.random() * 26) + 97);
				sb.append(c2);
				break;
			case 3:
				sb.append((int) (Math.random() * 10));
			}
		}
		return sb.toString();
	}

}
