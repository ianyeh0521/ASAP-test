<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.util.*"%>
<%@ page import="java.util.Base64" %>

<%
	

%>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>尋找場地</title>

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Bootstrap eCommerce Template">
	<meta name="author" content="SW-THEMES">

	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="/ASAP/assets/images/icons/favicon.png">

	<script>
		WebFontConfig = {
			google: { families: ['Open+Sans:400,600,700', 'Poppins:300,400,500,600,700'] }
		};
		(function (d) {
			var wf = d.createElement('script'), s = d.scripts[0];
			wf.src = '/ASAP/assets/js/webfont.js';
			wf.async = true;
			s.parentNode.insertBefore(wf, s);
		})(document);
	</script>

	<!-- Plugins CSS File -->
	<link rel="stylesheet" href="/ASAP/assets/css/bootstrap.min.css">
	<link rel="preload" href="/ASAP/assets/fonts/porto.woff2?64334846" as="font" type="font/ttf" crossorigin>
	<link rel="preload" href="/ASAP/assets/vendor/fontawesome-free/webfonts/fa-solid-900.woff2" as="font" type="font/woff2"
		crossorigin>
	<link rel="preload" href="/ASAP/assets/vendor/fontawesome-free/webfonts/fa-brands-400.woff2" as="font" type="font/woff2"
		crossorigin>

	<!-- Main CSS File -->
	<link rel="stylesheet" href="/ASAP/assets/css/style.min.css">
	<link rel="stylesheet" type="text/css" href="/ASAP/assets/vendor/fontawesome-free/css/all.min.css">

	
</head>

<body>
	<div class="page-wrapper">

		<header class="header">
			
		</header><!-- header -->

		<main class="main">
			<!-- banner in main -->
			<!-- <div class="category-banner-container bg-gray">
				<div class="category-banner banner text-uppercase"
					style="background: no-repeat 60%/cover url('assets/images/elements/page-header.jpg');">
					<div class="container position-relative">
						<nav aria-label="breadcrumb" class="breadcrumb-nav text-white">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item"><a href="demo4.html">Home</a></li>
								<li class="breadcrumb-item active" aria-current="page">找場地！</li>
							</ol>
						</nav>
						<h1 class="page-title text-center text-white">找場地！</h1>
					</div>
				</div>
			</div> -->

			<!-- 搜尋列 -->
			<div class="container" style="margin-top: 20px !important;">
				<div
					class="header-icon header-search header-search-inline header-search-category w-lg-max text-right mt-0">
					<a href="#" class="search-toggle" role="button"><i class="icon-search-3"></i></a>
					<form METHOD="post" ACTION="${pageContext.request.contextPath}/court/court.do">
						<div class="header-search-wrapper">
							
							<!-- 搜尋欄 -->
							<input type="search" class="form-control" name="searchCourt" placeholder="尋找場地...">
							
							<!--日期選擇-->
