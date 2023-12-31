<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List"%>
<%@ page import="com.asap.shop.entity.ItemInfoVO"%>
<%@ page import="com.asap.shop.service.ItemInfoService_interface"%>
<%@ page import="com.asap.shop.service.ItemInfoService"%>
<%@ page import="com.asap.member.entity.MemberVO"%>
<%@ page import="com.asap.shop.entity.ShoppingCartVO"%>
<%@ page import="com.asap.shop.service.ShoppingCartService_interface"%>
<%@ page import="com.asap.shop.service.ShoppingCartService"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<%
ItemInfoService_interface ItemSvc = new ItemInfoService();
List<ItemInfoVO> list = ItemSvc.getAll();
pageContext.setAttribute("list", list);
System.out.println(list);

MemberVO member = (MemberVO) session.getAttribute("memberVo");
String mbrNo = member.getMbrNo();
pageContext.setAttribute("mbrNo", mbrNo);
ShoppingCartService_interface ShoppingCartSvc = new ShoppingCartService();
ItemInfoService_interface ItemInfoSvc = new ItemInfoService();
List<ShoppingCartVO> cartlist = ShoppingCartSvc.findByMember(mbrNo);
pageContext.setAttribute("cartlist", cartlist);
System.out.println(cartlist);
%>

<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>ASAP</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template" />
<meta name="author" content="SW-THEMES" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

<script>
      WebFontConfig = {
        google: {
          families: [
            "Open+Sans:300,400,600,700,800,400italic,800italic",
            "Poppins:300,400,500,600,700,800",
            "Oswald:300,400,500,600,700,800",
          ],
        },
      };
      (function (d) {
        var wf = d.createElement("script"),
          s = d.scripts[0];
        wf.src = "${pageContext.request.contextPath}/assets/js/webfont.js";
        wf.async = true;
        s.parentNode.insertBefore(wf, s);
      })(document);
    </script>

