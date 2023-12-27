<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>ASAP</title>

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />
<link rel="stylesheet"
	href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
	integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
	crossorigin="anonymous" />



<!-- Plugins CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />
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
						<a href="${pageContext.request.contextPath}/ASAPwelcome.jsp" style="width: 222; height: 88;"> <img
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
							<li><a href="${pageContext.request.contextPath}/member/MemberLogin.jsp">會員登入</a></li>
                            <li><a href="${pageContext.request.contextPath}/coach/CoachLogin.jsp">教練登入</a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->
		</header>
		<!-- End .header -->

		<main class="main">
			<div class="page-header">
				<div class="container d-flex flex-column align-items-center">
					<h1>會員登入</h1>
				</div>
			</div>

			<div class="container login-container">
				<div style="text-align: center;">
					<c:if test="${not empty registerSuccess}">
						<p style="color: blue; font-size: 12px;">${registerSuccess}</p>
						<%
						session.removeAttribute("registerSuccess");
						%>
					</c:if>
					<c:if test="${not empty errorMsgs}">
						<c:forEach var="message" items="${errorMsgs}">
							<p style="color: red; font-size: 12px;">${message}</p>
						</c:forEach>
					</c:if>

				</div>
				<div class="row">
					<div class="col-lg-10 mx-auto">
						<div class="row" style="justify-content: center">
							<div class="col-md-6"
								style="margin: 30px; box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;">


								<form
									action="${pageContext.request.contextPath}/MemberController"
									method="post">
									<label for="login-email" style="margin-top: 20px"> 會員帳號
									</label> <input type="email" class="form-input form-wide"
										id="login-email" required name="mbrEmail" placeholder="email" value="${mbrEmail}" />
                                    <% session.removeAttribute("mbrEmail"); %>
									<label for="login-password"> 會員密碼 </label> <input
										type="password" class="form-input form-wide"
										id="login-password" required name="mbrPwd"
										placeholder="password" /> <label for="input_ver"> 驗證碼
									</label> <input class="form-input form-wide" id="input_ver" type="text"
										name="verifycode" required />

									<div
										style="display: flex; align-items: center; flex-wrap: wrap; margin: 5px 0;">
										<img id="verifycode"
											src="${pageContext.request.contextPath}/AuthCode"
											style="border: 2px white solid; margin-right: 15px; width: 150px; height: 40px" />
										<button type="button"
											style="border: 0; border-radius: 5px; margin: 0 6px 0 2px; background-color: lightgray;"
											id="change_ver">更換</button>
									</div>

									<div class="form-footer"
										style="margin: 5px 0 15px 0; justify-content: flex-end">
										<div style="margin-right: 15px;">
											<a
												href="${pageContext.request.contextPath}/member/MemberRegister.jsp"
												class="forget-password text-dark form-footer-right"
												style="text-decoration: underline;">註冊帳號</a>
										</div>
										<div>
											<a
												href="${pageContext.request.contextPath}/member/MemberForgetPwd.jsp"
												class="forget-password text-dark form-footer-right"
												style="text-decoration: underline">忘記密碼</a>
										</div>
									</div>
									<input type="hidden" name="action" value="login">
									<button type="submit" class="btn btn-dark btn-md w-100"
										id="btn_login">登入</button>
<!-- 									<hr style="margin: 15px 0" /> -->
<!-- 									<button type="button" -->
<!-- 										class="btn btn-primary btn-ellipse btn-md w-100" -->
<!-- 										style="border-radius: 50px" id="btn_google"> -->
<!-- 										使用Google帳號登入</button> -->
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
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
									<li><a>Account</a></li>
									<li><a>Course</a></li>
									<li><a>Forum</a></li>
									<li><a>Group</a></li>
									<li><a>Court</a></li>
									<li><a>Seller</a></li>
									<li><a>Mall</a></li>
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

	<div class="mobile-menu-overlay"></div>
	<!-- End .mobil-menu-overlay -->

	<div class="mobile-menu-container">
	 <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="fa fa-times"></i></span>
            <nav class="mobile-nav">
              <ul class="mobile-menu">
                <li><a href="${pageContext.request.contextPath}/ASAPwelcome.jsp">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/member/MemberLogin.jsp">會員登入</a></li>
                <li><a href="${pageContext.request.contextPath}/coach/CoachLogin.jsp">教練登入</a></li>
              </ul>
            </nav>
            <!-- End .mobile-nav -->
          </div>
          <!-- End .mobile-menu-wrapper -->
          
	</div>
	<!-- End .mobile-menu-container -->

<!-- 	<div class="sticky-navbar"></div> -->

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<script>
		$(window).on(
				"load",
				function() {

					$("button#change_ver").on(
							"click",
							function() {
								$("img#verifycode").attr(
										"src",
										"${pageContext.request.contextPath}/AuthCode?time="
												+ new Date().getTime());
							})

				});
	</script>

</body>
</html>
