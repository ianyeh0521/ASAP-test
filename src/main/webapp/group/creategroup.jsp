<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.asap.group.entity.GrpInfoVO" %>
<%@ page import="com.asap.member.entity.MemberVO" %>
<%@ page import="com.asap.member.service.MemberService" %>
<%@ page import="com.asap.member.service.MemberService_interface" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	MemberService memberSvc = new MemberService();

	//登入帳號->發起人
	String LoginActNo = "M1206202300001";
	MemberVO MemberVoDetail = new MemberVO();
	MemberVoDetail = memberSvc.findByMbrNo(LoginActNo);
	pageContext.setAttribute("MemberVoDetail", MemberVoDetail);
	
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

<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700", "Shadows+Into+Light:400",
					"Segoe+Script:300,400,500,600", ],
		},
	};
	(function(d) {
		var wf = d.createElement("script"), s = d.scripts[0];
		wf.src = "assets/js/webfont.js";
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo2.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group//mycss.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group/creategroup.css" />


<style>
/* 彈窗樣式 */
#creategrpfsfs_alert {
    width: 100vw;
    height: 100vh;
    position: absolute;
    top: 0;
    /* display: block; */
    display: none;
    z-index: 999;
}
.creategrpfsfs_alert_bg {
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.671);
    position: fixed;
    top: 0;
    right:0px;
    left:0px;
    
}
.creategrpfsfs_alert_show {
	position: fixed;
    max-width: 450px;
    min-width: 400px;
	top: 25%;
	left: 32.64%;
    background-color: white;
    margin: auto;
    z-index: 2;
    border-radius: 8px;
    text-align: center;
    border-top: 20px solid;
       border-image: linear-gradient(to right, #F5F5DC, #D1E9E9, #6db1f1);
       border-image-slice: 1;
}

.creategrpfsfs_alert_title {
    font-size: 30px;
    text-align: center;
    margin: 35px;
    font-weight: bold;
}
.creategrpfsfs_alert_title_suc {
    color:rgb(85, 184, 201);
}
.creategrpfsfs_alert_txt {
    width: 80%;
    word-wrap: break-word;
    font-size: 16px;
    padding: 0 20px;
    text-align: center;
    margin: 0px auto 15px auto;
}
#alert_yes {
    margin: 20px 2px 45px 2px;
}
#alert_no {
    margin: 20px 2px 45px 2px;
}

.btn_s {
   width: 100px;
    border-radius: 8px;
    font-size: 16px;
    text-align: center;
    padding: 10px;
    cursor: pointer;
    color: rgb(255, 255, 255);
    background-color: rgb(85, 184, 201);
    margin: 10px;
}

 .btn_s:hover { 
     background-color:rgb(85, 184, 201);
}

.Btn_yesorno {
    text-align: center;
}

