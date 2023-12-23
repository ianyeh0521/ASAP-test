<%@page import="com.asap.court.entity.CourtImgVO"%>
<%@page import="com.asap.court.service.CourtImgService"%>
<%@page import="com.asap.court.entity.SiteVO"%>
<%@page import="com.asap.court.service.SiteService"%>
<%@page import="com.asap.court.entity.CourtTypeVO"%>
<%@page import="com.asap.court.service.CourtTypeService"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.util.*"%>

<%
	Integer courtNoPage = Integer.valueOf(request.getParameter("courtNo"));
	System.out.print(courtNoPage);
	CourtService courtPage = new CourtService();
	CourtVO getCourtPage = courtPage.getCourtByCourtNo(courtNoPage);
	
	CourtTypeService courtTypeSvc = new CourtTypeService();
	CourtTypeVO getCourtTypePage = courtTypeSvc.getCourtByCourtTypeNo(getCourtPage.getCourtTypeVO().getCourtTypeNo());
	
	SiteService siteSvc = new SiteService();
	SiteVO getSitePage = siteSvc.findSiteByPK(getCourtPage.getSiteVO().getSiteNo());
	
	CourtImgService courtImgSvc = new CourtImgService();
	List<String> courtImgBase64 = new ArrayList<>();
	List<CourtImgVO> courtImgVOList = courtImgSvc.findByCourtNo(courtNoPage);
	for(CourtImgVO courtImgVO: courtImgVOList){
		courtImgBase64.add(Base64.getEncoder().encodeToString(courtImgVO.getCourtImg()));
	}
	
	// datetime picker
	java.sql.Date closedDate = null;
	try {
		 closedDate = java.sql.Date.valueOf(request.getParameter("closedDate").trim());
	} catch (Exception e) {
		 closedDate = new java.sql.Date(System.currentTimeMillis());
	}
	
	
	pageContext.setAttribute("getCourtPage",getCourtPage);
   	pageContext.setAttribute("getSitePage",getSitePage);
   	pageContext.setAttribute("getCourtTypePage",getCourtTypePage);
   	pageContext.setAttribute("courtImgBase64", courtImgBase64);
   	
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
	<!-- fb sharing -->
	<meta property="og:url"           content="<%=request.getRequestURL()%>" />
	<meta property="og:type"          content="website" />
	<meta property="og:title"         content="${getCourtPage.courtName}" />
	<meta property="og:description"   content="${getCourtPage.courtText}" />
<!-- 	<meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" /> -->

	<title>場地-個別資訊</title>

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
	
	<!-- dateTime Picker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/court/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/court/datetimepicker/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/court/datetimepicker/jquery.datetimepicker.full.js"></script>

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
        #fs_alert2 {
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
      
      .icon-wishlist-2 span::after{
      	content: "查看我的收藏" !important; 
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
	
	/* 	datetimepicker */
	.xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  	}
  	.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  	}
	
	
      
      
    
    </style>
    
   
  
    
</head>

<body>

