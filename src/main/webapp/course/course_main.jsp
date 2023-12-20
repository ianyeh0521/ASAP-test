<%@page import="java.util.List"%>
<%@page import="com.asap.course.entity.CourseVO"%>
<%@page import="com.asap.course.service.CourseService"%>
<%@page import="com.asap.course.service.CourseService_interface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<%
	CourseService_interface courseSvc = new CourseService();
	List<CourseVO> courseList = courseSvc.getAll();
	
	pageContext.setAttribute("courseList", courseList);

%>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>課程</title>

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Bootstrap eCommerce Template">
	<meta name="author" content="SW-THEMES">

	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">

	<script>
		WebFontConfig = {
			google: { families: ['Open+Sans:400,600,700', 'Poppins:300,400,500,600,700'] }
		};
		(function (d) {
			var wf = d.createElement('script'), s = d.scripts[0];
			wf.src = '${pageContext.request.contextPath}/assets/js/webfont.js';
			wf.async = true;
			s.parentNode.insertBefore(wf, s);
		})(document);
	</script>

	<!-- Plugins CSS File -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="preload" href="${pageContext.request.contextPath}/assets/fonts/porto.woff2?64334846" as="font" type="font/ttf" crossorigin>
	<link rel="preload" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/webfonts/fa-solid-900.woff2" as="font" type="font/woff2"
		crossorigin>
	<link rel="preload" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/webfonts/fa-brands-400.woff2" as="font" type="font/woff2"
		crossorigin>

	<!-- Main CSS File -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">

	<style>
		.outer-container {
	        border: 1px solid rgba(0, 0, 0, 0.1); 
	        border-radius: 10px; 
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
	        padding: 20px; 
	        margin: 10px; 
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
							<li><a href="login.jsp" style="color: blue">登出</a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->
      </header>
      <!-- End .header -->

		<main class="main">
			<!-- 搜尋列 -->
			<div class="container" style="margin-top: 20px !important;">
				<div
					class="header-icon header-search header-search-inline header-search-category w-lg-max text-right mt-0">
					<a href="#" class="search-toggle" role="button"><i class="icon-search-3"></i></a>
					<form action="#" method="get">
						<div class="header-search-wrapper">
							<input type="search" class="form-control" name="courseSearch"  placeholder="搜尋課程...">
							<!--日期選擇-->
							<div class="select-custom" style="display:flex;justify-content:center;align-items:center">
								<input type="date"  name="startTime">
							</div>

							<div class="select-custom" style="display:flex;justify-content:center;align-items:center">
								<input type="date" name="endTime">
							</div>
							
							<div class="select-custom">
								<select  name="sportType">
									<option value="">選擇運動</option>
									<option value="1">- 游泳</option>
									<option value="2">- 棒球</option>
									<option value="3">- 網球</option>
									<option value="4">- 手球</option>
									<option value="5">- 籃球</option>
									<option value="6">- 排球</option>
									<option value="7">- 桌球</option>
									<option value="8">- 羽球</option>
									<option value="9">- 跑步</option>
									<option value="10">- 自行車</option>
									<option value="11">- 足球</option>
									<option value="12">- 高爾夫</option>
								</select>
							</div><!-- End .select-custom -->
	
							<div class="select-custom">
								<select name="site">
									<option value="">選擇地區</option>
									<option value="松山區">- 松山區</option>
									<option value="信義區">- 信義區</option>
									<option value="大安區">- 大安區</option>
									<option value="中山區">- 中山區</option>
									<option value="中正區">- 中正區</option>
									<option value="大同區">- 大同區</option>
									<option value="萬華區">- 萬華區</option>
									<option value="文山區">- 文山區</option>
									<option value="南港區">- 南港區</option>
									<option value="內湖區">- 內湖區</option>
									<option value="士林區">- 士林區</option>
									<option value="北投區">- 北投區</option>
								</select>
							</div><!-- End .select-custom -->
							<button class="btn icon-magnifier p-0" type="submit" title="search"></button>
						</div><!-- End .header-search-wrapper -->
					</form>	
				</div>		
			</div><!-- End .container -->

			<!-- 功能按鈕 -->
			<div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
				<button class="btn btn-primary btn-rounded btn-md"><a href="#"></a>我的課程</button>
			</div>
			
			
			<div class="container">
                <!-- 課程資訊 -->
                
                <c:forEach var="entry" items="${courseList}">
				<div class="outer-container">
					<div class="row justify-content-center align-items-center"  >
						<div class="col-sm-12 col-6 product-default left-details product-list mb-2 d-flex justify-content-center">
							<figure>
								<a href="#">
									<img src="<%=request.getContextPath()%>/course/DBGifReader?courseNo=${entry.courseNo}" width="250" height="250"
										alt="圖片" />
								</a>
							</figure>
							<div class="product-details" >
								<div class="category-list">
									<a href="" class="type">${entry.sportTypeVO.sportTypeName}</a>
								</div>
								<h3 class="product-title" class="name"> <a href="product.html"> ${entry.courseName}</a></h3>
								<p class="product-description" class="text">${entry.courseText}</p>
								
								
								<div class="price-box">
									<span class="product-price" class="price"> $${entry.coursePrice} / 堂</span>
								</div>
								
<!-- 								<div class="price-box"> -->
<!-- 									<span class="product-price" class="price"> 文山區 </span> -->
<!-- 								</div> -->
								
								<div class="product-action">
									<div class="product">
										<a href="/ASAP/court/course_page.jsp?courseNo=${entry.courseNo}" class="btn btn-primary btn-rounded btn-md" @click="writeCourt(data.courtNo)">
											<span style="color: white;">我要預約</span>
										</a>
									</div>
								</div>
							</div>
						</div>	
					</div><!-- 課程資訊結束 -->
				</div>
				</c:forEach>
				
            </div><!-- End .container -->

		</main><!-- End .main -->

		 <footer class="footer bg-dark">	<div class="footer-middle">
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
			<!-- End .container --></footer>
	</div><!-- End .page-wrapper -->

	<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->
	<div class="mobile-menu-container"></div><!-- End .mobile-menu-container -->

	<div class="sticky-navbar">	</div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

	<!-- import Vue 3.0 -->
	<script src="https://unpkg.com/vue@next"></script>

	<!-- CDN import Axios -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	
	<!-- Plugins JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/optional/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>


	<script>
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>
	
	<script>
		// window.onload=function(){
		// 	Vue.createApp({
	    //         data: function(){
	    //             return{
	    //                 datas: []
	    //             }
	    //         },
	    //         methods:{

	    //         },
	    //         mounted: function(){
	    //             axios.get('courtAjax.do')
	    //                 .then((response) => {
	    //                     console.log(response)
	    //                     this.datas = response.data
	    //                 })
	    //                 .catch(function (reason){
	    //                 	console.log(reason)
	    //                 })
	    //         }
	    //     }).mount('#divTest');
			
		// }
	</script>
	
</body>

</html>