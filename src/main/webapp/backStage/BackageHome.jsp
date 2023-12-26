<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.backstage.service.*"  %>
<%@ page import="com.asap.backstage.entity.*"  %>
<% 
   BackStageVO backStageVO = (BackStageVO)session.getAttribute("backVo");
   String backNo = backStageVO.getBackNo();
   BackAccessService bacAccessService = new BackAccessService();
   List<Integer> backAceList = bacAccessService.findByBackNo(backNo);
   pageContext.setAttribute("backAceList", backAceList);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <title>ASAP</title>

 

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

    <!-- Plugins CSS File -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- Main CSS File -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.min.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
    <script src="https://kit.fontawesome.com/2bd4419edb.js" crossorigin="anonymous"></script>


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
        </header>

        <div class="page-header">
            <div class="container d-flex flex-column align-items-center">
                <h1>後台人員首頁</h1>
            </div>
        </div>
        <div
            style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
        
        <div class="tab-pane fade show active" id="dashboard" role="tabpanel">
            <div class="dashboard-content">
            

                <div class="mb-4">
                    <p>
                        歡迎登入, <strong class="text-dark">${backVo.backName}</strong>
                        
                    </p>

                </div>

                <div class="row row-lg">
                    <c:if test="${not empty backAceList}">
                       <c:forEach var="backAce" items="${backAceList}">
                           <c:if test="${backAce == 1}">
	                         <div class="col-6 col-md-4">
	                           <div class="feature-box text-center pb-4">
	                           <a href="#" class="link-to-tab"><i class="fa-solid fa-cart-shopping"></i></a>
	                           <div class="feature-box-content">
	                              <h3>購物平台管理</h3>
	                           </div>
	                          </div>
	                         </div>
                           </c:if>
                           
                           <c:if test="${backAce == 2}">
		                      <div class="col-6 col-md-4">
		                        <div class="feature-box text-center pb-4">
		                            <a href="${pageContext.request.contextPath}/backStage/CoachManage.jsp" class="link-to-tab"><i class="icon-user-2"></i></a>
		                            <div class="feature-box-content p-0">
		                                <h3>教練會員資料管理</h3>
		                            </div>
		                        </div>
		                    </div>
                           </c:if>
                           <c:if test="${backAce == 3}">
                           <div class="col-6 col-md-4">
                            <div class="feature-box text-center pb-4">
                              <a href="${pageContext.request.contextPath}/court/listAllCourts_datatable_Ajax.html"><i class="fa-solid fa-location-dot"></i></a>
                               <div class="feature-box-content">
                                <h3>場地管理</h3>
                              </div>
                             </div>
                           </div>
                           </c:if>
                           <c:if test="${backAce == 4}">
                            <div class="col-6 col-md-4">
                              <div class="feature-box text-center pb-4">
                               <a href="${pageContext.request.contextPath}/forum/backstage_forum_report.jsp" class="link-to-tab"><i class="fa-solid fa-bullhorn"></i></a>
                               <div class=" feature-box-content">
                                <h3>論壇管理</h3>
                               </div>
                              </div>
                           </div>
                           </c:if>
                           <c:if test="${backAce == 5}">
                           <div class="col-6 col-md-4">
                            <div class="feature-box text-center pb-4">
                            <a href="${pageContext.request.contextPath}/backStage/BackageChat.jsp" class="link-to-tab"><i class="fa-solid fa-envelope"></i></a>
                            <div class="feature-box-content">
                                <h3>客服管理</h3>
                              </div>
                            </div>
                           </div>
                           </c:if>
                           
                       </c:forEach>
                    </c:if>
                    
                </div><!-- End .row -->
            </div>
        </div><!-- End .tab-pane -->
    </div>
 </div>


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
    </footer>
    
    	<div class="loading-overlay">
		<div class="bounce-loader">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>

<!--     <div class="sticky-navbar"></div> -->
<!--     <div class="mobile-menu-container"></div> -->

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
   
</body>

</html>