<!-- Plugins CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/demo41.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<style>
.selected {
	color: blue;
	font-weight: bold;
}
</style>
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
		<div class="header-middle">
			<div class="container"
				style="display: flex; justify-content: center; align-items: center; height: 100%;">
				<div class="header-right w-lg-max"
					style="flex-grow: 1; display: flex; justify-content: center; align-items: center;">
					<div
						class="header-search header-search-inline header-search-category d-lg-block d-none text-right mt-0"
						style="flex-grow: 1;">
						<a href="#" class="search-toggle" role="button"><i
							class="icon-magnifier"></i></a>
						<!-- 						<form action="ItemInfoServlet" method="get" -->
						<!-- 							style="display: flex; justify-content: center; align-items: center; width: 100%;"> -->
						<div class="header-search-wrapper"
							style="display: flex; justify-content: center; align-items: center; width: 100%;">
							<input type="search" class="form-control" name="q" id="q"
								placeholder="尋找想要的商品吧!" required=""
								style="flex-grow: 1; border: 2px solid #778899;" />
							<button class="btn icon-magnifier p-0" id="itemsearch" title="搜尋"
								type="button"></button>
						</div>
						<!-- End .header-search-wrapper -->
						</form>
					</div>

					<a href="MyCollection.jsp" class="header-icon position-relative"
						title="我的收藏"><i class="icon-wishlist-2"></i> <!-- 						 <span -->
						<!-- 						class="cart-count badge-circle">3</span> --> </a>

					<div class="dropdown cart-dropdown">
						<a href="PendingOrder.jsp" title="購物車"
							class="dropdown-toggle cart-toggle" role="button"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
							data-display="static"> <i class="icon-cart-thick"></i>
						</a>

						<div class="cart-overlay"></div>

						<div class="dropdown-menu mobile-cart">
							<a href="#" title="Close (Esc)" class="btn-close">×</a>
							<div class="dropdownmenu-wrapper custom-scrollbar">

								<div class="dropdown-cart-header">購物車</div>
								<!-- End .dropdown-cart-header -->

								<c:forEach items="${cartlist}" var="cartItem">
									<div class="dropdown-cart-products">

										<div class="product" data-cartid="${cartItem.shoppingCartNo}">
											<div class="product-details">
												<h4 class="product-title">
													<a
														href="ItemInfoServlet?action=increaseViewItem&itemNo=${cartItem.itemInfoVO.itemNo}">${cartItem.itemInfoVO.itemName}</a>
												</h4>

												<span class="cart-product-info"> <span
													class="cart-product-qty">$${cartItem.itemInfoVO.itemPrice}</span>
													× ${cartItem.itemShopQty}
												</span>
											</div>
											<!-- End .product-details -->

											<figure class="product-image-container">
												<a
													href="ItemInfoServlet?action=increaseViewItem&itemNo=${cartItem.itemInfoVO.itemNo}"
													class="product-image"> <img
													src="ItemInfoServlet?action=getImg&itemNo=${cartItem.itemInfoVO.itemNo}"
													alt="product">
												</a>

												<a href="javascript:void(0);" class="btn-remove"
													title="Remove Product"><span>×</span></a>
												<!-- 取消商品的動作 -->
											</figure>
										</div>
										<!-- End .product -->

									</div>

									<!-- End .cart-product -->

									<div class="dropdown-cart-total">
										<span>小計:</span> <span class="cart-total-price float-right">$${cartItem.itemInfoVO.itemPrice
											* cartItem.itemShopQty}</span>
									</div>
								</c:forEach>
								<!-- End .dropdown-cart-total -->

								<div class="dropdown-cart-action">
									<a href="AsapCart.jsp" class="btn btn-gray btn-block view-cart">查看購物車</a>
								</div>

							</div>

						</div>
						<!-- End .dropdown-cart-total -->
					</div>
					<!-- End .dropdownmenu-wrapper -->
				</div>
				<!-- End .dropdown-menu -->
			</div>
			<!-- End .dropdown -->
		</div>
		<!-- End .header-right -->
	</div>
	<!-- End .container -->
	</div>
	<!-- End .header-middle -->
	<main class="main">
		<div class="container">

			<div class="row">
				<div class="col-lg-9 main-content">
					<nav class="toolbox sticky-header"
						data-sticky-options="{'mobile': true}">
						<div class="toolbox-left">

							<div class="toolbox-item toolbox-sort">
								<label>排序方式:</label>

								<div class="select-custom">
									<select name="orderby" class="form-control orderby">
										<option value="menu">請選擇</option>

										<option value="new_order">最新上架</option>

										<option value="true">價格:高到低</option>

										<option value="false">價格:低到高</option>

										<option value="view_order">瀏覽人數</option>

									</select>
								</div>
								<!-- End .select-custom -->
							</div>
							<!-- End .toolbox-item -->
						</div>
						<!-- End .toolbox-left -->
					</nav>

					<div class="row" id="roworder">
						<c:forEach var="ItemInfoVO" items="${list}">
							<div class="col-6 col-sm-3">
								<div class="product-default inner-quickview inner-icon">
									<figure>
										<span
											style="display: flex; align-items: center; justify-content: center; height: 300px;">
											<a
											href="ItemInfoServlet?action=increaseViewItem&itemNo=${ItemInfoVO.itemNo}">
												<img
												src="ItemInfoServlet?action=getImg&itemNo=${ItemInfoVO.itemNo}"
												alt="product" style="max-height: 100%;" />
										</a>
										</span>


										<div class="label-group">
																							<span class="product-label label-sale">-50%</span>
										</div>

										<a href="ProductQuickView.html" class="btn-quickview"
											title="快速查看">快速查看</a>
									</figure>
									<div class="product-details">
										<div class="category-wrap">
											<div class="category-list">
												<span>${ItemInfoVO.itemName}</span>、<span>${ItemInfoVO.itemTypeVO.itemTypeName}</span>、<span>${ItemInfoVO.itemStatVO.itemStatText}</span>
											</div>
																							<a href="AsapShopWish.jsp" class="btn-icon-wish"
																								title="加入收藏"><i class="icon-heart"></i></a>
										</div>
										<h3 class="product-title">
											<a
												href="ItemInfoServlet?action=increaseViewItem&itemNo=${ItemInfoVO.itemNo}"><div>
													商品名稱: <span>${ItemInfoVO.itemName}</span>
												</div></a>
											<div>
												瀏覽人數: <span>${ItemInfoVO.itemView}</span>
											</div>
											<div>
												商品庫存: <span class=itemstockqty>${ItemInfoVO.itemStockQty}</span>
											</div>
										</h3>
										<div class="product-buttons"
											style="display: flex; align-items: center;">
											<input type="number" class="product-quantity"
												placeholder="請選擇數量" min="1" max="${ItemInfoVO.itemStockQty}"
												style="width: 100px; margin-right: 20px;" /> <a
												href="javascript:;" class="btn-icon-cart" title="加入購物車"
												data-itemno="${ItemInfoVO.itemNo}"> <i
												class="icon-shopping-cart"></i> 加入購物車
											</a>

										</div>
										<div style="margin-top: 1px; margin-left: 138px;">
											<a href="AsapCart.jsp" class="btn-view-cart"> 查看購物車 </a>
										</div>

										<div class="price-box">
											<c:if test="${ItemInfoVO.preItemPrice != 0}">
												<del class="old-price">$${ItemInfoVO.preItemPrice}</del>
											</c:if>
											<span class="product-price">$${ItemInfoVO.itemPrice}</span>
										</div>

									</div>

								</div>
							</div>
						</c:forEach>

					</div>
					<!-- End .row -->

					<div class="pagination-container" style="text-align: center">
						<div id="pagination-wrapper"></div>
					</div>

				</div>
				<!-- End .col-lg-9 -->

				<div class="sidebar-overlay"></div>
				<aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
					<div class="sidebar-wrapper">
						<div class="widget">
							<h3 class="widget-title">
								<a data-toggle="collapse" href="#widget-body-2" role="button"
									aria-expanded="true" aria-controls="widget-body-2">商品分類</a>
							</h3>

							<div class="collapse show" id="widget-body-2">
								<div class="widget-body">
									<ul class="cat-list">
										<li><a href="#widget-category-1" data-toggle="collapse"
											role="button" aria-expanded="true"
											aria-controls="widget-category-1"> 產品類型<span
												class="products-count"></span> <span class="toggle"></span>
										</a>
											<div class="collapse show" id="widget-category-1">
												<div class="row" id="item_type_select">
													<div class="col-md-6">
														<ul class="cat-sublist">
															<li><div class="typeswim " data-category="1"
																	data-column="itemTypeNo" style="cursor: pointer">
																	帽子<span class="products-count"></span>
																</div></li>
															<li><div class="typebaseball " data-category="2"
																	data-column="itemTypeNo" style="cursor: pointer">
																	男上衣<span class="products-count"></span>
																</div></li>
															<li><div class="typetennis " data-category="3"
																	data-column="itemTypeNo" style="cursor: pointer">
																	男下身<span class="products-count"></span>
																</div></li>
															<li><div class="typehandball " data-category="4"
																	data-column="itemTypeNo" style="cursor: pointer">
																	男鞋<span class="products-count"></span>
																</div></li>
															<li><div class="typebasketball " data-category="5"
																	data-column="itemTypeNo" style="cursor: pointer">
																	女上衣<span class="products-count"></span>
																</div></li>
															<li><div class="typevolleyball " data-category="6"
																	data-column="itemTypeNo" style="cursor: pointer">
																	女下身<span class="products-count"></span>
																</div></li>
														</ul>
													</div>
													<div class="col-md-6">
														<ul class="cat-sublist">
															<li><div class="typepingpong " data-category="7"
																	data-column="itemTypeNo" style="cursor: pointer">
																	女鞋<span class="products-count"></span>
																</div></li>
															<li><div class="typebanminton" data-category="8"
																	data-column="itemTypeNo" style="cursor: pointer">
																	配件<span class="products-count"></span>
																</div></li>
															<li><div class="typerun" data-category="9"
																	data-column="itemTypeNo" style="cursor: pointer">
																	球類<span class="products-count"></span>
																</div></li>
															<li><div class="typebike " data-category="10"
																	data-column="itemTypeNo" style="cursor: pointer">
																	健身器材<span class="products-count"></span>
																</div></li>
															<li><div class="typesoccer " data-category="11"
																	data-column="itemTypeNo" style="cursor: pointer">
																	其他<span class="products-count"></span>
																</div></li>

														</ul>
													</div>
												</div>
											</div>
										<li><a href="#widget-category-2" class="collapsed"
											data-toggle="collapse" role="button" aria-expanded="false"
											aria-controls="widget-category-2"> 商品尺寸<span
												class="products-count"></span> <span class="toggle"></span>
										</a>
											<div class="collapse" id="widget-category-2">
												<div class="row" id="item_size_select">
													<ul class="cat-sublist">
														<li><div class="sizenone" data-category="1"
																data-column="itemSizeNo" style="cursor: pointer">
																無<span class="products-count"></span>
															</div></li>
														<li><div class="sizexs" data-category="2"
																data-column="itemSizeNo" style="cursor: pointer">
																XS<span class="products-count"></span>
															</div></li>
														<li><div class="sizes" data-category="3"
																data-column="itemSizeNo" style="cursor: pointer">
																S<span class="products-count"></span>
															</div></li>
														<li><div class="sizem" data-category="4"
																data-column="itemSizeNo" style="cursor: pointer">
																M<span class="products-count"></span>
															</div></li>
														<li><div class="sizel" data-category="5"
																data-column="itemSizeNo" style="cursor: pointer">
																L<span class="products-count"></span>
															</div></li>
														<li><div class="sizexl" data-category="6"
																data-column="itemSizeNo" style="cursor: pointer">
																XL<span class="products-count"></span>
															</div></li>

													</ul>
												</div>
											</div></li>

										<li><a href="#widget-category-3" class="collapsed"
											data-toggle="collapse" role="button" aria-expanded="false"
											aria-controls="widget-category-3"> 商品狀態<span
												class="products-count"></span> <span class="toggle"></span>
										</a>
											<div class="collapse" id="widget-category-3">
												<div class="row" id="item_stat_select">
													<ul class="cat-sublist">
														<li>
															<div class="brandnew " data-category="1"
																data-column="itemStatNo" style="cursor: pointer">
																全新<span class="products-count"></span>
															</div>
														</li>
														<li>
															<div class="almostnew " data-category="2"
																data-column="itemStatNo" style="cursor: pointer">
																幾乎全新<span class="products-count"></span>
															</div>
														</li>
														<li>
															<div class="good " data-category="3"
																data-column="itemStatNo" style="cursor: pointer">
																狀況良好<span class="products-count"></span>
															</div>
														</li>
														<li>
															<div class="soso" data-category="4"
																data-column="itemStatNo" style="cursor: pointer">
																狀況尚可<span class="products-count"></span>
															</div>
														</li>
													</ul>
												</div>
											</div></li>

									</ul>
								</div>
								<!-- End .widget-body -->
							</div>
							<!-- End .collapse -->
						</div>
						<!-- End .widget -->

						<div class="widget">
							<h3 class="widget-title">
								<a data-toggle="collapse" href="#widget-body-3" role="button"
									aria-expanded="true" aria-controls="widget-body-3">價格範圍</a>
							</h3>

							<div class="collapse show" id="widget-body-3">
								<div class="widget-body pb-0">
									<form action="#">
										<div class="price-slider-wrapper">

											<div class="slider-container">
												<label for="min-price">最低價格:</label> <input type="range"
													id="min-price" name="min-price" min="0" max="50000"
													value="0"> <span id="min-price-value"></span>
											</div>

											<div class="slider-container">
												<label for="max-price">最高價格:</label> <input type="range"
													id="max-price" name="max-price" min="0" max="50000"
													value="50000"> <span id="max-price-value"></span>
											</div>

											<p>
												選擇的價格範圍: <span id="selected-price-range"></span>
											</p>

											<button type="button" id="select" class="btn btn-primary"
												data-column=""
												style="background-color: #4CAF50; color: white; border-radius: 4px; border: none; padding: 8px 15px; font-size: 14px; box-shadow: 0 3px 6px 0 rgba(0, 0, 0, 0.15); transition: all 0.2s ease; outline: none;">
												篩選</button>

										</div>
										<!-- End .filter-price-action -->
									</form>
								</div>
								<!-- End .widget-body -->

							</div>
							<!-- End .collapse -->

						</div>
						<!-- End .widget -->

						<div class="widget widget-featured">
							<h3 class="widget-title">近期瀏覽</h3>
							<div class="widget-body">
								<div class="owl-carousel widget-featured-products">
									<div class="featured-col">
										<!-- 迭代顯示前三個近期瀏覽的商品 -->
										<c:if test="${not empty sessionScope.recentlyViewed}">
											<c:forEach items="${sessionScope.recentlyViewed}" var="item"
												varStatus="status">
												<c:if test="${status.count le 3}">
													<div class="product-default left-details product-widget"
														style="height: 75px; overflow: hidden;">
														<figure
															style="width: 100px; float: left; margin-right: 10px;">
															<a href="AsapShopProduct.jsp?itemNo=${item.itemNo}">
																<img
																src="ItemInfoServlet?action=getImg&itemNo=${item.itemNo}"
																width="100" height="75" style="object-fit: cover;"
																alt="${item.itemName}" />
															</a>
														</figure>
														<div class="product-details" style="overflow: hidden;">
															<h3 class="product-title">
																<a href="AsapShopProduct.jsp?itemNo=${item.itemNo}">${item.itemName}</a>
															</h3>
															<div class="price-box">
																<span class="product-price">$${item.itemPrice}</span>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</c:if>
									</div>
									<div class="featured-col">
										<!-- 迭代顯示後三個近期瀏覽的商品 -->
										<c:if test="${not empty sessionScope.recentlyViewed}">
											<c:forEach items="${sessionScope.recentlyViewed}" var="item"
												varStatus="status">
												<c:if test="${status.count gt 3 and status.count le 6}">
													<div class="product-default left-details product-widget"
														style="height: 75px; overflow: hidden;">
														<figure
															style="width: 100px; float: left; margin-right: 10px;">
															<a href="AsapShopProduct.jsp?itemNo=${item.itemNo}">
																<img
																src="ItemInfoServlet?action=getImg&itemNo=${item.itemNo}"
																width="100" height="75" style="object-fit: cover;"
																alt="${item.itemName}" />
															</a>
														</figure>
														<div class="product-details">
															<h3 class="product-title">
																<a href="AsapShopProduct.jsp?itemNo=${item.itemNo}">${item.itemName}</a>
															</h3>
															<div class="price-box">
																<span class="product-price">$${item.itemPrice}</span>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</c:if>
									</div>
								</div>
							</div>
						</div>

						<div class="widget widget-block">
							<h3 class="widget-title">親愛的購物好友</h3>
							<p>
								歡迎來到ASAP二手商城！這裡有各種令人驚喜的二手物品等著您發現。與友善賣家互動，輕鬆購物，開啟您的寶藏之旅。安全、方便，期待為您帶來愉快的購物體驗！
							</p>
						</div>
					</div>

					<!-- End .widget -->
				</aside>
				<!-- End .col-lg-3 -->
			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->

		<div class="mb-4"></div>
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
									target="_blank" title="Facebook"></a> <a href="#"
									class="social-icon social-twitter icon-twitter" target="_blank"
									title="Twitter"></a> <a href="#"
									class="social-icon social-instagram icon-instagram"
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
						<span class="footer-copyright">© ASAP. 2023. All Rights
							Reserved</span>
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

	<!-- Plugins JS File -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/optional/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.appear.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.plugin.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>
	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<script>
	
