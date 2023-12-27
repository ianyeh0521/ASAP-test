<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.shop.entity.ItemInfoVO"%>
<%@ page import="com.asap.shop.service.ItemInfoService_interface"%>
<%@ page import="com.asap.shop.service.ItemInfoService"%>
<%@ page import="com.asap.shop.entity.OrderDetailVO"%>
<%@ page import="com.asap.shop.service.OrderDetailService_interface"%>
<%@ page import="com.asap.shop.service.OrderDetailService"%>
<%@ page import="com.asap.shop.entity.ItemImgVO"%>
<%@ page import="com.asap.shop.service.ItemImgService_interface"%>
<%@ page import="com.asap.shop.service.ItemImgService"%>
<%@ page import="com.asap.member.entity.MemberVO"%>
<%@ page import="com.asap.member.service.MemberService_interface"%>
<%@ page import="com.asap.member.service.MemberService"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<%
Integer itemInfo = Integer.valueOf(request.getParameter("itemNo"));
ItemInfoService_interface ItemSvc = new ItemInfoService();
ItemInfoVO list = ItemSvc.findByItemNo(itemInfo);
pageContext.setAttribute("list", list);
System.out.println(list);

OrderDetailService_interface OrderDetailSvc = new OrderDetailService();
List<OrderDetailVO> orderdetail = OrderDetailSvc.findByMbrNo("M1");
pageContext.setAttribute("cmtlist", orderdetail);

MemberService_interface MemberSvc = new MemberService();
MemberVO member = MemberSvc.findByMbrNo("M1");
pageContext.setAttribute("member", member);

ItemImgService_interface itemImgSvc = new ItemImgService();
List<String> itemImgBase64 = new ArrayList<>();
List<ItemImgVO> itemImgVOList = itemImgSvc.findByItemNo(itemInfo);
for (ItemImgVO itemImgVO : itemImgVOList) {
	itemImgBase64.add(Base64.getEncoder().encodeToString(itemImgVO.getItemImg()));
}
pageContext.setAttribute("itemimgbase64", itemImgBase64);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String formattedDate = "";
if (list.getItemAddTime() != null) {
	formattedDate = sdf.format(list.getItemAddTime());
}
%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>ASAP-ShopProduct</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template">
<meta name="author" content="SW-THEMES">

<!-- Favicon -->
<link rel="icon" type="${pageContext.request.contextPath}/image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">


