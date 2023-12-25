package com.asap.backstage.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.coach.entity.CoachVO;
import com.asap.coach.entity.SportCertVO;
import com.asap.coach.service.CoachService;
import com.asap.coach.service.CoachService_interface;
import com.asap.coach.service.SportCertService;
import com.asap.coach.service.SportCertService_interface;

@WebServlet("/GifReader")
public class GifReader extends HttpServlet {

	private CoachService_interface cService;
	private SportCertService_interface sportCertService;
	@Override
	public void init() throws ServletException {
		cService = new CoachService();
		sportCertService = new SportCertService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		String action = req.getParameter("action");

		if ("getCoachImg".equals(action)) {
			String coachNo = req.getParameter("coachNo");

			try {
				if (coachNo != null) {
					CoachVO cVo = cService.findByPK(coachNo);
					out.write(cVo.getCoachImg());
				} else {
					InputStream in = getServletContext().getResourceAsStream("/NoData/nopic.jpg");
					byte[] buf = in.readAllBytes();
					out.write(buf);
					in.close();
				}

			} catch (Exception e) {
				InputStream in = getServletContext().getResourceAsStream("/NoData/nopic.jpg");
				byte[] buf = in.readAllBytes();
				out.write(buf);
				in.close();

			}
			return;
		}
		
		if ("getCoachCertImg".equals(action)) {
			String certImgNo = req.getParameter("certImgNo");

			try {
				if (!certImgNo.equals(" ")) {
					SportCertVO sVo = sportCertService.findByPK(Integer.parseInt(certImgNo));
					out.write(sVo.getSportCertImg());
				} else {
					InputStream in = getServletContext().getResourceAsStream("/NoData/nopic.jpg");
					byte[] buf = in.readAllBytes();
					out.write(buf);
					in.close();
				}

			} catch (Exception e) {
				InputStream in = getServletContext().getResourceAsStream("/NoData/nopic.jpg");
				byte[] buf = in.readAllBytes();
				out.write(buf);
				in.close();

			}
			return;
		}
	}

}
