<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>我的揪團 | ASAP</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template" />
    <meta name="author" content="SW-THEMES" />

    <!-- Favicon 網站圖示 -->
    <link
      rel="icon"
      type="image/x-icon"
      href="assets/images/icons/asapLOGO.png"
    />

    <script>
      WebFontConfig = {
        google: {
          families: [
            "Open+Sans:300,400,600,700,800",
            "Poppins:300,400,500,600,700",
            "Shadows+Into+Light:400",
            "Segoe+Script:300,400,500,600",
          ],
        },
      };
      (function (d) {
        var wf = d.createElement("script"),
          s = d.scripts[0];
        wf.src = "assets/js/webfont.js";
        wf.async = true;
        s.parentNode.insertBefore(wf, s);
      })(document);
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/demo2.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="assets/vendor/fontawesome-free/css/all.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="assets/css/mycss.css"
    />

  </head>

  <body>
    <div class="page-wrapper">
      <header class="header"></header>
      <!-- End .header -->

      <main class="main">
    </div>
        <div class="container">
          <nav aria-label="breadcrumb" class="breadcrumb-nav">
            <span class = "titlegroup1">我的揪團</span>
          </nav>
          <div class="row">
              <nav class="toolbox-sticky-header"data-sticky-options="{'mobile': true}">
                <div class="toolbox-right">
                  <div class="search_bar d-flex justify-content-between align-items-center">
                  
                      <button type="button" class="Btn_creategroup" id="creategroup_Btn">發起揪團</button>

                    <form id="search_formid" class="search_c" action="#" method="get">
                      <input type="search" name="search" id="search" class="search"  placeholder="搜尋">
                      <a id="searchBtn">搜尋</a>
                    </form>
                  </div>
                  <!-- End  .search_bar-->
                </div>
                <!-- End .toolbox-right -->
              </nav>
              
              <div class="row_products-group">
                 <!-- 活動列表 -->
                 <div class="col-6_col-sm-4">
                  <div class="product-default inner-quickview inner-icon">
                    <figure class="img-effect">
                      <a href="demo2-product.html">
                        <img
                          src="assets/images/myimg/pexels-amodita's-frame-18984959.jpg"
                          style="width: 263.533px; height: 263.533px;"
                          alt="product"
                        />
                      </a>
                      <a
                        href="#"
                        class="btn-quickview"
                        title="Quick View"
                        >詳細資訊</a
                      >
                    </figure>
                    <div class="product-details">
                      <div class="category-wrap">
                        <a
                          href="wishlist.html"
                          title="Wishlist"
                          class="btn-icon-wish"
                          >2/6</a>
                      </div>
                      <h3 class="product-title">
                        <a>籃球三對三</a>
                      </h3>
                      <div class="ratings-container">
                        <a><i class="fas fa-thumbtack"></i>
                          活動類別：籃球</a>
                        <br>
                        <a><i class="fas fa-thumbtack"></i>
                          活動日期：2023/10/16(日)</a>
                        <br>
                        <a><i class="fas fa-thumbtack"></i>
                          活動時間：下午13:00至15:00</a>
                        <br>
                        <a><i class="fas fa-thumbtack"></i>
                          活動地點：台北體育館</a>                   
                        </div>
                        <!-- End .product-ratings -->
                      </div>
                      <!-- End .product-container -->
                      <button type="button" class="Btn_allgrpXJoin">退出揪團</button>
                    </div>
                    <!-- End .product-details -->
                </div>
                <!-- End .col-6_col-sm-4 -->
                <div class="col-6_col-sm-4">
                 
                  <div class="product-default inner-quickview inner-icon">

                    <figure class="img-effect">
                      <a href="demo2-product.html">
                        <img
                          src="assets/images/myimg/pexels-amodita's-frame-18984959.jpg"
                          style="width: 263.533px; height: 263.533px;"
                          alt="product"
                        />
                      </a>
                      <a
                        href="#"
                        class="btn-quickview"
                        title="Quick View"
                        >詳細資訊</a
                      >
                    </figure>
                    <div class="orgmbr_grp">
                      <i class="fas fa-flag" id="fas_fa_flag"></i>我創建的揪團
                      </div>
                    <div class="product-details">
                      <div class="category-wrap">
                        <a
                          href="wishlist.html"
                          title="Wishlist"
                          class="btn-icon-wish"
                          >2/6</a>
                      </div>
                      <h3 class="product-title">
                        <a>籃球三對三</a>
                      </h3>
                      <div class="ratings-container">
                        <a><i class="fas fa-thumbtack"></i>
                          活動類別：籃球</a>
                        <br>
                        <a><i class="fas fa-thumbtack"></i>
                          活動日期：2023/10/16(日)</a>
                        <br>
                        <a><i class="fas fa-thumbtack"></i>
                          活動時間：下午13:00至15:00</a>
                        <br>
                        <a><i class="fas fa-thumbtack"></i>
                          活動地點：台北體育館</a>                   
                        </div>
                        <!-- End .product-ratings -->
                      </div>
                      <!-- End .product-container -->
                    </div>
                    <!-- End .product-details -->
                </div>
                <!-- End .col-6_col-sm-4 -->
              
              </div>  
              <!-- End .row_products-group -->
            <div class="toolbox toolbox-pagination">
              <div class="toolbox-item_toolbox-show">
                <label>頁數:</label>
                <!-- End .select-custom -->
              </div>
              <!-- End .toolbox-item -->

              <ul class="pagination toolbox-item">
                <li class="page-item disabled">
                  <a class="page-link page-link-btn" href="#"
                    ><i class="icon-angle-left"></i
                  ></a>
                </li>
                <li class="page-item active">
                  <a class="page-link" href="#"
                    >1 <span class="sr-only">(current)</span></a
                  >
                </li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><span class="page-link">...</span></li>
                <li class="page-item">
                  <a class="page-link page-link-btn" href="#"
                    ><i class="icon-angle-right"></i
                  ></a>
                </li>
              </ul>
            </div>
          <!-- End .row -->
        </div>
        <!-- End .container -->

        <!-- margin -->
      </main>
      <!-- End .main -->
</div>
    <!-- End .page-wrapper -->
      <footer class="footer bg-dark position-relative"></footer>
      <!-- End .footer -->
    

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

    <a id="scroll-top" href="#top" title="Top" role="button"
      ><i class="icon-angle-up"></i
    ></a>

    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/plugins.min.js"></script>
    <script src="assets/js/nouislider.min.js"></script>

    <!-- Main JS File -->
    <script src="assets/js/main.min.js"></script>

    <script>
      $("header").load("header.html");
      $("footer").load("footer.html");
      $("div.sticky-navbar").load("sticky-navbar.html");
      $("div.mobile-menu-container").load("mobile-menu-container.html");
    </script>
  </body>
</html>
