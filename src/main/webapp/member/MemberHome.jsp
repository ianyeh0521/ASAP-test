<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.asap.member.entity.*"%>
<%@ page import="com.asap.member.service.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>


<% 
   MemberVO mbrVo = (MemberVO)session.getAttribute("memberVo");

   MbrNewsService mbrNewsSvc = new MbrNewsService();
   List<MbrNewsVO> newslist = mbrNewsSvc.findByMbrNo(mbrVo.getMbrNo());
   pageContext.setAttribute("newslist", newslist);
   
   
   MbrActivService mbrActivSvc = new MbrActivService();
   List<MbrActivVO> activlist = mbrActivSvc.findByMbrNo(mbrVo.getMbrNo());
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
   ArrayList allActiv = new ArrayList();
  
   if(activlist != null){
   for(MbrActivVO vo: activlist){
	   ArrayList oneActiv = new ArrayList();
	   oneActiv.add(vo.getActivSubj());
	   oneActiv.add(sdf.format(vo.getActivStartTime()));
	   oneActiv.add(sdf.format(vo.getActivEndTime()));
	   allActiv.add(oneActiv);  
    }
   }
   pageContext.setAttribute("allActiv", allActiv);
   
   
%>
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

<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700", "Shadows+Into+Light:400", ],
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/simple-line-icons/css/simple-line-icons.min.css" />
<style>
.scrollbar {
        &::-webkit-scrollbar {
          width: 10px;
        }
        &::-webkit-scrollbar-track {
          background-color: lightgray;
          border-radius: 25px;
        }
        &::-webkit-scrollbar-thumb {
          border-radius: 25px;
          background-color: gray;
        }
      }
#fs_alert {
	width: 100vw;
	height: 100vh;
	position: absolute;
	top: 0;
	/* display: block; */
	display: none;
	z-index: 999;
}

.fs_alert_bg {
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.671);
	position: fixed;
	top: 0;
}

.fs_alert_show {
	max-width: 500px;
	min-width: 400px;
	background-color: white;
	position: fixed;
	top: 30%;
	left: 0;
	right: 0;
	margin: auto;
	z-index: 2;
	border-radius: 8px;
	text-align: center;
}

.fs_alert_title {
	font-size: 36px;
	text-align: center;
	margin: 35px;
	font-weight: bold;
}

.fs_alert_title_suc {
	color: rgb(85, 184, 201);
}

.fs_alert_txt {
	word-wrap: break-word;
	overflow-y: scroll;
	overflow-x: hidden;
	font-size: 16px;
	padding: 10px;
	text-align: center;
	margin: 15px 10%;
}

#alert_ok {
	margin: 30px auto;
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
	background-color: rgb(76, 139, 150);
}
</style>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.9/index.global.min.js'></script>
<script
	src="${pageContext.request.contextPath}/assets/js/locales-all.global.js"></script>

<!-- 行事曆 -->
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var calendarEl = document.getElementById("calendar");
		
		var calendar = new FullCalendar.Calendar(calendarEl, {
			locale : "zh-tw",
			initialView : "dayGridMonth",
			headerToolbar : {
				left : "prev,next today",
				center : "title",
				right : "dayGridMonth,timeGridWeek,timeGridDay,listMonth",
			},
			initialDate : new Date(),
			
			navLinks : true, // can click day/week names to navigate views
			businessHours : true, // display business hours
			// editable: true,

			eventLimit : true,
			selectable : true,
			events: [
				<c:if test="${not empty allActiv}">		
				<c:forEach var="activ" items="${allActiv}">
				{
					title: "${activ[0]}",
					start: "${activ[1]}",
					end: "${activ[2]}",
					
				},					
		        </c:forEach>
				</c:if>
			],
			

		});

		calendar.render();
	});
