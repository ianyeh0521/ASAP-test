<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.util.*"%>

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
	  
		/* 分頁按鈕 */
	  .pagination-buttons button {
        margin-right: 5px;
      }
      
      .pagination-buttons button:hover {
        cursor: pointer; 
      }
      
      .pagination-buttons button.selected-page {
        background-color: #009EEE; 
        color: #fff; 
        cursor: default;
       }
       
       .outer-container {
	        border: 1px solid rgba(0, 0, 0, 0.1); 
	        border-radius: 10px; 
	        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); 
	        padding: 0px; 
	        margin: 0px; 
	        text-align: center;
	    }
	    
	  	  #f_date1{
	  	  	border-radius: 8px;
	    	border: 1px solid;
	    	
	    }
	    
/* 	    近期瀏覽 */
/* 		#recentlyViewedContainer { */
/* 			border-radius: 5px; */
/* 		    position: fixed; */
/* 		    top: 276px;  */
/* 		    right: 20px;  */
/* 		    height: 400px; */
/* 		    width: 300px;  */
/* 		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  */
/* 		    overflow-y: auto; */
/* 		} */
		
/* 		#recentlyViewedContainer.initial-position { */
/* 		    position: relative; */
/* 		} */
		
/* 		#recentlyViewedContainer.fixed { */
/* 		    position: fixed; */
/* 		    top: 0px;  */
/* 		    right: 20px;  */
/* 		    height: 400px; */
/* 		    width: 300px; */
/* 		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);  */
/* 		    overflow-y: auto;  */
/* 		} */
		
       
       
       
	</style>

	
</head>

<body>
	<div class="page-wrapper">

	<!-- header -->
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

		<main class="main" >
		

			<!-- 搜尋列 -->
			<div class="container" style="margin-top: 20px !important;" >
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
				<a href="${pageContext.request.contextPath}/court/court_mapSearching.jsp"><button class="btn btn-primary btn-rounded btn-md">地圖搜尋</button></a>
				<a href="${pageContext.request.contextPath}/court/court_savelist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的收藏</button></a>
				<a href="${pageContext.request.contextPath}/court/court_orderlist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的預約</button></a>
			</div>
			
			
			
			
			<!-- main container -->
			<div class="container mt-6" style="margin-top: 0px !important;" id="divTest">
				<!-- 整個 row -->
				
				<!-- 原本的側邊欄近期瀏覽改到這裡 (先改回去)-->
<!-- 					<div class="col-lg-3" id="recentlyViewedContainer"  class="initial-position" style="height: 400px;"> -->
<!-- 							<h4 class="text-uppercase heading-bottom-border mt-6 mt-lg-4" style="margin-top: 30px !important;">近期瀏覽</h4> -->
<!-- 							<div class="product-default left-details product-widget" v-for="data in recentlyViewDatas"> -->
<!-- 								<figure> -->
<!-- 									<a :href="'/ASAP/court/court_page.jsp?courtNo='+ data.courtVO.courtNo" @click="writeCourt(data.courtVO.courtNo)"> -->
<!-- 										<img :src="'data:image/jpeg;base64,' + data.img.img" width="84" height="84" -->
<!-- 											alt="圖片"> -->
<!-- 									</a> -->
<!-- 								</figure> -->
<!-- 								<div class="product-details"> -->
<!-- 									<h3 class="product-title"> <a :href="'/ASAP/court/court_page.jsp?courtNo='+ data.courtVO.courtNo" class="name" @click="writeCourt(data.courtVO.courtNo)">{{data.courtVO.courtName}}</a> </h3> -->
<!-- 									<div class="ratings-container"> -->
<!-- 									</div>End .product-container -->
<!-- 									<div class="price-box"> -->
<!-- 										<span class="product-price">{{data.courtVO.courtPrice}}</span> -->
<!-- 									</div>End .price-box -->
<!-- 								</div>End .product-details -->
<!-- 							</div> -->
<!-- 						</div> -->
				
				
				<div class="row mb-8" >

					<!-- court list -->
					<div class="col-lg-9">
						<h4 class="text-uppercase heading-bottom-border mt-4" style="margin-top: 30px !important;">搜尋結果</h4>
						
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
								
									
									
								<div class="toolbox-item toolbox-sort">
									<label>排序方式:</label>

									<div class="select-custom">
										<select name="orderby" class="form-control" v-model="selectedSortOption" @change="sortProducts" style="border-radius: 10px">
											<option value="menu_order" selected="selected" disabled>預設</option>
											<option value="priceHL" >價格高➪低</option>
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
						
						<!-- 暫放會員編號給前端 -->
						<div id="hiddenDivForMember" ref="hiddenDiv" style="display: none;">${mbrNo}</div>	
					
						<!-- 場地資訊 -->
						
						<div v-for="data in datas">
