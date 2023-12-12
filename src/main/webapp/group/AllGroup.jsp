<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.asap.group.entity.GrpInfoVO" %>
<%@ page import="com.asap.group.service.GrpInfoService" %>
<%@ page import="com.asap.group.service.GrpInfoService_interface" %>
<%@ page import="java.util.*"%>

<%
	Boolean bIsSkip = (Boolean) request.getAttribute("Skip");
	if(bIsSkip == null || !bIsSkip)
 	{
		GrpInfoService grpInfoSvc = new GrpInfoService_interface();
	 	List<GrpInfoVO> list = grpInfoSvc.getALL(); 
	 	pageContext.setAttribute("grpVOList",list);
 	}
 
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>揪團 | ASAP</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template" />
<meta name="author" content="SW-THEMES" />



<!-- Plugins CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo2.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group/mycss.css" />


<style>
.btn-quickview {
    border: none;
    background: none;
    padding: 0;
    margin: 0;
    color: blue; 
    text-decoration: underline; 
    cursor: pointer;
}

</style>
</head>
<body>
	<div class="page-wrapper">
		<header class="header">
		        <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}" style="
            padding-top: 0;
            padding-bottom: 0;
            height: 75px;
            background: rgb(255, 250, 85);
            background: linear-gradient(
              90deg,
              rgba(255, 250, 85, 0.9081757703081232) 0%,
              rgba(9, 34, 121, 0.8773634453781513) 35%,
              rgba(0, 212, 255, 1) 100%
            );
            position: relative; /* Set position to relative for the parent */
            display: flex;
            align-items: center;">
          <div class="container" style="position: relative;">
            <div class="header-left col-lg-2 w-auto pl-0"
              style="
                position: absolute;
                top: 50%; /* Move 50% from the top */
                transform: translateY(-50%);
                z-index: 999;
                left: 20px; /* Adjust distance from the left */
              ">
              <button class="mobile-menu-toggler text-primary mr-2" type="button">
                <i class="fas fa-bars"></i>
              </button>
              <a href="#" width="222" height="88">
                <img src="${pageContext.request.contextPath}/newImg/logo2.png" style="max-width: 200px; height: auto; vertical-align: middle; border-style: none;">
              </a>
            </div>
            <!-- End .header-left -->
          </div>
          <!-- End .container -->
        </div>
        <!-- End .header-middle -->

        <div
          class="header-bottom sticky-header d-none d-lg-block"
          data-sticky-options="{'mobile': false}" 
        >
          <div class="container">
            <nav class="main-nav w-100" >
              <ul class="menu" style="display: flex; justify-content: flex-end">
                <li>
                  <a href="#">論壇</a>
                  <ul>
                    <li><a href="#">論壇首頁</a></li>
                    <li><a href="#">發佈貼文</a></li>
                    <li><a href="#">我的貼文</a></li>
                    <li><a href="#">收藏貼文</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">揪團</a>
                  <ul>
                    <li><a href="#">揪團首頁</a></li>
                    <li><a href="#">發起揪團</a></li>
                    <li><a href="#">我的揪團</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">找課程</a>
                  <ul>
                    <li><a href="#">查詢課程</a></li>
                    <li><a href="#">我的課程</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">找場地</a>
                  <ul>
                    <li><a href="#">詢找場地</a></li>
                    <li><a href="#">我的預約</a></li>
                    <li><a href="#">我的收藏</a></li>
                  </ul>
                </li>
                <li>
                  <a href="#">賣家入口</a>
                  <ul>
                    <li><a href="#">所有訂單</a></li>
                    <li><a href="#">所有商品</a></li>
                    <li><a href="#">新增商品</a></li>
                    <li><a href="#">商品評論</a></li>
                  </ul>
                </li>

                <li><a href="">商城</a></li>
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
	</div>
	<div class="container">
		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<span class="titlegroup1">揪團</span>
		</nav>
		<div class="row">
			<nav class="toolbox-sticky-header"
				data-sticky-options="{'mobile': true}">
				<div class="toolbox-right">
					<div class="search_bar d-flex justify-content-between align-items-center">
						<button class="Btn_mygroup" id="mygroup_Btn">我的揪團</button>
						<a href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup" class="Btn_creategroup" id="creategroup_Btn">發起揪團</a>

						<form id="search_formid" class="search_c" action="<%=request.getContextPath()%>/Grpinfo.do" method="post">
						<input type="text" name="grpInfoKeyword" id="search" class="search" placeholder="搜尋" value="${param.grpInfoKeyword}" > 
						<input type="hidden" name="action" value="FuzzySearch">
						<input type="submit" id="searchBtn" value="搜尋">	
						</form>
					</div>
					<!-- End  .search_bar-->
				</div>
				<!-- End .toolbox-right -->
			</nav>

			<div class="row_products-group">
				<!-- 活動列表 -->
				<c:forEach var="grpInfoVO" items="${grpVOList}">
				
				<div class="col-6_col-sm-4">
					<div class="product-default inner-quickview inner-icon">
						<figure class="img-effect">
							<a href="#"> <img src="#"
								style="width: 263.533px; height: 263.533px;" alt="無圖片顯示" />
							</a>
							<FORM  class="btn-quickview" method="post" action="<%=request.getContextPath()%>/Grpinfo.do" style="margin-bottom: 0px;">
						    <input type="submit" name="grpdetailsinfo" value="${grpInfoVO.grpNo}">
						    <input type="hidden" name="action" value="detailsinfo">
						    <input type="submit" value="詳細資訊" style="border: none; background: none; color: white; cursor: pointer;">
							</FORM>
						</figure>
						<div class="product-details">
							<div class="category-wrap">
								<a href="#" title="Wishlist" class="btn-icon-wish">2/6</a>
							</div>
							<h3 class="product-title">
								<a>${grpInfoVO.grpName}</a>
							</h3>
							<div class="ratings-container">
								<a><i class="fas fa-thumbtack"></i> 活動類別：</a><a>${grpInfoVO.sportTypeNo}</a><br> 
								<a><i class="fas fa-thumbtack"></i> 活動日期：</a><a>${grpInfoVO.grpDate}</a> <br> 
								<a><i class="fas fa-thumbtack"></i> 活動時間：</a><a>${grpInfoVO.grpStartTime}至${grpInfoVO.grpEndTime}</a> <br> 
								<a><i class="fas fa-thumbtack"></i> 活動地點：</a><a>${grpInfoVO.grpAddress}</a>
							</div>
							<!-- End .product-ratings -->
						</div>
						<!-- End .product-container -->
						<FORM METHOD="post" class="Btn_allgrpJoin" ACTION="<%=request.getContextPath()%>/Grpinfo.do" style="margin-bottom: 0px;">
						    <input type="submit" value="報名參加" style="border: none; background: none; color: white; cursor: pointer;text-align: center;">
						    <input type="hidden" name="#" value="${grpInfoVO.grpNo}">
						    <input type="hidden" name="action" value="entergrpno">
						</FORM>
				
					</div>
					<!-- End .product-details -->
				</div>
				<!-- End .col-6_col-sm-4 -->
				
				</c:forEach>
				
