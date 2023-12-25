<%@page import="com.asap.coach.entity.CoachVO"%>
<%@page import="com.asap.coach.service.CoachService"%>
<%@page import="com.asap.coach.service.CoachService_interface"%>
<%@page import="com.asap.group.entity.SportTypeVO"%>
<%@page import="com.asap.group.service.SportTypeService"%>
<%@page import="com.asap.group.service.SportTypeService_interface"%>
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

	//datetime picker
	java.sql.Date closedDate = null;
	try {
		 closedDate = java.sql.Date.valueOf(request.getParameter("closedDate").trim());
	} catch (Exception e) {
		 closedDate = new java.sql.Date(System.currentTimeMillis());
	}
	
	

	SportTypeService sportTypeSvc = new SportTypeService_interface();
	List<SportTypeVO> sportTypeList = sportTypeSvc.getALL();
	pageContext.setAttribute("sportTypeList",sportTypeList);
	
	CoachService_interface coachSvc = new CoachService();
	List<CoachVO> coachList = coachSvc.getAll();
	pageContext.setAttribute("coachList", coachList);
	
	// 教練編號
	/*
	String memberNo = session.getAttribute("memberVO").getMbrNo();
	pageContext.setAttribute("memberNo",memberNo);
	*/
	
	String coachNo = "C1206202300001";
	pageContext.setAttribute("coachNo",coachNo);
%>



<html>

<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>教練課程上架</title>



<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="assets/images/icons/favicon.png">


