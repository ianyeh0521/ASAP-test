package com.asap.shop.controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.asap.coach.entity.CoachVO;
import com.asap.shop.entity.ItemImgVO;
import com.asap.shop.service.ItemImgService;
import com.asap.shop.service.ItemImgService_interface;

@WebServlet("/ItemGifReader")
public class ItemGifReader extends HttpServlet {

	private ItemImgService_interface imgService;

	@Override
	public void init() throws ServletException {
		imgService = new ItemImgService();
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

		if ("getItemImg".equals(action)) {
			String itemImgNo = req.getParameter("itemImgNo");

			try {
				if(!itemImgNo.equals(" ")) {
					ItemImgVO iVo = imgService.findByPK(Integer.parseInt(itemImgNo));
					out.write(iVo.getItemImg());
				}else {
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
