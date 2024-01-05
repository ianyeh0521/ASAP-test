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
//datetime picker
java.sql.Date closedDate = null;
try {
	closedDate = java.sql.Date.valueOf(request.getParameter("closedDate").trim());
} catch (Exception e) {
	closedDate = new java.sql.Date(System.currentTimeMillis());
}

%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>ASAP</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template">
<meta name="author" content="SW-THEMES">

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<link rel="preload"
	href="${pageContext.request.contextPath}/assets/fonts/porto.woff2?64334846"
	as="font" type="font/ttf" crossorigin>
<link rel="preload"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/webfonts/fa-solid-900.woff2"
	as="font" type="font/woff2" crossorigin>
<link rel="preload"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/webfonts/fa-brands-400.woff2"
	as="font" type="font/woff2" crossorigin>

<!-- Main CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">

<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/court/datetimepicker/jquery.datetimepicker.css" />
<script
	src="${pageContext.request.contextPath}/court/datetimepicker/jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/court/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}

.outer-container {
	border: 1px solid rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin: 10px;
}

/* 分頁按鈕 */
.pagination-buttons button {
	margin-right: 5px;
}

.pagination-buttons button:hover {
	cursor: pointer;
}

.pagination-buttons button.selected-page {
	background-color: #009EEE;
	color: #fff;
	cursor: default;
}

#f_date1 {
	border-radius: 8px;
	border: 1px solid;
}

#f_date2 {
	border-radius: 8px;
	border: 1px solid;
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
						<a href="${pageContext.request.contextPath}/member/MemberHome.jsp" style="width: 222; height: 88;"> <img
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
									<li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
								</ul></li>
							<li><a href="#">揪團</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
									<li><a href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
									<li><a href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
								</ul></li>
							<li><a href="#">課程</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
									<li><a href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
								</ul></li>
							<li><a href="#">場地</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
									<li><a href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
									<li><a href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
								</ul></li>
							<li><a href="#">賣家</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
								</ul>
							</li>

							<li><a href="#">商城</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
								</ul>
							</li>
							<li><a href="#">個人首頁</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
									<li><a href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
								</ul>
							</li>
							<li><a><form action="${pageContext.request.contextPath}/MemberController" method="post" style="margin: 0px;"><button type="submit" style="border:0px; background-color:white;">登出</button><input type="hidden" name="action" value="logout"/></form></a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->
		</header>
		<!-- End .header -->

		<main class="main" id="divTest">
			<!-- 搜尋列 -->
			<div class="container" style="margin-top: 20px !important;">
				<div
					class="header-icon header-search header-search-inline header-search-category w-lg-max text-right mt-0">
					<a href="#" class="search-toggle" role="button"><i
						class="icon-search-3"></i></a>
					<form action="#" method="post" id="searchForm" @submit.prevent="submitForm">
						<div class="header-search-wrapper">
							<input type="courseSearch" class="form-control" name="courseSearch"
								placeholder="搜尋課程...">

							<!--日期選擇-->
							<div class="select-custom"
								style="display: flex; justify-content: center; align-items: center; padding-right: 5px">
								<input name="startTime" id="f_date1" type="text"
									onkeydown="return false"
									style="width: 100%; box-sizing: border-box;" autocomplete="off">
							</div>

							<div class="select-custom"
								style="display: flex; justify-content: center; align-items: center; padding-left: 5px">
								<input name="endTime" id="f_date2" type="text"
									onkeydown="return false"
									style="width: 100%; box-sizing: border-box;" autocomplete="off">
							</div>

							<div class="select-custom">
								<select name="sportType">
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
							</div>
							<!-- End .select-custom -->
							<input type="hidden" name="action" value="getByCompositeQuery">
							<button class="btn icon-magnifier p-0" type="submit" title="search"></button>
						</div>
						<!-- End .header-search-wrapper -->
					</form>
				</div>
			</div>
			<!-- End .container -->

			<!-- 功能按鈕 -->
			<div class="container"
				style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
				<a href="${pageContext.request.contextPath}/course/course_orderlist.jsp">
				<button class="btn btn-primary btn-rounded btn-md">
					我的課程
				</button>
				</a>
			</div>


			<div class="container">
			
				<h4 v-if="formSubmitted" class="text-uppercase heading-bottom-border mt-4" style="margin-top: 30px !important;">
				  搜尋結果：
				</h4>	
						
				<!-- 排序按鈕 -->
				<nav class="toolbox sticky-header"
					data-sticky-options="{'mobile': true}" style="margin-bottom: 0px;">
					<div class="toolbox-left"></div>
					<!-- End .toolbox-left -->

					<div class="toolbox-right">
						<a href="#" class="sidebar-toggle"> <svg data-name="Layer 3"
								id="Layer_3" viewBox="0 0 32 32"
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
										<path d="M22.5,15.92a2.5,2.5,0,1,1-5,0,2.5,2.5,0,0,1,5,0Z"
									class="cls-2"></path>
										<path d="M21,16a1,1,0,1,1-2,0,1,1,0,0,1,2,0Z" class="cls-3"></path>
										<path
									d="M16.5,22.92A2.6,2.6,0,0,1,14,25.5a2.6,2.6,0,0,1-2.5-2.58,2.5,2.5,0,0,1,5,0Z"
									class="cls-2"></path>
									</svg> <span>Filter</span>
						</a>

						<div class="toolbox-item toolbox-sort">
							<label>排序方式:</label>

							<div class="select-custom">
								<select name="orderby" class="form-control"
									v-model="selectedSortOption" @change="sortProducts"
									style="border-radius: 10px">
									<option value="menu_order" selected="selected" disabled>預設</option>
									<option value="priceHL">價格高➪低</option>
									<option value="priceLH">價格低➪高</option>
								</select>
							</div>
							<!-- End .select-custom -->
						</div>
						<!-- End .toolbox-item -->
					</div>
					<!-- End .toolbox-right -->
				</nav>
				<!-- 課程資訊 -->
