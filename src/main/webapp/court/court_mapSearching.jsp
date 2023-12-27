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
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

<script>
      WebFontConfig = {
        google: {
          families: [
            "Open+Sans:300,400,600,700,800",
            "Poppins:300,400,500,600,700",
            "Shadows+Into+Light:400",
          ],
        },
      };
      (function (d) {
        var wf = d.createElement("script"),
          s = d.scripts[0];
        wf.src = "${pageContext.request.contextPath}/assets/js/webfont.js";
        wf.async = true;
        s.parentNode.insertBefore(wf, s);
      })(document);
    </script>

<!-- map css -->
<style>
#map {
	height: 100%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>

<!-- Plugins CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />


</head>

<body>
	<div class="page-wrapper">
		<header class="header"></header>
		<!-- End .header -->

		<main class="main">
			<div class="container"
				style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
				<nav aria-label="breadcrumb" class="breadcrumb-nav">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court/court_main.jsp"><i
								class="icon-home"></i></a></li>
						<li class="breadcrumb-item">地圖搜尋</li>
					</ol>
				</nav>
				
					<a href="${pageContext.request.contextPath}/court/court_savelist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的收藏</button></a>
					<a href="${pageContext.request.contextPath}/court/court_orderlist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的預約</button></a>
				
				<!-- <h3 class="p-2" style="text-align: left;">地圖搜尋</h3> -->
			</div>

			<div class="container">
				<div id="map"></div>
			</div>
			<!-- End .container -->
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
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>


	<!-- map js -->
	<script>
      ((g) => {
        var h,
          a,
          k,
          p = "The Google Maps JavaScript API",
          c = "google",
          l = "importLibrary",
          q = "__ib__",
          m = document,
          b = window;
        b = b[c] || (b[c] = {});
        var d = b.maps || (b.maps = {}),
          r = new Set(),
          e = new URLSearchParams(),
          u = () =>
            h ||
            (h = new Promise(async (f, n) => {
              await (a = m.createElement("script"));
              e.set("libraries", [...r] + "");
              for (k in g)
                e.set(
                  k.replace(/[A-Z]/g, (t) => "_" + t[0].toLowerCase()),
                  g[k]
                );
              e.set("callback", c + ".maps." + q);
              a.src = `https://maps.googleapis.com/maps/api/js?` + e;
              d[q] = f;
              a.onerror = () => (h = n(Error(p + " could not load.")));
              a.nonce = m.querySelector("script[nonce]")?.nonce || "";
              m.head.append(a);
            }));
        d[l]
          ? console.warn(p + " only loads once. Ignoring:", g)
          : (d[l] = (f, ...n) => r.add(f) && u().then(() => d[l](f, ...n)));
      })({ key: "AIzaSyDAzTPC1sKmVCjpe8jsO3FnnPpSEr6PJNY", v: "weekly" });		
      // 記得這邊用的 key 是限制 localhost 的，之後上線要改成其他
    </script>


	<script>
      // 多個地點
      window.addEventListener("load", function(){
    	 
    	var storedValue = JSON.parse(sessionStorage.getItem("form_data")) || {};
        // 沒拿到的話，再去獲取使用者位置，存入sessionStorage
        function getGeoloca() {
		  if (!storedValue.latitude || !storedValue.longitude) {
		    if (navigator.geolocation) {
		      navigator.geolocation.getCurrentPosition(
		        function (position) {
		          console.log(position);
		         
		          var lng = position.coords.longitude;
		          var lat = position.coords.latitude;
		          
		          storedValue.latitude = lat;
		          storedValue.longitude = lng;
		          
		          sessionStorage.setItem("form_data", JSON.stringify(storedValue));
		          
		          console.log(
		            typeof JSON.parse(sessionStorage.getItem("form_data")).latitude
		          );
		          
		          initMap();
		        },
		      
		        function (error) {
		          alert(
		            "使用者不同意取得位置資訊或尚未取得位置資訊：ERROR(" +
		              error.code +
		              "): " +
		              error.message
		          );
		        },
		      );
		    } else {
		      alert("瀏覽器不支援 Geolocation 功能");
		    }
		  } else {
		    console.log("Latitude and Longitude already present:", storedValue.latitude, storedValue.longitude);
		    initMap();
		  }
		}
		
		getGeoloca();

        
        // 建立地圖
        var map;
        var marker;
        async function initMap() {

          const { Map } = await google.maps.importLibrary("maps");

          // Map options
          map = new Map(document.getElementById("map"), {
            center: { 
              lat: parseFloat(JSON.parse(sessionStorage.getItem("form_data")).latitude), 
              lng: parseFloat(JSON.parse(sessionStorage.getItem("form_data")).longitude)},
            zoom: 16,
            styles: [{
            	featureType: 'poi',
	            stylers: [{
                	visibility: 'off'
              	}]
            }],
            mapTypeControl: false,
            fullscreenControl: false,
            streetViewControl: false,
          });
          
          // 將地圖中心設為 session 中的使用者位置
//           map.setCenter({lat: parseFloat(JSON.parse(sessionStorage.getItem("form_data")).latitude), lng: parseFloat(JSON.parse(sessionStorage.getItem("form_data")).longitude)});     

          
          // 增加地標，讀取 map.geojson 裡的訊息
          $.ajax({
	            url: 'courtMap.do', 
	            type: 'POST',
	            contentType: 'application/json',
	            success: function(results) {
	            	
	            	console.log(results);
	            	
	            	let i = 0;
	            	var markers = []
	            	results.forEach(function(obj){
	            		let latLng = new google.maps.LatLng(obj.geometry.coordinates[1], obj.geometry.coordinates[0]);
	            		let name = obj.properties.name;
	            		let text = obj.properties.text;
	            		let courtNo = obj.properties.courtNo; 

	            		
	            		// 生成 marker
	            		
	            		markers[i] = new google.maps.Marker({
	            			position: latLng,
	                      	title: name,
	            			url:"/ASAP/court/court_page.jsp?courtNo="+courtNo,
	            			map: map,	                      
	                      	animation: google.maps.Animation.DROP,
	            		});
	            		console.log(markers[i])
	            		
	            		// 生成 info window
	            		let infowindow = new google.maps.InfoWindow({
	                       content: 
	                       "<h6>"+name+"</h6><div>"+text+"</div>"

	                    });
	            		
	            		// 監聽 marker mouseover 開
	            		markers[i].addListener('mouseover', function() {
	            		    infowindow.open(map, this);
	            		});
	            		// 關
	            		markers[i].addListener('mouseout', function() {
	            		    infowindow.close();
	            		});
	            		
	            		
	            		// 綁定場地頁面連結
	            		google.maps.event.addListener(markers[i], 'click', function() {
//             		      	window.location.href = markers[i].url;
            		      	window.location.href = "/ASAP/court/court_page.jsp?courtNo="+courtNo;
            		    });
	            		
	            		i++;
	            		
	            	})
	            },
	            error: function() {
	                console.log('Error in AJAX request');
	            }
	        });
          
          
          
          
	         
          
        }

        

       
        

        



      })
      

      

      
      
      
    </script>
</body>
</html>
