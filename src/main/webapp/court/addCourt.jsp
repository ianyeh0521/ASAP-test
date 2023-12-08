<%@page import="com.asap.court.entity.CourtTypeVO"%>
<%@page import="com.asap.court.service.CourtTypeService"%>
<%@page import="com.asap.court.service.SiteService"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.entity.SiteVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>


<%
	CourtVO courtVO = (CourtVO) request.getAttribute("courtVO");
	
	SiteService siteSvc = new SiteService();
	List<SiteVO> list1 = siteSvc.getAllSites();
	pageContext.setAttribute("sitelist", list1);
	
	CourtTypeService courtTypeSvc = new CourtTypeService();
	List<CourtTypeVO> list2 = courtTypeSvc.getAllTypes();
	pageContext.setAttribute("typelist", list2);
%>



<html>

<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>���a��x-�s�W</title>



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
								<li class="breadcrumb-item"><a href="#">���a�޲z</a></li>
								<li class="breadcrumb-item"><a href="listAllCourts_datatable_Ajax.html">�Ҧ����a</a></li>
								<li class="breadcrumb-item active" aria-current="page">�s�W</li>
							</ol>
						</div>
					</nav>
					<h1>�s�W</h1>
				</div>
			</div>
			
			<%-- ���~��C --%>
			<c:if test="${not empty errorMsgs}">
				<font style="color:red">�Эץ��H�U���~:</font>
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color:red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>

			<div class="container account-container custom-account-container">
				<div class="row">
					<div class="col-lg-9 order-lg-last order-1 tab-content">
						<!-- modify HERE -->
						<div class="" id="shipping" role="tabpanel">
							<div class="address account-content mt-0 pt-2">
								<h4 class="title mb-3"></h4>

								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/court/court.do" class="mb-2" enctype="multipart/form-data">
									
									<div class="form-group">
										<label>�W�� </label> <input type="text" class="form-control"
											name="name" value="">
									</div>

									<div class="select-custom">
										<label>����<span class="required">*</span></label> 
										<select name="type" class="form-control">
											<!-- 											<option value="" selected="selected">--�п�ܳ��a����--</option> -->
											<c:forEach var="courtTypeVO" items="${typelist}">
												<option value="${courtTypeVO.courtTypeNo}">${courtTypeVO.courtType}
											</c:forEach>
										</select>
									</div>


									<div class="select-custom">
										<label>�Ǥ�<span></span></label> 
										<select name="indoor" class="form-control">
											<option value="true" selected="selected">�O
											<option value="false">�_
										</select>
									</div>

									<div class="form-group">
										<label>�a�} </label> <input type="text" class="form-control" onblur="ShowLngLati()" id="getAddress"
											name="address" value="">
									</div>

									<div class="select-custom">
										<label>�ϰ�<span></span></label> 
										<select name="site" class="form-control">
											<!-- 											<option value="" selected="selected">--�п��F�ϰ�--</option> -->
											<c:forEach var="siteVO" items="${sitelist}">
												<option value="${siteVO.siteNo}">${siteVO.regions}
											</c:forEach>
										</select>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>�g��<span></span></label> <input type="text" id="getLng"
													class="form-control" name="lng"
													value="" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>�n��<span></span></label> <input type="text" id="getLati"
													class="form-control" name="lati"
													value=""/>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>�H�ƭ���<span></span></label> <input type="text"
													class="form-control" name="pplLimit"
													value=""/>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>����<span></span></label> <input type="text"
													class="form-control" name="price"
													value=""/>
											</div>
										</div>
									</div>

									<div class="form-group">
										<label>���Ф���<span></span></label>
										<textarea cols="30" rows="1" id="contact-message"
											class="form-control" name="courtText" style="height: 30px; text-align: left;"
											onblur="courtTextAlert()"></textarea>
												
										
									</div>

									<div class="select-custom">
										<label>���A<span></span></label> <select name="stat"
											class="form-control">
											<option value="true" selected="selected">��B��</option>
											<option value="false">�Ȱ���B</option>
										</select>
									</div>
									
									<div>
										<label for="upFiles1">�Ӥ�1:</label>
										<input id ="upFiles1" name="upFiles1" type="file" onclick="previewImage()" multiple="multiple" onchange="hideContent('upFiles1.errors');" />
										<div class="blob_holder"></div>
									</div>
									
									<div>
										<label for="upFiles2">�Ӥ�2:</label>
										<input id ="upFiles2" name="upFiles2" type="file" onclick="previewImage()" multiple="multiple" onchange="hideContent('upFiles2.errors');" />
										<div class="blob_holder"></div>
									</div>
									
									<div>
										<label for="upFiles3">�Ӥ�3:</label>
										<input id ="upFiles3" name="upFiles3" type="file" onclick="previewImage()" multiple="multiple" onchange="hideContent('upFiles3.errors');" />
										<div class="blob_holder"></div>
									</div>
									
									<div>
										<label for="upFiles4">�Ӥ�4:</label>
										<input id ="upFiles4" name="upFiles4" type="file" onclick="previewImage()" multiple="multiple" onchange="hideContent('upFiles4.errors');" />
										<div class="blob_holder"></div>
									</div>

									<div class="form-footer mb-0">
											<div class="form-footer-right">
											<input type="hidden" name="action" value="add">
											<input type="submit" class="btn btn-dark py-4" value="�s�W">
										</div>
									</div>
								</FORM>
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
	            
            var userData = "https://maps.googleapis.com/maps/api/geocode/json?address=" + $('#getAddress').val() +"&key=AIzaSyAnAshx89XCdT3mcu8Aru0-uD7tBTH9cUs";
            console.log($('#getAddress').val());
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
        }
		 
		function courtTextAlert(){
			if($("#contact-message").val().length > 255){
				alert("���Ф��o�W�L255�Ӧr!");
			}
			
		}
	</script>
</body>

</html>