<script>
	WebFontConfig = {
		google : {
			families : [ 'Open+Sans:300,400,600,700,800,400italic,800italic',
					'Poppins:300,400,500,600,700,800',
					'Oswald:300,400,500,600,700,800' ]
		}
	};
	(function(d) {
		var wf = d.createElement('script'), s = d.scripts[0];
		wf.src = '${pageContext.request.contextPath}/assets/js/webfont.js';
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<!-- Main CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/demo41.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">
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
						<a href="#" width="222" height="88"> <img
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
									<li><a href="#">論壇首頁</a></li>
									<li><a href="#">發佈貼文</a></li>
									<li><a href="#">我的貼文</a></li>
									<li><a href="#">收藏貼文</a></li>
								</ul></li>
							<li><a href="#">揪團</a>
								<ul>
									<li><a href="#">揪團首頁</a></li>
									<li><a href="#">發起揪團</a></li>
									<li><a href="#">我的揪團</a></li>
								</ul></li>
							<li><a href="#">找課程</a>
								<ul>
									<li><a href="#">查詢課程</a></li>
									<li><a href="#">我的課程</a></li>
								</ul></li>
							<li><a href="#">找場地</a>
								<ul>
									<li><a href="#">詢找場地</a></li>
									<li><a href="#">我的預約</a></li>
									<li><a href="#">我的收藏</a></li>
								</ul></li>
							<li><a href="#">賣家入口</a>
								<ul>
									<li><a href="#">所有訂單</a></li>
									<li><a href="#">所有商品</a></li>
									<li><a href="#">新增商品</a></li>
									<li><a href="#">商品評論</a></li>
								</ul></li>

							<li><a href="AsapShop.jsp">商城</a></li>
							<li><a href="" style="color: red">登入</a></li>
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
				<nav aria-label="breadcrumb" class="breadcrumb-nav">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="AsapShop.jsp"><i
								class="icon-home">商城首頁</i></a></li>
						<li class="breadcrumb-item">${list.itemName}</li>
					</ol>
				</nav>

				<div class="product-single-container product-single-default">
					<div class="cart-message d-none">
						<strong class="single-cart-notice">“${list.itemName}”</strong> <span>已經加入到您的購物車裡.</span>
					</div>

					<div class="row">

						<div class="col-lg-5 col-md-6 product-single-gallery">
							<div class="product-slider-container">

								<div
									class="product-single-carousel owl-carousel owl-theme show-nav-hover">

									<c:forEach var="img" items="${itemimgbase64}">
									<span style="display: flex; align-items: center; justify-content: center; height: 468px;">
										<div class="product-item">
											<img class="product-single-image"
												src="data:image/jpg;base64,${img}"
												data-zoom-image="data:image/jpg;base64,${img}" width="468"
												height="468" alt="圖片" />
										</div>
										</span>
									</c:forEach>

								</div>
								<!-- End .product-single-carousel -->
								<span class="prod-full-screen"> <i class="icon-plus"></i>
								</span>
							</div>

							<div class="prod-thumbnail owl-dots">

								<c:forEach var="img" items="${itemimgbase64}" >
									<span style="display: flex; align-items: center; justify-content: center; height: 110px; margin: 8px 0" >
									<div class="owl-dot">

											<img src="data:image/jpg;base64,${img}" width="110px"
												height="110px" alt="圖片" />
	
										</div>
										</span>
								</c:forEach>

							</div>
						</div>
						<!-- End .product-single-gallery -->


						<div class="col-lg-7 col-md-6 product-single-details">
							<h1 class="product-title" data-itemno=${list.itemNo}>${list.itemName}</h1>


							<div class="ratings-container">
								<!-- 								<div class="product-ratings"> -->
								<!-- 									<span class="ratings" style="width: 80%"></span> -->
								<!-- 									End .ratings -->
								<!-- 									<span class="tooltiptext tooltip-top"></span> -->
								<!-- 								</div> -->
								<!-- 								End .product-ratings -->

								<!-- 								<a href="#" class="rating-link">( 1 則評論 )</a> -->
							</div>
							<!-- End .ratings-container -->

							<hr class="short-divider">

							<div class="price-box">
								<c:if test="${list.preItemPrice > list.itemPrice}">
									<del class="old-price">$${list.preItemPrice}</del>
								</c:if>
								<span class="product-price">$${list.itemPrice}</span>
							</div>


							<!-- End .price-box -->

							<div class="product-desc">
								<p>${list.itemText}</p>
							</div>
							<!-- End .product-desc -->

							<ul class="single-info-list">
								<!---->
								<li>商品編號: <strong>${list.itemNo}</strong>
								</li>

								<li>商品分類: <strong>${list.itemTypeVO.itemTypeName}</strong>
								</li>
								<fmt:formatDate value="${list.itemAddTime}" pattern="yyyy-MM-dd"
									var="formattedDate" />
								<li>上架時間: <strong><a class="product-addtime">${formattedDate}</a></strong></li>
								<li>商品狀態: <strong> <a class="product-stat">${list.itemStatVO.itemStatText}</a>
								</strong>
								</li>
								<li>庫存數量: <strong> <a class="product-qty">${list.itemStockQty}</a>
								</strong>
								</li>
								<li>賣家: <strong> <a class="product-seller">${list.mbrNo}</a>
								</strong>
								</li>
								<li>瀏覽人數: <strong> <a class="product-cview">${list.itemView}</a>
								</strong>
								</li>


							</ul>

							<div class="product-action">

								<div class="product-single-qty">
									<input class="horizontal-quantity form-control" type="text">
								</div>
								<!-- End .product-single-qty -->

								<a href="javascript:;" class="btn btn-dark add-cart mr-2"
									title="Add to Cart">加入購物車</a> <a href="AsapCart.jsp"
									class="btn btn-gray view-cart d-none">查看購物車</a>
							</div>
							<!-- End .product-action -->

							<hr class="divider mb-0 mt-0">

							<div class="product-single-share mb-2">
								<label class="sr-only">Share:</label>

								<div class="social-icons mr-2"></div>
								<!-- End .social-icons -->

								<span class="addwish"><a href="#"
									class="btn-icon-wish add-wishlist" title="加入我的收藏"><i
										class="icon-wishlist-2"></i><span>加入我的收藏</span></a></span>
							</div>
							<!-- End .product single-share -->
						</div>
						<!-- End .product-single-details -->

					</div>
					<!-- End .row -->


				</div>
				<!-- End .product-single-container -->

				<div class="product-single-tabs">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="product-tab-desc" data-toggle="tab"
							href="#product-desc-content" role="tab"
							aria-controls="product-desc-content" aria-selected="true">商品描述</a>
						</li>


						<li class="nav-item"><a class="nav-link"
							id="product-tab-reviews" data-toggle="tab"
							href="#product-reviews-content" role="tab"
							aria-controls="product-reviews-content" aria-selected="false">賣家評論
						</a></li>
					</ul>

					<div class="tab-content">
						<div class="tab-pane fade show active" id="product-desc-content"
							role="tabpanel" aria-labelledby="product-tab-desc">
							<div class="product-desc-content">
								<p>${list.itemText}</p>
								<ul>
									<li>商品狀態: <strong> <a class="product-category">${list.itemStatVO.itemStatText}</a>
									</strong>
									</li>
									<li>安全支付選項</li>
									<li>依據售出商品屬於個人衛生或特殊性質，故無法提供換貨服務。</li>
								</ul>
								<p>透過購買二手商品，有助於減少對自然資源的需求，降低環境影響，建立更為環保的生活方式。</p>
							</div>
							<!-- End .product-desc-content -->
						</div>
						<!-- End .tab-pane -->

						<div class="tab-pane fade" id="product-reviews-content"
							role="tabpanel" aria-labelledby="product-tab-reviews">
							<div class="product-reviews-content">
								<h3 class="reviews-title">
									<!-- 								1 review for Men Black SportsShoes -->
								</h3>

								<div class="comment-list">
									<div class="comments">
										<figure class="img-thumbnail">
											<img src="${pageContext.request.contextPath}/newImg/user.png"
												alt="author" width="80" height="80">
										</figure>

										<div class="comment-block">
											<div class="comment-header">
												<div class="comment-arrow"></div>

												<div class="ratings-container float-sm-right">
													<div class="product-ratings">
														<c:set var="ratingPercentage"
															value="${member.cmtReScore/member.cmtReNum*20}" />
														<!-- 計算百分比 -->
														<span class="ratings" style="width: ${ratingPercentage}%"></span>
														<!-- 應用百分比 -->
														<!-- End .ratings -->
														<span class="tooltiptext tooltip-top"></span>
													</div>
													<!-- End .product-ratings -->
												</div>

												<span class="comment-by"> <strong>${member.mbrName}</strong>
													${member.mbrNo}
												</span>
											</div>

											<div class="comment-content">
												<p>${member.sellerIntro}</p>
											</div>
										</div>
									</div>
								</div>


								<div class="divider"></div>

							</div>
							<!-- End .product-reviews-content -->
						</div>
						<!-- End .tab-pane -->
					</div>
					<!-- End .tab-content -->
				</div>
				<!-- End .product-single-tabs -->

			</div>
			<!-- End .container -->
		</main>
		<!-- End .main -->

		<footer class="footer bg-dark"> </footer>
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

	<div class="mobile-menu-container"></div>
	<!-- End .mobile-menu-container -->

	<div class="sticky-navbar"></div>

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

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<script>
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");

		//確認已加入收藏
		var itemNo = $(".product-title").attr("data-itemno");
		var mbrNo = "M001";
		$
				.ajax({
					url : "${pageContext.request.contextPath}/shop/ItemCollectController",
					type : "POST",
					data : {
						"itemNo" : itemNo,
						"mbrNo" : mbrNo,
						"action" : "checkwishlist"
					},
					dataType : "json",
					success : function(data) {
						if (data.status == -1) {
							$("a.add-wishlist").html("已加入收藏");
							$("a.add-wishlist").removeAttr("href");
							$("span.addwish").unbind();
						}
					}

				})

		//加入購物車
		$(".add-cart").on("click", function() {
			var addCart = $(".product-title").attr("data-itemno");
			var max = $(".product-qty").text();
			var cartQty = $(".horizontal-quantity").val();
			var mbrNo = "M1";

			if (cartQty > max) {
				alert("超過庫存數量！");
				return; // 阻止後續執行
			}

			if (cartQty < 0) {
				alert("不可選擇負數！");
				return; // 阻止後續執行
			}

			console.log(addCart);
			$.ajax({
				url : "ShoppingCartServlet",
				type : "POST",
				data : {
					itemNo : addCart,
					max : max,
					itemqty : cartQty,
					mbrNo : mbrNo,
					"action" : "addcart"
				},
				//         	            dataType: "json",
				success : function(data) {
					if (data.status == -2) {
						alert("超過可購買上限!")
					} else {
						alert("加入成功")
					}

				}

			})
		})

		//加入收藏
		$("span.addwish")
				.on(
						"click",
						function() {
							var itemNo = $(".product-title")
									.attr("data-itemno");
							var mbrNo = "M001";
							$
									.ajax({
										url : "${pageContext.request.contextPath}/shop/ItemCollectController",
										type : "POST",
										data : {
											"itemNo" : itemNo,
											"mbrNo" : mbrNo,
											"action" : "wishlist"
										},
										success : function(data) {
											console.log(data.status)

											$("a.add-wishlist").html("已加入收藏");
											$("a.add-wishlist").removeAttr(
													"href");
											$("span.addwish").unbind();

										}

									})

						})
	</script>

</body>

</html>