<!-- 						<div class="select-custom" style="display:flex;justify-content:center;align-items:center"> -->
<!-- 							<input type="date" id="choose-date"> -->
<!-- 						</div> -->
							
							<!-- 場地種類選擇 -->
							<div class="select-custom">
								<select name="courtType">
									<option value="">選擇場地類型</option>
									<option value="1">- 游泳池</option>
									<option value="2">- 棒球場</option>
									<option value="3">- 網球場</option>
									<option value="4">- 手球場</option>
									<option value="5">- 籃球場</option>
									<option value="6">- 排球場</option>
									<option value="7">- 桌球場</option>
									<option value="8">- 羽球場</option>
								</select>
							</div><!-- End .select-custom -->
	
							<!-- 地點選擇 -->
							<div class="select-custom">
								<select name="regions">
									<option value="">選擇地區</option>
									<option value="1">- 松山區</option>
									<option value="2">- 信義區</option>
									<option value="3">- 大安區</option>
									<option value="4">- 中山區</option>
									<option value="5">- 中正區</option>
									<option value="6">- 大同區</option>
									<option value="7">- 萬華區</option>
									<option value="8">- 文山區</option>
									<option value="9">- 南港區</option>
									<option value="10">- 內湖區</option>
									<option value="11">- 士林區</option>
									<option value="12">- 北投區</option>
								</select>
							</div><!-- End .select-custom -->
							<button class="btn icon-magnifier p-0" type="submit" title="search"></button>	
							<input type="hidden" name="action" value="compositeQuery">
							
						</div><!-- End .header-search-wrapper -->
					</form>	
				</div>		
			</div><!-- End .container -->

			<!-- 功能按鈕 -->
			<div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
				<button class="btn btn-primary btn-rounded btn-md"><a href="#"></a>地圖搜尋</button>
				<button class="btn btn-primary btn-rounded btn-md"><a href="#"></a>我的收藏</button>
				<button class="btn btn-primary btn-rounded btn-md"><a href="#"></a>我的預約</button>
			</div>
			
			
			<!-- main container -->
			<div class="container mt-6" style="margin-top: 0px !important;">
				<!-- 整個 row -->
				
				
				<div class="row mb-8" id="divTest">

					<!-- court list -->
					<div class="col-lg-9">
						<h4 class="text-uppercase heading-bottom-border mt-4" style="margin-top: 30px !important;">搜尋「 ${searchCon} 」的結果：</h4>
						
						<nav class="toolbox sticky-header" data-sticky-options="{'mobile': true}" style="margin-bottom: 0px;">
							<div class="toolbox-left"></div>
							<!-- End .toolbox-left -->

							<div class="toolbox-right">
								<a href="#" class="sidebar-toggle">
									<svg data-name="Layer 3" id="Layer_3" viewBox="0 0 32 32"
										xmlns="http://www.w3.org/2000/svg">
										<line x1="15" x2="26" y1="9" y2="9" class="cls-1"></line>
										<line x1="6" x2="9" y1="9" y2="9" class="cls-1"></line>
										<line x1="23" x2="26" y1="16" y2="16" class="cls-1"></line>
										<line x1="6" x2="17" y1="16" y2="16" class="cls-1"></line>
										<line x1="17" x2="26" y1="23" y2="23" class="cls-1"></line>
										<line x1="6" x2="11" y1="23" y2="23" class="cls-1"></line>
										<path
											d="M14.5,8.92A2.6,2.6,0,0,1,12,11.5,2.6,2.6,0,0,1,9.5,8.92a2.5,2.5,0,0,1,5,0Z"
											class="cls-2"></path>
										<path d="M22.5,15.92a2.5,2.5,0,1,1-5,0,2.5,2.5,0,0,1,5,0Z" class="cls-2"></path>
										<path d="M21,16a1,1,0,1,1-2,0,1,1,0,0,1,2,0Z" class="cls-3"></path>
										<path
											d="M16.5,22.92A2.6,2.6,0,0,1,14,25.5a2.6,2.6,0,0,1-2.5-2.58,2.5,2.5,0,0,1,5,0Z"
											class="cls-2"></path>
									</svg>
									<span>Filter</span>
								</a>

								<div class="toolbox-item toolbox-sort">
									<label>排序方式:</label>

									<div class="select-custom">
										<select name="orderby" class="form-control">
											<option value="menu_order" selected="selected">預設</option>
											<option value="priceHL">價格高➪低</option>
											<option value="priceLH">價格低➪高</option>
											<option value="distanceFN">距離遠➪近</option>
											<option value="distanceNF">距離近➪遠</option>
										</select>
									</div>
									<!-- End .select-custom -->


								</div>
								<!-- End .toolbox-item -->
							</div>
							<!-- End .toolbox-right -->
						</nav>
					
						<!-- 場地資訊 -->
						
						<div class="row" >
							<c:forEach var="courtVO" items="${courSearchList}">
							<div class="col-sm-12 col-6 product-default left-details product-list mb-2">
								
								
								<figure>								
										<img src="data:image/jpeg;base64" width="250" height="250"
											alt="圖片" />							
								</figure>
								
								
								<div class="product-details" >
									<div class="category-list">
										<a href="category.html" class="type">${courtVO.courtTypeVO.courtType}</a>
									</div>
									<h3 class="product-title" class="name"> <a href="product.html">${courtVO.courtName}</a></h3>
									<p class="product-description" class="text">${courtVO.courtText}</p>
									<div class="price-box">
										<span class="product-price" class="price">${courtVO.courtPrice} / hr</span>
									</div>
									<div class="product-action">
										<a href="#" class="btn-icon btn-add-cart product-type-simple">
											<i class="icon-shopping-cart"></i>
											<span>我要預約</span>
										</a>
										<a href="wishlist.html" class="btn-icon-wish" title="wishlist">
											<i class="icon-heart"></i>
										</a>
									</div>
								</div>
							</div>	
							</c:forEach>
						</div><!-- 場地資訊結束 -->
						
						</div>
					</div>
					
					<!-- current browse history -->
					<div class="col-lg-3">
						<h4 class="text-uppercase heading-bottom-border mt-6 mt-lg-4" style="margin-top: 30px !important;">近期瀏覽</h4>
						<div class="product-default left-details product-widget">
							<figure>
								<a href="product.html">
									<img src="#" width="84" height="84"
										alt="product">
									<img src="#" width="84" height="84"
										alt="product">
								</a>
							</figure>
							<div class="product-details">
								<h3 class="product-title"> <a href="product.html" class="name">室內網球場</a> </h3>
								<div class="ratings-container">
								</div><!-- End .product-container -->
								<div class="price-box">
									<span class="product-price">1000</span>
								</div><!-- End .price-box -->
							</div><!-- End .product-details -->
						</div>
					</div>

				</div>
			</div>

		</main><!-- End .main -->

		<footer class="footer bg-dark"></footer><!-- End .footer -->
	</div><!-- End .page-wrapper -->

	<div class="loading-overlay">
		<div class="bounce-loader">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>

	<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->
	<div class="mobile-menu-container"></div><!-- End .mobile-menu-container -->

	<div class="sticky-navbar">	</div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

	<!-- import Vue 3.0 -->
	<script src="https://unpkg.com/vue@next"></script>

	<!-- CDN import Axios -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	
	<!-- Plugins JS File -->
	<script src="/ASAP/assets/js/jquery.min.js"></script>
	<script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/ASAP/assets/js/plugins.min.js"></script>
	<script src="/ASAP/assets/js/nouislider.min.js"></script>
	<script src="/ASAP/assets/js/optional/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script src="/ASAP/assets/js/main.min.js"></script>

	<!-- datepicker -->
	<script>
		import AirDatepicker from 'air-datepicker';
		import 'air-datepicker/air-datepicker.css';

		let dp = new AirDatepicker('#el');
		dp.show();
	</script>

	<!-- header and footer template -->
	<script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>
	
</body>

</html>