<!-- 				<div class="outer-container" v-for="data in datas" :key="data.courseNo"> -->
				<div class="outer-container" v-for="data in paginatedData" :key="data.courseNo">
					<div class="row justify-content-center align-items-center">
						<div
							class="col-sm-12 col-6 product-default left-details product-list mb-2 d-flex justify-content-center">
							<figure>
								 <img
									:src="'/ASAP/course/DBGifReader?courseNo=' + data.courseNo"
									width="400" height="400" alt="圖片" />
							</figure>
							<div class="product-details">
								<div class="category-list">
									{{data.sportTypeVO.sportTypeName}}
								</div>
								<h3 class="product-title" class="name">
									 {{data.courseName}}
								</h3>
								<p class="product-description" class="text">{{data.courseText}}</p>


								<div class="price-box">
									名額：
									<span class="product-price" class="price"> 
										{{ currentOrder[data.courseNo] }} / {{data.coursePplLimit}}
									</span>
									<span v-if="currentOrder[data.courseNo] === data.coursePplLimit" style="color: red;">已額滿!!!</span>
								</div>
								
								<div class="price-box">
									<span class="product-price" class="price"> $
										{{data.coursePrice}} / 堂</span>
								</div>

								<!-- 								<div class="price-box"> -->
								<!-- 									<span class="product-price" class="price"> 文山區 </span> -->
								<!-- 								</div> -->

								<div class="product-action">
									<div class="product">
										<a	
											v-if="currentOrder[data.courseNo] !== data.coursePplLimit"
											:href="'/ASAP/course/course_page.jsp?courseNo=' + data.courseNo"
											class="btn btn-primary btn-rounded btn-md"
											@click="writeCourt(data.courtNo)"> <span
											style="color: white;">我要預約</span>
										</a>
										<span v-else style="color: gray;">無法預約</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 課程資訊結束 -->
				</div>
				<!-- 分頁按鈕 -->
				<div class="pagination-buttons" style="text-align: center; margin-bottom: 20px">
				    <button v-for="page in Math.ceil(datas.length / itemsPerPage)" :key="page"
				            @click="changePage(page)"
				            :class="{ 'selected-page': page === currentPage }"
				            :disabled="page === currentPage">{{ page }}</button>
				</div>
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
			              <li>
			                <span class="contact-info-label">Address:</span>5F., No. 219, Sec. 3, Nanjing E. Rd., Zhongshan Dist., Taipei City 104, Taiwan (R.O.C.)
			              </li>
			              <li>
			                <span class="contact-info-label">Phone:</span
			                ><a href="tel:">(02) 2712-0589</a>
			              </li>
			              <li>
			                <span class="contact-info-label">Email:</span>
			                <a href="mailto:mail@example.com">business@tibame.com</a>
			              </li>
			              <li>
			                <span class="contact-info-label"
			                  >Working Days/Hours:</span
			                >
			                Mon - Sun / 8:00 AM - 9:30 PM
			              </li>
			            </ul>
			            <div class="social-icons">
			              <a
			                href="#"
			                class="social-icon social-facebook icon-facebook"
			                target="_blank"
			                title="Facebook"
			              ></a>
			              <a
			                href="#"
			                class="social-icon social-twitter icon-twitter"
			                target="_blank"
			                title="Twitter"
			              ></a>
			              <a
			                href="#"
			                class="social-icon social-instagram icon-instagram"
			                target="_blank"
			                title="Instagram"
			              ></a>
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
			              <li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">Account</a></li>
			              <li><a href="${pageContext.request.contextPath}/course/course_main.jsp">Course</a></li>
			              <li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">Forum</a></li>
			              <li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">Group</a></li>
			              <li><a href="${pageContext.request.contextPath}/court/court_main.jsp">Court</a></li>
			              <li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">Seller</a></li>
			              <li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">Mall</a></li>
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
			          <span class="footer-copyright"
			            >© ASAP. 2023. All Rights Reserved</span
			          >
			        </div>
			      </div>
			    </div>
			    <!-- End .footer-bottom -->
			  </div>
			  <!-- End .container -->
		</footer>
	</div>
	<!-- End .page-wrapper -->

	<div class="mobile-menu-overlay"></div>
	<!-- End .mobil-menu-overlay -->
	<div class="mobile-menu-container">
		<div class="mobile-menu-wrapper">
		  <span class="mobile-menu-close"><i class="fa fa-times"></i></span>
		  <nav class="mobile-nav">
		    <ul class="mobile-menu">
		      <li>
		        <a href="#">論壇</a>
		        <ul>
					<li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
					<li><a href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
					<li><a href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
					<li><a href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
				</ul>
		      </li>
		      <li>
		        <a href="#">揪團</a>
		        <ul>
					<li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
					<li><a href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
					<li><a href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
					<li><a href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
				</ul>
		      </li>
		      <li>
		        <a href="#">課程</a>
		        <ul>
					<li><a href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
					<li><a href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
				</ul>
		      </li>
		
		      <li>
		        <a href="#">場地</a>
		        <ul>
					<li><a href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
					<li><a href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
					<li><a href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
				</ul>
		      </li>
		
		      <li>
		        <a href="#">賣家</a>
		        <ul>
					<li><a href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
				</ul>
		      </li>
		      <li><a href="#">商城</a>
		      	<ul>
					<li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
					<li><a href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
				</ul>
		      </li>
		      <li><a href="#">個人首頁</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
					<li><a href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
				</ul>
			  </li>
		      
		    </ul>
		  </nav>
		  <!-- End .mobile-nav -->
		</div>
		<!-- End .mobile-menu-wrapper -->
		
	</div>
	<!-- End .mobile-menu-container -->

	<div class="sticky-navbar">
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/course/course_main.jsp"> <i class="icon-home"></i>Course </a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/forum/forum_home.jsp" class=""> <i class="icon-edit"></i>Forum </a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/group/AllGroup.jsp" class=""> <i class="icon-cat-sport"></i>Group</a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/shop/AsapShop.jsp" class="">
		    <i class="icon-shopping-cart position-relative"> </i>Mall
		  </a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/member/MemberHome.jsp" class=""> <i class="icon-user-2"></i>Account </a>
		</div>
		
	</div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- import Vue 3.0 -->
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>

	<!-- CDN import Axios -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<!-- Plugins JS File -->