<!-- 						<div class="outer-container"> -->
						<div class="row" >
							<div class="col-sm-12 col-6 product-default left-details product-list mb-2">
								<figure>								
										<img :src="data.courtImg1" width="250" height="250"
											alt="product" />
										<img :src="data.courtImg2" width="250" height="250"
											alt="product" />							
								</figure>
								<div class="product-details" >
									<div class="category-list">
										<a href="category.html" class="type">{{data.courtTypeVO.courtType}}</a>
									</div>
									<h3 class="product-title" class="name"> <a :href="'/ASAP/court/court_page.jsp?courtNo='+ data.courtNo" @click="writeCourt(data.courtNo)">{{data.courtName}}</a></h3>
									<p class="product-description" class="text">{{data.courtText}}</p>
									<div class="price-box">
										<span class="product-price" class="price">{{data.courtPrice}} / hr</span>
									</div>
									<div class="product">
										<a :href="'/ASAP/court/court_page.jsp?courtNo='+ data.courtNo" class="btn btn-primary btn-rounded btn-md" @click="writeCourt(data.courtNo)">
											<span style="color: white;">我要預約</span>
										</a>
									</div>
									<div style="display:none" class="long">{{data.courtLong}}</div>
									<div style="display:none" class="lat">{{data.courtLat}}</div>
								</div>
							</div>	
						</div>
<!-- 						</div> -->
						</div>
						<!-- 場地資訊結束 -->
						
						
						<!-- 分頁按鈕 -->
						<div class="pagination-buttons">
							<button v-for="page in totalPage" :key="page" @click="changePage(page)" 
							:class="{ 'selected-page': page === currentPage }" 
							:disabled="page === currentPage">{{ page }}</button>
						</div>
					</div>
					
					
					
					
					
					<!-- 近期瀏覽 -->
					
					<div class="col-lg-3" id="recentlyViewedContainer" style="height: 400px;">
						<h4 class="text-uppercase heading-bottom-border mt-6 mt-lg-4" style="margin-top: 30px !important;">近期瀏覽</h4>
						<div class="product-default left-details product-widget" v-for="data in recentlyViewDatas">
							<figure>
								<a :href="'/ASAP/court/court_page.jsp?courtNo='+ data.courtVO.courtNo" @click="writeCourt(data.courtVO.courtNo)">
									<img :src="'data:image/jpeg;base64,' + data.img.img" width="84" height="84"
										alt="圖片">
								</a>
							</figure>
							<div class="product-details">
								<h3 class="product-title"> <a :href="'/ASAP/court/court_page.jsp?courtNo='+ data.courtVO.courtNo" class="name" @click="writeCourt(data.courtVO.courtNo)">{{data.courtVO.courtName}}</a> </h3>
								<div class="ratings-container">
								</div>
								<div class="price-box">
									<span class="product-price">{{data.courtVO.courtPrice}}</span>
								</div>
							</div>
						</div>
					</div>
				
				</div>
				
			</div>
			
			

		</main><!-- End .main -->

		<footer class="footer bg-dark"></footer><!-- End .footer -->
	</div><!-- End .page-wrapper -->



	<div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->
	<div class="mobile-menu-container"></div><!-- End .mobile-menu-container -->

	<div class="sticky-navbar">	</div>