//☆☆☆排序功能
$("select.orderby").on("change", function() {
    var orderby = $(".orderby").val();
    var form_data = {};

    if (orderby === "view_order") {
        form_data.action = "view_order";
    } else if (orderby === "true") {
        form_data.action = "orderby";
        form_data.Itemsort = true;
    } else if (orderby === "false") {
        form_data.action = "orderby";
        form_data.Itemsort = false;
    } else if (orderby === "new_order") {
        form_data.action = "new_order";
    } else {
        form_data.action = "other_action"; 
    }	
      
    $.ajax({
      url : "ItemInfoServlet",
      type : "POST",
      data : form_data,
      dataType: "json",
      success : function(data) {
      	state.querySet = data;
        var paginationData = pagination(state.querySet, state.page, state.rows);
        console.log(paginationData);
        getPosts(paginationData);
        pageButtons(paginationData.pages);
          
          }
      }
    )
  })
  
//☆☆☆搜尋功能
  $(document).ready(function() {
$("#itemsearch").on("click", function(event) {
    event.preventDefault(); // 阻止表單提交默認行為
    var searchQuery = $("#q").val(); // 獲取搜索關鍵詞
    $.ajax({
        url: "ItemInfoServlet", 
        type: "GET", // 使用GET方法
        data: { q: searchQuery, 
          action:"search"}, // 傳遞搜索參數
        dataType: "json",
        success: function(data) {
        	state.querySet = data;
            var paginationData = pagination(state.querySet, state.page, state.rows);
            console.log(paginationData);
            getPosts(paginationData);
            pageButtons(paginationData.pages);

			}
		})
	})
})