</script>
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

		<main class="main">
			<div class="page-header">
				<div class="container d-flex flex-column align-items-center">
					<h1>我的帳戶</h1>
				</div>
			</div>
			<!--這是彈窗 需要傳資料可以把form、input打開 他的css在上面-->

			<div id="fs_alert">
				<div class="fs_alert_bg"></div>
				<div class="fs_alert_show">

					<div class="fs_alert_txt scrollbar"></div>
					<div class="btn_s" id="alert_ok">關閉</div>

				</div>
			</div>


			<div class="container account-container custom-account-container">

				<p>Welcome, ${memberVo.mbrName} !</p>
				<div
					style="display: flex; padding: 3%; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px -1px, rgba(0, 0, 0, 0.06) 0px 2px 4px -1px; border-radius: 15px; flex-wrap: wrap; border-radius: 15px; justify-content: space-between;">
					<div class="news"
						style="flex-basis: calc(( 100% - 20px)/2); border-radius: 15px; padding: 3%; height: 400px; max-height: 450px; max-width: calc(( 100% - 20px)/2);">
						<h3>最新消息</h3>
						<div
							style="height: 300px; border: 1px dashed lightgray; border-radius: 15px; padding: 10px;">
							<div class="scrollbar"
								style="overflow-y: scroll; overflow-x: hidden; max-height:250px" id="newsList">
								<c:if test="${not empty newslist}">
								<c:forEach var="news" items="${newslist}">
								<div style="margin-bottom: 5px;font-size: 1.5rem;padding: 2px 0;border-bottom: darkgray 1.5px dashed;">
                                      <p style="display: block;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;" class="news">
                                           <b>${news.newsSubj}</b>&ensp;|&ensp;${news.newsText}&ensp;|&ensp;<fmt:formatDate value="${news.newsTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                      </p>
                                 </div>							
						        </c:forEach>
								</c:if>
							</div>
						</div>
					</div>

					<div class="mbrinfo"
						style="flex-basis: calc(( 100% - 20px)/2); border-radius: 15px; padding: 3%; height: 400px; max-height: 450px; max-width: calc(( 100% - 20px)/2);">
						<h3>會員資訊</h3>
						<div style="height: 300px;border: 1px dashed lightgray;border-radius: 15px;">

							<div
								style="margin: 10px; display: flex; align-items: center; flex-wrap: wrap; justify-content: space-between; height: calc(( 100% -100px)/6);">
								<label for="MbrEmail"
									style="margin: 0 10px 0 0; font-size: 1.5rem; height: 30px; display: flex; align-items: center;">會員帳號
									:</label> <input type="text" disabled value="${memberVo.mbrEmail}"
									id="MbrEmail"
									style="font-size: 1.5rem; border-radius: 5px; width: 80%" />
							</div>
							<div
								style="margin: 10px; display: flex; align-items: center; flex-wrap: wrap; justify-content: space-between; height: calc(( 100% -100px)/6);">
								<label for="MbrName"
									style="margin: 0 10px 0 0; font-size: 1.5rem; height: 30px; display: flex; align-items: center;">會員姓名
									:</label> <input type="text" disabled value="${memberVo.mbrName}"
									id="MbrName"
									style="font-size: 1.5rem; border-radius: 5px; width: 80%" />
							</div>
							<div
								style="margin: 10px; display: flex; align-items: center; flex-wrap: wrap; justify-content: space-between; height: calc(( 100% -100px)/6);">
								<label for="MbrPhone"
									style="margin: 0 10px 0 0; font-size: 1.5rem; height: 30px; display: flex; align-items: center;">會員手機
									:</label> <input type="text" disabled value="${memberVo.mbrPhone} "
									id="MbrPhone"
									style="font-size: 1.5rem; border-radius: 5px; width: 80%" />
							</div>

							<div
								style="margin: 10px; height: calc(( 100% -100px)/6); text-align: right;">

								<button
									style="font-size: 1.5rem; border-radius: 5px; margin: 10px; border: 0;">
									<a style="display: block;"
										href="${pageContext.request.contextPath}/member/MemberUpdateInfo.jsp">更新</a>
								</button>

							</div>

						</div>
					</div>
				</div>



			</div>
			<!--End Top-->
			<div
				style="margin: 40px 0 40px 0; padding: 3%; font-family: Arial, Helvetica Neue, Helvetica, sans-serif; font-size: 14px; box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px -1px, rgba(0, 0, 0, 0.06) 0px 2px 4px -1px; border-radius: 15px;">
				<h2>我的行事曆</h2>
				<div id="calendar" style="max-width: 1100px; margin: 0 auto"></div>
			</div>
			<!--End calendar-->

			<!-- End .container -->

			<div class="mb-5"></div>
			<!-- margin -->
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
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<script>
		$(window).on("load", function() {
		

			$("#newsList").on("click", "p.news", function() {
				 var p = $(this).text();
		         var p_list = p.split("|");
		         var context = '<div style="font-size: larger">'+ p_list[0] +'</div><br><div style="text-align: left;">'+ p_list[1] +'</div><br><div style="text-align: left;">'+ p_list[2] +'</div>';
		         $("div.fs_alert_txt").html(context);
				$("#fs_alert").css("display", "block");
			});
			
			
			$("#alert_ok").on("click", function() {
				$("#fs_alert").css("display", "none");
			});
			
			
			
		});
	</script>

</body>
</html>