<!-- 	<a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a> -->

	<!-- import Vue 3.0 -->
	<script src="https://unpkg.com/vue@next"></script>

	<!-- CDN import Axios -->
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	
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
// 		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>
	
	<script>
		window.onload=function(){
			
			// vue 初始化
			Vue.createApp({
	            data: function(){
	                return{
	                    datas: [],
	                    recentlyViewDatas: [],
	                    selectedSortOption: 'menu_order',
	                    userlatitude: null,
	                    userlongitude: null,
	                    currentPage: 1,
	                    totalPage: 0,
	                }
	            },
	            methods:{
	            	successCallback: function (position) {
	                    this.userlatitude = position.coords.latitude;
	                    this.userlongitude = position.coords.longitude;
	                    
	                    // 先存在 sessionStorage 裡，forward 到其他頁可以用
	                    sessionStorage.setItem('userlatitude', this.userlatitude);
	                    sessionStorage.setItem('userlongitude', this.userlongitude);

	                    console.log("緯度: " + this.userlatitude);
	                    console.log("經度: " + this.userlongitude);
	                },
	                
	                errorCallback: function (error) {
	                    switch (error.code) {
	                        case error.PERMISSION_DENIED:
	                            console.log("使用者拒絕位置存取");
	                            break;
	                        case error.POSITION_UNAVAILABLE:
	                            console.log("無法取得位置資訊");
	                            break;
	                        case error.TIMEOUT:
	                            console.log("取得位置資訊請求超時");
	                            break;
	                        case error.UNKNOWN_ERROR:
	                            console.log("未知的錯誤發生");
	                            break;
	                    }
	                },
	                
	                // 場地資料初始化
	            	fetchInitialData: function () {
	                    const request1 = { url: 'courtAjax.do', method: 'get', params: { page: this.currentPage } };;
	                    const request2 = { url: 'courtImgAjax.do', method: 'get' };
	                    const request3 = { url: 'courtAjax.do', method: 'get', params: { getTotalPage: true } };

	                    axios.all([axios(request1), axios(request2), axios(request3)])
	                        .then(axios.spread((response1, response2, response3) => {
	                            var result1 = response1.data;
	                            var result2 = response2.data;
	                            var result3 = response3.data;
	                            console.log(JSON.stringify(result3));

	                            for (let i = 0; i < result1.length; i++) {
	                                let imgCount = 0;
	                                for (let j = 0; j < result2.length; j++) {
	                                    if (result1[i].courtNo == result2[j][0]) {
	                                        imgCount += 1;

	                                        let courtImg = "courtImg";
	                                        courtImg = courtImg + imgCount;
	                                        result1[i][courtImg] = 'data:image/jpg;base64,' + result2[j][1];

	                                        if (imgCount == 4) {
	                                            break;
	                                        }
	                                    }
	                                }
	                            }

	                            this.datas = result1;
	                            this.totalPage = result3;
	                            console.log(this.datas)
	                            console.log(this.totalPage)
	                        }))
	                        .catch(function (reason) {
	                            console.log(reason);
	                        });
	            	},
	            	
	            	// 顯示近期瀏覽
	            	recentlyViewData: function () {
	            		// 會員編號
		                const textContent = this.$refs.hiddenDiv.textContent;
	            		axios.get('courtRecView.do', {
		                      params: {
		                        action: 'get',
		                        mbrNo:textContent,
		                      }
		                    })
		                    .then(response => {
// 		                      console.log(response.data);
		                      var result = response.data;
		                      this.processDatas(result);
								
		                    })
		                    .catch(error => {
		                      console.error(error);
		                    });
	            	},
	            	
	            	processDatas(result) {
            	      const dataArray = Object.values(result);

            	      dataArray.forEach(jsonString => {
            	        const parsedData = JSON.parse(jsonString);
            	        this.recentlyViewDatas.push(parsedData);
            	      });
            	    },
	            	
					// 排序
					sortProducts: function () {
				        const selectedOption = this.selectedSortOption;
				
				        switch (selectedOption) {
				            case 'priceHL':
				                this.datas.sort((a, b) => this.getNumericPrice(b) - this.getNumericPrice(a));
				                break;
				            case 'priceLH':
				                this.datas.sort((a, b) => this.getNumericPrice(a) - this.getNumericPrice(b));
				                break;
				            case 'distanceFN':
				                this.datas.sort((a, b) => this.getDistance(b) - this.getDistance(a));
				                break;
				            case 'distanceNF':
				                this.datas.sort((a, b) => this.getDistance(a) - this.getDistance(b));
				                break;
				            default:
				                break;
				        }
				    },
				
				    getNumericPrice: function (product) {
				        return parseFloat(product.courtPrice); 
				    },
				
				    getDistance: function (product) {
				        const userLatitude = this.userlatitude;
				        const userLongitude = this.userlongitude;
				
				        const productLatitude = parseFloat(product.courtLat); 
				        const productLongitude = parseFloat(product.courtLong); 
				
				        return this.calculateDistance(userLatitude, userLongitude, productLatitude, productLongitude);
				    },
				
				    calculateDistance: function (lat1, lon1, lat2, lon2) {
				        const R = 6371; // 地球半徑
				        const dLat = this.deg2rad(lat2 - lat1);
				        const dLon = this.deg2rad(lon2 - lon1);
				
				        const a =
				            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
				            Math.cos(this.deg2rad(lat1)) * Math.cos(this.deg2rad(lat2)) *
				            Math.sin(dLon / 2) * Math.sin(dLon / 2);
				
				        const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
				
				        const distance = R * c;
				
				        return distance;
				    },
				
				    deg2rad: function (deg) {
				        return deg * (Math.PI / 180);
				    },
	                
	                // 換頁按鈕
	                changePage: function (page) {
	                    this.currentPage = page;
	                    this.fetchInitialData();
	                    
	                    window.scrollTo({
	                        top: 230,
	                        behavior: 'smooth' 
	                    });
	                },
	                
	                // 點擊場地寫入 Redis
	                writeCourt(courtNo) {
	                	// 會員編號
		                const textContent = this.$refs.hiddenDiv.textContent;
	                    axios.get('courtRecView.do', {
	                      params: {
	                        action: 'write',
	                        courtNo:courtNo,
	                        mbrNo:textContent,
	                      }
	                    })
	                    .then(response => {
	                      console.log(response.data);
	                    })
	                    .catch(error => {
	                      console.error(error);
	                    });
	                }
	            	
	            },
	            mounted: function(){
	            	// geolocation
	                if (navigator.geolocation) {
	                    navigator.geolocation.getCurrentPosition(this.successCallback, this.errorCallback);
	                } else {
	                    console.log("瀏覽器不支援定位");
	                }
	                this.fetchInitialData();
	                this.recentlyViewData();
	                
	            },
            	
	            
	        }).mount('#divTest');
			
		}
		
		
		$(document).ready(function() {
			// 日期選擇
			var somedate1 = new Date('<%=closedDate%>');
			$.datetimepicker.setLocale('zh'); 
	        $('#f_date1').datetimepicker({
	           theme: '',          
	           timepicker: false,   //timepicker: false,
	           step: 60,            
		       format: 'Y-m-d',
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
	        $('#f_date1').attr("placeholder", "請選擇日期");
	        
	        
	        // 側邊欄
// 	        var container = $("recentlyViewedContainer");
// 	        var initialPosition = container.offsetTop;

// 	        window.addEventListener("scroll", function () {
// 	            if (window.pageYOffset >= initialPosition) {
// 	                container.classList.add("fixed");
// 	                container.classList.remove("initial-position");
// 	            } else {
// 	                container.classList.remove("fixed");
// 	                container.classList.add("initial-position");
// 	            }
// 	        });
	       
	        
	        
	       
		})
		
	
		
	</script>
	
	

	
</body>

</html>