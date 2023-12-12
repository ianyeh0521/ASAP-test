<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"  %>
<%@ page import="com.asap.shop.entity.ItemInfoVO" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<title>AsapCart</title>

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
			<div class="container">
				<ul class="checkout-progress-bar d-flex justify-content-center flex-wrap">
					<li class="active">
						<a href="asapcart.html">購物車</a>
					</li>
					<li>
						<a href="asapordercheck.html">確認訂單</a>
					</li>
					<li class="disabled">
						<a href="cart.html">訂單完成</a>
					</li>
				</ul>

				<div class="row">
					<div class="col-lg-8">
						<div class="cart-table-container">
							<table class="table table-cart">
								<thead>
									<tr>
										<th class="thumbnail-col"></th>
										<th class="product-col">商品</th>
										<th class="price-col">價格</th>
										<th class="qty-col">數量</th>
										<th class="text-right">小計</th>
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
									  <td class="product-col">
										<h5 class="product-title">
										  <a href="asapshopproduct.html">足球</a>
										</h5>
									  </td>
									  <td class="price-col">$200</td>
									  <td>
										<div class="product-single-qty">
										  <input class="horizontal-quantity form-control" type="text" value="1" oninput="updateSubtotal(this)">
										</div><!-- End .product-single-qty -->
									  </td>
									  <td class="text-right"><span class="subtotal-price">$200</span></td>
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
										<td class="product-col">
											<h5 class="product-title">
												<a href="asapshopproduct.html">棒球帽</a>
											</h5>
										</td>
										<td>$400</td>
										<td>
											<div class="product-single-qty">
												<input class="horizontal-quantity form-control" type="text">
											</div><!-- End .product-single-qty -->
										</td>
										<td class="text-right"><span class="subtotal-price">$400</span></td>
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
										<td class="product-col">
											<h5 class="product-title">
												<a href="asapshopproduct.html">棒球</a>
											</h5>
										</td>
										<td>$10</td>
										<td>
											<div class="product-single-qty">
												<input class="horizontal-quantity form-control" type="text">
											</div><!-- End .product-single-qty -->
										</td>
										<td class="text-right"><span class="subtotal-price">$10</span></td>
									</tr>
								</tbody>


								<tfoot>
									<tr>
										<td colspan="5" class="clearfix">

											<div class="float-right">
												<a href="asapshop.html" class="btn btn-shop btn-update-cart">
													繼續購物
												</a>
											</div><!-- End .float-right -->
										</td>
									</tr>
								</tfoot>
							</table>
						</div><!-- End .cart-table-container -->
					</div><!-- End .col-lg-8 -->

					<div class="col-lg-4">
						<div class="cart-summary">
							<h3>購物車總計</h3>

								<table class="table table-mini-cart">
								  <thead>
									<tr>
										<th>商品</th>
										<th>價格</th>
										<th>數量</th>
										<th>小計</th>
									  </tr>
								  </thead>
								  <tbody>
									<tr>
										<td class="product-col">
										  <h3 class="product-title">
											棒球帽
										  </h3>
										</td>								
								  
										<td class="price-col">
											<span class="unit-price">$400.00</span>
										</td>
										<td class="price-col">
											<span class="quantity">2</span>
										</td>
										<td class="price-col">
											<span class="subtotal">$800.00</span>
										</td>
									  </tr>
				
									  <tr>
										<td class="product-col">
										  <h3 class="product-title">
											足球
										  </h3>
										</td>								
								  
										<td class="price-col">
											<span class="unit-price">$200.00</span>
										</td>
										<td class="price-col">
											<span class="quantity">2</span>
										</td>
										<td class="price-col">
											<span class="subtotal">$400.00</span>
										</td>
									  </tr>
								  </tbody>
								  <tfoot>
									<tr class="cart-subtotal">
										<td>
											<h4>商品小計</h4>
										  </td>
								  
										  <td class="price-col">
											<span class="total-subtotal">$1200.00</span>
										  </td>
									</tr>

								</tfoot>

							</table>

							<div class="checkout-methods">
								<a href="asapordercheck.html" class="btn btnoter-block btn-dark">&nbsp;&nbsp;&nbsp;確認訂單
									<i class="fa fa-arrow-right"></i></a>
							</div>
						</div><!-- End .cart-summary -->
					</div><!-- End .col-lg-4 -->
				</div><!-- End .row -->
			</div><!-- End .container -->

			<div class="mb-6"></div><!-- margin -->
		</main><!-- End .main -->

		<footer class="footer bg-dark">
			
		</footer><!-- End .footer -->
	</div><!-- End .page-wrapper -->


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