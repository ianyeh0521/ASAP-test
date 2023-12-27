<%@page import="com.asap.member.entity.MemberVO"%>
<%@page import="com.asap.court.entity.CourtTypeVO"%>
<%@page import="com.asap.court.service.CourtTypeService"%>
<%@page import="com.asap.court.service.SiteService"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.entity.SiteVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>



<%
	MemberVO mbrVO = (MemberVO)session.getAttribute("memberVo");
	String mbrNo = mbrVO.getMbrNo();
	pageContext.setAttribute("mbrNo",mbrNo);
%>
<html>

<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>ASAP</title>




<!-- Plugins CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<!-- Main CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/simple-line-icons/css/simple-line-icons.min.css">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">
    <link
          rel="stylesheet"
          href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
          integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
          crossorigin="anonymous"
    />

    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = '/ASAP/assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>


    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    
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
        </header><!-- End .header -->

        <main class="main">
            <ul class="checkout-progress-bar d-flex justify-content-center flex-wrap">
              <li class="disabled">
                  <a href="#">完成預約</a>
              </li>
              <li class="active">
                  <a href="#">付款完成</a>
              </li>
            </ul>

            

            <div class="container">
              <div class="alert alert-info" style="border-radius: 5px;">
                <div class="alert-wrapper">
                  <h4>付款成功!</h4>
                  	<p>
                    耶，你的課程預約完成啦！🎉
                    <br>
					<p>
                   <a href="${pageContext.request.contextPath}/course/course_main.jsp">
                   <button class="btn btn-info mt-xs mb-xs" type="button" style="background-color: rgb(191, 194, 197); margin-left: 20px; border-radius: 5px;">返回課程查詢</button>
                   </a>
                  <!-- <button class="btn btn-default mt-xs mb-xs" type="button">Not convinced yet</button> -->
    
                </div>
              </div>
            </div>
            
          

            
        </main><!-- End .main -->

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
        </footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->

    <div class="loading-overlay">
        <div class="bounce-loader">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

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
    	
    </div><!-- End .mobile-menu-container -->

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



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

    <!-- header and footer template -->
    <script>
        $(window).on("load", function(){
            $("#lookup").on("click", function(){
              $("#fs_alert").css("display", "block");
            })
            $("#alert_ok").on("click", function(){
              $("#fs_alert").css("display", "none");
            })
        })
	</script>
</body>

</html>