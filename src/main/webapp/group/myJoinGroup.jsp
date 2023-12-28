<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.asap.group.entity.GrpInfoVO" %>
<%@ page import="com.asap.group.service.GrpInfoService" %>
<%@ page import="com.asap.group.service.GrpInfoService_interface" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.List" %>
<%@ page import="com.asap.group.entity.GrpJoinInfoVO" %>
<%@ page import="com.asap.group.service.GrpJoinInfoService_interface" %>
<%@ page import="com.asap.group.service.GrpJoinInfoService" %>
<%@ page import="com.asap.group.entity.SportTypeVO" %>
<%@ page import="com.asap.group.service.SportTypeService" %>
<%@ page import="com.asap.group.service.SportTypeService_interface" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	Boolean bIsSkip = (Boolean) request.getAttribute("Skip");
	if(bIsSkip == null || !bIsSkip){
		
// 		GrpInfoService grpInfoSvc = new GrpInfoService_interface();
// 		GrpJoinInfoService grpJoinInfoSvc = new GrpJoinInfoService_interface();

// 		List<GrpJoinInfoVO> list = grpJoinInfoSvc.getALL(); 
// 	 	List<GrpInfoVO> grpJoinVOTempList = new ArrayList<>();
		
// 		String participantNo = "M1206202300003"; 

		
// // 		List<String> participantActivities = grpJoinInfoSvc.getgrpjoinserviceQuery(P, participantNo);

// 		Integer grpNo = 0;
// 		List<GrpInfoVO> participantActivityDetails = new ArrayList<>();
// 		for (GrpInfoVO  Vo: grpJoinVOTempList) {
// 		    GrpInfoVO activityDetail = grpInfoSvc.getGrpInfoVOBygrpNo(grpNo);
		    
// 		    if (activityDetail != null) {
// 		        participantActivityDetails.add(activityDetail);
// 		    }
// 		}
// 		list = grpVOTempList;
// 	 	pageContext.setAttribute("grpVOList",list);

		GrpInfoService grpInfoSvc = new GrpInfoService_interface();
		GrpJoinInfoService grpJoinInfoSvc = new GrpJoinInfoService_interface();
		
		List<GrpJoinInfoVO> grpJoinVOList = grpJoinInfoSvc.getALL();
		List<GrpInfoVO> GrpInfoVOList = new ArrayList<>();
		String LoginActNo = "M1206202300001";
		for (GrpJoinInfoVO JoinVo : grpJoinVOList) {
			String PartiMbrNo = JoinVo.getPartiMbrNo();
			//當參與人資訊裡面的參與人編號等於目前登入的帳號
			//要抓揪團編號出來，再去查揪團資訊
			if (PartiMbrNo.equals(LoginActNo) && JoinVo.getGrpJoinStat()) {
				GrpInfoVO grpVODetail = grpInfoSvc.getGrpInfoVOBygrpNo(JoinVo.getGrpNo());
				GrpInfoVOList.add(grpVODetail);
			}
		}
		
		pageContext.setAttribute("grpVOList", GrpInfoVOList);
	 	
	 	SportTypeService grpSportSvc = new SportTypeService_interface();
		List<SportTypeVO> strSportList = grpSportSvc.getALL();
		pageContext.setAttribute("SportNameList", strSportList);
	 	
 	}
%>

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
<link rel="icon" type="image/x-icon"
	href="../assets/images/icons/favicon.png" />

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
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

	<div class="page-wrapper">
		<header class="header">
		   <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}"
            style="
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
              align-items: center;
            "
          >
            <div class="container" style="position: relative;">
              <div class="header-left col-lg-2 w-auto pl-0"
                style="
                  position: absolute;
                  top: 50%; /* Move 50% from the top */
                  transform: translateY(-50%);
                  z-index: 999;
                  left: 20px; /* Adjust distance from the left */
                "
              >
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
	</div>
