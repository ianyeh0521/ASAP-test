<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="header-middle sticky-header"
	data-sticky-options="{'mobile': true}"
	style="height: 75px; background: rgb(255, 250, 85); background: linear-gradient(90deg, rgba(255, 250, 85, 0.9081757703081232) 0%, rgba(9, 34, 121, 0.8773634453781513) 35%, rgba(0, 212, 255, 1) 100%);">
	<div class="container">
		<div class="header-left col-lg-2 w-auto pl-0">
			<button class="mobile-menu-toggler text-primary mr-2" type="button">
				<i class="fas fa-bars"></i>
			</button>
			<a href="#" style="width: 222; height: 88;"> <img
				src="${pageContext.request.contextPath}/newImg/logo2.png" alt="Logo" />
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