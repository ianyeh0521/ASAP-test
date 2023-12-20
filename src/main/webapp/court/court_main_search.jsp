<%@page import="com.asap.court.entity.CourtImgVO"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.util.*"%>
<%@ page import="java.util.Base64" %>
<%
	//datetime picker
	java.sql.Date closedDate = null;
	try {
		 closedDate = java.sql.Date.valueOf(request.getParameter("closedDate").trim());
	} catch (Exception e) {
		 closedDate = new java.sql.Date(System.currentTimeMillis());
	}
	
	// 會員編號
	/*
	String memberNo = session.getAttribute("memberVO").getMbrNo();
	pageContext.setAttribute("memberNo",memberNo);
	*/
	
	String mbrNo = "M1206202300001";
	pageContext.setAttribute("mbrNo",mbrNo);
	
%>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>尋找場地</title>

	<meta name="keywords" content="HTML5 Template" />
	<meta name="description" content="Porto - Bootstrap eCommerce Template">
	<meta name="author" content="SW-THEMES">

	<!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">

	<script>
		WebFontConfig = {
			google: { families: ['Open+Sans:400,600,700', 'Poppins:300,400,500,600,700'] }
		};
		(function (d) {
			var wf = d.createElement('script'), s = d.scripts[0];
			wf.src = '${pageContext.request.contextPath}/assets/js/webfont.js';
			wf.async = true;
			s.parentNode.insertBefore(wf, s);
		})(document);
	</script>

	<!-- Plugins CSS File -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="preload" href="${pageContext.request.contextPath}/assets/fonts/porto.woff2?64334846" as="font" type="font/ttf" crossorigin>
	<link rel="preload" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/webfonts/fa-solid-900.woff2" as="font" type="font/woff2"
		crossorigin>
	<link rel="preload" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/webfonts/fa-brands-400.woff2" as="font" type="font/woff2"
		crossorigin>

	<!-- Main CSS File -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">

	<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
	<link   rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/court/datetimepicker/jquery.datetimepicker.css" />
	<script src="${pageContext.request.contextPath}/court/datetimepicker/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/court/datetimepicker/jquery.datetimepicker.full.js"></script>
	
	<style>
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
			
		</header><!-- header -->

		<main class="main">

			<!-- 搜尋列 -->
			<div class="container" style="margin-top: 20px !important;">
				<div
					class="header-icon header-search header-search-inline header-search-category w-lg-max text-right mt-0">
					<a href="#" class="search-toggle" role="button"><i class="icon-search-3"></i></a>
					<form METHOD="post" ACTION="${pageContext.request.contextPath}/court/court.do">
						<div class="header-search-wrapper">
							
							<!-- 搜尋欄 -->
							<input type="search" class="form-control" name="searchCourt" placeholder="尋找場地...">
							
							<!--日期選擇-->
							<div class="select-custom" style="display:flex;justify-content:center;align-items:center">
								<input name="chooseDate" id="f_date1" type="text" onkeydown="return false" style="width: 100%; box-sizing: border-box;" autocomplete="off">
							</div>
							
							<!-- 場地種類選擇 -->
							<div class="select-custom">
								<select name="courtType">
									<option value="">選擇場地類型</option>
									<option value="1">- 游泳池</option>
									<option value="2">- 棒球場</option>
									<option value="3">- 網球場</option>
									<option value="4">- 手球場</option>
									<option value="5">- 籃球場</option>
									<option value="6">- 排球場</option>
									<option value="7">- 桌球場</option>
									<option value="8">- 羽球場</option>
								</select>
							</div><!-- End .select-custom -->
	
							<!-- 地點選擇 -->
							<div class="select-custom">
								<select name="regions">
									<option value="">選擇地區</option>
									<option value="1">- 松山區</option>
									<option value="2">- 信義區</option>
									<option value="3">- 大安區</option>
									<option value="4">- 中山區</option>
									<option value="5">- 中正區</option>
									<option value="6">- 大同區</option>
									<option value="7">- 萬華區</option>
									<option value="8">- 文山區</option>
									<option value="9">- 南港區</option>
									<option value="10">- 內湖區</option>
									<option value="11">- 士林區</option>
									<option value="12">- 北投區</option>
								</select>
							</div><!-- End .select-custom -->
							<button class="btn icon-magnifier p-0" type="submit" title="search"></button>	
							<input type="hidden" name="action" value="compositeQuery">
							
						</div><!-- End .header-search-wrapper -->
					</form>	
				</div>		
			</div><!-- End .container -->

			<!-- 功能按鈕 -->
			<div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
				<button class="btn btn-primary btn-rounded btn-md"><a href="#"></a>地圖搜尋</button>
				<a href="${pageContext.request.contextPath}/court/court_savelist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的收藏</button></a>
				<a href="${pageContext.request.contextPath}/court/court_orderlist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的預約</button></a>
			</div>
			
			
			<!-- main container -->
			<div class="container mt-6" style="margin-top: 0px !important;">
				<!-- 整個 row -->
				
				
				<div class="row mb-8" id="divTest">
					<!-- court list -->
					<div class="col-lg-9">
						<h4 class="text-uppercase heading-bottom-border mt-4" style="margin-top: 30px !important;">搜尋「 ${searchCon} 」的結果：</h4>
						
						<nav class="toolbox sticky-header" data-sticky-options="{'mobile': true}" style="margin-bottom: 0px;">
							<div class="toolbox-left"></div>
							<!-- End .toolbox-left -->

							<div class="toolbox-right">
								<a href="#" class="sidebar-toggle">
									<svg data-name="Layer 3" id="Layer_3" viewBox="0 0 32 32"
										xmlns="http://www.w3.org/2000/svg">
										<line x1="15" x2="26" y1="9" y2="9" class="cls-1"></line>
										<line x1="6" x2="9" y1="9" y2="9" class="cls-1"></line>
										<line x1="23" x2="26" y1="16" y2="16" class="cls-1"></line>
										<line x1="6" x2="17" y1="16" y2="16" class="cls-1"></line>
										<line x1="17" x2="26" y1="23" y2="23" class="cls-1"></line>
										<line x1="6" x2="11" y1="23" y2="23" class="cls-1"></line>
										<path
											d="M14.5,8.92A2.6,2.6,0,0,1,12,11.5,2.6,2.6,0,0,1,9.5,8.92a2.5,2.5,0,0,1,5,0Z"
											class="cls-2"></path>
										<path d="M22.5,15.92a2.5,2.5,0,1,1-5,0,2.5,2.5,0,0,1,5,0Z" class="cls-2"></path>
										<path d="M21,16a1,1,0,1,1-2,0,1,1,0,0,1,2,0Z" class="cls-3"></path>
										<path
											d="M16.5,22.92A2.6,2.6,0,0,1,14,25.5a2.6,2.6,0,0,1-2.5-2.58,2.5,2.5,0,0,1,5,0Z"
											class="cls-2"></path>
									</svg>
									<span>Filter</span>
								</a>
								
								<!-- 暫放會員編號給前端 -->
								<div id="hiddenDivForMember"  style="display: none;">${mbrNo}</div>	

								<div class="toolbox-item toolbox-sort">
									<label>排序方式:</label>

									<div class="select-custom">
										<select name="orderby" id="orderby"class="form-control" onchange="sortProducts()">
											<option value="" selected="selected">預設</option>
											<option value="priceHL">價格高➪低</option>
											<option value="priceLH">價格低➪高</option>
											<option value="distanceFN">距離遠➪近</option>
											<option value="distanceNF">距離近➪遠</option>
										</select>
									</div>
									<!-- End .select-custom -->


								</div>
								<!-- End .toolbox-item -->
							</div>
							<!-- End .toolbox-right -->
						</nav>
					
						<!-- 場地資訊 -->
						
						<div class="row" id="courtContainer">
							<c:forEach var="entry" items="${cobineMap}">
							<div class="col-sm-12 col-6 product-default left-details product-list mb-2">
								
								
								
								<figure>	
										<c:forEach var="entryValue" items="${entry.value}" begin="0" end="1">							
										<img src="data:image/jpeg;base64,${Base64.getEncoder().encodeToString(entryValue.courtImg)}"  width="250" height="250"
											alt="圖片" loading="lazy"/>	
										</c:forEach>						
								</figure>
								
								
								<div class="product-details" >
									<div class="category-list">
										<a href="category.html" class="type">${entry.key.courtTypeVO.courtType}</a>
									</div>
									<h3 class="product-title name" ><a href="/ASAP/court/court_page.jsp?courtNo=${entry.key.courtNo}" class="getCourtNo">${entry.key.courtName}</a></h3>
									<p class="product-description text" >${entry.key.courtText}</p>
									<div class="price-box">
										<span class="product-price price" >${entry.key.courtPrice} / hr</span>
									</div>
									<div class="product-action">
										<a href="/ASAP/court/court_page.jsp?courtNo=${entry.key.courtNo}" class="btn btn-primary btn-rounded btn-md getCourtNo">
											<span style="color: white;">我要預約</span>
										</a>					
									</div>
									<div style="display:none" class="long">${entry.key.courtLong}</div>
									<div style="display:none" class="lat">${entry.key.courtLat}</div>
								</div>
							</div>	
							</c:forEach>
						</div><!-- 場地資訊結束 -->
						
						<div class="pagination">
						    <c:forEach var="i" begin="1" end="${totalPages}">
						        <button onclick="changePage(${i})">${i}</button>
						    </c:forEach>
						</div>
						
						</div>
				
					
					<!-- 近期瀏覽 -->
					<div class="col-lg-3" id="productContainer">
						<h4 class="text-uppercase heading-bottom-border mt-6 mt-lg-4" style="margin-top: 30px !important;">近期瀏覽</h4>
						
					</div>

					
				</div>
			</div>

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

	<div class="sticky-navbar">	</div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>
	
	<!-- Plugins JS File -->