//☆☆☆複合查詢
$(document).ready(function() {
    var itemTypeNo, itemSizeNo, itemStatNo;

    // 監聽商品類型的點擊事件
    $('#item_type_select .cat-sublist div').on('click', function() {
        // 檢查當前元素是否已被選中
        if($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            itemTypeNo = null; // 清除選中類型編號
        } else {
            // 清除同一類型列表中其他元素的選中狀態
            $('#item_type_select .cat-sublist div').removeClass('selected');
            // 設置當前元素為選中狀態
            $(this).addClass("selected");
            itemTypeNo = $(this).data('category');
        }
        console.log("商品類型編號:", itemTypeNo);
    });

    // 監聽尺寸的點擊事件
    $('#item_size_select div').on('click', function() {
        if($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            itemSizeNo = null;
        } else {
            $('#item_size_select div').removeClass('selected');
            $(this).addClass("selected");
            itemSizeNo = $(this).data('category');
        }
        console.log("尺寸編號:", itemSizeNo);
    });

    // 監聽商品狀態的點擊事件
    $('#item_stat_select div').on('click', function() {
        if($(this).hasClass('selected')) {
            $(this).removeClass('selected');
            itemStatNo = null;
        } else {
            $('#item_stat_select div').removeClass('selected');
            $(this).addClass("selected");
            itemStatNo = $(this).data('category');
        }
        console.log("商品狀態編號:", itemStatNo);
    });

    // 綁定點擊事件
    $('body').on('click', 'button#select', function() {
    	var minPrice = $('#min-price').val();
    	var maxPrice = $('#max-price').val();   	
    	
        $.ajax({
            url: "ItemInfoServlet",
            type: "GET",
            data: {
                ItemTypeNo: itemTypeNo,
                ItemSizeNo: itemSizeNo,
                ItemStatNo: itemStatNo,
                minPrice: minPrice, // 最低價格
                maxPrice: maxPrice, // 最高價格
                action: "category"
            },
            dataType: "json",
            success: function(data) {
            	state.querySet = data;
                var paginationData = pagination(state.querySet, state.page, state.rows);
                console.log(paginationData);
                getPosts(paginationData);
                pageButtons(paginationData.pages);

              }
	         }
	       )
		})
	  })
	      
