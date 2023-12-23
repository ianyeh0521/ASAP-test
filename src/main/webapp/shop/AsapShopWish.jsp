<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.shop.entity.ShoppingCartVO"%>
<%@ page import="com.asap.shop.service.ShoppingCartService_interface"%>
<%@ page import="com.asap.shop.service.ShoppingCartService"%>
<%@ page import="com.asap.shop.entity.ItemInfoVO"%>
<%@ page import="com.asap.shop.service.ItemInfoService_interface"%>
<%@ page import="com.asap.shop.service.ItemInfoService"%>
<!DOCTYPE html>
<html lang="en">

<%
// String shoppingCart = request.getParameter("mbrNo");
ShoppingCartService_interface ShoppingCartSvc = new ShoppingCartService();
ItemInfoService_interface ItemInfoSvc = new ItemInfoService();
List<ShoppingCartVO> list = ShoppingCartSvc.findByMember("M1");
pageContext.setAttribute("list", list);

System.out.println(list);
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>AsapShopWish</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/images/icons/favicon.png">


    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = '../assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">

    <!-- Main CSS File -->
    <link rel="stylesheet" href="../assets/css/style.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/vendor/fontawesome-free/css/all.min.css">
</head>

<body>
    <div class="page-wrapper">


        <header class="header">
            <div
            class="header-middle sticky-header"
            data-sticky-options="{'mobile': true}"
            style="
              height: 75px;
              background: rgb(255, 250, 85);
              background: linear-gradient(
                90deg,
                rgba(255, 250, 85, 0.9081757703081232) 0%,
                rgba(9, 34, 121, 0.8773634453781513) 35%,
                rgba(0, 212, 255, 1) 100%
              );
            "
          >
            <div class="container">
              <div class="header-left col-lg-2 w-auto pl-0">
                <button
                  class="mobile-menu-toggler text-primary mr-2"
                  type="button"
                >
                  <i class="fas fa-bars"></i>
                </button>
                <a href="#"  width="222"
                height="88">
                  <img
                    src="newImg/logo2.png"
                    
                    alt="Logo"
                  />
                </a>
              </div>
              <!-- End .header-left -->
            </div>
            <!-- End .container -->
          </div>
          <!-- End .header-middle -->
  
          <div
            class="header-bottom sticky-header d-none d-lg-block"
            data-sticky-options="{'mobile': false}"
          >
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
        </header><!-- End .header -->

        <main class="main">
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="AsapShop.jsp">商城首頁</a></li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    我的收藏
                                </li>
                            </ol>
                        </div>
                    </nav>

                    <h1>我的收藏</h1>
                </div>
                
            </div>

            <div class="container">
                <div class="wishlist-title">
                    <h2 class="p-2">我的收藏在ASAP二手商城</h2>
                </div>
                <div class="wishlist-table-container">
                    <table class="table table-wishlist mb-0">
                        <thead>
                            <tr>
                                <th class="thumbnail-col"></th>
                                <th class="product-col">商品名稱</th>
                                <th class="price-col">商品編號</th>
                                <th class="status-col">商品狀態</th>
                                <th class="action-col">功能</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="product-row">
                                <td>
                                    <figure class="product-image-container">
                                        <a href="asapshopproduct.html" class="product-image">
                                            <img src="../assets/images/asapshop/football.jpg" alt="product">
                                        </a>

                                        <a href="#" class="btn-remove icon-cancel" title="Remove Product"></a>
                                    </figure>
                                </td>
                                <td>
                                    <h5 class="product-title">
                                        <a href="asapshopproduct.html">足球</a>
                                    </h5>
                                </td>
                                <td class="price-box">#1001</td>

                                <td>
                                    <span class="stock-status">有庫存</span>
                                </td>
                                <td class="action">
                                    <a href="ajax/asapproduct-quick-view.html" class="btn btn-quickview mt-1 mt-md-0"
                                        title="Quick View">快速查看</a>
                                    <button class="btn btn-dark btn-add-cart product-type-simple btn-shop">
                                        加入購物車
                                    </button>
                                </td>
                            </tr>

                            <tr class="product-row">
                                <td>
                                    <figure class="product-image-container">
                                        <a href="asapshopproduct.html" class="product-image">
                                            <img src="../assets/images/asapshop/baseballhat2.jpg" alt="product">
                                        </a>

                                        <a href="#" class="btn-remove icon-cancel" title="Remove Product"></a>
                                    </figure>
                                </td>
                                <td>
                                    <h5 class="product-title">
                                        <a href="asapshopproduct.htm">棒球帽</a>
                                    </h5>
                                </td>
                                <td class="price-box">#1002</td>
                                <td>
                                    <span class="stock-status">售完</span>
                                </td>
                                <td class="action">
                                    <a href="ajax/asapproduct-quick-view.html" class="btn btn-quickview mt-1 mt-md-0"
                                        title="Quick View">快速查看</a>
                                    <button class="btn btn-dark btn-add-cart product-type-simple btn-shop">
                                        加入購物車
                                    </button>
                                </td>
                            </tr>

                            <tr class="product-row">
                                <td>
                                    <figure class="product-image-container">
                                        <a href="asapshopproduct.html" class="product-image">
                                            <img src="../assets/images/asapshop/baseball.jpg" alt="product">
                                        </a>

                                        <a href="#" class="btn-remove icon-cancel" title="Remove Product"></a>
                                    </figure>
                                </td>
                                <td>
                                    <h5 class="product-title">
                                        <a href="asapshopproduct.htm">棒球</a>
                                    </h5>
                                </td>
                                <td class="price-box">#1003</td>
                                <td>
                                    <span class="stock-status">售完</span>
                                </td>
                                <td class="action">
                                    <a href="ajax/asapproduct-quick-view.html" class="btn btn-quickview mt-1 mt-md-0"
                                        title="Quick View">快速查看</a>
                                    <button class="btn btn-dark btn-add-cart product-type-simple btn-shop">
                                        加入購物車
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div><!-- End .cart-table-container -->
            </div><!-- End .container -->
        </main><!-- End .main -->

        <footer class="footer bg-dark">
            
        </footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->

    <div class="loading-overlay">
        <div class="bounce-loader">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <div class="mobile-menu-container">
 
    </div><!-- End .mobile-menu-container -->

    <div class="sticky-navbar">
    
    </div>



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="../assets/js/main.min.js"></script>

    <script>

        $("footer").load("footer.html");
        $("div.sticky-navbar").load("sticky-navbar.html");
        $("div.mobile-menu-container").load("mobile-menu-container.html");
      </script>
</body>

</html>