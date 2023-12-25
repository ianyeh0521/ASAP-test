package com.asap.shop.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONObject;

import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.asap.shop.entity.ItemImgVO;
import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ItemSizeVO;
import com.asap.shop.entity.ItemStatVO;
import com.asap.shop.entity.ItemTypeVO;
import com.asap.shop.entity.OrderDetailVO;
import com.asap.shop.entity.OrderVO;
import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;
import com.asap.shop.service.OrderDetailService;
import com.asap.shop.service.OrderDetailService_interface;
import com.asap.shop.service.OrderService;
import com.asap.shop.service.OrderService_interface;

@WebServlet("/shop/SellerOrder.do")
//@MultipartConfig(fileSizeThreshold = 2 * 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 5 * 1024
//		* 1024)
public class SellerOrderController extends HttpServlet {

	private MemberService_interface memberSvc;
	private OrderService_interface orderSvc;
	private OrderDetailService_interface orderDetailSvc;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	@Override
	public void init() throws ServletException {
		orderSvc = new OrderService();
		orderDetailSvc = new OrderDetailService();
		memberSvc = new MemberService();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		String mbrNo = req.getParameter("mbrNo");
		res.setContentType("application/json;charset=UTF-8");

		// 取得datatable資料
		if ("getOrder".equals(action)) {

			// 設定json
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			// 取得所有商品
			List<OrderDetailVO> orderDetailList = orderDetailSvc.findByMbrNo(mbrNo);

			if (orderDetailList != null && !(orderDetailList.isEmpty())) {

				for (OrderDetailVO orderDetailVo : orderDetailList) {
					int orderNo = orderDetailVo.getOrderNo();
					OrderVO orderVo = orderSvc.findByPK(orderNo);
					int orderStat = orderVo.getOrderStat();
					// 排除待付款、已取消
					if (orderStat != 0 && orderStat != 4) {
						// 設置每筆訂單
						JSONObject item = new JSONObject();
						item.put("OrderDetailNo", orderDetailVo.getOrderDetailNo());
						item.put("ItemNo", orderDetailVo.getItemInfoVO().getItemNo());
						item.put("ItemName", orderDetailVo.getItemInfoVO().getItemName());
						item.put("OrderNo", orderVo.getOrderNo());
						item.put("OrderCrtTime", sdf.format(orderVo.getOrderCrtTime()));
						item.put("ItemOrderQty", orderDetailVo.getItemOrderQty());
						item.put("ItemOrderPrice", orderDetailVo.getItemOrderPrice());
						item.put("DelyStat", orderDetailVo.isDelyStat() ? "已出貨" : "未出貨");

						// 收件資訊
						item.put("RcvrName", orderVo.getRcvrName());
						item.put("RcvrEmail", orderVo.getRcvrEmail());
						item.put("RcvrPhone", orderVo.getRcvrPhone());
						item.put("RcvrAddr", orderVo.getRcvrAddr());

						// 放入商品列表
						array.put(item);
					}
				}

			}
			json.put("data", array);

			// 轉換json
			String output = json.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		// 出貨
		if ("changeDelyStat".equals(action)) {

			// 設定json
			JSONObject json = new JSONObject();
			// 取得參數
			String orderDetailNo = req.getParameter("OrderDetailNo");
			// 設定vo
			OrderDetailVO orderDetailvo = orderDetailSvc.findByPK(Integer.parseInt(orderDetailNo));

			// 修改vo
			orderDetailvo.setDelyStat(true);
			// 修改資料庫
			int resultInt = orderDetailSvc.update(orderDetailvo);

			// 檢查訂單狀況是否全部出貨
			int orderNo = orderDetailvo.getOrderNo();
			List<OrderDetailVO> orderDetailVos = orderDetailSvc.findByOrderNo(orderNo);
			int status = 0;
			for (OrderDetailVO vo : orderDetailVos) {
				if (vo.isDelyStat()) {
					status++;
				}
			}

			if (status == orderDetailVos.size()) {
				OrderVO orderVo = orderSvc.findByPK(orderNo);
				orderVo.setOrderStat(2);
				orderSvc.update(orderVo);
			}
			// 設定返回
			if (resultInt == 1) {
				json.put("result", "success");
			} else {
				json.put("result", "fail");
			}

			// 轉換json
			String output = json.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		// 取得評論datatable資料
		if ("getOrderCmt".equals(action)) {

			// 設定json
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			// 取得所有商品
			List<OrderDetailVO> orderDetailList = orderDetailSvc.findByMbrNo(mbrNo);

			if (orderDetailList != null && !(orderDetailList.isEmpty())) {

				for (OrderDetailVO orderDetailVo : orderDetailList) {
//					int orderNo = orderDetailVo.getOrderNo();
					Integer itemScore = orderDetailVo.getCmtScore();
//					OrderVO orderVo = orderSvc.findByPK(orderNo);
//					int orderStat = orderVo.getOrderStat();
					// 排除未評分
					if (itemScore != null) {
						// 設置每筆商品評分
						JSONObject item = new JSONObject();
						item.put("OrderDetailNo", orderDetailVo.getOrderDetailNo());
						item.put("ItemNo", orderDetailVo.getItemInfoVO().getItemNo());
						item.put("ItemName", orderDetailVo.getItemInfoVO().getItemName());
						item.put("CmtScore", itemScore);
						item.put("CmtTextStat", orderDetailVo.getCmtText() != null ? "已評論" : "未評論");
						item.put("CmtTime", sdf.format(orderDetailVo.getCmtTime()));
						item.put("CmtReTextStat", orderDetailVo.getCmtReText() != null ? "已回覆" : "未回覆");
						item.put("CmtReTime",
								orderDetailVo.getCmtReTime() != null ? sdf.format(orderDetailVo.getCmtReTime()) : "");

						item.put("CmtText", orderDetailVo.getCmtText() != null ? orderDetailVo.getCmtText() : "");
						item.put("CmtReText", orderDetailVo.getCmtReText() != null ? orderDetailVo.getCmtReText() : "");

						// 放入商品列表
						array.put(item);
					}
				}

			}
			json.put("data", array);

			// 轉換json
			String output = json.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;

		}

		// 回覆評論
		if ("addReCmt".equals(action)) {
			// 設定json
			JSONObject json = new JSONObject();
			// 取得參數
			String orderDetailNo = req.getParameter("OrderDetailNo");
			String reCmt = req.getParameter("reCmt");

			// 檢查參數
			if (reCmt == null || reCmt.trim().length() == 0) {
				json.put("result", "fail");
				// 轉換json
				String output = json.toString();

				// 輸出
				PrintWriter out = res.getWriter();
				out.print(output);
				out.flush();
				return;
			}

			// 設定vo
			OrderDetailVO orderDetailvo = orderDetailSvc.findByPK(Integer.parseInt(orderDetailNo));

			// 修改vo
			orderDetailvo.setCmtReText(reCmt.trim());
			orderDetailvo.setCmtReTime(new java.sql.Timestamp(System.currentTimeMillis()));
			// 修改資料庫
			int resultInt = orderDetailSvc.update(orderDetailvo);

			// 設定返回
			if (resultInt == 1) {
				json.put("result", "success");
				json.put("CmtReText", orderDetailvo.getCmtReText());
				json.put("CmtReTime", sdf.format(orderDetailvo.getCmtReTime()));
			} else {
				json.put("result", "fail");
			}

			// 轉換json
			String output = json.toString();

			// 輸出
			PrintWriter out = res.getWriter();
			out.print(output);
			out.flush();
			return;
		}

	}
}
