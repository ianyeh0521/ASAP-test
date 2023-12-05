<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700,800",
					"Oswald:300,400,500,600,700,800", ],
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> -->

<!-- Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/demo4.min.css" />
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
						<a href="#" style="width: 222; height: 88;"> <img
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

							<li><a href="">商城</a></li>
							<li><a href="login.jsp" style="color: red">登入</a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->
		</header>
		<!-- End .header -->

		<main class="main">
			<div
				class="home-slider slide-animate owl-carousel owl-theme show-nav-hover nav-big mb-2 text-uppercase"
				data-owl-options="{
				'loop': false
			}">
				<div class="home-slide home-slide1 banner">
					<img class="slide-bg"
						src="${pageContext.request.contextPath}/newImg/runner.jpg"
						width="1903" height="499" alt="slider image" />
					<div class="container d-flex align-items-center">
						<div class="banner-layer appear-animate"
							data-animation-name="fadeInUpShorter">
							<h4 class="text-transform-none m-b-3">Find the Boundaries.
								Push Through!</h4>
							<h2 class="text-transform-none mb-0">Start Exercising with</h2>
							<h3 class="m-b-3">ASAP</h3>
							<a href="category.html" class="btn btn-dark btn-lg">Start!</a>
						</div>
						<!-- End .banner-layer -->
					</div>
				</div>
				<!-- End .home-slide -->

				<div class="home-slide home-slide2 banner banner-md-vw">
					<img class="slide-bg" style="background-color: #ccc" width="1903"
						height="499"
						src="${pageContext.request.contextPath}/newImg/tennis.jpg"
						alt="slider image" />
					<div class="container d-flex align-items-center">
						<div
							class="banner-layer d-flex justify-content-center appear-animate"
							data-animation-name="fadeInUpShorter">
							<div class="mx-auto">
								<h4 class="m-b-1">About US</h4>

								<h3 class="mb-2 heading-border"
									style="font-size: 18px; color: blanchedalmond; text-shadow: black 0.1em 0.1em 0.2em;">
									針對不知道該從何開始運動的初學者、找不到夥伴一起運動的人，這裡提供了一個無壓力、充滿支援的地方。<br /> <br />

									新手要開始運動可能讓人感到迷茫，藉由在論壇上輕鬆提出任何運動相關的問題，會員們將樂意分享經驗、提供建議。<br /> <br />

									如果需要更專業的引導，提供了專業教練的媒合服務，找到最適合的教練，一步步建立運動的習慣，也可隨時隨地，發起揪團，尋找同領域的運動夥伴，相互交流，共同進步，並透過平台上的即時搜尋功能，協助尋找、租借適合的場地，並提供專屬優惠。<br />
									<br /> 另外，也可以在市集找到二手的運動商品，節省開支，為初學者打造的運動社群，提供了豐富的功能，輕鬆開啟運動。<br />
								</h3>
								<h2 class="text-transform-none mb-0"
									style="font-size: 15px; color: white; text-shadow: black 0.1em 0.1em 0.2em;">
									- Avid Sport Access Platform</h2>
							</div>
						</div>
						<!-- End .banner-layer -->
					</div>
				</div>
				<!-- End .home-slide -->
			</div>
			<!-- End .home-slider -->
		</main>


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
										class="social-icon social-twitter icon-twitter"
										target="_blank" title="Twitter"></a> <a href="#"
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
									<li><a href="#">Account</a></li>
									<li><a href="#">Course</a></li>
									<li><a href="#">Forum</a></li>
									<li><a href="#">Group</a></li>
									<li><a href="#">Court</a></li>
									<li><a href="#">Seller</a></li>
									<li><a href="#">Mall</a></li>
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
							<span class="footer-copyright">© Tibame. 2023. All Rights
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


	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->
	<!-- 				<script src="assets/js/jquery.min.js"></script> -->
	<!-- 				<script src="assets/js/bootstrap.bundle.min.js"></script> -->
	<!-- 				<script src="assets/js/optional/isotope.pkgd.min.js"></script> -->
	<!-- 				<script src="assets/js/plugins.min.js"></script> -->
	<!-- 				<script src="assets/js/jquery.appear.min.js"></script> -->

	<!-- 				Main JS File -->
	<!-- 				<script src="assets/js/main.min.js"></script> -->
</body>
</html>
