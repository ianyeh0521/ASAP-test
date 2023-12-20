<%@page import="com.asap.court.entity.CourtTypeVO"%>
<%@page import="com.asap.court.service.CourtTypeService"%>
<%@page import="com.asap.court.service.SiteService"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.entity.SiteVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%
	// 錯誤訊息
	String error = request.getParameter("error");
	pageContext.setAttribute("error", error);

	//先設一個 member，記得改
	String mbrNo = "M1206202300001";
	pageContext.setAttribute("mbrNo",mbrNo);
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>付款失敗</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/ASAP/assets/images/icons/favicon.png">
    <link
          rel="stylesheet"
          href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
          integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
          crossorigin="anonymous"
    />

    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = 'assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"/>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    
</head>

<body>
    <div class="page-wrapper">
        <header class="header">
        </header><!-- End .header -->

        <main class="main">
            <ul class="checkout-progress-bar d-flex justify-content-center flex-wrap">
              <li class="disabled">
                  <a href="#">付款確認</a>
              </li>
              <li class="active">
                  <a href="#">預約失敗</a>
              </li>
            </ul>

            

            <div class="container">
              <div class="alert alert-rounded alert-danger icon-sm">
                <div class="alert-wrapper">
                  <i class="fas fa-exclamation-triangle"></i>
                  <span><strong>喔不!</strong>  結帳時出了一些問題</span>
                  <ul>
		            <c:choose>
		                <c:when test="${error eq 'time'}">
		                    <li>此時段已被預約，請重新選擇時段</li>
		                </c:when>
		                <c:when test="${error eq 'order'}">
		                    <li>您已重複下單，請至我的預約確認</li>
		                </c:when>
		                <c:otherwise>
		                    <!-- Handle other error cases if needed -->
		                    <li>Unknown error</li>
		                </c:otherwise>
		            </c:choose>
			      </ul>
                  <br>
                  <a href="${pageContext.request.contextPath}/court/court_main.jsp">
                  <button class="btn btn-default mt-xs mb-xs" type="button" style=" border-radius: 5px;">回到場地頁面</button>
                  </a>
<!--                   <button class="btn btn-default mt-xs mb-xs" type="button" style="background-color: rgb(191, 194, 197); margin-left: 20px; border-radius: 5px;">取消</button> -->
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

    <div class="sticky-navbar"></div>



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
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
        $(window).on("load", function(){
            $("#lookup").on("click", function(){
              $("#fs_alert").css("display", "block");
            })
            $("#alert_ok").on("click", function(){
              $("#fs_alert").css("display", "none");
            })
        })
	</script>
</body>

</html>