<%@page import="com.asap.court.entity.CourtImgVO"%>
<%@page import="com.asap.court.service.CourtImgService"%>
<%@page import="com.asap.court.service.CourtImgService_interface"%>
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
	CourtVO courtVO = (CourtVO) request.getAttribute("courtVO");
	Integer pplLimit = 0;
	if(courtVO.getCourtPplLimit() == null){
		pplLimit = 0;
	}else{
		pplLimit = Integer.valueOf(courtVO.getCourtPplLimit());
	}
	
	SiteService siteSvc = new SiteService();
	List<SiteVO> list1 = siteSvc.getAllSites();
	pageContext.setAttribute("sitelist", list1);
	
	CourtTypeService courtTypeSvc = new CourtTypeService();
	List<CourtTypeVO> list2 = courtTypeSvc.getAllTypes();
	pageContext.setAttribute("typelist", list2);
	
	CourtImgService_interface courtImgSvc = new CourtImgService();
	List<CourtImgVO> courtImgList = courtImgSvc.findByCourtNo(courtVO.getCourtNo());
	List<String> imgBase64 = new ArrayList<>(); 
	for(CourtImgVO courtImgVO:courtImgList){
		imgBase64.add(Base64.getEncoder().encodeToString(courtImgVO.getCourtImg()));
	}
	
	int i = 1;
	String pic = "pic";
	for(String ele: imgBase64){
		pageContext.setAttribute(pic+i , ele);
		i++;
	}
	
%>



<html>

<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>場地後台-修改</title>



<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="/ASAP/assets/images/icons/favicon.png">


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
	
<style>
    .outer-container {
        border: 1px solid rgba(0, 0, 0, 0.1); /* Border color with some transparency */
        border-radius: 10px; /* Border-radius for rounded corners */
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
        padding: 20px; /* Optional: Add padding to the outer container */
        margin: 20px; /* Optional: Add margin to create space around the container */
    }

</style>	
</head>

