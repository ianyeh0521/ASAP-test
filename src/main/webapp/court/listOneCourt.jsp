<%@page import="com.asap.court.entity.CourtTypeVO"%>
<%@ page import="com.asap.court.entity.CourtVO"%>
<%@ page import="com.asap.court.entity.SiteVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.court.service.CourtService"%>
<%@ page import="com.asap.court.service.CourtTypeService"%>
<%@ page import="com.asap.court.service.SiteService"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	Integer courtNoPass = (Integer) request.getAttribute("courtNoPass"); 
	System.out.print(courtNoPass);
	CourtService courtSvc2 = new CourtService();
	CourtVO getCourt = courtSvc2.getCourtByCourtNo(courtNoPass);
	
	CourtTypeService courtTypeSvc = new CourtTypeService();
	CourtTypeVO getCourtType = courtTypeSvc.getCourtByCourtTypeNo(getCourt.getCourtTypeVO().getCourtTypeNo());
	
	SiteService SiteSvc = new SiteService();
	SiteVO getSite = SiteSvc.findSiteByPK(getCourt.getSiteVO().getSiteNo());
	
   	pageContext.setAttribute("getCourt",getCourt);
   	pageContext.setAttribute("getSite",getSite);
   	pageContext.setAttribute("getCourtType",getCourtType);
   	

%>

<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>後臺管理-所有場地</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/ASAP/assets/images/icons/favicon.png">


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

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="/ASAP/assets/css/bootstrap.min.css">
   
    <!-- Main CSS File -->
    <link rel="stylesheet" href="/ASAP/assets/css/style.min.css" >
    <link rel="stylesheet" type="text/css" href="/ASAP/assets/vendor/fontawesome-free/css/all.min.css">
</head>

<body>
    <div class="page-wrapper">
        <header class="header"></header><!-- End .header -->

        <main class="main">
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court_index.jsp">場地管理</a></li>
                                <li class="breadcrumb-item active" aria-current="page" >所有場地</li>
                            </ol>
                        </div>
                    </nav>
                    <h1 href="${pageContext.request.contextPath}/court/listAllCourts_datatable_Ajax.html">所有場地</h1>
                </div>
            </div>
            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: left !important;">
				<a href="${pageContext.request.contextPath}/court/listAllCourts_datatable_Ajax.html">
				<button class="btn btn-primary btn-rounded btn-md">返回所有場地</button>
				</a>
			
			</div>

            <div class="container" >
                <div class="wishlist-table-container" >
                    <table class="table table-wishlist mb-0" >
                        <thead>
                            <tr style="text-align: center !important">
                                
                                <th>場地編號</th>
                                <th>場地名稱</th>
                                <th>場地類型</th>
                                <th>室內/外</th>
                                <th>地點</th> 
 								<th>介紹內文</th>
                                <th>狀態</th>
                                

								<!-- <th>場地創建時間</th> -->
                                
                                
<!--                                 <th>地址</th> -->
<!--                                 <th>經度</th> -->
<!--                                 <th>緯度</th> -->
<!--                                 <th>場館人數限制</th> -->
<!--                                 <th>價格</th>  -->
                            </tr>
                        </thead>
                        <tbody>
                         
                            <tr style="text-align: center !important">
                                
                                <td>${getCourt.courtNo}</td>
                                <td>${getCourt.courtName}</td>
                                <td>${getCourtType.courtType}</td>
                                <td>${getCourt.indoor ?"室內":"室外"}</td>
                                <td>${getSite.regions}</td>               
                                <td>${getCourt.courtText}</td>
                                <td>${getCourt.courtStat ? "營運中":"暫停營運"}</td>  
                               
                               
								<%-- <td>${courtVO.courtCrtTime}</td>  --%>
								<!-- <td>${courtVO.courtAddress}</td> -->
                                <!--  -->
                                <!-- <td>${courtVO.courtPplLimit}</td> -->
                                <!-- <td>${courtVO.courtPrice}</td> -->
                                 
                                                       
                                <!-- <td>${courtVO.courtLong}</td>
                                <td>${courtVO.courtLat}</td> -->
                            </tr>
                        
                        </tbody>    
                    </table>
                </div><!-- End .cart-table-container -->
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
    <script src="/ASAP/assets/js/jquery.min.js"></script>
    <script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/ASAP/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="/ASAP/assets/js/main.min.js"></script>

    <!-- header and footer template -->
	<script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>
</body>

</html>