.btn_s {
    display: inline-block;
    padding: 8px 16px;
    margin: 0 5px;
}
.Btn_creategrp_sm {
	width:68px;
	height:42.4px;

}
</style>
</head>
<body>
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
		<c:set var="MemberVoDetail" value="${MemberVoDetail}" />
		
		<main class="main">
			<h2 class="creategrptitle">發起揪團</h2>
			
			<div class="createform">
				<div class="createform_main">
					<form id="creategrpform" action="<%=request.getContextPath()%>/Grpinfo.do?action=insertgrpInfo" method="post" enctype="multipart/form-data">
						<div class="import" style="font-size: 10px; color: red">*必填
						</div>
						<!-- 發起人資訊 -->
						<h3 style="color: #5a5aad">
							<i class="fas fa-user-circle"></i> 發起人資訊
						</h3>
						<br/> <span class="form_textbox"> 
						<label class="create_member">
						<a class="x">*</a>發起人：</label> 
						<input class="MbrName" type="text" id="MbrName" name="OrgMbrNo" value="${MemberVoDetail.mbrName}" required disabled />
						</span> 
						<span class="form_textbox"> 
						<label for="create_phonenum">
						<a class="x">*</a>連絡電話：</label> <input class="MbrPhone" type="tel"
							id="MbrPhone" name="MbrPhone" value="${MemberVoDetail.mbrPhone}"required disabled />
						</span> <br /> <span class="form_textbox"> 
						<label for="create_email">電子信箱：</label> <input class="MbrEmail"
							type="email" id="MbrEmail" name="MbrEmail" value="${MemberVoDetail.mbrEmail}"required disabled />
						</span>
						<hr/>
						<!-- 活動資訊 -->
						<h3 style="color: #5a5aad">
							<i class="fas fa-user-circle"></i> 活動資訊</h3>
						<span class="form_GrpNametxt"> 
						<label for="Grp_Name">
						<a class="x">*</a>活動名稱：</label> 
						<input type="text" id="GrpName" name="GrpName" placeholder="請輸入活動名稱" required />
						</span> <br /> 
						
						<label for="SportTypeName">
						<a class="x">*</a>運動類別：</label>
						<select name="SportTypeName" id="SportTypeName" required >
							<option value="">請選擇</option>
							<option value="1">游泳</option>
							<option value="2">棒球</option>
							<option value="3">網球</option>
							<option value="4">手球</option>
							<option value="5">籃球</option>
							<option value="6">排球</option>
							<option value="7">桌球</option>
							<option value="8">羽球</option>
							<option value="9">跑步</option>
							<option value="10">自行車</option>
							<option value="11">足球</option>
							<option value="12">高爾夫</option>
						</select> <label for="Grp_Date">
						<a class="x">*</a>活動日期：</label> 
						<input type="date" id="GrpDate" name="GrpDate" required /> 
						<label for="GrpStartTime"><a class="x">*</a>開始時間：</label> 
						<input type="time" id="GrpStartTime" name="GrpStartTime" required  />
						<br /> 
						<label for="GrpEndTime"><a class="x">*</a>結束時間：</label> 
						<input type="time" id="GrpEndTime" name="GrpEndTime" required /> 
						<label for="GrpPplMin"><a class="x">*</a>最低人數：</label> 
						<input type="number" id="GrpPplMin" name="GrpPplMin" required value="2" />
						<a>人</a> <label for="GrpPplLimit">
					    <a class="x">*</a>最高人數：</label>
						<input type="number" id="GrpPplLimit" name="GrpPplLimit" 
							value="2" required /> <a>人</a> <br /> 
						<label for="GrpAddress"><a class="x">*</a>活動地點：</label> 
						<input type="text" id="GrpAddress2" name="GrpAddress" required placeholder="例：台北體育館，台北市松山區南京東路四段10號" required /> <br /> 
							<label for="GrpSignStrTime"><a class="x">*</a>報名期間：</label> 
							<input type="date" id="GrpSignStrTime1" name="GrpSignStrDate" required />
							<input type="time" id="GrpSignStrTime2" name="GrpSignStrTime" required /> 
							<a class="an">至</a> 
							<input type="date" id="GrpSignEndTime1" name="GrpSignEndDate" required />				
							<input type="time" id="GrpSignEndTime2" name="GrpSignEndTime" required />
						<div>
							<label for="GrpImg">圖片上傳：</label> 
							<input id="GrpImg" name="GrpImg" type="file"  multiple="multiple">
						</div>
						<div id="preview">
							<span class="text">預覽圖</span>
						</div>
						<div>
							<label for="GrpNote">注意事項：</label>
						</div>
						<textarea id="GrpNote" name="GrpNote" rows="5" cols="33"></textarea>
						<br />
						
						
						<div class="Grp_Btnsrr">
						<c:set var="grpVO" value="${grpVO}" />
						<c:set var="type" value="${type}" />
						
						<c:if test="${type == null or type eq '0'}">
							<input class="Btn_creategrp_sm" id="InsertBtn" value="送出">
						</c:if>
						
						<c:if test="${type eq '1'}">
							<input class="Btn_creategrp_sm" id="InsertBtn" value="修改">
						</c:if>
							
							
							<a href="${pageContext.request.contextPath}/group/AllGroup.jsp" class="return-link" id="return_link">返回</a>						
							<button type="reset">清空</button>
						</div>
						
						<!--彈窗畫面 -->
						<div id="creategrpfsfs_alert">
						    <div class="creategrpfsfs_alert_bg"></div>
						    <div class="creategrpfsfs_alert_show"> 
						        <div class="creategrpfsfs_alert_title">提示:</div>
						        <div class="creategrpfsfs_alert_txt">確定要送出嗎?</div>
						        <div class="Btn_yesorno">
						            <input type="submit" class="btn_s" id="alert_yes" value="確定">
						            <input type="hidden" name="GrpNo" value="${grpVO.grpNo}">
									<input type="hidden" name="type" value="${type}">
							   	    <input type="hidden" name="action" value="insertgrpInfo">
							   	    <input type="button" class="btn_s" id="alert_no" value="取消">
						        </div> 
						    </div>
						</div>
						<!--End .div彈窗畫面 -->
					</form>		
					
					
						
				</div>	
			</div>	
		</main>
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
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/plugins.min.js"></script>
	<script src="assets/js/nouislider.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.min.js"></script>

