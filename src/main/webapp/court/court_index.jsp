<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>後臺管理-場地</title>
<!-- Favicon -->

<link rel="icon" type="image/x-icon" href="/ASAP/assets/images/icons/favicon.png">


<script>
	WebFontConfig = {
		google : {
			families : [ 'Open+Sans:300,400,600,700,800',
					'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ]
		}
	};
	(function(d) {
		var wf = d.createElement('script'), s = d.scripts[0];
		wf.src = '/ASAP/assets/js/webfont.js';
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="/ASAP/assets/css/bootstrap.min.css">

<!-- Main CSS File -->
<link rel="stylesheet" href="/ASAP/assets/css/style.min.css">
<link rel="stylesheet" type="text/css" href="/ASAP/assets/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/ASAP/assets/vendor/simple-line-icons/css/simple-line-icons.min.css">
</head>

<body>
	<div class="page-wrapper">
	 <header class="header" >
		<div class="container" >
			<div class="header-left col-lg-2 w-auto pl-0">
				<button class="mobile-menu-toggler text-primary mr-2" type="button">
					<i class="fas fa-bars"></i>
				</button>
				<a href="#" width="222" height="88"> <img
					src="${pageContext.request.contextPath}/newImg/logo2.png"
					alt="Logo" />
				</a>
			</div>
			<!-- End .header-left -->
		</div>
		End .container


	<div class="header-bottom sticky-header d-none d-lg-block"
		data-sticky-options="{'mobile': false}"></div>
	<!-- End .header-bottom -->
	</header>
	<!-- End .header -->

	<main class="main">
		<div class="page-header">
			<div class="container d-flex flex-column align-items-center">
				<nav aria-label="breadcrumb" class="breadcrumb-nav">
					<div class="container">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">後台</a></li>
							<li class="breadcrumb-item active" aria-current="page">場地管理</li>
						</ol>
					</div>
				</nav>

				<h1>場地管理</h1>
			</div>
		</div>

		<div class="container account-container custom-account-container">
			<div class="row">
				<div class="col-lg-9 order-lg-last order-1 tab-content">
					<div class="tab-pane fade show active" id="dashboard"
						role="tabpanel">
						<div class="dashboard-content">
							<div class="mb-4"></div>

							<div class="row row-lg">

								<div class="col-6 col-md-4">
									<div class="feature-box text-center pb-4">
										<a
											href="${pageContext.request.contextPath}/court/listAllCourts_datatable_Ajax.html"><i
											class="sicon-location-pin"></i></a>
										<div class="feature-box-content">
											<h3>所有場地</h3>
										</div>
									</div>
								</div>

								<div class="col-6 col-md-4">
									<div class="feature-box text-center pb-4">
										<a href="#"><i class="sicon-logout"></i></a>
										<div class="feature-box-content">
											<h3>回後臺首頁</h3>
										</div>
									</div>
								</div>
							</div>
							<!-- End .row -->
						</div>
					</div>
					<!-- End .tab-pane -->
				</div>
				<!-- End .tab-content -->
			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->

		<div class="mb-5"></div>
		<!-- margin -->
	</main>
	<!-- End .main -->

	<footer class="footer bg-dark"></footer>
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
	<script src="/ASAP/assets/js/jquery.min.js"></script>
	<script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/ASAP/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="/ASAP/assets/js/main.min.js"></script>

	<!-- header and footer template -->
	<script>
		$("header").load("backstage_header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>
</body>

</html>