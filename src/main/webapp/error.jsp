<%@page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <title>Uh oh Something went wrong!</title>

  <meta name="keywords" content="HTML5 Template" />
  <meta name="description" content="Porto - Bootstrap eCommerce Template" />
  <meta name="author" content="SW-THEMES" />

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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/forum/errorstyle.css">




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
            <button class="mobile-menu-toggler text-primary mr-2" type="button">
              <i class="fas fa-bars"></i>
            </button>
            <a href="#" width="222" height="88">
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
              <li>
                <a href="#">論壇</a>
                <ul>
                  <li><a href="#">論壇首頁</a></li>
                  <li><a href="#">發佈貼文</a></li>
                  <li><a href="#">我的貼文</a></li>
                  <li><a href="#">收藏貼文</a></li>
                </ul>
              </li>
              <li>
                <a href="#">揪團</a>
                <ul>
                  <li><a href="#">揪團首頁</a></li>
                  <li><a href="#">發起揪團</a></li>
                  <li><a href="#">我的揪團</a></li>
                </ul>
              </li>
              <li>
                <a href="#">找課程</a>
                <ul>
                  <li><a href="#">查詢課程</a></li>
                  <li><a href="#">我的課程</a></li>
                </ul>
              </li>
              <li>
                <a href="#">找場地</a>
                <ul>
                  <li><a href="#">詢找場地</a></li>
                  <li><a href="#">我的預約</a></li>
                  <li><a href="#">我的收藏</a></li>
                </ul>
              </li>
              <li>
                <a href="#">賣家入口</a>
                <ul>
                  <li><a href="#">所有訂單</a></li>
                  <li><a href="#">所有商品</a></li>
                  <li><a href="#">新增商品</a></li>
                  <li><a href="#">商品評論</a></li>
                </ul>
              </li>

              <li><a href="">商城</a></li>
              <li><a href="" style="color: red">登入</a></li>
            </ul>
          </nav>
        </div>
        <!-- End .container -->
      </div>
      <!-- End .header-bottom -->
    </header>


<!-- partial:index.partial.html -->
<div class="site">
	<div class="sketch">
		<div class="bee-sketch red"></div>
		<div class="bee-sketch blue"></div>
	</div>

<h1>Uh Oh:
	<small>Something went wrong!</small></h1>
</div>
<!-- partial -->




    
    
    



    <footer class="footer bg-dark"></footer>

    <div class="sticky-navbar"></div>
    <div class="mobile-menu-container"></div>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
    <script>
      //$("header").load("header.html");
      $("footer").load("${pageContext.request.contextPath}/forum/footer.html");
      $("div.sticky-navbar").load("sticky-navbar.html");
      $("div.mobile-menu-container").load("mobile-menu-container.html");
    </script>
</body>

</html>