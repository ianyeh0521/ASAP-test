<%@page import="com.asap.court.entity.CourtTypeVO"%>
<%@ page import="com.asap.court.entity.CourtVO"%>
<%@ page import="com.asap.court.entity.SiteVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>ASAP</title>


    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">



    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
   
    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">
</head>

<body>
    <div class="page-wrapper">
        <header class="header">
        <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}" style="
          height: 75px;
          background: rgb(255, 250, 85);
          background: linear-gradient(
            90deg,
            rgba(255, 250, 85, 0.9081757703081232) 0%,
            rgba(9, 34, 121, 0.8773634453781513) 35%,
            rgba(0, 212, 255, 1) 100%
          );
        ">
                <div class="container">
                    <div class="header-left col-lg-2 w-auto pl-0">
                       
                        <a href="${pageContext.request.contextPath}/backStage/BackageHome.jsp" width="222" height="88">
                            <img src="${pageContext.request.contextPath}/newImg/logo2.png" alt="Logo" />
                        </a>
                    </div>
                    <!-- End .header-left -->
                </div>
                <!-- End .container -->
            </div>
            <!-- End .header-middle -->

            <div class="header-bottom sticky-header d-none d-lg-block" data-sticky-options="{'mobile': false}">
                <div class="container">
                    <nav class="main-nav w-100">
                        <ul class="menu" style="display: flex; justify-content: flex-end">
                             <li><a><form action="${pageContext.request.contextPath}/BackStageController" method="post" style="margin: 0px;"><button type="submit" style="border:0px; background-color:white;">登出</button><input type="hidden" name="action" value="logout"/></form></a></li>
                        </ul>
                    </nav>
                </div>
                <!-- End .container -->
            </div>
            <!-- End .header-bottom -->
        </header><!-- End .header -->

        <main class="main">
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
<!--                     <nav aria-label="breadcrumb" class="breadcrumb-nav"> -->
<!--                         <div class="container"> -->
<!--                             <ol class="breadcrumb"> -->
<%--                                 <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court_index.jsp">場地管理</a></li> --%>
<!--                                 <li class="breadcrumb-item active" aria-current="page" >所有場地</li> -->
<!--                             </ol> -->
<!--                         </div> -->
<!--                     </nav> -->
                    <h1>所有場地</h1>
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

        <footer class="footer bg-dark">
        <div class="footer-middle">
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
									<li><a>Account</a></li>
									<li><a>Course</a></li>
									<li><a>Forum</a></li>
									<li><a>Group</a></li>
									<li><a>Court</a></li>
									<li><a>Seller</a></li>
									<li><a>Mall</a></li>
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

<!--     <div class="mobile-menu-overlay"></div>End .mobil-menu-overlay -->

<!--     <div class="mobile-menu-container"></div>End .mobile-menu-container -->

<!--     <div class="sticky-navbar"></div> -->



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

   
</body>

</html>