<script>
	WebFontConfig = {
		google : {
			families : [ 'Open+Sans:300,400,600,700,800',
					'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ]
		}
	};
	(function(d) {
		var wf = d.createElement('script'), s = d.scripts[0];
		wf.src = '/ASAP/assets/js/webfont.js';
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="/ASAP/assets/css/bootstrap.min.css">

<!-- Main CSS File -->
<link rel="stylesheet" href="/ASAP/assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="/ASAP/assets/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/ASAP/assets/vendor/simple-line-icons/css/simple-line-icons.min.css">
	
<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link   rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/court/datetimepicker/jquery.datetimepicker.css" />
<script src="${pageContext.request.contextPath}/court/datetimepicker/jquery.js"></script>
<script src="${pageContext.request.contextPath}/court/datetimepicker/jquery.datetimepicker.full.js"></script>
<style>
    .outer-container {
        border: 1px solid rgba(0, 0, 0, 0.1); 
        border-radius: 10px; 
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
        padding: 20px; 
        margin: 20px; 
    }
    
    .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
	 }
	 
	 .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	          height: 151px;   /* height:  151px; */
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
		
			<div class="page-header">
				<div class="container d-flex flex-column align-items-center">
					<nav aria-label="breadcrumb" class="breadcrumb-nav">
						<div class="container">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="#">教練主頁</a></li>
								<li class="breadcrumb-item active" aria-current="page">課程上架</li>
							</ol>
						</div>
					</nav>
					<h1>課程上架</h1>
				</div>
			</div>
			
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color:red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>


			
			<div class="container account-container custom-account-container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 order-lg-last order-1 tab-content">
						<!-- modify HERE -->
						<div class="outer-container">
						<div class="" id="shipping" role="tabpanel">
							<div class="address account-content mt-0 pt-2">
								

								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/course/course.do" class="mb-2" enctype="multipart/form-data">
									
									
									<div class="form-group">
										<label>課程名稱 </label><div style="color:red">${nameError}</div> <input type="text" class="form-control"
											name="name" value=""  style="border-radius: 10px;">
									</div>

									<div class="select-custom">
										<label>運動種類<span class="required"></span></label> 
										<select name="type" class="form-control" style="border-radius: 10px;">
											<c:forEach var="sportTypeVO" items="${sportTypeList}">
												<option value="${sportTypeVO.sportTypeNo}">${sportTypeVO.sportTypeName}
											</c:forEach>
										</select>
									</div>

									
									<div class="form-group">
										<label>上課地址 </label><div style="color:red">${addressError}</div> <input type="text" class="form-control" style="border-radius: 10px;" onblur="ShowLngLati()" id="getAddress"
											name="address" value="">
									</div>

										
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>人數限制<span></span></label> <div style="color:red">${pplLimitError}</div><input type="text"
													class="form-control" style="border-radius: 10px;" name="pplLimit"
													value=""/>
											</div>
										</div>
										
										<div class="col-md-6">
											<div class="form-group">
												<label>課程價格<span></span></label> <div style="color:red">${priceError}</div><input type="text"
													class="form-control" style="border-radius: 10px;" name="price"
													value=""/>
											</div>
										</div>
									</div>
									
									<label>課程時間<span></span></label>
									<div style="color:red">${timeError}</div>
									<div class="row">
										<div class="col-md-6">
											<!--起始時間選擇-->
											<div class="select-custom" style="display:flex;justify-content:center;align-items:center">
												<input name="start" id="f_date1" type="text" onkeydown="return false" style="width: 100%; box-sizing: border-box;" autocomplete="off">
											</div>
										</div>
										
										<div class="col-md-6">
											<!--結束時間選擇-->
											<div class="select-custom" style="display:flex;justify-content:center;align-items:center">
												<input name="end" id="f_date2" type="text" onkeydown="return false" style="width: 100%; box-sizing: border-box;" autocomplete="off">
											</div>
										</div>
									</div>

									
									<div class="form-group">
										<label>課程介紹內文<span></span></label><div style="color:red">${textError}</div>
										<textarea cols="30" rows="1" id="contact-message"
											class="form-control" name="courseText" style="height: 30px; text-align: left; border-radius: 10px;"
											onblur="courtTextAlert()"></textarea>
									</div>

<!-- 									<div class="select-custom"> -->
<!-- 										<label>課程狀態<span></span></label> <select name="stat" -->
<!-- 											class="form-control" style="border-radius: 10px;"> -->
<!-- 											<option value="true" selected="selected">開課中</option> -->
<!-- 											<option value="false">已額滿</option> -->
<!-- 										</select> -->
<!-- 									</div> -->

										
									<div class="mb-3">
									    <div class="row">
									        <div class="col-md-3">
									            <label for="upFiles1" class="form-label">照片:</label><div style="color:red">${imgError}</div>
									            <input id="upFiles1" name="upFiles1" class="form-control" style="border-radius: 10px;" type="file" 
									            	onchange="previewImage('upFiles1', 'blob_holder1')">
									            <div class="blob_holder" id="blob_holder1"></div>
									        </div>
									    </div>
									</div>
								
									<div class="form-footer mb-0">
											<div class="form-footer-right">
											<input type="hidden" name="action" value="add">
											<input type="hidden" name="coachNo" value="${coachNo}">
											<input type="submit" class="btn btn-dark py-4" value="新增" style="border-radius: 10px;">
										</div>
									</div>
								</FORM>
							</div>
						</div>
						</div>

					</div>
				</div>
				<!-- End .tab-pane -->
			</div>
			<!-- End .tab-content -->
			

	<div class="mb-5"></div>
	<!-- margin -->
	</main>
	<!-- End .main -->

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

	<div class="mobile-menu-container"></div>
	<!-- End .mobile-menu-container -->

	<div class="sticky-navbar"></div>



	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->
<!-- 	<script src="/ASAP/assets/js/jquery.min.js"></script> -->
	<script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/ASAP/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="/ASAP/assets/js/main.min.js"></script>

	<!-- header and footer template -->
	<script>
// 		$("header").load("backstage_header.html");
// 		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
		
		 function ShowLngLati(){
	            
			 if($('#getAddress').val()!=''){
				 	var userData = "https://maps.googleapis.com/maps/api/geocode/json?address=" + $('#getAddress').val() +"&key=AIzaSyAnAshx89XCdT3mcu8Aru0-uD7tBTH9cUs";
		            console.log($('#getAddress').val());
		            
		            // 自動選擇地區
		            const inputAddress = document.getElementById('getAddress').value;

				    const selectElement = document.querySelector('select[name="site"]');
		 
				    for (let option of selectElement.options) {
				        if (inputAddress.includes(option.text)) {
				        	console.log(option.text)
				            option.selected = true;
				            break; 
				        }
				    } 
			 }
           
        }
		 
		function courtTextAlert(){
			if($("#contact-message").val().length > 255){
				alert("介紹不得超過255個字!");
			}
			
		}
		
	
		function previewImage(inputId, blobHolderId) {
		    const input = document.getElementById(inputId);
		    const blobHolder = document.getElementById(blobHolderId);

		    if (input.files && input.files[0]) {
		        const reader = new FileReader();

		        reader.onload = function (e) {
		            
		            const img = document.createElement('img');
		            img.src = e.target.result;
		            img.alt = '照片預覽';
		            img.style.maxWidth = '100%';

		            blobHolder.innerHTML = '';

		            blobHolder.appendChild(img);
		        };

		        reader.readAsDataURL(input.files[0]);
		    }
		}
		
		$(document).ready(function() {
			// 日期選擇
			var somedate1 = new Date('<%=closedDate%>');
			$.datetimepicker.setLocale('zh'); 
	        $('#f_date1').datetimepicker({
	           theme: '',          
	           timepicker: true,   //timepicker: false,
	           step: 60,            
		       format: 'Y-m-d H:i:s',
// 		       value: somedate1,
		       beforeShowDay: function(date) {
	           	  if (  date.getYear() <  somedate1.getYear() || 
	    		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	    		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	                 ) {
	                      return [false, ""]
	                 }
	                 return [true, ""];
	           }
	           //disabledDates:    ['2022/06/08','2022/06/09','2022/06/10'], // 去除特定不含
	           //startDate:	        '2022/07/10',  // 起始日
	           //minDate:           '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:           '+1970-01-01'  // 去除今日(不含)之後
	        });
	        $('#f_date1').attr("placeholder", "請選擇起始時間");
	        
	        $('#f_date2').datetimepicker({
	           theme: '',          
	           timepicker: true,   //timepicker: false,
	           step: 60,            
		       format: 'Y-m-d H:i:s',
// 		       value: somedate1,
		       beforeShowDay: function(date) {
	           	  if (  date.getYear() <  somedate1.getYear() || 
	    		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	    		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	                 ) {
	                      return [false, ""]
	                 }
	                 return [true, ""];
	           }
	           //disabledDates:    ['2022/06/08','2022/06/09','2022/06/10'], // 去除特定不含
	           //startDate:	        '2022/07/10',  // 起始日
	           //minDate:           '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:           '+1970-01-01'  // 去除今日(不含)之後
	        });
	        $('#f_date2').attr("placeholder", "請選擇結束時間");
	        
	        
	       
		})
	
		
		
	</script>
</body>

</html>