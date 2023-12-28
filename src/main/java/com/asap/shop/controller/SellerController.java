package com.asap.shop.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.JSONArray;
import org.json.JSONObject;

import com.asap.member.entity.MemberVO;
import com.asap.member.service.MemberService;
import com.asap.member.service.MemberService_interface;
import com.asap.shop.entity.ItemImgVO;
import com.asap.shop.entity.ItemInfoVO;
import com.asap.shop.entity.ItemSizeVO;
import com.asap.shop.entity.ItemStatVO;
import com.asap.shop.entity.ItemTypeVO;
import com.asap.shop.service.ItemImgService;
import com.asap.shop.service.ItemImgService_interface;
import com.asap.shop.service.ItemInfoService;
import com.asap.shop.service.ItemInfoService_interface;

@WebServlet("/shop/Seller.do")
@MultipartConfig(fileSizeThreshold = 2 * 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 10 * 5 * 1024
		* 1024)
public class SellerController extends HttpServlet {

	private ItemInfoService_interface itemInfoSvc;
	private ItemImgService_interface itemImgSvc;
	private MemberService_interface memberSvc;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	@Override
	public void init() throws ServletException {
		itemInfoSvc = new ItemInfoService();
		itemImgSvc = new ItemImgService();
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

		// 發布新商品功能
		if ("publish".equals(action)) {

			res.setContentType("text/html; charset=UTF-8");

			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取值
			String itemName = req.getParameter("itemName");
			String itemDescript = req.getParameter("itemDescript");
			String itemStat = req.getParameter("itemStat");
			String itemType = req.getParameter("itemType");
			String itemSize = req.getParameter("itemSize");
			String itemPrice = req.getParameter("itemPrice");
			String itemQuantity = req.getParameter("itemQuantity");
			Part coverPic = req.getPart("coverPic");
			Part itemPic1 = req.getPart("itemPic1");
			Part itemPic2 = req.getPart("itemPic2");
			Part itemPic3 = req.getPart("itemPic3");
			// 設定返回值
			req.setAttribute("itemName", itemName);
			req.setAttribute("itemDescript", itemDescript);
			req.setAttribute("itemPrice", itemPrice);
			req.setAttribute("itemQuantity", itemQuantity);
			// 驗證資料
			if (itemName == null || itemName.trim().length() == 0) {
				errorMsgs.add("請輸入商品名稱");
			}

			if (itemDescript == null || itemDescript.trim().length() == 0) {
				errorMsgs.add("請輸入商品簡介");
			}

			if ("請選擇".equals(itemStat)) {
				errorMsgs.add("請選擇商品狀況");
			}

			if ("請選擇".equals(itemType)) {
				errorMsgs.add("請選擇商品分類");
			}

			if ("請選擇".equals(itemSize)) {
				errorMsgs.add("請選擇商品尺寸");
			}

			if (itemPrice == null || itemPrice.trim().length() == 0) {
				errorMsgs.add("請輸入商品價格");
				if (Integer.parseInt(itemPrice) <= 0) {
					errorMsgs.add("商品價格需為正數");
				}
			}

			if (itemQuantity == null || itemQuantity.trim().length() == 0) {
				errorMsgs.add("請輸入商品數量");
				if (Integer.parseInt(itemQuantity) <= 0) {
					errorMsgs.add("商品數量需為正數");
				}
			}

			InputStream coverPicIn = coverPic.getInputStream();
			if (coverPicIn.available() == 0) {
				errorMsgs.add("請上傳封面照");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/shop/AddItem.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 設置vo
			ItemInfoVO itemVo = new ItemInfoVO();

			itemVo.setItemName(itemName.trim());
			itemVo.setMbrNo(mbrNo);
			itemVo.setItemText(itemDescript.trim());
			itemVo.setItemStockQty(Integer.parseInt(itemQuantity));
			itemVo.setItemPrice(Integer.parseInt(itemPrice));
			itemVo.setPreItemPrice(Integer.parseInt(itemPrice));
			itemVo.setItemView(0);
			itemVo.setItemAddStat(0);

			ItemTypeVO itemTypeVo = new ItemTypeVO();
			itemTypeVo.setItemTypeNo(Integer.parseInt(itemType));
			itemVo.setItemTypeVO(itemTypeVo);

			ItemStatVO itemStatVo = new ItemStatVO();
			itemStatVo.setItemStatNo(Integer.parseInt(itemStat));
			itemVo.setItemStatVO(itemStatVo);

			ItemSizeVO itemSizeVo = new ItemSizeVO();
			itemSizeVo.setItemSizeNo(Integer.parseInt(itemSize));
			itemVo.setItemSizeVO(itemSizeVo);

			// 送進資料庫
			int itemNo = itemInfoSvc.insert(itemVo);

			if (itemNo != -1) {
				// 設置商品圖片
				ItemImgVO imgVo = new ItemImgVO();
				byte[] coverPicFile = coverPicIn.readAllBytes();
				coverPicIn.close();
				imgVo.setItemNo(itemNo);
				imgVo.setItemImg(coverPicFile);
				imgVo.setItemImgfront(true);
				// 送進資料庫
				itemImgSvc.insert(imgVo);

				InputStream itemPic1In = itemPic1.getInputStream();
				if (itemPic1In.available() != 0) {
					byte[] itemPic1File = itemPic1In.readAllBytes();
					itemPic1In.close();
					// 設置商品圖片
					ItemImgVO imgVo1 = new ItemImgVO();
					imgVo1.setItemNo(itemNo);
					imgVo1.setItemImg(itemPic1File);
					imgVo1.setItemImgfront(false);
					// 送進資料庫
					itemImgSvc.insert(imgVo1);
				}

				InputStream itemPic2In = itemPic2.getInputStream();
				if (itemPic2In.available() != 0) {
					byte[] itemPic2File = itemPic2In.readAllBytes();
					itemPic2In.close();
					// 設置商品圖片
					ItemImgVO imgVo2 = new ItemImgVO();
					imgVo2.setItemNo(itemNo);
					imgVo2.setItemImg(itemPic2File);
					imgVo2.setItemImgfront(false);
					// 送進資料庫
					itemImgSvc.insert(imgVo2);
				}

				InputStream itemPic3In = itemPic3.getInputStream();
				if (itemPic3In.available() != 0) {
					byte[] itemPic3File = itemPic3In.readAllBytes();
					itemPic3In.close();
					// 設置商品圖片
					ItemImgVO imgVo3 = new ItemImgVO();
					imgVo3.setItemNo(itemNo);
					imgVo3.setItemImg(itemPic3File);
					imgVo3.setItemImgfront(false);
					// 送進資料庫
					itemImgSvc.insert(imgVo3);
				}
			}
			res.sendRedirect(req.getContextPath() + "/shop/ItemManage.jsp");
			return;// 程式中斷
		}

		// 儲存草稿功能
		if ("save".equals(action)) {

			res.setContentType("text/html; charset=UTF-8");

			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			// 取值
			String itemName = req.getParameter("itemName");
			String itemDescript = req.getParameter("itemDescript");
			String itemStat = req.getParameter("itemStat");
			String itemType = req.getParameter("itemType");
			String itemSize = req.getParameter("itemSize");
			String itemPrice = req.getParameter("itemPrice");
			String itemQuantity = req.getParameter("itemQuantity");
			Part coverPic = req.getPart("coverPic");
			Part itemPic1 = req.getPart("itemPic1");
			Part itemPic2 = req.getPart("itemPic2");
			Part itemPic3 = req.getPart("itemPic3");

			// 設置vo
			ItemInfoVO itemVo = new ItemInfoVO();
			itemVo.setMbrNo(mbrNo);

			// 驗證資料
			if (itemName == null || itemName.trim().length() == 0) {
				errorMsgs.add("請輸入商品名稱");
				req.getRequestDispatcher("/shop/AddItem.jsp").forward(req, res);
				return;// 程式中斷
			} else {
				itemVo.setItemName(itemName.trim());
			}

			if (itemDescript == null || itemDescript.trim().length() == 0) {
				itemVo.setItemText(" ");
			} else {
				itemVo.setItemText(itemDescript.trim());
			}

			ItemStatVO itemStatVo = new ItemStatVO();
			if ("請選擇".equals(itemStat)) {
				itemStatVo.setItemStatNo(1);// 預設為全新狀態
			} else {
				itemStatVo.setItemStatNo(Integer.parseInt(itemStat));
			}
			itemVo.setItemStatVO(itemStatVo);

			ItemTypeVO itemTypeVo = new ItemTypeVO();
			if ("請選擇".equals(itemType)) {
				itemTypeVo.setItemTypeNo(11);// 預設為其他類別
			} else {
				itemTypeVo.setItemTypeNo(Integer.parseInt(itemType));

			}
			itemVo.setItemTypeVO(itemTypeVo);

			ItemSizeVO itemSizeVo = new ItemSizeVO();
			if ("請選擇".equals(itemSize)) {
				itemSizeVo.setItemSizeNo(1);// 預設為無尺寸
			} else {
				itemSizeVo.setItemSizeNo(Integer.parseInt(itemSize));

			}
			itemVo.setItemSizeVO(itemSizeVo);

			if (itemPrice == null || itemPrice.trim().length() == 0) {
				itemVo.setItemPrice(0);// 預設為0
				itemVo.setPreItemPrice(0);
			} else {

				if (Integer.parseInt(itemPrice) <= 0) {
					itemVo.setItemPrice(Integer.parseInt(itemPrice));
					itemVo.setPreItemPrice(Integer.parseInt(itemPrice));
				} else {
					itemVo.setItemPrice(0);// 預設為0
					itemVo.setPreItemPrice(0);
				}
			}

			if (itemQuantity == null || itemQuantity.trim().length() == 0) {
				itemVo.setItemStockQty(0);// 預設為0

			} else {
				if (Integer.parseInt(itemQuantity) <= 0) {
					itemVo.setItemStockQty(Integer.parseInt(itemQuantity));
				} else {
					itemVo.setItemStockQty(0);// 預設為0
				}
			}

			itemVo.setItemView(0);
			itemVo.setItemAddStat(1);// 草稿

			// 送進資料庫
			int itemNo = itemInfoSvc.insert(itemVo);

			if (itemNo != -1) {

				InputStream coverPicIn = coverPic.getInputStream();
				if (coverPicIn.available() != 0) {
					byte[] coverPicFile = coverPicIn.readAllBytes();
					coverPicIn.close();
					// 設置商品圖片
					ItemImgVO imgVo = new ItemImgVO();
					imgVo.setItemNo(itemNo);
					imgVo.setItemImg(coverPicFile);
					imgVo.setItemImgfront(true);
					// 送進資料庫
					itemImgSvc.insert(imgVo);
				}

				InputStream itemPic1In = itemPic1.getInputStream();
				if (itemPic1In.available() != 0) {
					byte[] itemPic1File = itemPic1In.readAllBytes();
					itemPic1In.close();
					// 設置商品圖片
					ItemImgVO imgVo1 = new ItemImgVO();
					imgVo1.setItemNo(itemNo);
					imgVo1.setItemImg(itemPic1File);
					imgVo1.setItemImgfront(false);
					// 送進資料庫
					itemImgSvc.insert(imgVo1);
				}

				InputStream itemPic2In = itemPic2.getInputStream();
				if (itemPic2In.available() != 0) {
					byte[] itemPic2File = itemPic2In.readAllBytes();
					itemPic2In.close();
					// 設置商品圖片
					ItemImgVO imgVo2 = new ItemImgVO();
					imgVo2.setItemNo(itemNo);
					imgVo2.setItemImg(itemPic2File);
					imgVo2.setItemImgfront(false);
					// 送進資料庫
					itemImgSvc.insert(imgVo2);
				}

				InputStream itemPic3In = itemPic3.getInputStream();
				if (itemPic3In.available() != 0) {
					byte[] itemPic3File = itemPic3In.readAllBytes();
					itemPic3In.close();
					// 設置商品圖片
					ItemImgVO imgVo3 = new ItemImgVO();
					imgVo3.setItemNo(itemNo);
					imgVo3.setItemImg(itemPic3File);
					imgVo3.setItemImgfront(false);
					// 送進資料庫
					itemImgSvc.insert(imgVo3);
				}
			}
			res.sendRedirect(req.getContextPath() + "/shop/ItemManage.jsp");
			return;// 程式中斷
		}

		// 更新賣家介紹
		if ("updateSellerIntro".equals(action)) {

			res.setContentType("text/html; charset=UTF-8");

			// 取值
			String introText = req.getParameter("introText");
			// 設置vo
			HttpSession session = req.getSession();
			MemberVO mVo = (MemberVO) session.getAttribute("memberVo");
			if(introText != null && introText.trim().length() != 0) {
				mVo.setSellerIntro(introText.trim());
			}
			
			// 與資料庫溝通
			memberSvc.updateMen(mVo);
			session.setAttribute("memberVo", mVo);
			res.sendRedirect(req.getContextPath() + "/shop/ItemManage.jsp");
			return;
		}

		// 取得datatable資料
		if ("getItem".equals(action)) {

			res.setContentType("application/json;charset=UTF-8");

			// 設定json
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();

			// 取得所有商品
			List<ItemInfoVO> itemList = itemInfoSvc.findbyMbrNo(mbrNo);

			if (itemList != null && !(itemList.isEmpty())) {

				for (ItemInfoVO itemVo : itemList) {
					// 設置每個商品
					JSONObject item = new JSONObject();
					item.put("ItemNo", itemVo.getItemNo());
					item.put("ItemName", itemVo.getItemName());
					item.put("ItemType", itemVo.getItemTypeVO().getItemTypeName());
					item.put("ItemStat", itemVo.getItemStatVO().getItemStatText());
					item.put("ItemText", itemVo.getItemText());
					item.put("ItemStockQty", itemVo.getItemStockQty());
					item.put("ItemPrice", itemVo.getItemPrice());
					item.put("ItemSize", itemVo.getItemSizeVO().getItemSizeText());
					item.put("ItemView", itemVo.getItemView());

					switch (itemVo.getItemAddStat()) {
					case 0: {
						item.put("ItemAddStat", "已上架");
						break;
					}
					case 1: {
						item.put("ItemAddStat", "草稿");
						break;
					}
					case 2: {
						item.put("ItemAddStat", "已售出");
						break;
					}
					}

					item.put("ItemAddTime", sdf.format(itemVo.getItemAddTime()));
					item.put("ItemUpdTime", sdf.format(itemVo.getItemUpdTime()));

					// 查圖片
					List<ItemImgVO> itemImgList = itemImgSvc.findByItemNo(itemVo.getItemNo());

					if (itemImgList != null && !(itemImgList.isEmpty())) {
						// 排封面照為第一張
						LinkedList<Integer> linkedList = new LinkedList<>();
						for (ItemImgVO imgVo : itemImgList) {
							if (imgVo.getItemImgfront()) {
								linkedList.addFirst(imgVo.getItemImgNo());
							} else {
								linkedList.add(imgVo.getItemImgNo());
							}
						}

						// 放入json
						if (linkedList.size() >= 1) {
							item.put("ItemFrontImg", linkedList.get(0));
						} else {
							item.put("ItemFrontImg", " ");
						}

						if (linkedList.size() >= 2) {
							item.put("ItemImg1", linkedList.get(1));
						} else {
							item.put("ItemImg1", " ");
						}

						if (linkedList.size() >= 3) {
							item.put("ItemImg2", linkedList.get(2));
						} else {
							item.put("ItemImg2", " ");
						}

						if (linkedList.size() >= 4) {
							item.put("ItemImg3", linkedList.get(3));
						} else {
							item.put("ItemImg3", " ");
						}
					} else {
						item.put("ItemFrontImg", " ");
						item.put("ItemImg1", " ");
						item.put("ItemImg2", " ");
						item.put("ItemImg3", " ");
					}
					// 放入商品列表
					array.put(item);
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

		// 修改上架狀態
		if ("changeItemAddStat".equals(action)) {

			res.setContentType("application/json;charset=UTF-8");

			// 設定json
			JSONObject json = new JSONObject();
			// 取得參數
			String itemNo = req.getParameter("ItemNo");
			// 設定vo
			ItemInfoVO infoVO = itemInfoSvc.findByItemNo(Integer.parseInt(itemNo));
			// 修改vo
			infoVO.setItemAddStat(1);
			// 修改資料庫
			int resultInt = itemInfoSvc.update(infoVO);

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
		// 更新商品
		if ("updateItem".equals(action)) {
			res.setContentType("text/html; charset=UTF-8");
			// 取得參數
			String itemNo = req.getParameter("ItemNo");
			// 取得vo
			ItemInfoVO itemInfoVo = itemInfoSvc.findByItemNo(Integer.parseInt(itemNo));
			List<ItemImgVO> itemImgVos = itemImgSvc.findByItemNo(Integer.parseInt(itemNo));
			// 放入session
			HttpSession session = req.getSession();
			session.setAttribute("itemInfoVo", itemInfoVo);
			if (itemImgVos != null && !(itemImgVos.isEmpty())) {
				// 排封面照為第一張
				LinkedList<Integer> linkedList = new LinkedList<>();
				for (ItemImgVO imgVo : itemImgVos) {
					if (imgVo.getItemImgfront()) {
						linkedList.addFirst(imgVo.getItemImgNo());
					} else {
						linkedList.add(imgVo.getItemImgNo());
					}
				}
				// 設定照片編號
				if (linkedList.size() >= 1) {
					session.setAttribute("ItemFrontImg", linkedList.get(0));
				} else {
					session.setAttribute("ItemFrontImg", " ");
				}

				if (linkedList.size() >= 2) {
					session.setAttribute("ItemImg1", linkedList.get(1));
				} else {
					session.setAttribute("ItemImg1", " ");
				}

				if (linkedList.size() >= 3) {
					session.setAttribute("ItemImg2", linkedList.get(2));
				} else {
					session.setAttribute("ItemImg2", " ");
				}

				if (linkedList.size() >= 4) {
					session.setAttribute("ItemImg3", linkedList.get(3));
				} else {
					session.setAttribute("ItemImg3", " ");
				}
			} else {
				session.setAttribute("ItemFrontImg", " ");
				session.setAttribute("ItemImg1", " ");
				session.setAttribute("ItemImg2", " ");
				session.setAttribute("ItemImg3", " ");
			}
			// 轉發
			res.sendRedirect(req.getContextPath() + "/shop/UpdateItem.jsp");
			return;

		}

		// 更新後取消
		if ("updateCancel".equals(action)) {
			res.setContentType("text/html; charset=UTF-8");
			// 移除session中的屬性
			HttpSession session = req.getSession();
			session.removeAttribute("itemInfoVo");
			session.removeAttribute("ItemFrontImg");
			session.removeAttribute("ItemImg1");
			session.removeAttribute("ItemImg2");
			session.removeAttribute("ItemImg3");
			// 轉發
			res.sendRedirect(req.getContextPath() + "/shop/ItemManage.jsp");
			return;
		}

		// 更新後發布
		if ("updatePublish".equals(action)) {
			res.setContentType("text/html; charset=UTF-8");
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取值
			String itemName = req.getParameter("itemName");
			String itemDescript = req.getParameter("itemDescript");
			String itemStat = req.getParameter("itemStat");
			String itemType = req.getParameter("itemType");
			String itemSize = req.getParameter("itemSize");
			String itemPrice = req.getParameter("itemPrice");
			String itemQuantity = req.getParameter("itemQuantity");
			Part coverPic = req.getPart("coverPic");
			Part itemPic1 = req.getPart("itemPic1");
			Part itemPic2 = req.getPart("itemPic2");
			Part itemPic3 = req.getPart("itemPic3");

			// 驗證資料
			if (itemName == null || itemName.trim().length() == 0) {
				errorMsgs.add("請輸入商品名稱");
			}

			if (itemDescript == null || itemDescript.trim().length() == 0) {
				errorMsgs.add("請輸入商品簡介");
			}

			if ("請選擇".equals(itemStat)) {
				errorMsgs.add("請選擇商品狀況");
			}

			if ("請選擇".equals(itemType)) {
				errorMsgs.add("請選擇商品分類");
			}

			if ("請選擇".equals(itemSize)) {
				errorMsgs.add("請選擇商品尺寸");
			}

			if (itemPrice == null || itemPrice.trim().length() == 0) {
				errorMsgs.add("請輸入商品價格");
				if (Integer.parseInt(itemPrice) <= 0) {
					errorMsgs.add("商品價格需為正數");
				}
			}

			if (itemQuantity == null || itemQuantity.trim().length() == 0) {
				errorMsgs.add("請輸入商品數量");
				if (Integer.parseInt(itemQuantity) <= 0) {
					errorMsgs.add("商品數量需為正數");
				}
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/shop/UpdateItem.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 設置vo
			HttpSession session = req.getSession();
			ItemInfoVO itemVo = (ItemInfoVO) session.getAttribute("itemInfoVo");
			//取前次價格
			int preItemPrice = itemVo.getItemPrice();

			itemVo.setItemName(itemName.trim());
			itemVo.setItemText(itemDescript.trim());
			itemVo.setItemStockQty(Integer.parseInt(itemQuantity));
			itemVo.setItemPrice(Integer.parseInt(itemPrice));
			itemVo.setPreItemPrice(preItemPrice);
			itemVo.setItemAddStat(0);

			ItemTypeVO itemTypeVo = itemVo.getItemTypeVO();
			itemTypeVo.setItemTypeNo(Integer.parseInt(itemType));
			itemVo.setItemTypeVO(itemTypeVo);

			ItemStatVO itemStatVo = itemVo.getItemStatVO();
			itemStatVo.setItemStatNo(Integer.parseInt(itemStat));
			itemVo.setItemStatVO(itemStatVo);

			ItemSizeVO itemSizeVo = itemVo.getItemSizeVO();
			itemSizeVo.setItemSizeNo(Integer.parseInt(itemSize));
			itemVo.setItemSizeVO(itemSizeVo);

			// 送進資料庫
			itemInfoSvc.update(itemVo);

			// 設置封面照

			InputStream coverPicIn = coverPic.getInputStream();
			if (coverPicIn.available() != 0) {
				// 刪除舊的
				if (!" ".equals(session.getAttribute("ItemFrontImg"))) {
					ItemImgVO itemFrontImg = itemImgSvc.findByPK((Integer) session.getAttribute("ItemFrontImg"));
					itemImgSvc.delete(itemFrontImg);
				}

				// 新增新的
				byte[] coverPicFile = coverPicIn.readAllBytes();
				coverPicIn.close();
				// 設置商品圖片
				ItemImgVO imgVo = new ItemImgVO();
				imgVo.setItemNo(itemVo.getItemNo());
				imgVo.setItemImg(coverPicFile);
				imgVo.setItemImgfront(true);
				// 送進資料庫
				itemImgSvc.insert(imgVo);
			}

			InputStream itemPic1In = itemPic1.getInputStream();
			if (itemPic1In.available() != 0) {
				// 刪除舊的
				if (!" ".equals(session.getAttribute("ItemImg1"))) {
					ItemImgVO itemImg1 = itemImgSvc.findByPK((Integer) session.getAttribute("ItemImg1"));
					itemImgSvc.delete(itemImg1);
				}

				// 新增新的
				byte[] itemPic1File = itemPic1In.readAllBytes();
				itemPic1In.close();
				// 設置商品圖片
				ItemImgVO imgVo1 = new ItemImgVO();
				imgVo1.setItemNo(itemVo.getItemNo());
				imgVo1.setItemImg(itemPic1File);
				imgVo1.setItemImgfront(false);
				// 送進資料庫
				itemImgSvc.insert(imgVo1);
			}

			InputStream itemPic2In = itemPic2.getInputStream();
			if (itemPic2In.available() != 0) {
				// 刪除舊的
				if (!" ".equals((String) session.getAttribute("ItemImg2"))) {
					ItemImgVO itemImg2 = itemImgSvc.findByPK((Integer) session.getAttribute("ItemImg2"));
					itemImgSvc.delete(itemImg2);
				}

				// 新增新的
				byte[] itemPic2File = itemPic2In.readAllBytes();
				itemPic2In.close();
				// 設置商品圖片
				ItemImgVO imgVo2 = new ItemImgVO();
				imgVo2.setItemNo(itemVo.getItemNo());
				imgVo2.setItemImg(itemPic2File);
				imgVo2.setItemImgfront(false);
				// 送進資料庫
				itemImgSvc.insert(imgVo2);
			}

			InputStream itemPic3In = itemPic3.getInputStream();
			if (itemPic3In.available() != 0) {
				// 刪除舊的
				if (!" ".equals((String) session.getAttribute("ItemImg3"))) {
					ItemImgVO itemImg3 = itemImgSvc.findByPK((Integer) session.getAttribute("ItemImg3"));
					itemImgSvc.delete(itemImg3);
				}

				// 新增新的
				byte[] itemPic3File = itemPic3In.readAllBytes();
				itemPic3In.close();
				// 設置商品圖片
				ItemImgVO imgVo3 = new ItemImgVO();
				imgVo3.setItemNo(itemVo.getItemNo());
				imgVo3.setItemImg(itemPic3File);
				imgVo3.setItemImgfront(false);
				// 送進資料庫
				itemImgSvc.insert(imgVo3);
			}

			// 移除session中的屬性

			session.removeAttribute("itemInfoVo");
			session.removeAttribute("ItemFrontImg");
			session.removeAttribute("ItemImg1");
			session.removeAttribute("ItemImg2");
			session.removeAttribute("ItemImg3");

			// 轉發
			res.sendRedirect(req.getContextPath() + "/shop/ItemManage.jsp");
			return;
		}

		// 更新後儲存
		if ("updateSave".equals(action)) {

			res.setContentType("text/html; charset=UTF-8");
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);
			// 取值
			String itemName = req.getParameter("itemName");
			String itemDescript = req.getParameter("itemDescript");
			String itemStat = req.getParameter("itemStat");
			String itemType = req.getParameter("itemType");
			String itemSize = req.getParameter("itemSize");
			String itemPrice = req.getParameter("itemPrice");
			String itemQuantity = req.getParameter("itemQuantity");
			Part coverPic = req.getPart("coverPic");
			Part itemPic1 = req.getPart("itemPic1");
			Part itemPic2 = req.getPart("itemPic2");
			Part itemPic3 = req.getPart("itemPic3");

			// 驗證資料
			if (itemName == null || itemName.trim().length() == 0) {
				errorMsgs.add("請輸入商品名稱");
			}

			if (!errorMsgs.isEmpty()) {
				req.getRequestDispatcher("/shop/AddItem.jsp").forward(req, res);
				return;// 程式中斷
			}

			// 設置vo
			HttpSession session = req.getSession();
			ItemInfoVO itemVo = (ItemInfoVO) session.getAttribute("itemInfoVo");

			itemVo.setItemName(itemName.trim());

			if (itemDescript != null && itemDescript.trim().length() != 0) {
				itemVo.setItemText(itemDescript.trim());
			}

			ItemStatVO itemStatVo = itemVo.getItemStatVO();
			if ((!"請選擇".equals(itemStat))) {
				if ((itemStatVo.getItemStatNo() != Integer.parseInt(itemStat))) {
					itemStatVo.setItemStatNo(Integer.parseInt(itemStat));
					itemVo.setItemStatVO(itemStatVo);
				}

			}

			ItemTypeVO itemTypeVo = itemVo.getItemTypeVO();
			if (!"請選擇".equals(itemType)) {
				if (itemTypeVo.getItemTypeNo() != Integer.parseInt(itemType)) {
					itemTypeVo.setItemTypeNo(Integer.parseInt(itemType));
					itemVo.setItemTypeVO(itemTypeVo);
				}
			}

			ItemSizeVO itemSizeVo = itemVo.getItemSizeVO();		
			if (!"請選擇".equals(itemSize)) {
                 if (itemSizeVo.getItemSizeNo() != Integer.parseInt(itemSize)) {
                	 itemSizeVo.setItemSizeNo(Integer.parseInt(itemSize));
                	 itemVo.setItemSizeVO(itemSizeVo);
				}
			}

			if (itemPrice != null && itemPrice.trim().length() != 0) {
				if (Integer.parseInt(itemPrice) > 0) {
					itemVo.setItemPrice(Integer.parseInt(itemPrice));
					itemVo.setPreItemPrice(Integer.parseInt(itemPrice));
				} 
			}

			if (itemQuantity != null && itemQuantity.trim().length() != 0) {
				
				if (Integer.parseInt(itemQuantity) > 0) {
					itemVo.setItemStockQty(Integer.parseInt(itemQuantity));
				} 
			}

			
			itemVo.setItemAddStat(1);// 草稿


			// 送進資料庫
			itemInfoSvc.update(itemVo);

			// 設置封面照

			InputStream coverPicIn = coverPic.getInputStream();
			if (coverPicIn.available() != 0) {
				// 刪除舊的
				if (!" ".equals(session.getAttribute("ItemFrontImg"))) {
					ItemImgVO itemFrontImg = itemImgSvc.findByPK((Integer) session.getAttribute("ItemFrontImg"));
					itemImgSvc.delete(itemFrontImg);
				}

				// 新增新的
				byte[] coverPicFile = coverPicIn.readAllBytes();
				coverPicIn.close();
				// 設置商品圖片
				ItemImgVO imgVo = new ItemImgVO();
				imgVo.setItemNo(itemVo.getItemNo());
				imgVo.setItemImg(coverPicFile);
				imgVo.setItemImgfront(true);
				// 送進資料庫
				itemImgSvc.insert(imgVo);
			}

			InputStream itemPic1In = itemPic1.getInputStream();
			if (itemPic1In.available() != 0) {
				// 刪除舊的
				if (!" ".equals((String) session.getAttribute("ItemImg1"))) {
					ItemImgVO itemImg1 = itemImgSvc.findByPK((Integer) session.getAttribute("ItemImg1"));
					itemImgSvc.delete(itemImg1);
				}

				// 新增新的
				byte[] itemPic1File = itemPic1In.readAllBytes();
				itemPic1In.close();
				// 設置商品圖片
				ItemImgVO imgVo1 = new ItemImgVO();
				imgVo1.setItemNo(itemVo.getItemNo());
				imgVo1.setItemImg(itemPic1File);
				imgVo1.setItemImgfront(false);
				// 送進資料庫
				itemImgSvc.insert(imgVo1);
			}

			InputStream itemPic2In = itemPic2.getInputStream();
			if (itemPic2In.available() != 0) {
				// 刪除舊的
				if (!" ".equals((String) session.getAttribute("ItemImg2"))) {
					ItemImgVO itemImg2 = itemImgSvc.findByPK((Integer) session.getAttribute("ItemImg2"));
					itemImgSvc.delete(itemImg2);
				}

				// 新增新的
				byte[] itemPic2File = itemPic2In.readAllBytes();
				itemPic2In.close();
				// 設置商品圖片
				ItemImgVO imgVo2 = new ItemImgVO();
				imgVo2.setItemNo(itemVo.getItemNo());
				imgVo2.setItemImg(itemPic2File);
				imgVo2.setItemImgfront(false);
				// 送進資料庫
				itemImgSvc.insert(imgVo2);
			}

			InputStream itemPic3In = itemPic3.getInputStream();
			if (itemPic3In.available() != 0) {
				// 刪除舊的
				if (!" ".equals((String) session.getAttribute("ItemImg3"))) {
					ItemImgVO itemImg3 = itemImgSvc.findByPK((Integer) session.getAttribute("ItemImg3"));
					itemImgSvc.delete(itemImg3);
				}

				// 新增新的
				byte[] itemPic3File = itemPic3In.readAllBytes();
				itemPic3In.close();
				// 設置商品圖片
				ItemImgVO imgVo3 = new ItemImgVO();
				imgVo3.setItemNo(itemVo.getItemNo());
				imgVo3.setItemImg(itemPic3File);
				imgVo3.setItemImgfront(false);
				// 送進資料庫
				itemImgSvc.insert(imgVo3);
			}

			// 移除session中的屬性

			session.removeAttribute("itemInfoVo");
			session.removeAttribute("ItemFrontImg");
			session.removeAttribute("ItemImg1");
			session.removeAttribute("ItemImg2");
			session.removeAttribute("ItemImg3");

			// 轉發
			res.sendRedirect(req.getContextPath() + "/shop/ItemManage.jsp");
			return;
		}

	}
}