//☆☆☆加入購物車
$(document).on("click", ".btn-icon-cart", function() {
    var itemNo = $(this).data("itemno");
    var productCard = $(this).closest('.product-default'); // 定位到商品卡片
    var max = productCard.find("span.itemstockqty").text(); // 從商品卡片中獲取庫存量
    var quantity = $(this).siblings(".product-quantity").val(); // 獲取數量框的值
    console.log(max);
    console.log(quantity);
 // 檢查選擇的數量是否超過庫存
 
    if (quantity <= 0) {
        alert("無效的商品數量!");
        return; // 阻止後續執行
    }
    
    $.ajax({
        url: "ShoppingCartServlet",
        type: "POST",
        data: {
            itemNo: itemNo,
            max:max,
            itemqty: quantity,
            mbrNo: "${mbrNo}", //將會員號作為參數傳入後端
            action: "addcart"
        },
        dataType: "json",
        success: function(response) {
        	if(response.status==-2){
        		alert("超過可購買上限!")
        	} else{ 
        		alert("加入成功")
        		document.location.reload()
        		}
        	}
        }
    )
});
  
//☆☆☆刪除購物車
$('.btn-remove').on('click', function(e) {
    e.preventDefault();
    var cartId = $(this).closest('div').data('cartid'); // 獲取購物車項目 ID
    let r = confirm("確認刪除此項商品?");
	console.log(cartId);
    // 發送 AJAX 請求到後端
    if (r){
    $.ajax({
        url: '${pageContext.request.contextPath}/shop/ShoppingCartServlet',
        method: 'POST',
        data: {
            action: 'remove',
            shoppingCartNo: cartId // 購物車項目 ID
        },
        success: function(response) {
        	alert("刪除成功")
           document.location.reload()
        },
        error: function(xhr, status, error) {
            // 處理錯誤
            console.error(error);
        }
    });
    }
});  
  
