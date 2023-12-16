<%@page import="com.asap.member.service.MemberService"%>
<%@page import="com.asap.member.service.MemberService_interface"%>
<%@page import="com.asap.member.entity.MemberVO"%>
<%@page import="com.asap.court.service.CourtImgService_interface"%>
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

	String courtNo = request.getParameter("courtNo");
	String chooseDate = request.getParameter("chooseDate");
	String startTime = request.getParameter("startTime");
	String endTime = request.getParameter("endTime");
	String totalPrice = request.getParameter("totalPrice");
	
	CourtService_interface courtSvc = new CourtService();
	CourtVO courtVO = courtSvc.getCourtByCourtNo(Integer.valueOf(courtNo));
	
	
	CourtImgService_interface courtImgSvc = new CourtImgService();
	List<CourtImgVO> imgs = courtImgSvc.findByCourtNo(Integer.valueOf(courtNo));
	String base64Img = "";
	for(int i = 0; i < 1;i++){
		base64Img = Base64.getEncoder().encodeToString(imgs.get(i).getCourtImg());
	}
	
	pageContext.setAttribute("courtNo", courtNo);
	pageContext.setAttribute("courtVO", courtVO);
	pageContext.setAttribute("chooseDate", chooseDate);
	pageContext.setAttribute("startTime", startTime);
	pageContext.setAttribute("endTime", endTime);
	pageContext.setAttribute("base64Img", base64Img);
	pageContext.setAttribute("totalPrice", totalPrice);
	
	
	// 這邊還會有一個 member 的session.getAttribute
	// 先設一個 member，記得改
	String mbrNo = "M1206202300001";
	MemberService_interface mbrSvc = new MemberService();
	MemberVO mbrVO = mbrSvc.findByMbrNo(mbrNo);
	pageContext.setAttribute("mbrVO", mbrVO);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>場地-付款頁面</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">


    <script>
        WebFontConfig = {
            google: {
                families: ['Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400']
            }
        };
        (function(d) {
            var wf = d.createElement('script'),
                s = d.scripts[0];
            wf.src = '/ASAP/assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore(wf, s);
        })(document);
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">
    
 
</head>

<body>
    <div class="page-wrapper">
        <header class="header"></header>
        <!-- End .header -->

        <main class="main main-test">
            <div class="container checkout-container text-center">
                <ul class="checkout-progress-bar d-flex justify-content-center flex-wrap">
                    <li class="active">
                        <a href="#">付款確認</a>
                    </li>
                    <li class="disabled">
                        <a href="#">完成預約</a>
                    </li>
                </ul>
				
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/court/courtOrderServlet.do" class="mb-2">
                        <div class="order-summary">
                            <ul class="checkout-steps">
	                            <li>
	                                <h2 class="step-title">您的訂單</h2>
	                                    <div class="row">
	                                        <div class="col-md-6">
	                                            <div class="form-group">
	                                                <label>姓名</label>
	                                                <input type="text" class="form-control text-center" value="${mbrVO.mbrName}" required readonly/>
	                                                <input type="hidden" name="mbrNo" value="${mbrVO.mbrNo}">
	                                                <input type="hidden" name="courtNo" value="${courtNo}">
	                                                <input type="hidden" name="courtOrdDate" value="${chooseDate}">
	                                                <input type="hidden" name="courtOrdTime" value="${startTime}">
	                                                <input type="hidden" name="courtOrdTimeEnd" value="${endTime}">
	                                                <input type="hidden" name="totalPrice" value="${totalPrice}">
	                                            </div>
	                                        </div>
	
	                                        <div class="col-md-6">
	                                             <div class="form-group">
			                                        <label>連絡電話</label>
			                                        <input type="tel" class="form-control text-center" value="${mbrVO.mbrPhone}" required readonly/>
		                                    	</div>
	                                        </div>
	                                    </div>
	  
	  										
	                                    <div class="form-group">
	                                        <label>email 信箱</label>
	                                        <input type="email" class="form-control text-center" value="${mbrVO.mbrEmail}" required readonly/>
	                                    </div>
	                            </li>
	                        </ul>

                            <table class="table table-mini-cart">
                                <thead>
                                	<tr></tr>
                                	<tr></tr>
                                	<tr></tr>
                                	<tr></tr>
                                </thead>
                                
                                <tbody>
								    <tr>
								        <td class="product-col">
								            <div class="row align-items-center" style="margin-bottom: 20px">
								                <div class="col-md-4">
								                    <h3 class="product-title">
								                        <img src="data:image/jpg;base64,${base64Img}" width="250" height="250" alt="場地圖片">
								                    </h3>
								                </div>
								                <div class="col-md-8">
								                    <div class="product-details text-center">
								                        <h3 class="product-title mb-3" style="margin-top:30px">
								                            ${courtVO.courtName}
								                        </h3>
								                        <h3 class="product-title mb-3">
								                            ${chooseDate}
								                        </h3>
								                        <h3 class="product-title mb-3">
								                            ${startTime}：00 ~ ${endTime}：00
								                        </h3>
								                        
								                        <div class="row mt-3 justify-content-center">
								                            <div class="col-md-6">
								                                <h4 style="font-weight: bold;">總金額 $ ${totalPrice}</h4>
								                            </div>
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </td>
								    </tr>
								</tbody>
                            </table>

							<div class="d-flex justify-content-end">
								<div class="col-md-6">
									<input type="hidden" name="action" value="order">
		                            <button type="submit" class="btn btn-dark btn-place-order">
		                                確認預約
		                            </button>
		                            
		                        </div>
		                        
		                        <div class="col-md-6">
		                        	<a href="court_page.jsp?courtNo=${courtNo}">
		                            <button type="button" class="btn btn-gray btn-place-order">
					                    取消
					                </button>
					                </a>
					            </div>
			                </div>
                        </div>
                        </FORM>
                        <!-- End .cart-summary -->
                    </div>
                </div>
                <!-- End .row -->
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

    <div class="mobile-menu-container">  
    </div>
    <!-- End .mobile-menu-container -->

    <div class="sticky-navbar">
    </div>



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

    <!-- header and footer template -->
	<script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>
</body>

</html>