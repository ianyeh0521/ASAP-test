<%@page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <title>Uh oh Something went wrong!</title>


  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

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

  <!-- Plugins CSS File -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

  <!-- Main CSS File -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
  

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/errorstyle.css">




</head>

<body>
  <div class="page-wrapper">
    <header class="header">
       <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}"
            style="
              padding-top: 0;
              padding-bottom: 0;
              height: 75px;
              background: rgb(255, 250, 85);
              background: linear-gradient(
                90deg,
                rgba(255, 250, 85, 0.9081757703081232) 0%,
                rgba(9, 34, 121, 0.8773634453781513) 35%,
                rgba(0, 212, 255, 1) 100%
              );
              position: relative; /* Set position to relative for the parent */
              display: flex;
              align-items: center;
            "
          >
            <div class="container" style="position: relative;">
              <div class="header-left col-lg-2 w-auto pl-0"
                style="
                  position: absolute;
                  top: 50%; /* Move 50% from the top */
                  transform: translateY(-50%);
                  z-index: 999;
                  left: 20px; /* Adjust distance from the left */
                "
              >
                <button class="mobile-menu-toggler text-primary mr-2" type="button">
                  <i class="fas fa-bars"></i>
                </button>
                <a href="${pageContext.request.contextPath}/ASAPwelcome.jsp" width="222" height="88">
                  <img src="newImg/logo2.png" style="max-width: 200px; height: auto; vertical-align: middle; border-style: none;">
                </a>
              </div>
              <!-- End .header-left -->
            </div>
            <!-- End .container -->
          </div>
          <!-- End .header-middle -->
    </header>


<!-- partial:index.partial.html -->
<div class="site">
	<div class="sketch">
		<div class="bee-sketch red"></div>
		<div class="bee-sketch blue"></div>
	</div>

<h1>Uh Oh:
	<small>Something went wrong!</small>
	<button id="goback" type="button" style="border:0px; border-radius:20px; background-color:#9ae4e1;padding:10px;font-size:50%; margin-top:30px;">回上一頁</button>
	</h1>
	
	
</div>

<!-- <div style="margin:0px 0px 20px 70%;"> -->

<!-- </div> -->
<!-- partial -->



    <footer class="footer bg-dark">
        <div class="footer-middle">
              <div class="container">
                <div class="row">
                  <div class="col-lg-3 col-sm-6">
                    <div class="widget">
                      <h4 class="widget-title">Contact Info</h4>
                      <ul class="contact-info">
                        <li>
                          <span class="contact-info-label">Address:</span>5F., No. 219, Sec. 3, Nanjing E. Rd., Zhongshan Dist., Taipei City 104, Taiwan (R.O.C.)
                        </li>
                        <li>
                          <span class="contact-info-label">Phone:</span
                          ><a href="tel:">(02) 2712-0589</a>
                        </li>
                        <li>
                          <span class="contact-info-label">Email:</span>
                          <a href="mailto:mail@example.com">business@tibame.com</a>
                        </li>
                        <li>
                          <span class="contact-info-label"
                            >Working Days/Hours:</span
                          >
                          Mon - Sun / 8:00 AM - 9:30 PM
                        </li>
                      </ul>
                      <div class="social-icons">
                        <a
                          href="#"
                          class="social-icon social-facebook icon-facebook"
                          target="_blank"
                          title="Facebook"
                        ></a>
                        <a
                          href="#"
                          class="social-icon social-twitter icon-twitter"
                          target="_blank"
                          title="Twitter"
                        ></a>
                        <a
                          href="#"
                          class="social-icon social-instagram icon-instagram"
                          target="_blank"
                          title="Instagram"
                        ></a>
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
                    <span class="footer-copyright"
                      >© Tibame. 2023. All Rights Reserved</span
                    >
                  </div>
                </div>
              </div>
              <!-- End .footer-bottom -->
            </div>
            <!-- End .container -->
    </footer>

<!--     <div class="sticky-navbar"></div> -->
<!--     <div class="mobile-menu-container"></div> -->

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
    
    <script type="text/javascript">
      $("#goback").on("click", function(){
    	
    	  window.history.back();
      })
    </script>
</body>

</html>