<!-- 				活動列表 -->
<!-- 				<div class="col-6_col-sm-4"> -->
<!-- 					<div class="product-default inner-quickview inner-icon"> -->
<!-- 						<figure class="img-effect"> -->
<!-- 							<a href="#"> <img src="#" -->
<!-- 								style="width: 263.533px; height: 263.533px;" alt="無圖片顯示" /> -->
<!-- 							</a> -->
<!-- 							<a href="#" class="btn-quickview" title="Quick View">詳細資訊</a> -->
<!-- 						</figure> -->
<!-- 						<div class="product-details"> -->
<!-- 							<div class="category-wrap"> -->
<!-- 								<a href="#" title="Wishlist" class="btn-icon-wish">2/6</a> -->
<!-- 							</div> -->
<!-- 							<h3 class="product-title"> -->
<!-- 								<a>籃球三對三</a> -->
<!-- 							</h3> -->
<!-- 							<div class="ratings-container"> -->
<!-- 								<a><i class="fas fa-thumbtack"></i> 活動類別：籃球</a> <br> <a><i -->
<!-- 									class="fas fa-thumbtack"></i> 活動日期：2023/10/16(日)</a> <br> <a><i -->
<!-- 									class="fas fa-thumbtack"></i> 活動時間：下午13:00至15:00</a> <br> <a><i -->
<!-- 									class="fas fa-thumbtack"></i> 活動地點：台北體育館</a> -->
<!-- 							</div> -->
<!-- <!-- 							End .product-ratings --> 
<!-- 						</div> -->
<!-- <!-- 						End .product-container --> 
<!-- 						<p><input type="submit" class="Btn_allgrpXJoin" value="退出揪團"></p>
						          <input type="hidden" name="action" value="compositeQuery">
<!-- 					</div> -->
<!-- <!-- 					End .product-details --> 
<!-- 				</div> -->
<!-- <!-- 				End .col-6_col-sm-4 --> 
<!-- 				<div class="col-6_col-sm-4"> -->

<!-- 					<div class="product-default inner-quickview inner-icon"> -->

<!-- 						<figure class="img-effect"> -->
<!-- 							<a href="#"> <img src="#" -->
<!-- 								style="width: 263.533px; height: 263.533px;" alt="無圖片顯示" /> -->
<!-- 							</a> -->
<!-- 							<a href="#" class="btn-quickview" title="Quick View">詳細資訊</a> -->
<!-- 						</figure> -->
<!-- 						<div class="orgmbr_grp"> -->
<!-- 							<i class="fas fa-flag" id="fas_fa_flag"></i>我創建的揪團 -->
<!-- 						</div> -->
<!-- 						<div class="product-details"> -->

<!-- 							<div class="category-wrap"> -->