<%-- 	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/optional/isotope.pkgd.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<!-- header and footer template -->
	<script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
		$(document).ready(function() {
			var somedate1 = new Date('<%=closedDate%>');
			$.datetimepicker.setLocale('zh'); 
	        $('#f_date1').datetimepicker({
	           theme: '',          
	           timepicker: false,   //timepicker: false,
	           step: 60,            
		       format: 'Y-m-d',
// 		       value: '',
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
	        $('#f_date1').attr("placeholder", "請選擇日期");
	        
	        window.sortProducts = sortProducts;
	        const userlatitude = JSON.parse(sessionStorage.getItem('userlatitude'));
	        const userlongitude = JSON.parse(sessionStorage.getItem('userlongitude'));
	
		})
		
		
		
		// 前端排序
		function sortProducts() {
	        // 綁定排序
	        const selectedOption = document.getElementById('orderby').value;
	
	        // 綁定整個 court row
	        const courtContainer = document.getElementById('courtContainer');
	        const courtEntries = courtContainer.querySelectorAll('.product-default');
	
	        // 節點轉為 array
	        const courtsArray = Array.from(courtEntries);
	
	        // 排序 courtsArray
	        switch (selectedOption) {
	            case 'priceHL':
	            	courtsArray.sort((a, b) => getNumericPrice(b) - getNumericPrice(a));
	                break;
	            case 'priceLH':
	            	courtsArray.sort((a, b) => getNumericPrice(a) - getNumericPrice(b));
	                break;
	          		case 'distanceFN':
	                courtsArray.sort((a, b) => getDistance(a) - getDistance(b));
	                break;
	            case 'distanceNF':
	                courtsArray.sort((a, b) => getDistance(b) - getDistance(a));
	                break;
	            default:
	                break;
	                
	        }
	
	        // 新增 container
	        const sortedContainer = document.createElement('div');
	        sortedContainer.className = 'row';
	        sortedContainer.setAttribute("id", "courtContainer");
	
	        // 將排序好的加入 container
	        courtsArray.forEach(product => {
	            sortedContainer.appendChild(product);
	        });
	
	        // Replace the original container with the sorted one
	        courtContainer.parentNode.replaceChild(sortedContainer, courtContainer);
	    }
		
	    function getNumericPrice(product) {
	        return parseFloat(product.querySelector('.product-price').innerText.replace(/[^0-9.-]+/g, ''));
	    }
	    
	    function getDistance(product) {
	        const userLatitude = parseFloat(sessionStorage.getItem('userlatitude'));
	        const userLongitude = parseFloat(sessionStorage.getItem('userlongitude'));

	        const productLatitude = parseFloat(product.querySelector('.lat').innerText);
	        const productLongitude = parseFloat(product.querySelector('.long').innerText);

	        return calculateDistance(userLatitude, userLongitude, productLatitude, productLongitude);
	    }

	    function calculateDistance(lat1, lon1, lat2, lon2) {
	        const R = 6371; // 地球半徑
	        const dLat = deg2rad(lat2 - lat1);
	        const dLon = deg2rad(lon2 - lon1);
	        

	        const a =
	            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
	            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
	            Math.sin(dLon / 2) * Math.sin(dLon / 2);

	        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

	        const distance = R * c; 
			
	        
	        return distance;
	    }

	    function deg2rad(deg) {
	        return deg * (Math.PI / 180);
	    }
	    
	    // 顯示近期瀏覽
	    function recentlyViewData() {
		    // 會員編號
		    const textContent = $('#hiddenDivForMember').text(); 
		    console.log(textContent);
		    $.get('courtRecView.do', { action: 'get', mbrNo: textContent })
		        .done(result => {
		            console.log(result);
		            const courtObjects = result.map(jsonString => JSON.parse(jsonString));
		            processDatas(courtObjects);
		            
		        })
		        .fail((xhr, status, error) => {
		            console.error(error);
		        });
		}
		
		function processDatas(courtObjects) {
			const productContainer = document.getElementById('productContainer');
			
			courtObjects.forEach(item => {
		        
		        const productWidgetDiv = document.createElement('div');
		        productWidgetDiv.className = 'product-default left-details product-widget';
		        
		        const figure = document.createElement('figure');
		        
		        const link = document.createElement('a');
		        link.href =  "/ASAP/court/court_page.jsp?courtNo=" + item.courtVO.courtNo;
		        link.className = "getCourtNo";
		        
		        const img1 = document.createElement('img');
		        img1.src = "data:image/jpeg;base64," + item.img.img; 
		        img1.width = '84';
		        img1.height = '84';
		        img1.alt = '圖片';
		        
		        const productDetailsDiv = document.createElement('div');
		        productDetailsDiv.className = 'product-details';
		        
		        const productTitleH3 = document.createElement('h3');
		        productTitleH3.className = 'product-title';
		        
		        const productTitleLink = document.createElement('a');
		        productTitleLink.href = "/ASAP/court/court_page.jsp?courtNo=" + item.courtVO.courtNo;
		        productTitleLink.className = 'getCourtNo';
		        productTitleLink.textContent = item.courtVO.courtName; 
		        
		        const ratingsContainerDiv = document.createElement('div');
		        ratingsContainerDiv.className = 'ratings-container';
		        
		        const priceBoxDiv = document.createElement('div');
		        priceBoxDiv.className = 'price-box';
		        
		        const productPriceSpan = document.createElement('span');
		        productPriceSpan.className = 'product-price';
		        productPriceSpan.textContent = item.courtVO.courtPrice; 

		        priceBoxDiv.appendChild(productPriceSpan);
		        productTitleH3.appendChild(productTitleLink);
		        productDetailsDiv.appendChild(productTitleH3);
		        productDetailsDiv.appendChild(ratingsContainerDiv);
		        productDetailsDiv.appendChild(priceBoxDiv);
		        
		        link.appendChild(img1);
		        figure.appendChild(link);
		        
		        productWidgetDiv.appendChild(figure);
		        productWidgetDiv.appendChild(productDetailsDiv);
		        
		        
		        productContainer.appendChild(productWidgetDiv);
		    });
			
		}
		
		recentlyViewData();
		
		// 點擊場地寫入 Redis
		function writeCourt(courtNo) {
		  // 會員編號
		  const textContent = $('#hiddenDivForMember').text();

		  $.ajax({
		    url: 'courtRecView.do',
		    method: 'GET',
		    data: {
		      action: 'write',
		      courtNo: courtNo,
		      mbrNo: textContent,
		    },
		    success: function (data) {
		      console.log(data);
		    },
		    error: function (error) {
		      console.error(error);
		    },
		  });
		}

		document.addEventListener('click', function (event) {
	        const target = event.target;

	        if (target.matches('.getCourtNo')) {

	            const href = target.getAttribute('href');
	            const courtNo = href.match(/courtNo=(\d+)/)[1];
	
	            console.log('courtNo:', courtNo);

	            writeCourt(courtNo);
	        }
	    });

		
		    
		   	
		
		
		
		
	</script>
	
</body>

</html>