//☆☆☆商品分類數量顯示
$(document).ready(function() {
$.ajax({
    url: "${pageContext.request.contextPath}/shop/ItemInfoServlet",
    type: 'POST',
    dataType: 'json',
    data: { "action": "getAllCountsByCategories" },
    success: function(response) {
        updateAllCounts(response);
    },
    error: function(error) {
        console.log('Error fetching counts: ', error);
    }
});
});

function updateAllCounts(allCounts) {
//     console.log("Received all counts:", allCounts);

    for (let category in allCounts) {
        let countMap = allCounts[category];
//     console.log('Processing category:' + category +', Counts:' + countMap);

        for (let id in countMap) {
            let count = countMap[id];
            console.log('Updating count for ' + category + ', ID: ' +id + ', Count: ' +count);
            var categoryName;
            if(category == "stat" ){
            	categoryName = "Stat";
            }
            if(category == "size"){
            	categoryName = "Size";
            }
            if(category == "type"){
            	categoryName = "Type";
            }
//             console.log('div[data-column="item'+categoryName+'No"][data-category="'+id+'"]');
            var countStr = "("+count+")";
            $('div[data-column="item'+categoryName+'No"][data-category="'+id+'"]').find("span").text(countStr);
//             console.log("Category:", category);
//             console.log("ID:", id);
//             console.log("Count:", count);
        }
    }
}

