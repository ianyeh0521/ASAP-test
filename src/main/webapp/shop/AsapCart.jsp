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
<html lang="en">

<%
MemberVO member = (MemberVO) session.getAttribute("memberVo");
String mbrNo = member.getMbrNo();

ShoppingCartService_interface ShoppingCartSvc = new ShoppingCartService();
ItemInfoService_interface ItemInfoSvc = new ItemInfoService();
List<ShoppingCartVO> list = ShoppingCartSvc.findByMember(mbrNo);
pageContext.setAttribute("list", list);

System.out.println(list);
%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>AsapCart</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template">
<meta name="author" content="SW-THEMES">

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="../assets/images/icons/favicon.png">


<script>
	WebFontConfig = {
		google : {
			families : [ 'Open+Sans:300,400,600,700,800',
					'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ]
		}
	};
	(function(d) {
		var wf = d.createElement('script'), s = d.scripts[0];
		wf.src = '../assets/js/webfont.js';
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">

<!-- Main CSS File -->
<link rel="stylesheet" href="../assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="../assets/vendor/fontawesome-free/css/all.min.css">

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

		<main class="main">
			<div class="container">
				<ul
					class="checkout-progress-bar d-flex justify-content-center flex-wrap">
					<li class="active"><a href="asapcart.html">購物車</a></li>
					<li><span>確認訂單</span></li>
					<li class="disabled"><a href="cart.html">訂單完成</a></li>
				</ul>

				<div class="row">
					<div class="col-lg-8">
						<div class="cart-table-container">
							<table class="table table-cart">
								<thead>
									<tr>
										<th class="thumbnail-col"></th>
										<th class="product-col">商品編號</th>
										<th class="price-col">價格</th>
										<th class="qty-col">數量</th>
										<th class="text-right">小計</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${list}" var="cartItem" varStatus="status">
										<tr class="product-row"
											data-cartid="${cartItem.shoppingCartNo}">
											<td>
												<figure class="product-image-container">
													<a
														href="ItemInfoServlet?action=increaseViewItem&itemNo=${cartItem.itemInfoVO.itemNo}"
														class="product-image"> <img
														src="ItemInfoServlet?action=getImg&itemNo=${cartItem.itemInfoVO.itemNo}"
														alt="product">
													</a>


													<a href="#" class="btn-remove icon-cancel"
														title="Remove Product"></a>

												</figure>
											</td>
											<td class="product-col" style="padding-left: 10px">
												<h5 class="product-title">
													<a
														href="AsapShopProduct.jsp?itemNo=${cartItem.itemInfoVO.itemNo}">${cartItem.itemInfoVO.itemNo}
														<%-- ${cartItem.itemName} --%>
													</a>
												</h5>
											</td>
											<td class="price-col">${cartItem.itemInfoVO.itemPrice}</td>
											<td>
												<div class="product-single-qty">${cartItem.itemShopQty}</div>
											</td>
											<td class="text-right"><span class="subtotal-price">$${cartItem.itemInfoVO.itemPrice
													* cartItem.itemShopQty}</span></td>
										</tr>
									</c:forEach>


								</tbody>


								<tfoot>
									<tr>
										<td colspan="5" class="clearfix">

											<div class="float-right">
												<a href="AsapShop.jsp" class="btn btn-shop btn-update-cart">
													繼續購物 </a>
											</div> <!-- End .float-right -->
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
						<!-- End .cart-table-container -->
					</div>
					<!-- End .col-lg-8 -->

					<div class="col-lg-4">
						<div class="cart-summary">
							<h3>購物車總計</h3>

							<table class="table table-mini-cart">
								<thead>
									<tr>
										<th>商品</th>
										<th>價格</th>
										<th>數量</th>
										<th>小計</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="cartItem" varStatus="status">
										<tr>
											<td class="product-col">
												<h3 class="product-title">${cartItem.itemInfoVO.itemName}</h3>
											</td>

											<td class="price-col"><span class="unit-price">${cartItem.itemInfoVO.itemPrice}</span>
											</td>
											<td class="price-col"><span class="quantity">${cartItem.itemShopQty}</span></td>
											<td class="price-col"><span class="subtotal">$${cartItem.itemInfoVO.itemPrice
													* cartItem.itemShopQty}</span></td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr class="cart-subtotal">
										<td>
											<h4>商品小計</h4>
										</td>
										<td class="price-col"><span class="total-subtotal">
												<c:set var="subtotalSum" value="0" /> <c:forEach
													items="${list}" var="cartItem">
													<c:set var="subtotal"
														value="${cartItem.itemInfoVO.itemPrice * cartItem.itemShopQty}" />
													<c:set var="subtotalSum" value="${subtotalSum + subtotal}" />
												</c:forEach> $${subtotalSum}
										</span></td>
									</tr>

								</tfoot>

							</table>

							<div class="checkout-methods">
								<!-- 								<a href="AsapOrderCheck.jsp" class="btn btnoter-block btn-dark" -->
								<!-- 									style="padding-left: 20px">確認訂單 <i -->
								<!-- 									class="fa fa-arrow-right"></i> -->
								<!-- 								</a>  -->

								<a href="javascript:void(0);" id="confirmOrderBtn"
									class="btn btnoter-block btn-dark" style="padding-left: 20px">確認訂單
									<i class="fa fa-arrow-right"></i>
								</a>

							</div>
						</div>
						<!-- End .cart-summary -->
					</div>
					<!-- End .col-lg-4 -->
				</div>
				<!-- End .row -->
			</div>
			<!-- End .container -->

			<div class="mb-6"></div>
			<!-- margin -->
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


	<!-- Plugins JS File -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.bundle.min.js"></script>
	<script src="../assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="../assets/js/main.min.js"></script>

	<script>
		$('.btn-remove')
				.on(
						'click',
						function(e) {
							e.preventDefault();
							var cartId = $(this).closest('tr').data('cartid'); // 獲取購物車項目 ID
							let r = confirm("確認刪除此項商品?");
							console.log(cartId);
							// 發送 AJAX 請求到後端
							if (r) {
								$
										.ajax({
											url : '${pageContext.request.contextPath}/shop/ShoppingCartServlet',
											method : 'POST',
											data : {
												action : 'remove',
												shoppingCartNo : cartId
											// 購物車項目 ID
											},
											success : function(response) {
												alert("刪除成功")
												document.location.reload()
											},
											error : function(xhr, status, error) {
												// 處理錯誤
												console.error(error);
											}
										});
							}
						});

		//判斷購物車是否為空
		document.getElementById('confirmOrderBtn').addEventListener('click',
				function() {
					var cartList =
	<%=list.size()%>
		; // 獲取購物車商品數量
					if (cartList === 0) {
						alert('購物車內無商品!');
						window.location.href = 'AsapShop.jsp'; // 重定向到商城首頁
					} else {
						window.location.href = 'AsapOrderCheck.jsp'; // 如果購物車不為空，則轉到訂單確認頁面
					}
				});
	</script>

</body>

</html>