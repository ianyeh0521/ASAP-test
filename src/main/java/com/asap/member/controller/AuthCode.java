package com.asap.member.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AuthCode")
public class AuthCode extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("image/gif");
		int width = 150;
		int height = 40;

		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
		Graphics2D g = image.createGraphics();
		// 繪製背景
		g.setColor(Color.WHITE);
		g.drawRect(0, 0, width, height);
		// 產生驗證碼存入session
		String verificationCode = getAuthCode();
		HttpSession session = req.getSession();
		session.setAttribute("verificationCode", verificationCode);
		// 繪製驗證碼
		int x = 8;

		g.setFont(new Font("BlacklightD", Font.BOLD, 28));
		for (char ch : verificationCode.toCharArray()) {

			g.setColor(getRGBColor());
			int angle = (int) (Math.random() * 60 - 30);
			double theta = angle * Math.PI / 180;
			g.rotate(theta, x, 30);
			g.drawString(String.valueOf(ch), x, 30);
			g.rotate(-theta, x, 30);
			x += 20;
		}
		// 繪製干擾線
		int x1, x2, y1, y2;

		for (int i = 0; i < 30; i++) {
			g.setColor(getRGBColor());
			x1 = (int) (Math.random() * width);
			x2 = (int) (Math.random() * 100);
			y1 = (int) (Math.random() * height);
			y2 = (int) (Math.random() * 100);
			g.drawLine(x1, y1, x1 + x2, y1 + y2);
		}

		g.dispose();
		ImageIO.write(image, "gif", res.getOutputStream());
	}

	private static String getAuthCode() {
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i <= 6; i++) {
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

	private static Color getRGBColor() {
		Random random = new Random();
		Color color = new Color(50 + random.nextInt(150), 50 + random.nextInt(150), 50 + random.nextInt(150));
		return color;
	}

}