//☆☆☆價格範圍功能
document.addEventListener('DOMContentLoaded', function () {
    const minPriceSlider = document.getElementById('min-price');
    const maxPriceSlider = document.getElementById('max-price');
    const minPriceValue = document.getElementById('min-price-value');
    const maxPriceValue = document.getElementById('max-price-value');
    const selectedPriceRangeDisplay = document.getElementById('selected-price-range');

    function updatePriceRangeDisplay() {
        // 更新最大最小價格顯示
        minPriceValue.textContent =  "$" +minPriceSlider.value;
        maxPriceValue.textContent = "$" +maxPriceSlider.value;
        // 更新價格範圍顯示
        selectedPriceRangeDisplay.textContent = `$\${minPriceSlider.value} - $\${maxPriceSlider.value}`;
    }

    minPriceSlider.addEventListener('input', function() {
        if (parseInt(minPriceSlider.value) > parseInt(maxPriceSlider.value)) {
            minPriceSlider.value = maxPriceSlider.value;
        }
        updatePriceRangeDisplay();
    });
    
    maxPriceSlider.addEventListener('input', function() {
        if (parseInt(maxPriceSlider.value) < parseInt(minPriceSlider.value)) {
            maxPriceSlider.value = minPriceSlider.value;
        }
        updatePriceRangeDisplay();
    });
    // 初始化頁面立即更新價格顯示
    updatePriceRangeDisplay();
});
  
//☆☆☆首頁分頁
$.ajax({
        url: "${pageContext.request.contextPath}/shop/ItemInfoServlet",
        data: { "action": "page" },
        type: "POST",
        success: function(data) {
          console.log(data);
          state.querySet = data;
          var paginationData = pagination(state.querySet, state.page, state.rows);
          console.log(paginationData);
          getPosts(paginationData);
          pageButtons(paginationData.pages);
        }
      });
  