<!-- 								<a href="#" title="Wishlist" class="btn-icon-wish">2/6</a> -->
<!-- 							</div> -->
<!-- 							<h3 class="product-title"> -->
<!-- 								<a>籃球三對三</a> -->
<!-- 							</h3> -->
<!-- 							<div class="ratings-container"> -->
<!-- 								<a><i class="fas fa-thumbtack"></i> 活動類別：籃球</a> <br> <a><i -->
<!-- 									class="fas fa-thumbtack"></i> 活動日期：2023/10/16(日)</a> <br> <a><i -->
<!-- 									class="fas fa-thumbtack"></i> 活動時間：下午13:00至15:00</a> <br> <a><i -->
<!-- 									class="fas fa-thumbtack"></i> 活動地點：台北體育館</a> -->
<!-- 							</div> -->
<!-- <!-- 							End .product-ratings --> 
<!-- 						</div> -->
<!-- <!-- 						End .product-container --> 
<!-- 					</div> -->
<!-- <!-- 					End .product-details --> 
<!-- 				</div> -->
<!-- <!-- 				End .col-6_col-sm-4 --> 

			</div>
			<!-- End .row_products-group -->
			<div class="toolbox toolbox-pagination">
				<div class="toolbox-item_toolbox-show">
					<label>頁數:</label>
					<!-- End .select-custom -->
				</div>
				<!-- End .toolbox-item -->

				<ul class="pagination toolbox-item">
					<li class="page-item disabled"><a
						class="page-link page-link-btn" href="#"><i
							class="icon-angle-left"></i></a></li>
					<li class="page-item active"><a class="page-link" href="#">1
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><span class="page-link">...</span></li>
					<li class="page-item"><a class="page-link page-link-btn"
						href="#"><i class="icon-angle-right"></i></a>
					</li>
				</ul>
			</div>
			<!-- End .row -->
		</div>
		<!-- End .container -->

		<!-- margin -->
		</main>
		<!-- End .main -->
	</div>
	<!-- End .page-wrapper -->
	<footer class="footer bg-dark position-relative">
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
          <span class="footer-copyright"
            >© Porto eCommerce. 2021. All Rights Reserved</span
          >
        </div>
      </div>
    </div>
    <!-- End .footer-bottom -->
  </div>
  <!-- End .container -->
	</footer>
	<!-- End .footer -->

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
      <li><a href="#">首頁</a></li>
      <li>
        <a href="#">論壇</a>
        <ul>
          <li><a href="#">論壇首頁</a></li>
          <li>
            <a href="#">發佈貼文</a>
          </li>
          <li>
            <a href="#">我的貼文</a>
          </li>
          <li><a href="#">收藏貼文</a></li>
        </ul>
      </li>
      <li>
        <a href="#">揪團</a>
        <ul>
          <li><a href="#">揪團首頁</a></li>
          <li><a href="#">發起揪團</a></li>
          <li><a href="#">我的揪團</a></li>
        </ul>
      </li>
      <li>
        <a href="#">找課程</a>
        <ul>
          <li><a href="#">查詢課程</a></li>
          <li><a href="#">我的課程</a></li>
        </ul>
      </li>

      <li>
        <a href="#">找場地</a>
        <ul>
          <li><a href="#">詢找場地</a></li>
          <li><a href="#">我的預約</a></li>
          <li><a href="#">我的收藏</a></li>
        </ul>
      </li>

      <li>
        <a href="#">賣家入口</a>
        <ul>
          <li><a href="#">所有訂單</a></li>
          <li><a href="#">所有商品</a></li>
          <li><a href="#">新增商品</a></li>
          <li><a href="#">商品評論</a></li>
        </ul>
      </li>
      <li><a href="#">商城</a></li>
      <li><a href="#">登入</a></li>
    </ul>
  </nav>
  <!-- End .mobile-nav -->
</div>
<!-- End .mobile-menu-wrapper -->
	
	</div>
	<!-- End .mobile-menu-container -->

	<div class="sticky-navbar">
	<div class="sticky-info">
    <a href="#"> <i class="icon-home"></i>Home </a>
  </div>
  <div class="sticky-info">
    <a href="#" class=""> <i class="icon-edit"></i>Forum </a>
  </div>
  <div class="sticky-info">
    <a href="#" class=""> <i class="icon-cat-sport"></i>Group</a>
  </div>
  <div class="sticky-info">
    <a href="#" class="">
      <i class="icon-shopping-cart position-relative"> </i>Mall
    </a>
  </div>
  <div class="sticky-info">
    <a href="#" class=""> <i class="icon-user-2"></i>Account </a>
  </div>
	</div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

<!-- 	<script> -->
<!-- // 		$("header").load("header.html"); -->
<!-- // 		$("footer").load("footer.html"); -->
<!-- // 		$("div.sticky-navbar").load("sticky-navbar.html"); -->
<!-- // 		$("div.mobile-menu-container").load("mobile-menu-container.html"); -->
<!-- 	</script> -->

</body>
</html>

