
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.asap.course.service.CourseService"%>
<%@page import="com.asap.course.service.CourseService_interface"%>
<%@page import="com.asap.course.entity.CourseVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.util.*"%>

<%
	Integer courseNo = Integer.valueOf(request.getParameter("courseNo"));
	CourseService_interface courseSvc = new CourseService();
	CourseVO courseVO = courseSvc.findByPK(courseNo);
	
	Timestamp startTime = courseVO.getCourseStartTime();
	Timestamp endTime = courseVO.getCourseEndTime();
	SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd HH:mm");
	SimpleDateFormat df2 = new SimpleDateFormat("HH:mm");
    String start = df.format(startTime);
    String end = df2.format(endTime);
    
	
	pageContext.setAttribute("courseNo", courseNo);
	pageContext.setAttribute("courseVO", courseVO);
	pageContext.setAttribute("start", start);
	pageContext.setAttribute("end", end);
   	
	// 先設一個 member，之後會是 session.getAttribute 得到 memberVO
	String mbrNo = "M1206202300001";
	pageContext.setAttribute("mbrNo",mbrNo);
	
 	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>課程-個別資訊</title>

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Bootstrap eCommerce Template">
	<meta name="author" content="SW-THEMES">

	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">

	<script>
		WebFontConfig = {
			google: { families: ['Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400'] }
		};
		(function (d) {
			var wf = d.createElement('script'), s = d.scripts[0];
			wf.src = '${pageContext.request.contextPath}/assets/js/webfont.js';
			wf.async = true;
			s.parentNode.insertBefore(wf, s);
		})(document);
	</script>
	
	<script src="/ASAP/assets/js/jquery.min.js"></script>
	
	<!-- Plugins CSS File -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

	<!-- Main CSS File -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">

	<!-- 彈窗 -->
	<style>
        #fs_alert {
        width: 100%;
        height: 200vh;
        position: fixed;
        top: 0;
        /* display: block; */
        display: none;
        z-index: 999;
      }

      .fs_alert_bg {
        width: 100%;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.671);
        position: fixed;
        top: 0;
      }
      .fs_alert_show {
        max-width: 600px;
        min-width: 400px;

        background-color: white;
        position: absolute;
        top: 90px;
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
        width: 90%;
        word-wrap: break-word;
        font-size: 16px;
        padding: 0 20px;
      	text-align: center;
        margin: 0px auto 15px auto;
      }
      #alert_ok {
        margin: 20px auto 45px auto;
      }
      #alert_ok2 {
        margin: 20px auto 45px auto;
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
      
      
     .custom-select {
	    position: relative;
	    display: inline-block;
	}
	
	.scrollable-select {
	    max-height: 120px;
	    overflow-y: auto;
	    width: 150px;
	    position: absolute;
	    z-index: 1;
	}
	
	.custom-select select {
	    width: 100%;
	    padding: 5px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    box-sizing: border-box;
	    cursor: pointer;
	}
	
	
      
      
    
    </style>
    
   
  
    
</head>

<body>

