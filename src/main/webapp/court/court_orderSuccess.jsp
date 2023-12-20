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
	//先設一個 member，記得改
	String mbrNo = "M1206202300001";
	pageContext.setAttribute("mbrNo",mbrNo);
%>
<html>

<head>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>預約成功</title>




<!-- Plugins CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<!-- Main CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/simple-line-icons/css/simple-line-icons.min.css">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">
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
            wf.src = '/ASAP/assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>


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
                  <a href="#">完成預約</a>
              </li>
            </ul>

            

            <div class="container">
              <div class="alert alert-info" style="border-radius: 5px;">
                <div class="alert-wrapper">
                  <h4>預約成功!</h4>
                  	<p>
                    耶，你的場地預約成功啦！🎉
                    <br>
                    開心期待你的到來！如果需要，可以在我的預約中進行變更，若有任何問題，隨時跟我們聯繫。
                    Enjoy your event! 🚀
                    </p>
                   <a href="${pageContext.request.contextPath}/court/court_main.jsp">
                   <button class="btn btn-info mt-xs mb-xs" type="button" style="text-align: right;">返回場地搜尋</button>
                   </a>
                 
                  <!-- <button class="btn btn-default mt-xs mb-xs" type="button">Not convinced yet</button> -->
    
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