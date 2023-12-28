<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.shop.entity.ShoppingCartVO"%>
<%@ page import="com.asap.shop.service.ShoppingCartService_interface"%>
<%@ page import="com.asap.shop.service.ShoppingCartService"%>
<%@ page import="com.asap.member.entity.MemberVO"%>
<%@ page import="com.asap.shop.entity.ItemInfoVO"%>
<%@ page import="com.asap.shop.service.ItemInfoService_interface"%>
<%@ page import="com.asap.shop.service.ItemInfoService"%>
<!DOCTYPE html>
<%
// String shoppingCart = request.getParameter("mbrNo");
MemberVO member = (MemberVO) session.getAttribute("memberVo");
String mbrNo = member.getMbrNo();

ShoppingCartService_interface ShoppingCartSvc = new ShoppingCartService();
ItemInfoService_interface ItemInfoSvc = new ItemInfoService();
List<ShoppingCartVO> list = ShoppingCartSvc.findByMember(mbrNo);
pageContext.setAttribute("list", list);

System.out.println(list);
%>




<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>Asap</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template" />
<meta name="author" content="SW-THEMES" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700", "Shadows+Into+Light:400", ],
		},
	};
	(function(d) {
		var wf = d.createElement("script"), s = d.scripts[0];
		wf.src = "${pageContext.request.contextPath}/assets/js/webfont.js";
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
</head>

<body>
	<div class="page-wrapper">
		<header class="header">
			<div class="header-middle sticky-header"
				data-sticky-options="{'mobile': true}"
				style="height: 75px; background: rgb(255, 250, 85); background: linear-gradient(90deg, rgba(255, 250, 85, 0.9081757703081232) 0%, rgba(9, 34, 121, 0.8773634453781513) 35%, rgba(0, 212, 255, 1) 100%);">
				<div class="container">
					<div class="header-left col-lg-2 w-auto pl-0">
						<button class="mobile-menu-toggler text-primary mr-2"
							type="button">
							<i class="fas fa-bars"></i>
						</button>
						<a href="${pageContext.request.contextPath}/member/MemberHome.jsp"
							style="width: 222; height: 88;"> <img
							src="${pageContext.request.contextPath}/newImg/logo2.png"
							alt="Logo" />
						</a>
					</div>
					<!-- End .header-left -->
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-middle -->

			<div class="header-bottom sticky-header d-none d-lg-block"
				data-sticky-options="{'mobile': false}">
				<div class="container">
					<nav class="main-nav w-100">
						<ul class="menu" style="display: flex; justify-content: flex-end">
							<li><a href="#">論壇</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
									<li><a
										href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
									<li><a
										href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
									<li><a
										href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
								</ul></li>
							<li><a href="#">揪團</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
									<li><a
										href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
									<li><a
										href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
									<li><a
										href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
								</ul></li>
							<li><a href="#">課程</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
									<li><a
										href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
								</ul></li>
							<li><a href="#">場地</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
									<li><a
										href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
									<li><a
										href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
								</ul></li>
							<li><a href="#">賣家</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
								</ul></li>

							<li><a href="#">商城</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
								</ul></li>
							<li><a href="#">個人首頁</a>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
									<li><a
										href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
								</ul></li>
							<li><a><form
										action="${pageContext.request.contextPath}/MemberController"
										method="post" style="margin: 0px;">
										<button type="submit"
											style="border: 0px; background-color: white;">登出</button>
										<input type="hidden" name="action" value="logout" />
									</form></a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->
		</header>
		<!-- End .header -->

		<main class="main main-test">
			<div class="container checkout-container">
				<ul
					class="checkout-progress-bar d-flex justify-content-center flex-wrap">
					<li><a href="AsapCart.jsp">購物車</a></li>
					<li class="active"><a href="AsapOrderCheck.jsp">確認訂單</a></li>
					<li class="disabled"><a href="#">付款頁面</a></li>
				</ul>

				<div class="row">
					<div class="col-lg-7">
						<ul class="checkout-steps">
							<li>
								<h2 class="step-title">帳單詳細資料</h2>

								<form
									action="${pageContext.request.contextPath}/shop/OrderServlet"
									id="checkout-form" method="post">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>收件人名稱 <abbr class="required" title="required">*</abbr>
												</label> <input type="text" name="rcvrname" class="form-control"
													required />
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label>收件人信箱 <abbr class="required" title="required">*</abbr></label>
												<input type="email" name="rcvremail"
													placeholder="請輸入有效的電子郵件地址"
													pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$"
													title="請輸入有效的電子郵件地址，例如 example@domain.com。"
													class="form-control" required />
											</div>
										</div>
									</div>

									<div class="select-custom">
										<label>選擇縣/市 <abbr class="required" title="required">*</abbr></label>
										<select name="rcvraddr" class="form-control">
											<option value="" selected="selected">台北市</option>
											<option value="新北市">新北市</option>
											<option value="新北市">新北市</option>
											<option value="桃園市">桃園市</option>
											<option value="臺中市">臺中市</option>
											<option value="臺南市">臺南市</option>
											<option value="高雄市">高雄市</option>
											<option value="基隆市">基隆市</option>
											<option value="新竹市">新竹市</option>
											<option value="嘉義市">嘉義市</option>
											<option value="新竹縣">新竹縣</option>
											<option value="苗栗縣">苗栗縣</option>
											<option value="彰化縣">彰化縣</option>
											<option value="南投縣">南投縣</option>
											<option value="雲林縣">雲林縣</option>
											<option value="嘉義縣">嘉義縣</option>
											<option value="屏東縣">屏東縣</option>
											<option value="宜蘭縣">宜蘭縣</option>
											<option value="花蓮縣">花蓮縣</option>
											<option value="台東縣">台東縣</option>
											<option value="澎湖縣">澎湖縣</option>
											<option value="金門縣">金門縣</option>
											<option value="連江縣">連江縣</option>
										</select>
									</div>

									<div class="form-group mb-1 pb-2">
										<label>詳細地址 <abbr class="required" title="required">*</abbr></label>
										<input type="text" name="rcvraddrdetail" class="form-control"
											placeholder="鄉(鎮市區)、村(里)、鄰、大樓、公寓、號碼、等等：" required />
									</div>


									<div class="form-group">
										<label>郵遞區號 <abbr class="required" title="required">*</abbr></label>
										<input type="text" name="zip" class="form-control"
											pattern="^[\d+]{3,6}$" required />
									</div>

									<div class="form-group">
										<label>電話 <abbr class="required" title="required">*</abbr></label>
										<input type="tel" name="rcvrphone" class="form-control"
											placeholder="可輸入市話或手機 ex.011234567、0912345678"
											pattern="^[\d+]{7,10}$" required />
									</div>

									<input type="hidden" name="total" class="ordertotal" value="" />
							</li>
						</ul>
					</div>
					<!-- End .col-lg-8 -->



					<div class="col-lg-5">
						<div class="order-summary">
							<h3>訂單詳情</h3>

							<table class="table table-mini-cart">
								<thead>

									<tr>
										<th>商品</th>
										<th>商品編號</th>
										<th>價格</th>
										<th>數量</th>
										<th>小計</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${list}" var="cartItem" varStatus="status">
										<tr>

											<td class="price-col"><a
												href="AsapShopProduct.jsp?itemNo=${cartItem.itemInfoVO.itemNo}">${cartItem.itemInfoVO.itemName}</a>
											</td>
											<td class="price-col">${cartItem.itemInfoVO.itemNo}</td>
											<td class="price-col"><span class="unit-price">${cartItem.itemInfoVO.itemPrice}</span>
											</td>
											<td class="price-col"><span class="quantity">${cartItem.itemShopQty}</span>
											</td>
											<td class="price-col"><span class="subtotal">$${cartItem.itemInfoVO.itemPrice
													* cartItem.itemShopQty}</span></td>
											<input type="hidden" name="product${status.index+1}"
												value="${cartItem.itemInfoVO.itemNo},${cartItem.itemInfoVO.itemPrice},${cartItem.itemShopQty}" />
										</tr>
									</c:forEach>

								</tbody>
								</form>
								<tfoot>

									<tr class="cart-subtotal">
										<td>
											<h4>商品小計</h4>
										</td>

										<td class="price-col"><span class="total-subtotal"></span>
										</td>
									</tr>


									<tr class="order-shipping">
										<td class="text-left" colspan="2">
											<h4 class="m-b-sm">付款方式</h4>



											<div class="form-group form-group-custom-control mb-0">
												<div class="custom-control custom-radio d-flex mb-0">
													<input type="radio" name="radio" checked
														class="custom-control-input" /> <label
														class="custom-control-label">線上付款</label>
												</div>
												<!-- End .custom-checkbox -->
											</div> <!-- End .form-group -->
										</td>
									</tr>

									<tr class="order-total">
										<td>
											<h4>總計</h4>
										</td>
										<td><b class="total-price"><span></span></b></td>
								</tfoot>
							</table>


							<div class="payment-methods">
								<h4 class="">注意事項</h4>
								<div class="info-box with-icon p-0">
									<p>
										親愛的顧客， <br /> <br /> 請確保下單前您的個人資料正確無誤： <br /> <br /> 聯絡資訊：
										手機和電郵準確。 <br /> 寄送地址： 最新且正確。 <br /> 支付信息： 避免支付問題。 <br />
										個人信息： 如姓名正確。 <br /> <br /> 謝謝您的合作！ <br /> <br /> ASAP 客服
									</p>
								</div>
							</div>

							<button type="submit" class="btn btn-dark btn-place-order"
								name="action" value="ordercreate" form="checkout-form">前往待付款頁面</button>
						</div>
						<!-- End .cart-summary -->
					</div>
					<!-- End .col-lg-4 -->



				</div>
				<!-- End .row -->
			</div>
			<!-- End .container -->
		</main>
		<!-- End .main -->

		<footer class="footer bg-dark">
			<div class="footer-middle">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="widget">
								<h4 class="widget-title">Contact Info</h4>
								<ul class="contact-info">
									<li><span class="contact-info-label">Address:</span>5F.,
										No. 219, Sec. 3, Nanjing E. Rd., Zhongshan Dist., Taipei City
										104, Taiwan (R.O.C.)</li>
									<li><span class="contact-info-label">Phone:</span><a
										href="tel:">(02) 2712-0589</a></li>
									<li><span class="contact-info-label">Email:</span> <a
										href="mailto:mail@example.com">business@tibame.com</a></li>
									<li><span class="contact-info-label">Working
											Days/Hours:</span> Mon - Sun / 8:00 AM - 9:30 PM</li>
								</ul>
								<div class="social-icons">
									<a href="#" class="social-icon social-facebook icon-facebook"
										target="_blank" title="Facebook"></a> <a
										href="#" class="social-icon social-twitter icon-twitter"
										target="_blank" title="Twitter"></a> <a
										href="#" class="social-icon social-instagram icon-instagram"
										target="_blank" title="Instagram"></a>
								</div>
								<!-- End .social-icons -->
							</div>
							<!-- End .widget -->
						</div>
						<!-- End .col-lg-3 -->

						<div class="col-lg-3 col-sm-6">
							<div class="widget">
								<h4 class="widget-title">SiteMap</h4>

								<ul class="links">
									<li><a
										href="${pageContext.request.contextPath}/member/MemberHome.jsp">Account</a></li>
									<li><a
										href="${pageContext.request.contextPath}/course/course_main.jsp">Course</a></li>
									<li><a
										href="${pageContext.request.contextPath}/forum/forum_home.jsp">Forum</a></li>
									<li><a
										href="${pageContext.request.contextPath}/group/AllGroup.jsp">Group</a></li>
									<li><a
										href="${pageContext.request.contextPath}/court/court_main.jsp">Court</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">Seller</a></li>
									<li><a
										href="${pageContext.request.contextPath}/shop/AsapShop.jsp">Mall</a></li>
								</ul>
							</div>
							<!-- End .widget -->
						</div>
						<!-- End .col-lg-3 -->

					</div>
					<!-- End .row -->
				</div>
				<!-- End .container -->
			</div>
			<!-- End .footer-middle -->

			<div class="container">
				<div class="footer-bottom">
					<div class="container d-sm-flex align-items-center">
						<div class="footer-left">
							<span class="footer-copyright">© ASAP. 2023.
								All Rights Reserved</span>
						</div>
					</div>
				</div>
				<!-- End .footer-bottom -->
			</div>
			<!-- End .container -->
		</footer>
		<!-- End .footer -->
	</div>
	<!-- End .page-wrapper -->

	<div class="loading-overlay">
		<div class="bounce-loader">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>

	<div class="mobile-menu-overlay"></div>
	<!-- End .mobil-menu-overlay -->

	<div class="mobile-menu-container">
		<div class="mobile-menu-wrapper">
			<span class="mobile-menu-close"><i class="fa fa-times"></i></span>
			<nav class="mobile-nav">
				<ul class="mobile-menu">
					<li><a href="#">論壇</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
							<li><a
								href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
							<li><a
								href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
							<li><a
								href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
						</ul></li>
					<li><a href="#">揪團</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
							<li><a
								href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
							<li><a
								href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
							<li><a
								href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
						</ul></li>
					<li><a href="#">課程</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
							<li><a
								href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
						</ul></li>

					<li><a href="#">場地</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
							<li><a
								href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
							<li><a
								href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
						</ul></li>

					<li><a href="#">賣家</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
							<li><a
								href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
						</ul></li>
					<li><a href="#">商城</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
							<li><a
								href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
							<li><a
								href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
							<li><a
								href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
							<li><a
								href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
							<li><a
								href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
						</ul></li>
					<li><a href="#">個人首頁</a>
						<ul>
							<li><a
								href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
							<li><a
								href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
						</ul></li>

				</ul>
			</nav>
			<!-- End .mobile-nav -->
		</div>
		<!-- End .mobile-menu-wrapper -->

	</div>
	<!-- End .mobile-menu-container -->

	<div class="sticky-navbar">
		<div class="sticky-info">
			<a href="${pageContext.request.contextPath}/course/course_main.jsp">
				<i class="icon-home"></i>Course
			</a>
		</div>
		<div class="sticky-info">
			<a href="${pageContext.request.contextPath}/forum/forum_home.jsp"
				class=""> <i class="icon-edit"></i>Forum
			</a>
		</div>
		<div class="sticky-info">
			<a href="${pageContext.request.contextPath}/group/AllGroup.jsp"
				class=""> <i class="icon-cat-sport"></i>Group
			</a>
		</div>
		<div class="sticky-info">
			<a href="${pageContext.request.contextPath}/shop/AsapShop.jsp"
				class=""> <i class="icon-shopping-cart position-relative"> </i>Mall
			</a>
		</div>
		<div class="sticky-info">
			<a href="${pageContext.request.contextPath}/member/MemberHome.jsp"
				class=""> <i class="icon-user-2"></i>Account
			</a>
		</div>

	</div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<script>
		//       獲取表格中所有行
		var rows = document.querySelectorAll('tbody tr');

		var total = 0;
		var subtotal = 0;

		rows.forEach(function(row) {
			var unitPriceElement = row.querySelector('.unit-price');
			var quantityElement = row.querySelector('.quantity');
			var subtotalElement = row.querySelector('.subtotal');

			var unitPrice = parseFloat(unitPriceElement.textContent.replace(
					'$', ''));
			var quantity = parseInt(quantityElement.textContent);

			subtotal = unitPrice * quantity;
			subtotalElement.textContent = '$' + subtotal.toFixed(2);

			total += subtotal;
		});

		document.querySelector('.total-subtotal').textContent = '$'
				+ total.toFixed(2);
		document.querySelector('.total-price span').textContent = '$'
				+ total.toFixed(2);
		document.querySelector('.ordertotal').value = total.toFixed(0);
	</script>

	<!-- Plugins JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<script>
		<c:if test="${not empty msg}">
		alert("${msg}");
		</c:if>
	</script>

</body>
</html>