<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v18.0&appId=527715825381943" nonce="UErjtxl5"></script>
	<div class="page-wrapper">
		<header class="header"></header><!-- End .header -->

		<!-- 預約須知彈窗 -->
		<div id="fs_alert">
			<div class="fs_alert_bg"></div>
			<div class="fs_alert_show">
			  <div class="fs_alert_title">預約須知</div>
			  <div class="fs_alert_txt">
			  	1. 請提前進行場地預約程序，以確保場地的可用性。可通過網站、手機應用程式進行預約。
				<br>
				2. 請確定預約的具體時間，包括開始和結束時間。請遵守預約時間，以免影響其他使用者。
				<br>
				3. 請明確了解預約場地的使用範圍，包括可使用的設施、場地區域和相關限制。
				<br>
				4. 如有特殊設備或特殊需求，請在預約時提前通知，以確保場地提供合適的支援。
				<br>
				5. 請遵守場地的安全守則，包括緊急程序和應急設備的使用。確保使用期間能夠保持安全。
				<br>
				6. 使用結束後，請確保將場地保持整潔，按時歸還。了解場地管理方的清潔政策。
				<br>
				7. 明確預約方和場地管理方之間的責任歸屬，包括任何損壞或意外事件的處理。
			  </div>
			  <div class="btn_s" id="alert_ok">已詳細閱讀</div>
			</div>
		</div>
		
		<div id="fs_alert2">
			<div class="fs_alert_bg"></div>
			<div class="fs_alert_show">
			  <div class="fs_alert_title">請選擇預約日期</div>
			  <div class="fs_alert_txt">
			  </div>
			  <div class="btn_s" id="alert_ok2">確定</div>
			</div>
		</div>
		

		<main class="main">
			<div class="container">
				<nav aria-label="breadcrumb" class="breadcrumb-nav">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court/court_main.jsp"><i class="icon-home"></i></a></li>
						<li class="breadcrumb-item">球場名稱</li>
					</ol>
				</nav>
				
				<!-- 功能按鈕 -->
				<div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
					<button class="btn btn-primary btn-rounded btn-md"><a href="#"></a>地圖搜尋</button>
					<a href="${pageContext.request.contextPath}/court/court_savelist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的收藏</button></a>
					<a href="${pageContext.request.contextPath}/court/court_orderlist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的預約</button></a>
				</div>


				<div class="product-single-container product-single-default">
					<div class="row">
						<div class="col-lg-5 col-md-6 product-single-gallery" style="text-align: center;">
							<div class="product-slider-container">
								<!-- 圖片 -->
								<div class="product-single-carousel owl-carousel owl-theme show-nav-hover">
									<c:forEach var="img" items="${courtImgBase64}">
									<div class="product-item">
										<img class="product-single-image"
											src="data:image/jpg;base64,${img}"
											data-zoom-image="data:image/jpg;base64,${img}" width="468"
											height="468" alt="圖片" />
									</div>
									</c:forEach>
								</div>
								
								<!-- End .product-single-carousel -->
								<span class="prod-full-screen">
									<i class="icon-plus"></i>
								</span>
								
							</div>

							<div class="prod-thumbnail owl-dots">
								<c:forEach var="img" items="${courtImgBase64}">
								<div class="owl-dot">
									<img src="data:image/jpg;base64,${img}" width="110" height="110"
										alt="圖片" />
								</div>
								</c:forEach>
							</div>
						</div><!-- End .product-single-gallery -->

						<div id="hiddenDivForCourt" style="display: none;">${getCourtPage.courtNo}</div>	<!-- 暫放場地編號給前端 --> 
						<div id="hiddenDivForMember" style="display: none;">${mbrNo}</div>		<!-- 暫放會員編號給前端 -->
						<div class="col-lg-7 col-md-6 product-single-details">
							<h1 class="product-title">${getCourtPage.courtName}</h1>

							<hr class="short-divider">

							<div class="price-box">
								<span class="new-price">$ ${getCourtPage.courtPrice} / hr</span>
							</div><!-- End .price-box -->

							<div class="product-desc">
								<p>
									${getCourtPage.courtText}
								</p>
							</div><!-- End .product-desc -->
							<hr class="divider mb-0 mt-0">
							<br>
							<ul class="single-info-list">
								<li>
									類型: <strong><a class="product-category">${getCourtTypePage.courtType}</a></strong>
								</li>
								<li>
									人數限制: <strong><a class="product-category">${getCourtPage.courtPplLimit}</a></strong>
								</li>
								<li>
									地址: <strong><a class="product-category">${getCourtPage.courtAddress}</a></strong>
								</li>
							</ul>
							
							<hr class="divider mb-0 mt-0">
							
							
							<div style="display: flex; flex-direction: row; align-items: center;">
								<div style="margin: 10px 10px 10px 0;">
								<label for="f_date1">請選擇日期：</label>
									<input name="chooseDate" id="f_date1" type="text" autocomplete="off">
								</div>
							<div id="unavailable">預約已滿!</div>
							</div>
		
                             <div class="form-row">
							    <div class="form-group col-md-6">
							        <label for="timeSlot1">請選擇起始時間：</label>
							        <select id="timeSlot1" class="form-control-sm scrollable-select" name="startTime">
							        </select>
							    </div>
							
							    <div class="form-group col-md-6" id="timeSlot2Container" style="display:none;">
							        <label for="timeSlot2">請選擇結束時間：</label>
							        <select id="timeSlot2" class="form-control-sm scrollable-select" name="endTime">
							        </select>
							    </div>
							</div>
							
							<div class="product-filters-container custom-product-filters">
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
								<p id="totalPrice">總金額：</p>
								<a href="#" id="reservationLink" class="btn btn-dark disabled add-cart icon-shopping-cart mr-2" title="Add to Cart">
								預約
								</a>
							</div><!-- End .product-action -->
							
							

							<hr class="divider mb-0 mt-0">

							<div class="product-single-share mb-3">