<body>
	<div class="page-wrapper">
		<header class="header"></header>
		<!-- End .header -->

		<main class="main">
		
			<div class="page-header">
				<div class="container d-flex flex-column align-items-center">
					<nav aria-label="breadcrumb" class="breadcrumb-nav">
						<div class="container">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court/court_index.jsp">場地管理</a></li>
								<li class="breadcrumb-item"><a href="/ASAP/court/listAllCourt.jsp">所有場地</a></li>
								<li class="breadcrumb-item active" aria-current="page">修改</li>
							</ol>
						</div>
					</nav>
					<h1>修改</h1>
				</div>
			</div>
			
			 <div class="container" style="margin-top: 20px; margin-bottom: 10px !important; text-align: left !important;">
				<a href="/ASAP/court/listAllCourts_datatable_Ajax.html">
				<button class="btn btn-primary btn-rounded btn-md">返回所有場地</button>
				</a>
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
							<div class="address account-content mt-0 pt-2" style="margin-bottom: 0px">
								<h4 class="title mb-3"></h4>

								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/court/court.do" class="mb-2" enctype="multipart/form-data">
									<div class="form-group" style="dispaly:none; margin-bottom:0px !important">
										<label></label> <input type="hidden" class="form-control"
											name="courtNo" value="<%=courtVO.getCourtNo()%>">
									</div>
									
									<div class="form-group">
										<label>名稱 </label> <input type="text" class="form-control"
											name="name" value="<%=courtVO.getCourtName()%>" style="border-radius: 10px;">
									</div>

									<div class="select-custom">
										<label>類型<span class="required">*</span></label> 
										<select name="type" class="form-control" style="border-radius: 10px;">
											<c:forEach var="courtTypeVO" items="${typelist}">
												<option value="${courtTypeVO.courtTypeNo}"
												 ${(courtVO.courtTypeVO.courtTypeNo==courtTypeVO.courtTypeNo)?'selected':'' }>${courtTypeVO.courtType}
											</c:forEach>
										</select>
									</div>


									<div class="select-custom">
										<label>室內<span></span></label> 
										<select name="indoor" class="form-control" style="border-radius: 10px;">
											<option value="true" selected="selected">是
											<option value="false">否
										</select>
									</div>

									<div class="form-group">
										<label>地址 </label> <input type="text" class="form-control" onblur="ShowLngLati()" id="getAddress"
											name="address" value="<%=courtVO.getCourtAddress()%>" style="border-radius: 10px;">
									</div>

									<div class="select-custom">
										<label>區域<span></span></label> 
										<select name="site" class="form-control" style="border-radius: 10px;">
											<c:forEach var="siteVO" items="${sitelist}">
												<option value="${siteVO.siteNo}"
													${(courtVO.siteVO.siteNo==siteVO.siteNo)?'selected':'' }>${siteVO.regions}
											</c:forEach>
										</select>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>經度<span></span></label> <input type="text" id="getLng"
													class="form-control" name="lng"
													value="<%=courtVO.getCourtLong()%>" style="border-radius: 10px;"/>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>緯度<span></span></label> <input type="text" id="getLati"
													class="form-control" name="lati"
													value="<%=courtVO.getCourtLat()%>" style="border-radius: 10px;"/>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>人數限制<span></span></label> <input type="text"
													class="form-control" name="pplLimit"
													value="<%=pplLimit%>" style="border-radius: 10px;"/>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>價格<span></span></label> <input type="text"
													class="form-control" name="price"
													value="<%=courtVO.getCourtPrice()%>" style="border-radius: 10px;"/>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label>介紹內文<span></span></label>
										<textarea cols="30" rows="1" id="contact-message"
											class="form-control" name="courtText" style="height: 30px; text-align: left; border-radius: 10px;" 
											onblur="courtTextAlert()"><%=courtVO.getCourtText()%></textarea>
												
										
									</div>

									<div class="select-custom">
										<label>狀態<span></span></label> <select name="stat"
											class="form-control" style="border-radius: 10px;">
											<option value="true" selected="selected">營運中</option>
											<option value="false">暫停營運</option>
										</select>
									</div>
									
	

									<div class="form-footer mb-0">
										<div class="form-footer-right">
											<input type="hidden" name="action" value="update"> 
											<input type="hidden" name="courtNo" value="<%=courtVO.getCourtNo()%>">
											<input type="submit" class="btn btn-dark py-4" style="border-radius: 10px;" value="完成修改">
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

	<footer class="footer bg-dark"></footer>
	<!-- End .footer -->
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
	<script src="/ASAP/assets/js/jquery.min.js"></script>
	<script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
	<script src="/ASAP/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="/ASAP/assets/js/main.min.js"></script>

	<!-- header and footer template -->
	<script>
		$("header").load("backstage_header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
		
		 function ShowLngLati(){
	            
			 if($('#getAddress').val()!=''){  
			 		var userData = "https://maps.googleapis.com/maps/api/geocode/json?address=" + $('#getAddress').val() +"&key=AIzaSyAnAshx89XCdT3mcu8Aru0-uD7tBTH9cUs";
	            	console.log($('#getAddress').val());
	            
	            	// 自動抓經緯度 
	            	$.ajax({
	 	                type:'GET',
	 	                url: userData,
	 	                success: function(data){
	 	                    let lng = data.results[0].geometry.location.lng;
	 	                    if(lng.length > 12){
	 	                        lng = lng.substring(0, 13)
	 	                    }
	 	                    let lati = data.results[0].geometry.location.lat;
	 	                    if(lati.length > 11){
	 	                        lati = lati.substring(0, 12)
	 	                    }
	 	                    $('#getLng').val(lng);
	 	                    $('#getLati').val(lati);
	 	                    
	 	                }
	 	            })
	 	            
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
		
	</script>
</body>

</html>