<main class="main">
		<div class="page-header">
			<div class="container d-flex flex-column align-items-center">
				<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
				<li class="breadcrumb-item active" aria-current="page">我參加的揪團</li>
				</ol>
				<h1>我參加的揪團</h1>
			</div>
		</div>
	<div class="container">
	
		<div class="row">
			<nav class="toolbox-sticky-header"
				data-sticky-options="{'mobile': true}">
				<div class="toolbox-right">
					<div class="search_bar d-flex justify-content-between align-items-center">
<!-- 						<button class="Btn_mygroup" id="mygroup_Btn" style=width:68px;>我的揪團</button> -->
						
						<form id="search_formid" class="search_c" action="<%=request.getContextPath()%>/Grpinfo.do" method="post">
						<input type="text" name="grpInfoKeyword" id="search" class="search" placeholder="搜尋" value="${param.grpInfoKeyword}" > 
						<input type="hidden" name="action" value="FuzzySearch">
						<input type="hidden" name="type" value="1">
						<input type="submit" id="searchBtn" value="搜尋" style="font-size:10px;border:white;height:29.6px;width:36px;">	
						</form>
					</div>
					<!-- End  .search_bar-->
				</div>
				<!-- End .toolbox-right -->
			</nav>
			<!-- End .toolbox-sticky-header -->
		
			<div class="row_products-group">
				<!-- 活動列表 -->
<% 
	// 抓伺服器時間
	Date serverDateTime = new Date();
	//預設時間格式
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    //轉換對應時間格式
	String formattedDateTime = sdf.format(serverDateTime);
    //設定 formattedDateTime
    pageContext.setAttribute("formattedDateTime", formattedDateTime);
%>
				<c:forEach var="grpInfoVO" items="${grpVOList}">
				<c:set var="MemberVoDetail" value="${MemberVoDetail}" />
				<c:set var="IsOverDate" value="false" />
				
				<fmt:formatDate value="${grpInfoVO.grpDate}" pattern="yyyy-MM-dd" var="time1" />
				<fmt:formatDate value="${grpInfoVO.grpEndTime}" pattern="HH:mm:ss" var="time2" />
				<c:set var="combinedDateTime" value="${time1} ${time2}" />
				
				<!-- 判斷 現在時間(formattedDateTime) 超過 活動結束時間(combinedDateTime) -->
				<c:if test="${formattedDateTime gt combinedDateTime}">
				    <c:set var="IsOverDate" value="true" />
				</c:if>	
					<c:if test="${grpInfoVO.grpStat != 1 and IsOverDate eq 'false'}">
						<div class="col-6_col-sm-4">
							<div class="product-default inner-quickview inner-icon">
								<figure class="img-effect">
									<a href="#">
									<img src="<%=request.getContextPath()%>/GrpImgReader?grpNo=${grpInfoVO.grpNo}" style="width: 263.533px; height: 263.533px;" alt="無圖片顯示"/>
									</a>
									<FORM  class="btn-quickview" method="post" action="<%=request.getContextPath()%>/Grpinfo.do" style="margin-bottom: 0px;">
								    <input type="submit" value="詳細資訊" style="border: none; background: none; color: white; cursor: pointer;">
								    <input type="hidden" name="grpdetailsinfo" value="${grpInfoVO.grpNo}">
								    <input type="hidden" name="action" value="detailsinfo">
									</FORM>
								</figure>
								<div class="product-details">

									<h2 class="product-title" style="font-size:24px; margin-top:5px;">
										<a>${grpInfoVO.grpName}</a>
									</h2>
									<div class="ratings-container">
										<c:if test="${grpInfoVO.sportTypeNo eq '1'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>游泳</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '2'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>棒球</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '3'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>網球</a><br> 
										</c:if>						
										<c:if test="${grpInfoVO.sportTypeNo eq '4'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>手球</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '5'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>藍球</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '6'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>排球</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '7'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>桌球</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '8'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>羽球</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '9'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>跑步</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '10'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>自行車</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '11'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>足球</a><br> 
										</c:if>
										<c:if test="${grpInfoVO.sportTypeNo eq '12'}">
											<a><i class="fas fa-thumbtack"></i> 運動種類：</a><a>高爾夫</a><br> 
										</c:if>
										<a><i class="fas fa-thumbtack"></i> 活動日期：</a><fmt:formatDate value="${grpInfoVO.grpDate}" pattern="yyyy-MM-dd" var="formattedGrpDate" />
										<a>${formattedGrpDate}</a>
										<br>
										<a><i class="fas fa-thumbtack"></i> 活動時間：</a><fmt:formatDate value="${grpInfoVO.grpStartTime}" pattern="HH:mm" var="formattedGrpTime" />
										<a>${formattedGrpTime}</a><a>至</a><fmt:formatDate value="${grpInfoVO.grpEndTime}" pattern="HH:mm" var="formattedGrpTime" />
										<a>${formattedGrpTime}</a>
										<br>
										<a><i class="fas fa-thumbtack"></i> 活動地點：</a><a>${grpInfoVO.grpAddress}</a>
									</div>
									<!-- End .product-ratings -->
								</div>
								<!-- End .product-container -->