<!-- 	<script> -->
<!-- // 		$("header").load("header.html"); -->
<!-- // 		$("footer").load("footer.html"); -->
<!-- // 		$("div.sticky-navbar").load("sticky-navbar.html"); -->
<!-- // 		$("div.mobile-menu-container").load("mobile-menu-container.html"); -->
<!-- 	</script> -->

<% 
		// 抓伺服器時間
		Date serverDateTime = new Date();
		//預設時間格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //轉換對應時間格式
		String formattedDateTime = sdf.format(serverDateTime);
%>		

<script>
	var form = document.getElementById("creategrpform");
	var submitBtn = document.getElementById('InsertBtn');
	var alertYesBtn = document.getElementById('alert_yes');
	var alertNoBtn = document.getElementById('alert_no');
	 
	submitBtn.addEventListener('click', function(e) {
		e.preventDefault();
		// 錯誤處理
		var MbrName = document.getElementById("MbrName");
		var MbrPhone = document.getElementById("MbrPhone");
		var MbrGrpName = document.getElementById("GrpName");
		var GrpPplMin = document.getElementById("GrpPplMin");
		var GrpPplLimit = document.getElementById("GrpPplLimit");
		 
		
// 		MbrName.addEventListener("input", function () {
		var regex = /^(?=.*[\u4E00-\u9FFFa-zA-Z])[\u4E00-\u9FFFa-zA-Z\s]*$/;
		if (!regex.test(MbrName.value)) {
			MbrName.setCustomValidity("只能輸入中文和英文");
		} 
		else {
			MbrName.setCustomValidity("");
		}
// 		});
		
// 		MbrPhone.addEventListener("input", function () {
		var regex = /^(09\d{8}|02\d{8})$/;
		if (!regex.test(MbrPhone.value)) {
		    MbrPhone.setCustomValidity("必須以09或02開頭並為10位數字");
	 	} 
		else {
	   		MbrPhone.setCustomValidity("");
	 	}
// 		});
		
// 		GrpPplMin.addEventListener("input", function () {
		if (GrpPplMin.value <= 1) {
	      	GrpPplMin.setCustomValidity("人數請包含自己(預設為2),也不得設定為負數");
    	} 
		else {
	      	GrpPplMin.setCustomValidity("");
    	}
// 		});
		
// 		GrpPplLimit.addEventListener("input", function () {
		var limit = parseInt(GrpPplLimit.value);
		var min = parseInt(GrpPplMin.value);
		if (limit <= 1 ) {
		    GrpPplLimit.setCustomValidity("人數請包含自己(預設為2)，也不得設定為負數");
	    } 
		else if (limit < min) {
	        GrpPplLimit.setCustomValidity("最高人數不得小於最低人數");
	    } 
		else {
	        GrpPplLimit.setCustomValidity("");
		}
// 		});
		
// 		MbrGrpName.addEventListener("input", function () {
		var chineseCharacters = MbrGrpName.value.match(/[\u4E00-\u9FFF]/g);
		var englishCharacters = MbrGrpName.value.match(/[a-zA-Z]/g);
		var chineseCount = chineseCharacters ? chineseCharacters.length : 0;
		var englishCount = englishCharacters ? englishCharacters.length : 0;
		
		if (chineseCount > 10 || englishCount > 30) {
		    MbrGrpName.setCustomValidity("中文不得超過10個字, 英文不得超過30個字元");
		    
		} 
		else {
		    MbrGrpName.setCustomValidity("");
		}
// 		});
		   			
		// 時間處理
		
		//活動日期
		var GrpDate = document.getElementById("GrpDate");
		//活動開始時間
		var GrpStartTime = document.getElementById("GrpStartTime");
		//活動結束時間
		var GrpEndTime = document.getElementById("GrpEndTime");
		//報名開始日期
		var GrpSignStartDate = document.getElementById("GrpSignStrTime1");
		//報名結束日期
		var GrpSignEndDate = document.getElementById("GrpSignEndTime1");
		//報名開始時間
		var GrpSignStartTime = document.getElementById("GrpSignStrTime2");
		//報名結束時間
		var GrpSignEndTime = document.getElementById("GrpSignEndTime2");

		console.log("活動日期:", GrpDate.value);
		console.log("活動開始時間:", GrpStartTime.value);
		console.log("活動結束時間:", GrpEndTime.value);
		console.log("報名開始日期:", GrpSignStartDate.value);
		console.log("報名結束日期:", GrpSignEndDate.value);
		console.log("報名開始時間:", GrpSignEndDate.value);
		console.log("報名結束時間:", GrpSignEndTime.value);
	 
	
		var formattedDateTime = new Date("<%= formattedDateTime %>");
		formattedDateTime.setDate(formattedDateTime.getDate() + 1);
		formattedDateTime.setHours(0, 0, 0, 0);
		
		var GrpStartDateTime = new Date(GrpDate.value + 'T' + GrpStartTime.value);
		var GrpEndDateTime = new Date(GrpDate.value + 'T' + GrpEndTime.value);
		var GrpSignStartDateTime = new Date(GrpSignStartDate.value + 'T' + GrpSignStartTime.value);
		var GrpSignEndDateTime = new Date(GrpSignEndDate.value + 'T' + GrpSignEndTime.value);
		
		// 判斷活動開始時間不可晚於今日
		if (formattedDateTime > GrpStartDateTime) {
		    
			GrpDate.setCustomValidity("活動開始時間需大於今日");
		}
		// 判斷活動開始時間不可晚於活動結束時間
		else if (GrpStartDateTime > GrpEndDateTime) {
		    
			GrpEndTime.setCustomValidity("活動開始時間不可晚於活動結束時間");
		}
		// 判斷報名結束日期時間不可晚於活動開始日期時間
		else if (GrpSignEndDateTime > GrpStartDateTime) {
		    
			GrpSignEndTime.setCustomValidity("報名結束日期不可晚於活動開始日期");
		}
		// 判斷報名開始時間不可晚於報名結束時間
		else if (GrpSignStartDateTime > GrpSignEndDateTime) {
		    
			GrpSignEndTime.setCustomValidity("報名結束日期不可晚於活動開始日期");
		}
		else{
			GrpDate.setCustomValidity("");
			GrpEndTime.setCustomValidity("");
			GrpSignEndTime.setCustomValidity("");
		}
		
		if (form.reportValidity()) {
		    creategrpfsfs_alert();
		   }
	 });
	 
	  var preview_el = document.getElementById("preview");
	  var GrpImg_el = document.getElementById("GrpImg");
	 
	 // 透過 File 取得預覽圖
     var preview_img = function (file) {
		 
    	 console.log("file" + file);
	 	var reader = new FileReader(); // 用來讀取檔案
	    reader.readAsDataURL(file); // 讀取檔案
	    reader.addEventListener("load", function () {
	    	
	    	console.log("reader.result" + reader.result);
	    	var img_str ='<img src="' + reader.result + '" class="preview_img">';
	    	preview_el.innerHTML = img_str;
	    	console.log("reader.result:"+reader.result);
        });
     };

     GrpImg_el.addEventListener("change", function (e) {
        if (this.files.length > 0) {
            preview_img(this.files[0]);
        } else {
            preview_el.innerHTML = '<span class="text">預覽圖</span>';
        }
     });
        
	 // 清空欄位
	 var clearFormFields = function () {
	    document.getElementById("MbrName").value = "";
	    document.getElementById("MbrPhone").value = "";
	    document.getElementById("MbrEmail").value = "";
	    document.getElementById("GrpName").value = "";
	    document.getElementById("SportTypeName").value = "SportType_select";
	    document.getElementById("GrpDate").value = "";
	    document.getElementById("GrpStartTime").value = "";
	    document.getElementById("GrpEndTime").value = "";
	    document.getElementById("GrpPplMin").value = "";
	    document.getElementById("GrpPplLimit").value = "";
	    document.getElementById("GrpAddress2").value = "";
	    document.getElementById("GrpImg").value = "";
	    preview_el.innerHTML = '<span class="text">預覽圖</span>';
	    document.getElementById("GrpNote").value = "";
	    document.getElementById("GrpSignStrTime1").value = "";
	    document.getElementById("GrpSignEndTime1").value = "";
     };

	 var clearButton = document.querySelector(
	    '.Grp_Btnsrr button[type="reset"]'
	 );
	      
     clearButton.addEventListener("click", function () {
         clearFormFields();
     });
	
	// 送出後的確認彈窗
	 function creategrpfsfs_alert(){
	 	let creategrpfsfs_alert_el = document.getElementById('creategrpfsfs_alert');
		creategrpfsfs_alert_el.style.display = 'block';

		let alert_no_Btn = document.getElementById('alert_no');
		alert_no_Btn.addEventListener('click',function(){
		creategrpfsfs_alert_el.style.display = 'none';
		});
	 }
	</script>
	