//☆☆☆功能分頁
var state = {
		  'querySet': [],
		  'page': 1,
		  'rows': 8,
		  'window': 3,
		};

	function getPosts(paginationData) {
		 var item_html = "";
	  paginationData.querySet.forEach(function(item) {
		    var soldOutLabel = item.itemStockQty == 0 ? `<div class="product-label label-hot">已完售</div>` : '';
		    var hotSaleLabel = item.itemView > 180 ? `<span class="product-label label-sale">熱門瀏覽</span>` : '';
	        var date = new Date(item.itemAddTime); 
	        var formattedDate = date.getFullYear() + '-' + (date.getMonth() + 1).toString().padStart(2, '0') + '-' + date.getDate().toString().padStart(2, '0');
		  item_html += `<div class="col-6 col-sm-3">
        <div class="product-default inner-quickview inner-icon">
        <figure>
        <span style="display: flex; align-items: center; justify-content: center; height: 270px; 
            border: 1px solid black; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);">
            
        <a href="ItemInfoServlet?action=increaseViewItem&itemNo=\${item["itemNo"]}">
    	<img
			src="ItemInfoServlet?action=getImg&itemNo=\${item["itemNo"]}""
			alt="product" style="max-height: 100%;" />
</a>
</span>

		<div class="label-group">
		` + soldOutLabel + hotSaleLabel + `
	
		</div>
            <a href="ProductQuickView.jsp?itemNo=\${item["itemNo"]}" class="btn-quickview" title="快速查看">快速查看</a>
        </figure>
        <div class="product-details">
            <div class="category-wrap">
                <div class="category-list">
                <span>\${item.itemTypeVO.itemTypeName}</span>, <span>\${item.itemStatVO.itemStatText}</span>,尺寸: <span>\${item.itemSizeVO.itemSizeText}</span>
                    </div>
                  </div> 
                  <h3 class="product-title">
                  <span style="color: blue; font-size: 16px; font-weight: bold;">
                      <a href="ItemInfoServlet?action=increaseViewItem&itemNo=\${item['itemNo']}">\${item.itemName}</a>
                  </span>
                  商品庫存: <span class="itemstockqty">\${item.itemStockQty}</span><br>       
                  瀏覽人數: <span>\${item.itemView}</span><br>
                  上架時間: <span>\${formattedDate}</span>

              </h3>
            
            <div class="product-buttons" style="display: flex; align-items: center;">
            <input type="number" class="product-quantity" placeholder="請選擇數量" min="1"
            max="\${item.itemStockQty}"
            style="width: 100px; margin-right: 20px;" />
            <a href="javascript:;" class="btn-icon-cart" title="加入購物車"
            data-itemno="\${item.itemNo}">
            <i class="icon-shopping-cart"></i> 加入購物車</a>
        </div>
        <div style="margin-top: 1px; margin-left: 138px;">
            <a href="AsapCart.jsp" class="btn-view-cart">查看購物車</a>
        </div>
        <div class="price-box">`;

    if (item.preItemPrice > item.itemPrice ) {
    	item_html += `<del class="old-price">$\${item.preItemPrice}</del>`;
    }

    item_html += `<span class="product-price">$\${item.itemPrice}</span>
        </div>
        </div>
    </div>
</div>`;
	     ;
	  });
	  $("div#roworder").html(item_html);
	}

	function pagination(querySet, page, rows) {
	  var trimStart = (page - 1) * rows;
	  var trimEnd = trimStart + rows;
	  var trimmedData = querySet.slice(trimStart, trimEnd);
	  var pages = Math.ceil(querySet.length / rows);
	  return {
	    'querySet': trimmedData,
	    'pages': pages
	  };
	}

	function pageButtons(pages) {
	  var wrapper = document.getElementById('pagination-wrapper');
	  wrapper.innerHTML = '';
	  var maxLeft = state.page - Math.floor(state.window / 2);
	  var maxRight = state.page + Math.floor(state.window / 2);
	  if (maxLeft < 1) {
	    maxLeft = 1;
	    maxRight = state.window;
	  }
	  if (maxRight > pages) {
	    maxLeft = pages - (state.window - 1);

	    if (maxLeft < 1) {
	      maxLeft = 1;
	    }
	    maxRight = pages;
	  }
	  if (state.page != 1) {
		    wrapper.innerHTML += `
		        <button value="1" class="page btn btn-sm" style="
		        	 background-color: #6a1b9a;
	            border: 1px solid #4a148c; 
	            color: #ffffff;
	            text-align: center;
	            margin: 2px;
	            border-radius: 4px;
	            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		        "
		        >&#171; 第一頁</button>`;
		}

	  for (var page = maxLeft; page <= maxRight; page++) {
	    wrapper.innerHTML += `<button value="\${page}" class="page btn btn-sm btn-info" style="
	    	 background-color: #6a1b9a; 
            border: 1px solid #4a148c;
            color: #ffffff; 
            text-align: center;
            text-decoration: none;
            margin: 2px;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	    ">\${page}</button>`;
	  }
	  if (state.page != pages) {
	    wrapper.innerHTML += `<button value="\${pages}" class="page btn btn-sm btn-info" style="
	    	 background-color: #6a1b9a; 
            border: 1px solid #4a148c;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            margin: 2px;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	    ">最末頁 &#187;</button>`;
	  }
	  $('.page').on('click', function() {
	    $('div#roworder').empty();
	    state.page = Number($(this).val());
	    var paginationData = pagination(state.querySet, state.page, state.rows);
	    getPosts(paginationData);
	    pageButtons(paginationData.pages);
	  });
	}

	
</script>

</body>
</html>