<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v18.0&appId=527715825381943" nonce="UErjtxl5"></script>
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

		<!-- 預約須知彈窗 -->
		<div id="fs_alert">
			<div class="fs_alert_bg"></div>
			<div class="fs_alert_show">
			  <div class="fs_alert_title">預約須知</div>
			  <div class="fs_alert_txt">
			  	1. 儘量提前預約您想參加的課程，特別是在繁忙的時間段或受歡迎的課程中。這樣可以確保您有位置並節省等待時間。
				<br>
				2. 了解課程的取消政策。有些場所可能要求您提前通知取消，以免付款或保證金損失。
				<br>
				3. 選擇與您的適應程度相符的課程。有些課程可能適合初學者，而其他可能需要更高的體能水平。
				<br>
				4. 確保您了解課程所需的器材，並在參加課程前做好準備。有些場地可能提供器材，而其他場地可能要求您自行攜帶。
				<br>
				5. 穿著合適的運動服裝和運動鞋，以確保您在課程中感到舒適且能夠自由運動。
				<br>
				6. 請儘量準時到達課程場地，這樣可以有足夠的時間完成登記和準備。
			  </div>
			  <div class="btn_s" id="alert_ok">已詳細閱讀</div>
			</div>
		</div>
		
		

		<main class="main">
			<div class="container">
				<nav aria-label="breadcrumb" class="breadcrumb-nav">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/course/course_main.jsp"><i class="icon-home"></i></a></li>
						<li class="breadcrumb-item">課程名稱</li>
					</ol>
				</nav>
				
				<!-- 功能按鈕 -->
				<div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
					<a href="${pageContext.request.contextPath}/course/course_orderlist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的預約</button></a>
				</div>


				<div class="product-single-container product-single-default">
					<div class="row">
						<!-- 圖片 -->
						<div class="col-lg-5 col-md-6 product-single-gallery">
							<div class="product-item">
								<div class="inner">
									<img src="${pageContext.request.contextPath}/course/DBGifReader?courseNo=${courseNo}"
										data-zoom-image="${pageContext.request.contextPath}/course/DBGifReader?courseNo=${courseNo}" width="480"
										height="480" alt="proudct-img">
									<span class="prod-full-screen">
										<i class="icon-plus"></i>
									</span>
								</div>
							</div><!-- End .product-item -->
						</div><!-- End .col-md-5 -->

						<div id="hiddenDivForCourt" style="display: none;">${courseNo}</div>	<!-- 暫放課程編號給前端 --> 
						<div id="hiddenDivForMember" style="display: none;">${mbrNo}</div>		<!-- 暫放會員編號給前端 -->
						
						<div class="col-lg-7 col-md-6 product-single-details">
							<h1 class="product-title">${courseVO.courseName}</h1>

							<hr class="short-divider">

							<div class="price-box">
								<span class="new-price">$ ${courseVO.coursePrice} / 堂 </span>
							</div><!-- End .price-box -->

							<div class="product-desc">
								<p>
									${courseVO.courseText}
								</p>
							</div><!-- End .product-desc -->
							<hr class="divider mb-0 mt-0">
							<br>
							<ul class="single-info-list">
								<li>
									教練姓名: <strong><a class="product-category" style="margin-right: 200px;">${courseVO.coachVO.coachName}</a></strong>
									課程編號: <strong><a class="product-category">${courseVO.courseNo}</a></strong>
								</li>
								<li>
									課程種類: <strong><a class="product-category" style="margin-right: 200px;">${courseVO.sportTypeVO.sportTypeName}</a></strong>
									時間: <strong><a class="product-category" id = "courseTime">${start} ~ ${end}</a></strong>				
								</li>
								<li>
									地點: <strong><a class="product-category">${courseVO.courseAddress}</a></strong>
								</li>
								<li>
									人數上限: <strong><a class="product-category">${courseVO.coursePplLimit}</a></strong>
								</li>
							</ul>
							
<!-- 							<hr class="divider mb-0 mt-0"> -->
							
							
							<div class="product-filters-container custom-product-filters" style="padding-bottom: 2px; margin-bottom:0px">
								<div class="product-single-filter">
									<ul class="config-size-list">
										<li><a href="#" class="d-flex align-items-center justify-content-center" id="lookup">預約須知</a>
										</li>
									</ul>
								</div>
								<!-- 點擊完預約須知才能預約 -->
								<div class="product-single-filter"></div>
							</div>

							<div class="product-action">
								<a href="#" id="reservationLink" class="btn btn-dark disabled add-cart icon-shopping-cart mr-2" title="Add to Cart">
								預約
								</a>
							</div><!-- End .product-action -->
							
						
						</div><!-- End .product-single-details -->
					</div><!-- End .row -->
				</div><!-- End .product-single-container -->


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

	<div class="loading-overlay">
		<div class="bounce-loader">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>

	<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

	<div class="mobile-menu-container"></div><!-- End .mobile-menu-container -->

	<div class="sticky-navbar"></div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	
	

	<!-- Main JS File -->
	<script src="/ASAP/assets/js/main.min.js"></script>

	<!-- header and footer template -->
	<script>
// 		$("header").load("header.html");
// 		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
		
		$(window).on("load", function(){
	        
			$("#lookup").on("click", function(){
				$("#fs_alert").css("display", "block");
			});
			
			$("#alert_ok").on("click", function(){
				$("#fs_alert").css("display", "none");
				$("#reservationLink").removeClass('disabled');
			});
			
			
			
			// 預約進入確認預約頁面
			
			$("#reservationLink").on('click', async function(e) {
			    var courseNo = ${courseVO.courseNo};
			    var courseTime = document.getElementById("courseTime").textContent; 
			    
			    // 檢查是否已額滿
				 try {
			        var result = await $.ajax({
			            type: 'GET',
			            url: 'mbrCourseServlet?action=check&courseNo=' + courseNo,
			        });
			
			        console.log(result);
			
			        if ($(this).hasClass('disabled')) {
			            e.preventDefault();
			        }else if(result === "full"){
			            e.preventDefault();
			            alert('課程已額滿!');
			        } else {
			            var url = 'course_checkout.jsp?courseNo=' + encodeURIComponent(courseNo)
			                + '&courseTime=' + encodeURIComponent(courseTime);
			
			            window.location.href = url;
			        }
			    } catch (error) {
			        console.error('Error in AJAX call:', error);
			    }
			});
			        
			
			

		})
	
        
	</script>
</body>

	
	
</html>