<% String base64Image = (String) request.getAttribute("base64Image"); %>
    
	<script>
		// 編輯type是1
		var type = "${type}";
		
		if (type === '1'){
            
			document.getElementById('SportTypeName').disabled = true;
           	reserveText = "${grpVO.sportTypeNo}";
            document.getElementById('SportTypeName').value = reserveText;
            
            document.getElementById('GrpName').disabled = true;
            reserveText = "${grpVO.grpName}";
            document.getElementById('GrpName').value = reserveText;
            
            
            var reserveDate = "${grpVO.grpDate}"; 
          	//2023-12-17 00:00:00.0 取第0個位置開始10個數字
            var datePart = reserveDate.substring(0, 10); 
         	document.getElementById('GrpDate').value = datePart;
            
         	var reserveTime = "${grpVO.grpStartTime}";
         	document.getElementById('GrpStartTime').value = reserveTime;
			
         	reserveTime = "${grpVO.grpEndTime}";
         	document.getElementById('GrpEndTime').value = reserveTime;
			
         	reserveText = "${grpVO.grpAddress}";
         	document.getElementById('GrpAddress2').value = reserveText;
         	
         	document.getElementById('GrpPplLimit').disabled = true;
         	var reserveValue = "${grpVO.grpPplLimit}";
         	document.getElementById('GrpPplLimit').value = reserveValue;
         	

         	var previousValue = "${grpVO.grpPplMin}";
         	document.getElementById('GrpPplMin').value = previousValue;
         	
         	//報名開始日期
         	document.getElementById('GrpSignStrTime1').disabled = true;
         	reserveDate = "${grpVO.grpSignStrTime}"; 
            datePart = reserveDate.substring(0, 10); 
         	document.getElementById('GrpSignStrTime1').value = datePart;
         	
         	
         	//報名開始時間
         	document.getElementById('GrpSignStrTime2').disabled = true;
         	reserveDate = "${grpVO.grpSignStrTime}"; 
            datePart = reserveDate.substring(11, 19); 
         	document.getElementById('GrpSignStrTime2').value = datePart;
         	
  
         	//報名結束日期
         	document.getElementById('GrpSignEndTime1').disabled = true;
			reserveDate = "${grpVO.grpSignEndTime}"; 
            datePart = reserveDate.substring(0, 10); 
         	document.getElementById('GrpSignEndTime1').value = datePart;
         	
         	
         	//報名結束時間
         	document.getElementById('GrpSignEndTime2').disabled = true;
         	reserveDate = "${grpVO.grpSignEndTime}"; 
            datePart = reserveDate.substring(11, 19); 
         	document.getElementById('GrpSignEndTime2').value = datePart;
         	
         	
         	// 注意事項
         	reserveText = "${grpVO.grpNote}";
            document.getElementById('GrpNote').value = reserveText;

			var base64Image = '<%= base64Image %>';
			var preview_el = document.getElementById("preview");
			preview_el.src = 'data:image/png;base64,' + base64Image; // 更換 'jpeg' 依據實際圖片格式更改
			
	    	var img_str ='<img src="' + preview_el.src + '" class="preview_img">';
	    	preview_el.innerHTML = img_str;
				
 
        }
	</script>
	  
</body>
</html>