<%-- 		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/optional/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>


	<script>
	window.onload=function(){
		
		// vue 初始化
		Vue.createApp({
            data: function(){
                return{
                    datas: [],
                    paginatedData:[],
                    currentOrder:{},
                    selectedSortOption: 'menu_order',
                    currentPage: 1,
                    totalPage: 0,
                    itemsPerPage: 5,
                    searchData: '',
                    formSubmitted: false,
                }
            },
            created(){
            	this.fetchAdditionalData();
            },
            methods:{
                
                // 課程資料初始化
            	fetchInitialData: function () {
                    const request1 = { url: 'course.do?action=getAll', method: 'get' };
                    const request2 = { url: 'course.do?action=getAll', method: 'get', params: { getTotalPage: true } };

                    axios.all([axios(request1), axios(request2)])
                        .then(axios.spread((response1, response2) => {
                            var result1 = response1.data;
                            var result2 = response2.data;
                            console.log(result1)
                            console.log(result2)

                            this.datas = result1;
                            this.totalPage = result2;
                            console.log(this.datas)
                            console.log(this.totalPage)
                            
                            this.fetchAdditionalData();
                            this.updatePaginatedData();
                        }))
                        .catch(function (reason) {
                            console.log(reason);
                        });
            		
            	},
            	
				// 排序
				sortProducts: function () {
			        const selectedOption = this.selectedSortOption;
			
			        switch (selectedOption) {
			            case 'priceHL':
			                this.datas.sort((a, b) => this.getNumericPrice(b) - this.getNumericPrice(a));
			                break;
			            case 'priceLH':
			                this.datas.sort((a, b) => this.getNumericPrice(a) - this.getNumericPrice(b));
			                break;
			            default:
			                break;
			        }
			        
			        this.updatePaginatedData();
			    },
			
			    getNumericPrice: function (product) {
			        return parseFloat(product.coursePrice); 
			    },
			
                
                // 換頁按鈕
                changePage: function (page) {
                    this.currentPage = page;
                    this.updatePaginatedData();
                    window.scrollTo({
                        top: 230,
                        behavior: 'smooth' 
                    });
                },
                
                
                // 抓報名人數
                fetchAdditionalData() {
             
                   this.datas.forEach(data => {
                	 const courseNo = data.courseNo;
                	 console.log(courseNo)
                     axios.get("mbrCourseServlet?action=checkInMain&courseNo="+courseNo)
                       .then(response => {
                         console.log(response)
                         this.currentOrder = { ...this.currentOrder, [data.courseNo]: response.data };
                       })
                       .catch(error => {
                         console.error(`Error fetching additional data for courseNo ${data.courseNo}:`, error);
                       });
                   });
                 },
                
                // 分頁
                updatePaginatedData() {
                	 const startIndex = (this.currentPage - 1) * this.itemsPerPage;
                     const endIndex = startIndex + this.itemsPerPage;
                     this.paginatedData = this.datas.slice(startIndex, endIndex);

                     if (this.currentPage > this.totalPage) {
                         this.currentPage = 1;
                     }
                },
                
                // 複合查詢
                submitForm: function () {
                    const formData = new FormData(document.getElementById('searchForm'));

                    axios.post('course.do', formData)
                        .then(response => {
                            this.datas = response.data;
                            this.updatePaginatedData();
                            
                            this.searchData = formData.get('courseSearch') || '';
                            this.formSubmitted = true; 

                            window.scrollTo({
                                top: 230,
                                
                                behavior: 'smooth'
                            });
                        })
                        .catch(error => {
                            console.error('Error submitting form:', error);
                        });
                },
              
            	
            },
            mounted: function(){
            	// 日期選擇
        		var somedate1 = new Date('<%=closedDate%>');
        		
        		$.datetimepicker.setLocale('zh'); 
                $('#f_date1').datetimepicker({
                   theme: '',          
                   timepicker: true,   //timepicker: false,
                   step: 60,            
        	       format: 'Y-m-d H:i:s',
        	       beforeShowDay: function(date) {
                   	  if (  date.getYear() <  somedate1.getYear() || 
            		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
            		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
                         ) {
                              return [false, ""]
                         }
                         return [true, ""];
                   },
                
                  
                   //disabledDates:    ['2022/06/08','2022/06/09','2022/06/10'], // 去除特定不含
                   //startDate:	        '2022/07/10',  // 起始日
                   //minDate:           '-1970-01-01', // 去除今日(不含)之前
                   //maxDate:           '+1970-01-01'  // 去除今日(不含)之後
                });
                $('#f_date1').attr("placeholder", "請選擇起始時間");
                
                $('#f_date2').datetimepicker({
                   theme: '',          
                   timepicker: true,   
                   step: 60,            
        	       format: 'Y-m-d H:i:s',
        	       minDate: somedate1,
        	       beforeShowDay: function(date) {
                   	  if (  date.getYear() <  somedate1.getYear() || 
            		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
            		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
                         ) {
                              return [false, ""]
                         }
                         return [true, ""];
                   },
                   
                   //disabledDates:    ['2022/06/08','2022/06/09','2022/06/10'], // 去除特定不含
                   //startDate:	        '2022/07/10',  // 起始日
                   //minDate:           '-1970-01-01', // 去除今日(不含)之前
                   //maxDate:           '+1970-01-01'  // 去除今日(不含)之後
                });
                $('#f_date2').attr("placeholder", "請選擇結束時間");
                
                $('#f_date1').on('change', function(selected) {
                    var selectedDate = new Date(selected.target.value);
                    $('#f_date2').datetimepicker('setOptions', { minDate: selectedDate });
                });
                
                $('#f_date2').on('blur', function() {
                    validateDatetimeInputs();
                });
                
                function validateDatetimeInputs() {
                    var startDate = $('#f_date1').val();
                    var endDate = $('#f_date2').val();

                    if (startDate && endDate) {
                        if (new Date(startDate) > new Date(endDate)) {
                            alert('結束時間必須晚於起始時間');
                            $('#f_date2').val('');
                        }
                    } else if (!startDate && endDate) {
                        alert('請先選擇起始時間');
                        $('#f_date2').val('');
                    }
                }
            	
                this.fetchInitialData();
                
            },
        	
            
        }).mount('#divTest');
		
	}
	
	
           
        
   
	

	</script>

</body>

</html>