<!-- 								<label class="sr-only">Share:</label> -->

<!-- 								<div class="social-icons mr-2"> -->
<!-- 									<a href="#" class="social-icon social-facebook icon-facebook" target="_blank" -->
<!-- 										title="Facebook"></a> -->
<!-- 										facebook sharing -->
<!-- 									<div class="fb-share-button"  -->
<%-- 										data-href="<%=request.getRequestURL()%>"  --%>
<!-- 										data-layout="button_count"> -->
<!-- 									</div> -->
<!-- 									<a href="#" class="social-icon social-twitter icon-twitter" target="_blank" -->
<!-- 										title="Twitter"></a> -->
<!-- 									<a href="#" class="social-icon social-linkedin fab fa-linkedin-in" target="_blank" -->
<!-- 										title="Linkedin"></a> -->
<!-- 									<a href="#" class="social-icon social-gplus fab fa-google-plus-g" target="_blank" -->
<!-- 										title="Google +"></a> -->
<!-- 									<a href="#" class="social-icon social-mail icon-mail-alt" target="_blank" -->
<!-- 										title="Mail"></a> -->
<!-- 								</div>End .social-icons -->

								<a href="" class="btn-icon-wish add-wishlist" title="Go to Wishlist"><i
										class="icon-wishlist-2"></i><span>加入收藏</span></a>
									
							</div><!-- End .product single-share -->
						</div><!-- End .product-single-details -->
					</div><!-- End .row -->
				</div><!-- End .product-single-container -->


			</div><!-- End .container -->
		</main><!-- End .main -->

		<footer class="footer bg-dark"></footer><!-- End .footer -->
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
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	
	

	<!-- Main JS File -->
	<script src="/ASAP/assets/js/main.min.js"></script>

	<!-- header and footer template -->
	<script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
		
		$(window).on("load", function(){
			// datetimepicker 
			var somedate1 = new Date('<%=closedDate%>');
	        $.datetimepicker.setLocale('zh');
	        $('#f_date1').datetimepicker({
	 	       theme: '',              //theme: 'dark',
		       timepicker:false,       //timepicker:true,
		       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		       format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '', 				// value:   new Date(),
			   beforeShowDay: function(date) {
	           	  if (  date.getYear() <  somedate1.getYear() || 
	    		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	    		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	                 ) {
	                      return [false, ""]
	                 }
	                 return [true, ""];
	           }
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	           //startDate:	            '2017/07/10',  // 起始日
	           //minDate:               '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	        });
	        
			$("#lookup").on("click", function(){
				$("#fs_alert").css("display", "block");
			});
			
			$("#alert_ok").on("click", function(){
				$("#fs_alert").css("display", "none");
				$("#reservationLink").removeClass('disabled');
			});
			
			// 待新增：Session 查找會員進來頁面自動判斷場地是否有在 savelist 中，依此調整 save icon
			$.ajax({
	            url: 'courtSaveListAjax.do', // Servlet URL
	            type: 'POST',
	            contentType: 'application/json',
	            data: JSON.stringify({
	                action: "check",
	                mbrNo: $("#hiddenDivForMember").html(),	
	                courtNo: $("#hiddenDivForCourt").html()
	            }),
	            success: function(response) {
	            	var i = $(".btn-icon-wish");
	                if(response == "isOne"){
	                	i.addClass("added-wishlist");
			            "" !== i.find("span").text() && i.find("span").text("已加入收藏！");
			            i.attr("title", "Go to Wishlist");
	                }
	            },
	            error: function() {
	                console.log('Error in AJAX request');
	            }
	        });
			
			
			// 收藏按鈕
			$("body").on("click", ".btn-icon-wish", function(e){
			    e.preventDefault();
			    var i = $(this);

			    if (i.hasClass("added-wishlist")) {
			        i.removeClass("added-wishlist");
			        i.find("span").text("加入收藏");
			        e.stopImmediatePropagation();
			        
			        // 移除收藏req
			        $.ajax({
			            url: 'courtSaveListAjax.do', 
			            type: 'POST',
			            contentType: 'application/json',
			            data: JSON.stringify({
			                action: "delete",
			                mbrNo: $("#hiddenDivForMember").html(),	
			                courtNo: $("#hiddenDivForCourt").html()
			            }),
			            success: function(response) {
			                console.log('Server response:', response);
			            },
			            error: function() {
			                console.log('Error in AJAX request');
			            }
			        });
			        
			    } else {
			        i.addClass("load-more-overlay loading");
			        setTimeout((function() {
			            i.removeClass("load-more-overlay loading");
			            i.addClass("added-wishlist");
			            "" !== i.find("span").text() && i.find("span").text("已加入收藏！");
			            i.attr("title", "Go to Wishlist");
			            $(".wishlist-popup").removeClass("active");
			        }), 1e3);

			     	// 加入收藏req
			        $.ajax({
			            url: 'courtSaveListAjax.do', 
			            type: 'POST',
			            contentType: 'application/json',
			            data: JSON.stringify({
			                action: "add",
			                mbrNo: $("#hiddenDivForMember").html(),	
			                courtNo: $("#hiddenDivForCourt").html()
			            }),
			            success: function(response) {
			                console.log('Server response:', response);
			            },
			            error: function() {
			                console.log('Error in AJAX request');
			            }
			        });
			    }
			});
			
			// 預約進入確認預約頁面
			$("#reservationLink").on('click', function (e) {
			    if ($(this).hasClass('disabled')) {
			        e.preventDefault();
			    } else {
			        var chooseDate = $("#f_date1").val();
			        var startTime = $("#timeSlot1").val();
			        var endTime = $("#timeSlot2").val();
			        var courtNo = ${getCourtPage.courtNo};
			        var totalPriceText = $("#totalPrice").text();
			        
			        if (!startTime || !endTime || totalPriceText == "總金額：") {
			        	showCustomAlert();
			            return;
			        }
			        
			        var totalPrice = parseInt((totalPriceText.match(/\d+/) || [])[0], 10);

			        
			        var url = 'court_checkout.jsp?chooseDate=' + encodeURIComponent(chooseDate) 
			        		+ '&startTime=' + encodeURIComponent(startTime) 
			        		+ '&endTime=' + encodeURIComponent(endTime) 
			        		+ '&courtNo=' + encodeURIComponent(courtNo)
			        		+ '&totalPrice=' + encodeURIComponent(totalPrice);

			        // 補一個發送鎖定預約時間到 Redis
			        
			        
			        window.location.href = url;
			    }
			});
			        
	        function showCustomAlert() {
	            $("#fs_alert2 .fs_alert_txt");
	            $("#fs_alert2").fadeIn();
	        }

	        
	        $("#alert_ok2").on('click', function () {
	            $("#fs_alert2").fadeOut();
	        });
			
			// 預約日期、起始結束時間關聯選單（選完日期點擊空白處發兩次req還沒解決）
			var cList = [];
			var unavailable = $("#unavailable");	
			unavailable.hide();	//
			$("#f_date1").on("change", function (e) {
				var selectedDate = $(this).val();
				console.log(selectedDate);
				
				 $.ajax({
			        url: 'courtClosedTimeAjax.do', 
			        method: 'GET',
			        dataType: 'json',
			        data: {
			            courtNo: $("#hiddenDivForCourt").html(),
			            getDate: selectedDate
			        },
			        success: function (data) {
			            cList = []; 
			            
			            for(let i = 0; i < data.length; i++){
			            	cList.push(data[i]["courtClosedTime"]); 	
			            }
			            
			            populateTimeSlot1(cList);
			            updateUnavailableLabel(); 
			        },
			        error: function (error) {
			            console.error('Error fetching closed times:', error);
			        }
			    });
			});
			
			// 生成第一個 select-option
			function populateTimeSlot1(cList) {
			    var timeSlot1 = $("#timeSlot1");
			    
			    timeSlot1.empty();
			    
			   
			    for (var i = 8; i <= 17; i++) {
			        if (cList.indexOf(i) === -1) {
			            timeSlot1.append('<option value="' + i + '">' + i + '</option>');
			        }
			    }
			    
			    timeSlot1.trigger("change");
			    updateUnavailableLabel();
			    
			}
			
			$(document).on("change", "#timeSlot1", function () {
			    var selectedValue = parseInt($(this).val());
			    updateEndTimeOptions(selectedValue, cList);
			    updateUnavailableLabel(); 
			});
			
			
			function updateEndTimeOptions(selectedValue, cList) {
				var timeSlot2Container = $("#timeSlot2Container");
    			var timeSlot2 = $("#timeSlot2");
    			
    			timeSlot2Container.show(); 
				
			
			    var setEnd = 0;
			
			    for (var i = 0; i < cList.length; i++) {
			        if (selectedValue < cList[i]) {
			            setEnd = cList[i];
			            break;
			        }
			    }
			
			    if (setEnd === 0) {
			        setEnd = 18;
			    }
			    
			  
			    
			 	// 生成第二個 select-option
			    if ($("#timeSlot1").val() !== ''){
			    	timeSlot2.prop("disabled", false).empty();	
			    	 
			    	for (var j = selectedValue + 1; j <= setEnd; j++) {
				        timeSlot2.append('<option value="' + j + '">' + j + '</option>');
				    }
			    	

			    }
			    
			    timeSlot2.trigger("change");
			    updateUnavailableLabel();	
				
			}
			
			// 已滿顯示
			function updateUnavailableLabel() {
			    if ($("#f_date1").val() && cList.length === 10 && $("#timeSlot1 option").length === 0) {
			        unavailable.show();
			    } else {
			        unavailable.hide();
			    }
			}
		    
		    
		    // 計算總金額
		    var courtPrice =${getCourtPage.courtPrice};
		    
		    $("#timeSlot1, #timeSlot2").on("change", function() {
	            calculatePrice();
	        });
		    
		    function calculatePrice() {
		        var startTime = parseInt($("#timeSlot1").val());
		        var endTime = parseInt($("#timeSlot2").val());


		        if (!isNaN(startTime) && !isNaN(endTime) && !isNaN(courtPrice)) {
		            var hours = endTime - startTime;
		            var totalPrice = hours * courtPrice;
		            console.log(totalPrice);
		            $("#totalPrice").text("總金額： $ " + Math.floor(totalPrice));
		        }
		    }

		})
	
        
	</script>
</body>

	
	<script>
		 	
	        
	   
	        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------
	
	        //      1.以下為某一天之前的日期無法選擇
<%-- 	             var somedate1 = new Date('<%=closedDate%>'); --%>
// 	             $('#f_date1').datetimepicker({
// 	                 beforeShowDay: function(date) {
// 	               	  if (  date.getYear() <  somedate1.getYear() || 
// 	        		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
// 	        		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
// 	                     ) {
// 	                          return [false, ""]
// 	                     }
// 	                     return [true, ""];
// 	             }});
	
	        
	        //      2.以下為某一天之後的日期無法選擇
	        //      var somedate2 = new Date('2017-06-15');
	        //      $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() >  somedate2.getYear() || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	
	
	        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
	        //      var somedate1 = new Date('2017-06-15');
	        //      var somedate2 = new Date('2017-06-25');
			//	     $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() <  somedate1.getYear() || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	        //		             ||
	        //		            date.getYear() >  somedate2.getYear() || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	        
	</script>

</html>