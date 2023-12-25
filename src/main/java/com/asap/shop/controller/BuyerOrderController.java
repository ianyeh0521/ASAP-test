package com.asap.shop.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import net.bytebuddy.dynamic.DynamicType.Builder.InnerTypeDefinition;

@WebServlet("/shop/BuyerOrder.do")
//@MultipartConfig(fileSizeThreshold = 2 * 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 5 * 1024
//		* 1024)
public class BuyerOrderController extends HttpServlet {

	private MemberService_interface memberSvc;
	private OrderService_interface orderSvc;
	private OrderDetailService_interface orderDetailSvc;
//	private ItemInfoService_interface itemInfoSvc;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	@Override
	public void init() throws ServletException {
		orderSvc = new OrderService();
		orderDetailSvc = new OrderDetailService();
		memberSvc = new MemberService();
//		itemInfoSvc = new ItemInfoService();
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

		// 取得datatable資料
		if ("getOrder".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
			// 設定json
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			// 取得所有商品
			List<OrderVO> orderList = orderSvc.findByMbrNo(mbrNo);

			if (orderList != null && !(orderList.isEmpty())) {

				for (OrderVO orderVo : orderList) {

					// 排除待付款和已取消
					if (orderVo.getOrderStat() != 0 && orderVo.getOrderStat() != 4) {
						// 設置每筆訂單
						JSONObject item = new JSONObject();
						item.put("OrderNo", orderVo.getOrderNo());
						item.put("OrderPrice", orderVo.getOrderPrice());
						item.put("OrderCrtTime", sdf.format(orderVo.getOrderCrtTime()));

						// 收件資訊
						item.put("RcvrName", orderVo.getRcvrName());
						item.put("RcvrEmail", orderVo.getRcvrEmail());
						item.put("RcvrPhone", orderVo.getRcvrPhone());
						item.put("RcvrAddr", orderVo.getRcvrAddr());

						// 訂單狀態
						switch (orderVo.getOrderStat()) {
						case 1: {
							item.put("OrderStat", "待出貨");
							break;
						}
						case 2: {
							item.put("OrderStat", "待收貨");
							break;
						}
						case 3: {
							item.put("OrderStat", "已完成");
							break;
						}
						}

						// 訂單明細
						StringBuffer orderDetail = new StringBuffer("");

						List<OrderDetailVO> orderDetailList = orderDetailSvc.findByOrderNo(orderVo.getOrderNo());

						if (orderDetailList != null && !(orderDetailList.isEmpty())) {
							int cmtNum = 0;
							int delyNum = 0;
							for (OrderDetailVO orderDetailVo : orderDetailList) {
								int itemNo = orderDetailVo.getItemInfoVO().getItemNo();
								String itemName = orderDetailVo.getItemInfoVO().getItemName();
								int orderNum = orderDetailVo.getItemOrderQty();
								int orderPrice = orderDetailVo.getItemOrderPrice();
								String orderStat = orderDetailVo.isDelyStat() ? "已出貨" : "未出貨";
								orderDetail.append("<tr><td>" + itemNo + "</td><td>" + itemName + "</td><td>" + orderNum
										+ "</td><td>" + orderPrice + "</td><td>" + orderStat + "</td></tr>");
								// 查看評論
								if (!orderDetailVo.isDelyStat()) {
									delyNum++;// 有未出貨的就加一
								}
								if (orderDetailVo.getCmtScore() != null) {
									cmtNum++;
								}
							}
							item.put("orderDetail", orderDetail.toString());
							// 評論狀態
							if (delyNum > 0) {
								item.put("CmtStat", "尚未到貨");
							} else {
								if (cmtNum == orderDetailList.size()) {
									item.put("CmtStat", "評論完成");
								} else {
									item.put("CmtStat", "評論未完成");
								}
							}
						}
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

		// 確認收貨
		if ("changeOrderStat".equals(action)) {
			res.setContentType("application/json;charset=UTF-8");
			// 設定json
			JSONObject json = new JSONObject();
			// 取得參數
			String orderNo = req.getParameter("OrderNo");
			// 設定vo
			OrderVO orderVo = orderSvc.findByPK(Integer.parseInt(orderNo));

			// 修改vo
			orderVo.setOrderStat(3);
			// 修改資料庫
			int resultInt = orderSvc.update(orderVo);

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

		// 新增評論
		if ("addOrderCmt".equals(action)) {
			res.setContentType("text/html;charset=UTF-8");
			// 取參數
			String orderNo = req.getParameter("OrderNo");
			String cmtStat = req.getParameter("CmtStat");
			HttpSession session = req.getSession();
			// 尋找商品vo
			List<OrderDetailVO> orderDetailVos = orderDetailSvc.findByOrderNo(Integer.parseInt(orderNo));
			ArrayList<OrderDetailVO> unCmtItems = new ArrayList<>();
			ArrayList<OrderDetailVO> CmtItems = new ArrayList<>();

			if ("評論完成".equals(cmtStat)) {
				// 放入session
				session.setAttribute("orderNo", orderNo);
				session.setAttribute("CmtItems", orderDetailVos);
				session.setAttribute("unCmtItems", unCmtItems);

			} else {
				// 分已評分和未評分
				for (OrderDetailVO vo : orderDetailVos) {
					if (vo.getCmtScore() == null) {
						unCmtItems.add(vo);
					} else {
						CmtItems.add(vo);
					}
				}
				// 放入session
				session.setAttribute("orderNo", orderNo);
				session.setAttribute("CmtItems", CmtItems);
				session.setAttribute("unCmtItems", unCmtItems);
			}

			// 轉發
			res.sendRedirect(req.getContextPath() + "/shop/ItemComment.jsp");
			return;
		}

		// 取消評論
		if ("cancelCmt".equals(action)) {
			// 移除session中屬性
			HttpSession session = req.getSession();
			session.removeAttribute("orderNo");
			session.removeAttribute("CmtItems");
			session.removeAttribute("unCmtItems");

			// 轉發
			res.sendRedirect(req.getContextPath() + "/shop/BuyerOrderManage.jsp");
			return;
		}

		// 確認評論
		if ("saveCmt".equals(action)) {
			// 取得參數
			Map<String, String[]> paraMap = req.getParameterMap();
			Map<String, String> query = new HashMap<>();
			Set<Map.Entry<String, String[]>> entry = paraMap.entrySet();

			// 整理資料
			for (Map.Entry<String, String[]> row : entry) {
				String key = row.getKey();
				// 因為請求參數裡包含了action、mbrNo，做個去除動作
				if ("action".equals(key) || "mbrNo".equals(key)) {
					continue;
				}
				// 若是value為空即代表沒有查詢條件，做個去除動作
				String value = row.getValue()[0];
				if (value.isEmpty() || value == null) {
					continue;
				}
//				System.out.println(key);
//				System.out.println(value);
				query.put(key, value);
			}
            
		
			// 更新資料庫
			if (!query.isEmpty()) {
				for (Map.Entry<String, String> row : query.entrySet()) {
					String rowKey = row.getKey();
					String rowVal = row.getValue();
					// 分數
					if (rowKey.startsWith("productRate")) {
						
						int orderDetailNo = Integer.parseInt(rowKey.substring(11));
						int score = Integer.parseInt(rowVal);
						OrderDetailVO vo = orderDetailSvc.findByPK(orderDetailNo);

						// 設置vo
						vo.setCmtScore(score);
						vo.setCmtTime(new java.sql.Timestamp(System.currentTimeMillis()));
						orderDetailSvc.update(vo);
						// 更新賣家評分
						String sellerNo = vo.getMbrNo();
						memberSvc.addCmtByMbrNo(score, sellerNo);
					}
					// 評論
					if (rowKey.startsWith("productText")) {

						int orderDetailNo = Integer.parseInt(rowKey.substring(11));
						OrderDetailVO vo = orderDetailSvc.findByPK(orderDetailNo);

						// 設置vo
						vo.setCmtText(rowVal);
						vo.setCmtTime(new java.sql.Timestamp(System.currentTimeMillis()));
						orderDetailSvc.update(vo);

					}
				}
			}

			HttpSession session = req.getSession();

			// 移除session中屬性
			session.removeAttribute("orderNo");
			session.removeAttribute("CmtItems");
			session.removeAttribute("unCmtItems");

			// 轉發
			res.sendRedirect(req.getContextPath() + "/shop/BuyerOrderManage.jsp");
			return;
		}

	}
}
