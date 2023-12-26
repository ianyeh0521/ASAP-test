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
	<div
		class="product-single-container product-single-default product-quick-view mb-0 custom-scrollbar">
		<div class="row">
			<div class="col-md-6 product-single-gallery mb-md-0">
				<div class="product-slider-container">
					<div class="label-group">
						<div class="product-label label-hot"
							style="${list.itemStockQty == 0 ? 'display: block;' : 'display: none;'}">已完售</div>
						<!---->
						<div class="product-label label-sale"
							style="${list.itemView >180 ? 'display: block;' : 'display: none;'}">熱門瀏覽</div>
					</div>

					<div
						class="product-single-carousel owl-carousel owl-theme show-nav-hover">
						<c:forEach var="img" items="${itemimgbase64}">
							<div class="product-item">
								<img class="product-single-image"
									src="data:image/jpg;base64,${img}"
									data-zoom-image="data:image/jpg;base64,${img}" width="468"
									height="468" alt="圖片" />
							</div>
						</c:forEach>
					</div>
					<!-- End .product-single-carousel -->
				</div>
				<div class="prod-thumbnail owl-dots">
					<c:forEach var="img" items="${itemimgbase64}">
						<div class="owl-dot">
							<img src="data:image/jpg;base64,${img}" width="110" height="110"
								alt="圖片" />
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- End .product-single-gallery -->

			<div class="col-md-6">
				<div class="product-single-details mb-0 ml-md-4">
					<h1 class="product-title">${list.itemName}</h1>

					<hr class="short-divider">

					<div class="price-box">
						<c:if test="${list.preItemPrice > list.itemPrice}">
							<del class="old-price">$${list.preItemPrice}</del>
						</c:if>
						<span class="product-price">$${list.itemPrice}</span>
					</div>

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
						
						<li>商品狀態: <strong> <a class="product-category">${list.itemStatVO.itemStatText}</a>
						</strong>
						</li>

						<li>庫存數量: <strong> <a class="product-category">${list.itemStockQty}</a>
						</strong>
						</li>
						<li>賣家: <strong> <a class="product-category">${list.mbrNo}</a>
						</strong>
						</li>
						<li>瀏覽人數: <strong> <a class="product-cview">${list.itemView}</a>
						</strong>
						</li>
					</ul>

					<!-- End .product-action -->

					<hr class="divider mb-0 mt-0">

					<div class="product-single-share mb-0">
						<label class="sr-only">Share:</label>

						<div class="social-icons mr-2">

						</div>
						<!-- End .social-icons -->

					</div>
					<!-- End .product single-share -->
				</div>


			</div>
			<!-- End .product-single-details -->

			<button title="Close (Esc)" type="button" class="mfp-close">
				×</button>
		</div>
		<!-- End .row -->
	</div>
	<!-- End .product-single-container -->
</body>
</html>