<!-- 									<div class="category-wrap"> -->
<%-- 									<c:if test="${empty partiMbrNoCount}"> --%>
<%-- 								    <a class="btn-icon-wish" style="font-size: 12px; color: red;">目前參與人數：1/${grpInfoVO.grpPplLimit}</a> --%>
<%-- 									</c:if> --%>
<%-- 									<c:if test="${not empty partiMbrNoCount}"> --%>
<%-- 								    <a class="btn-icon-wish" style="font-size: 12px; color: red;">目前參與人數：${partiMbrNoCount}/${grpInfoVO.grpPplLimit}</a> --%>
<%-- 									</c:if> --%>
<!-- 									</div> -->
		<%-- 						<FORM METHOD="post"  class="Btn_allgrpJoin" ACTION="<%=request.getContextPath()%>/Grpinfo.do" style="margin-bottom: 0px;"> --%>
		<!-- 						    <input type="submit" value="報名參加" style="width:68px; border: none; background: none; color: white; cursor: pointer;text-align: center;"> -->
		<%-- 						    <input type="hidden" name="#" value="${grpInfoVO.grpNo}"> --%>
		<!-- 						    <input type="hidden" name="action" value="entergrpno"> -->
		<!-- 						</FORM> -->
						
							</div> 
							<!-- End .product-details -->
						</div>
				<!-- End .col-6_col-sm-4 -->
					</c:if>
				</c:forEach>
			</div>
			<!-- End .row_products-group -->
<!-- 			<div class="toolbox toolbox-pagination"> -->
<!-- 				<div class="toolbox-item_toolbox-show"> -->
<!-- 					<label>頁數:</label> -->
<!-- 					End .select-custom -->
<!-- 				</div> -->
<!-- 				End .toolbox-item -->
				
<!-- 				<ul class="pagination toolbox-item"> -->
<!-- 					<li class="page-item disabled"><a -->
<!-- 						class="page-link page-link-btn" href="#"><i -->
<!-- 							class="icon-angle-left"></i></a></li> -->
<!-- 					<li class="page-item active"><a class="page-link" href="#">1 -->
<!-- 							<span class="sr-only">(current)</span> -->
<!-- 					</a></li> -->
<!-- 					<li class="page-item"><a class="page-link" href="#">2</a></li> -->
<!-- 					<li class="page-item"><a class="page-link" href="#">3</a></li> -->
<!-- 					<li class="page-item"><span class="page-link">...</span></li> -->
<!-- 					<li class="page-item"><a class="page-link page-link-btn" -->
<!-- 						href="#"><i class="icon-angle-right"></i></a> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 			</div> -->
			<!-- End .row -->
		  </div>
		  <!-- End .container -->
		 </div>
		 <!-- margin -->
		</main>
		<!-- End .main -->

	<!-- End .page-wrapper -->
	<footer class="footer bg-dark position-relative" style="margin-top:20px;">
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

	<!-- Plugins JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
	</script> -->

</body>
</html>

