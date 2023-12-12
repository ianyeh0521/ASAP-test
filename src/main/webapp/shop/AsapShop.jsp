<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"  %>
<%@ page import="com.asap.shop.entity.ItemInfoVO" %>
<%@ page import="com.asap.shop.service.ItemInfoService_interface" %>
<%@ page import="com.asap.shop.service.ItemInfoService" %>
<!DOCTYPE html>

<%
    ItemInfoService_interface ItemSvc = new ItemInfoService();
 	List<ItemInfoVO> list = ItemSvc.getAllItemInfo();
    pageContext.setAttribute("list",list);
    System.out.println(list);
%>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>ASAP-SHOP</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template" />
    <meta name="author" content="SW-THEMES" />

    <!-- Favicon -->
    <link
      rel="icon"
      type="image/x-icon"
      href="../assets/images/icons/favicon.png"
    />

    <script>
      WebFontConfig = {
        google: {
          families: [
            "Open+Sans:300,400,600,700,800,400italic,800italic",
            "Poppins:300,400,500,600,700,800",
            "Oswald:300,400,500,600,700,800",
          ],
        },
      };
      (function (d) {
        var wf = d.createElement("script"),
          s = d.scripts[0];
        wf.src = "../assets/js/webfont.js";
        wf.async = true;
        s.parentNode.insertBefore(wf, s);
      })(document);
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />

    <!-- Main CSS File -->
    <link rel="stylesheet" href="../assets/css/demo41.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/vendor/fontawesome-free/css/all.min.css"
    />
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
              <a href="#" width="222" height="88">
                <img src="newImg/logo2.png" alt="Logo" />
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
      </header>
      <!-- End .header -->
      <div class="header-middle">
        <div class="container">
          <div class="header-right w-lg-max">
            <div
              class="header-search header-search-inline header-search-category d-lg-block d-none text-right mt-0"
            >
              <a href="#" class="search-toggle" role="button"
                ><i class="icon-magnifier"></i
              ></a>
				              <form action="ItemInfoServlet" method="get">
				    <div class="header-search-wrapper">
				        <input
				            type="search"
				            class="form-control"
				            name="q"
				            id="q"
				            placeholder="尋找想要的商品吧!"
				            required=""
				        />
				        <button
				            class="btn icon-magnifier p-0"
				            title="搜尋"
				            type="submit"
				        ></button>
				    </div>
				    <!-- End .header-search-wrapper -->
				</form>
            </div>

            <a
              href="AsapShopWish.jsp"
              class="header-icon position-relative"
              title="我的收藏"
              ><i class="icon-wishlist-2"></i>
              <span class="cart-count badge-circle">3</span></a
            >

            <div class="dropdown cart-dropdown">
              <a
                href="#"
                title="購物車"
                class="dropdown-toggle cart-toggle"
                role="button"
                data-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
                data-display="static"
              >
                <i class="icon-cart-thick"></i>
                <span class="cart-count badge-circle">2</span>
              </a>

              <div class="cart-overlay"></div>

              <div class="dropdown-menu mobile-cart">
                <a href="#" title="Close (Esc)" class="btn-close">×</a>

                <div class="dropdownmenu-wrapper custom-scrollbar">
                  <div class="dropdown-cart-header">購物車</div>
                  <!-- End .dropdown-cart-header -->

                  <div class="dropdown-cart-products">
                    <div class="product">
                      <div class="product-details">
                        <h4 class="product-title">
                          <a href="AsapShopProduct.jsp">足球</a>
                        </h4>

                        <span class="cart-product-info">
                          <span class="cart-product-qty">1</span>
                          × $200.00
                        </span>
                      </div>
                      <!-- End .product-details -->

                      <figure class="product-image-container">
                        <a href="AsapShopProduct.jsp" class="product-image">
                          <img
                            src="../assets/images/asapshop/football.jpg"
                            alt="product"
                            width="80"
                            height="80"
                          />
                        </a>

                        <a href="#" class="btn-remove" title="Remove Product"
                          ><span>×</span></a
                        >
                        <!-- 取消商品的動作 -->
                      </figure>
                    </div>
                    <!-- End .product -->

                    <div class="product">
                      <div class="product-details">
                        <h4 class="product-title">
                          <a href="AsapShopProduct.jsp">棒球帽</a>
                        </h4>

                        <span class="cart-product-info">
                          <span class="cart-product-qty">3</span>
                          × $400.00
                        </span>
                      </div>
                      <!-- End .product-details -->

                      <figure class="product-image-container">
                        <a href="AsapShopProduct.jsp" class="product-image">
                          <img
                            src="../assets/images/asapshop/baseballhat2.jpg"
                            alt="product"
                            width="80"
                            height="80"
                          />
                        </a>

                        <a href="#" class="btn-remove" title="Remove Product"
                          ><span>×</span></a
                        >
                        <!-- 取消商品的動作 -->
                      </figure>
                    </div>
                    <!-- End .product -->
                  </div>
                  <!-- End .cart-product -->

                  <div class="dropdown-cart-total">
                    <span>小計:</span>

                    <span class="cart-total-price float-right">$1,400.00</span>
                  </div>
                  <!-- End .dropdown-cart-total -->

                  <div class="dropdown-cart-action">
                    <a
                      href="AsapCart.jsp"
                      class="btn btn-gray btn-block view-cart"
                      >查看購物車</a
                    >
                    <a href="AsapOrderCheck.jsp" class="btn btn-dark btn-block"
                      >確認訂單</a
                    >
                  </div>
                  <!-- End .dropdown-cart-total -->
                </div>
                <!-- End .dropdownmenu-wrapper -->
              </div>
              <!-- End .dropdown-menu -->
            </div>
            <!-- End .dropdown -->
          </div>
          <!-- End .header-right -->
        </div>
        <!-- End .container -->
      </div>
      <!-- End .header-middle -->
      <main class="main">
        <div class="container">

          <div class="row">
            <div class="col-lg-9 main-content">
              <nav
                class="toolbox sticky-header"
                data-sticky-options="{'mobile': true}"
              >
                <div class="toolbox-left">

                  <div class="toolbox-item toolbox-sort">
                    <label>排序方式:</label>

                    <div class="select-custom">
                      <select name="orderby" class="form-control orderby">
                        <option value="menu" >請選擇</option>
                        
                        <option value="menu_order" >最新上架</option>
                        
                        <option value="true">價格:高到低</option>
                        
                        <option value="false">價格:低到高</option>
                        
                        <option value="view_order">瀏覽人數</option>

                      </select>
                    </div>
                    <!-- End .select-custom -->
                  </div>
                  <!-- End .toolbox-item -->
                </div>
                <!-- End .toolbox-left -->
              </nav>

              <div class="row"  id="roworder">
              <c:forEach var="ItemInfoVO" items="${list}">
                <div class="col-6 col-sm-3">
                  <div class="product-default inner-quickview inner-icon">
                    <figure>
                      <a href="AsapShopProduct.jsp">
                        <img
                          src="../assets/images/asapshop/football.jpg"
                          width="300"
                          height="300"
                          alt="product"
                        />
                      </a>
                      <div class="label-group">
                        <span class="product-label label-sale">-50%</span>
                      </div>

                      <a
                        href="ProductQuickView.html"
                        class="btn-quickview"
                        title="快速查看"
                        >快速查看</a
                      >
                    </figure>
                    <div class="product-details">
                      <div class="category-wrap">
                        <div class="category-list">
                          <span>${ItemInfoVO.itemName}</span>、<span>${ItemInfoVO.itemTypeNo}</span>、<span>${ItemInfoVO.itemStatNo}</span>
                        </div>
                        <a
                          href="AsapShopWish.jsp"
                          class="btn-icon-wish"
                          title="加入收藏"
                          ><i class="icon-heart"></i
                        ></a>
                      </div>
                      <h3 class="product-title">
                        <a href="AsapShopProduct.jsp" ><span>${ItemInfoVO.itemName}</span></a>
                        瀏覽人數:<span>${ItemInfoVO.itemView}</span>
                      </h3>
                      <div class="product-buttons">
                        <a href="AsapCart.jsp" class="btn-icon-cart" title="加入購物車"><i class="icon-shopping-cart"></i> 加入購物車</a>
                    </div>
       
						<div class="price-box">
						    <c:if test="${ItemInfoVO.preItemPrice != 0}">
						        <del class="old-price">${ItemInfoVO.preItemPrice}</del>
						    </c:if>
						    <span class="product-price">${ItemInfoVO.itemPrice}</span>
						</div>

                    </div>
               
                  </div>
                </div>
				</c:forEach>
				
              </div>
              <!-- End .row -->

              <nav class="toolbox toolbox-pagination">
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
                  <li class="page-item">
                    <a class="page-link page-link-btn" href="#"
                      ><i class="icon-angle-right"></i
                    ></a>
                  </li>
                </ul>
              </nav>
            </div>
            <!-- End .col-lg-9 -->

            <div class="sidebar-overlay"></div>
            <aside class="sidebar-shop col-lg-3 order-lg-first mobile-sidebar">
              <div class="sidebar-wrapper">
                <div class="widget">
                  <h3 class="widget-title">
                    <a
                      data-toggle="collapse"
                      href="#widget-body-2"
                      role="button"
                      aria-expanded="true"
                      aria-controls="widget-body-2"
                      >商品分類</a
                    >
                  </h3>

                  <div class="collapse show" id="widget-body-2">
                    <div class="widget-body">
                      <ul class="cat-list">
                        <li>
                          <a
                          href="#widget-category-1"
                          data-toggle="collapse"
                          role="button"
                          aria-expanded="true"
                          aria-controls="widget-category-1"
                      >
                          運動類型<span class="products-count">(3)</span>
                          <span class="toggle"></span>
                      </a>
                      <div class="collapse show" id="widget-category-1">
                          <div class="row">
                              <div class="col-md-6">
                                  <ul class="cat-sublist">
                                      <li><a href="#">游泳<span class="products-count">(3)</span></a></li>
                                      <li><a href="#">棒球<span class="products-count">(2)</span></a></li>
                                      <li><a href="#">網球<span class="products-count">(0)</span></a></li>
                                      <li><a href="#">手球<span class="products-count">(0)</span></a></li>
                                      <li><a href="#">籃球<span class="products-count">(0)</span></a></li>
                                      <li><a href="#">排球<span class="products-count">(0)</span></a></li>
                                  </ul>
                              </div>
                              <div class="col-md-6">
                                  <ul class="cat-sublist">
                                      <li><a href="#">桌球<span class="products-count">(0)</span></a></li>
                                      <li><a href="#">羽球<span class="products-count">(0)</span></a></li>
                                      <li><a href="#">跑步<span class="products-count">(15)</span></a></li>
                                      <li><a href="#">自行車<span class="products-count">(0)</span></a></li>
                                      <li><a href="#">足球<span class="products-count">(1)</span></a></li>
                                      <li><a href="#">高爾夫<span class="products-count">(0)</span></a></li>
                                  </ul>
                              </div>
                          </div>
                      </div>

                        <li>
                          <a
                            href="#widget-category-2"
                            class="collapsed"
                            data-toggle="collapse"
                            role="button"
                            aria-expanded="false"
                            aria-controls="widget-category-2"
                          >
                            服裝尺寸<span class="products-count">(4)</span>
                            <span class="toggle"></span>
                          </a>
                          <div class="collapse" id="widget-category-2">
                            <ul class="cat-sublist">
                              <li>
                                <a href="#"
                                  >XS<span class="products-count"
                                    >(3)</span
                                  ></a
                                >
                              </li>
                              <li>
                                <a href="#"
                                  >S<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                              <li>
                                <a href="#"
                                  >M<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                              <li>
                                <a href="#"
                                  >L<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                              <li>
                                <a href="#"
                                  >XL<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                            </ul>
                          </div>
                        </li>

                        <li>
                          <a
                            href="#widget-category-3"
                            class="collapsed"
                            data-toggle="collapse"
                            role="button"
                            aria-expanded="false"
                            aria-controls="widget-category-3"
                          >
                            商品狀態<span class="products-count">(4)</span>
                            <span class="toggle"></span>
                          </a>
                          <div class="collapse" id="widget-category-3">
                            <ul class="cat-sublist">
                              <li>
                                <a href="#"
                                  >全新<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                              <li>
                                <a href="#"
                                  >幾乎全新<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                              <li>
                                <a href="#"
                                  >狀況良好<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                              <li>
                                <a href="#"
                                  >狀況尚可<span class="products-count"
                                    >(1)</span
                                  ></a
                                >
                              </li>
                            </ul>
                          </div>
                        </li>

                      </ul>
                    </div>
                    <!-- End .widget-body -->
                  </div>
                  <!-- End .collapse -->
                </div>
                <!-- End .widget -->

                <div class="widget">
                  <h3 class="widget-title">
                    <a
                      data-toggle="collapse"
                      href="#widget-body-3"
                      role="button"
                      aria-expanded="true"
                      aria-controls="widget-body-3"
                      >價格範圍</a
                    >
                  </h3>

                  <div class="collapse show" id="widget-body-3">
                    <div class="widget-body pb-0">
                      <form action="#">
                        <div class="price-slider-wrapper">
                          <div id="price-slider"></div>
                          <!-- End #price-slider -->
                        </div>
                        <!-- End .price-slider-wrapper -->

                        <div
                          class="filter-price-action d-flex align-items-center justify-content-between flex-wrap"
                        >
                          <div class="filter-price-text">
                            價格:
                            <span id="filter-price-range"></span>
                          </div>
                          <!-- End .filter-price-text -->

                          <button type="submit" class="btn btn-primary">
                            篩選
                          </button>
                        </div>
                        <!-- End .filter-price-action -->
                      </form>
                    </div>
                    <!-- End .widget-body -->
                  </div>
                  <!-- End .collapse -->
                </div>
                <!-- End .widget -->

                <div class="widget widget-featured">
                  <h3 class="widget-title">商品推薦</h3>

                  <div class="widget-body">
                    <div class="owl-carousel widget-featured-products">
                      <div class="featured-col">
                        <div
                          class="product-default left-details product-widget"
                        >
                          <figure>
                            <a href="AsapShopProduct.jsp">
                              <img
                                src="../assets/images/demoes/demo41/product/product1-300x300.jpg"
                                width="75"
                                height="75"
                                alt="product"
                              />
                            </a>
                          </figure>
                          <div class="product-details">
                            <h3 class="product-title">
                              <a href="AsapShopProduct.jsp"
                                >Product Short Name</a
                              >
                            </h3>
                            <div class="ratings-container">
                              <div class="product-ratings">
                                <span
                                  class="ratings"
                                  style="width: 100%"
                                ></span>
                                <!-- End .ratings -->
                                <span class="tooltiptext tooltip-top"></span>
                              </div>
                              <!-- End .product-ratings -->
                            </div>
                            <!-- End .product-container -->
                            <div class="price-box">
                              <span class="product-price">$7.00</span>
                            </div>
                            <!-- End .price-box -->
                          </div>
                          <!-- End .product-details -->
                        </div>
                        <div
                          class="product-default left-details product-widget"
                        >
                          <figure>
                            <a href="AsapShopProduct.jsp">
                              <img
                                src="../assets/images/demoes/demo41/product/product2-300x300.jpg"
                                width="75"
                                height="75"
                                alt="product"
                              />
                            </a>
                          </figure>
                          <div class="product-details">
                            <h3 class="product-title">
                              <a href="AsapShopProduct.jsp"
                                >Product Short Name</a
                              >
                            </h3>
                            <div class="ratings-container">
                              <div class="product-ratings">
                                <span
                                  class="ratings"
                                  style="width: 100%"
                                ></span>
                                <!-- End .ratings -->
                                <span class="tooltiptext tooltip-top"></span>
                              </div>
                              <!-- End .product-ratings -->
                            </div>
                            <!-- End .product-container -->
                            <div class="price-box">
                              <span class="product-price">$19.00</span>
                            </div>
                            <!-- End .price-box -->
                          </div>
                          <!-- End .product-details -->
                        </div>
                        <div
                          class="product-default left-details product-widget"
                        >
                          <figure>
                            <a href="AsapShopProduct.jsp">
                              <img
                                src="../assets/images/demoes/demo41/product/product3-300x300.jpg"
                                width="75"
                                height="75"
                                alt="product"
                              />
                            </a>
                          </figure>
                          <div class="product-details">
                            <h3 class="product-title">
                              <a href="AsapShopProduct.jsp"
                                >Product Short Name</a
                              >
                            </h3>
                            <div class="ratings-container">
                              <div class="product-ratings">
                                <span
                                  class="ratings"
                                  style="width: 100%"
                                ></span>
                                <!-- End .ratings -->
                                <span class="tooltiptext tooltip-top"></span>
                              </div>
                              <!-- End .product-ratings -->
                            </div>
                            <!-- End .product-container -->
                            <div class="price-box">
                              <span class="product-price">$49.00</span>
                            </div>
                            <!-- End .price-box -->
                          </div>
                          <!-- End .product-details -->
                        </div>
                      </div>
                      <!-- End .featured-col -->

                      <div class="featured-col">
                        <div
                          class="product-default left-details product-widget"
                        >
                          <figure>
                            <a href="AsapShopProduct.jsp">
                              <img
                                src="../assets/images/demoes/demo41/product/product4-300x300.jpg"
                                width="75"
                                height="75"
                                alt="product"
                              />
                            </a>
                          </figure>
                          <div class="product-details">
                            <h3 class="product-title">
                              <a href="AsapShopProduct.jsp"
                                >Product Short Name</a
                              >
                            </h3>
                            <div class="ratings-container">
                              <div class="product-ratings">
                                <span
                                  class="ratings"
                                  style="width: 100%"
                                ></span>
                                <!-- End .ratings -->
                                <span class="tooltiptext tooltip-top"></span>
                              </div>
                              <!-- End .product-ratings -->
                            </div>
                            <!-- End .product-container -->
                            <div class="price-box">
                              <span class="product-price">$19.00</span>
                            </div>
                            <!-- End .price-box -->
                          </div>
                          <!-- End .product-details -->
                        </div>
                        <div
                          class="product-default left-details product-widget"
                        >
                          <figure>
                            <a href="AsapShopProduct.jsp">
                              <img
                                src="../assets/images/demoes/demo41/product/product5-300x300.jpg"
                                width="75"
                                height="75"
                                alt="product"
                              />
                            </a>
                          </figure>
                          <div class="product-details">
                            <h3 class="product-title">
                              <a href="AsapShopProduct.jsp"
                                >Product Short Name</a
                              >
                            </h3>
                            <div class="ratings-container">
                              <div class="product-ratings">
                                <span
                                  class="ratings"
                                  style="width: 100%"
                                ></span>
                                <!-- End .ratings -->
                                <span class="tooltiptext tooltip-top"></span>
                              </div>
                              <!-- End .product-ratings -->
                            </div>
                            <!-- End .product-container -->
                            <div class="price-box">
                              <span class="product-price">$24.00</span>
                            </div>
                            <!-- End .price-box -->
                          </div>
                          <!-- End .product-details -->
                        </div>
                        <div
                          class="product-default left-details product-widget"
                        >
                          <figure>
                            <a href="AsapShopProduct.jsp">
                              <img
                                src="../assets/images/demoes/demo41/product/product6-300x300.jpg"
                                width="75"
                                height="75"
                                alt="product"
                              />
                            </a>
                          </figure>
                          <div class="product-details">
                            <h3 class="product-title">
                              <a href="AsapShopProduct.jsp"
                                >Product Short Name</a
                              >
                            </h3>
                            <div class="ratings-container">
                              <div class="product-ratings">
                                <span
                                  class="ratings"
                                  style="width: 100%"
                                ></span>
                                <!-- End .ratings -->
                                <span class="tooltiptext tooltip-top"></span>
                              </div>
                              <!-- End .product-ratings -->
                            </div>
                            <!-- End .product-container -->
                            <div class="price-box">
                              <span class="product-price">$11.00</span>
                            </div>
                            <!-- End .price-box -->
                          </div>
                          <!-- End .product-details -->
                        </div>
                      </div>
                      <!-- End .featured-col -->
                    </div>
                    <!-- End .widget-featured-slider -->
                    <!-- End .widget -->
                  </div>
                </div>

                <div class="widget widget-block">
                  <h3 class="widget-title">親愛的購物好友</h3>
                  <p>
                    歡迎來到ASAP二手商城！這裡有各種令人驚喜的二手物品等著您發現。與友善賣家互動，輕鬆購物，開啟您的寶藏之旅。安全、方便，期待為您帶來愉快的購物體驗！
                  </p>
                </div>
              </div>
              <!-- End .widget -->
            </aside>
            <!-- End .col-lg-3 -->
          </div>
          <!-- End .row -->
        </div>
        <!-- End .container -->

        <div class="mb-4"></div>
        <!-- margin -->
      </main>
      <!-- End .main -->

      <footer class="footer"></footer>
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

    <div class="mobile-menu-container"></div>
    <!-- End .mobile-menu-container -->

    <div class="sticky-navbar"></div>

    <a id="scroll-top" href="#top" title="Top" role="button"
      ><i class="icon-angle-up"></i
    ></a>

    <!-- Plugins JS File -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.bundle.min.js"></script>
    <script src="../assets/js/optional/isotope.pkgd.min.js"></script>
    <script src="../assets/js/plugins.min.js"></script>
    <script src="../assets/js/jquery.appear.min.js"></script>
    <script src="../assets/js/jquery.plugin.min.js"></script>
    <script src="../assets/js/nouislider.min.js"></script>
    <!-- Main JS File -->
    <script src="../assets/js/main.min.js"></script>

    <script>
      $("footer").load("footer.html");
      $("div.sticky-navbar").load("sticky-navbar.html");
      $("div.mobile-menu-container").load("mobile-menu-container.html");
      
      $("select.orderby").on("change", function() {
    	    var orderby = $(".orderby").val();
    	    var form_data = {};

    	    if (orderby === "view_order") {
    	        form_data.action = "view_order";
    	    } else if (orderby === "true") {
    	        form_data.action = "orderby";
    	        form_data.Itemsort = true;
    	    } else if (orderby === "false") {
    	        form_data.action = "orderby";
    	        form_data.Itemsort = false;
    	    } else {

    	        form_data.action = "other_action"; 
    	    }	    
    	    
    	  $.ajax({
    		  url : "ItemInfoServlet",
    		  type : "POST",
    		  data : form_data,
    		  dataType: "json",
    		  success : function(data) {
    			  console.log(data);
        		  $("div#roworder").children("div").animate({
                      "opacity": 0
                    }, 0, "swing", function(){
                      $(this).remove();
                    });
        		  var itemsorthtml = "";
        		  for(let itemabc in data){
        			  itemsorthtml=`<div class="col-6 col-sm-3">
                          <div class="product-default inner-quickview inner-icon">
                          <figure>
                            <a href="AsapShopProduct.jsp">
                              <img
                                src="../assets/images/asapshop/football.jpg"
                                width="300"
                                height="300"
                                alt="product"
                              />
                            </a>
                            <div class="label-group">
                              <span class="product-label label-sale">-50%</span>
                            </div>

                            <a
                              href="ProductQuickView.html"
                              class="btn-quickview"
                              title="快速查看"
                              >快速查看</a
                            >
                          </figure>
                          <div class="product-details">
                            <div class="category-wrap">
                              <div class="category-list">
                                <span>\${data[itemabc]["itemName"]}</span><span>\${data[itemabc]["itemTypeNo"]}</span>,
                                <a href="#">狀況尚可</a>
                                
                              </div>
                              <a
                                href="AsapShopWish.jsp"
                                class="btn-icon-wish"
                                title="加入收藏"
                                ><i class="icon-heart"></i
                              ></a>
                            </div>
                            <h3 class="product-title">
                            <span>\${data[itemabc]["itemName"]}</span><br>
                            瀏覽人數: <span>\${data[itemabc]["itemView"]}</span>
                            </h3>
                            <div class="product-buttons">
                              <a href="AsapCart.jsp" class="btn-icon-cart" title="加入購物車"><i class="icon-shopping-cart"></i> 加入購物車</a>
                          
                          </div>

                            <div class="price-box">
                              <del class="old-price">$400.00</del>
                              <span class="product-price">\${data[itemabc]["itemPrice"]}</span>
                            </div>
         
                          </div>
                  
                        </div>
                      </div>`     
                      $("div#roworder").append(itemsorthtml)
        		  
        		  }
    		  },
    	  });
      })
      
      
      //搜尋功能
      (document).ready(function() {
    $("form").on("submit", function(event) {
        event.preventDefault(); // 阻止表单默认提交行为
        var searchQuery = $("#q").val(); // 获取搜索关键词
        $.ajax({
            url: "ItemInfoServlet", // Servlet URL
            type: "GET", // 使用GET方法
            data: { q: searchQuery }, // 传递搜索参数
            dataType: "json",
            success: function(data) {
                $("div#roworder").empty(); // 清空当前商品列表
                var itemsHtml = "";
                $.each(data, function(index, item) {
                    // 根据返回的数据构建商品HTML
                    // 此处需要根据您的数据结构和HTML结构进行调整
                    itemsHtml += `<div class="col-6 col-sm-3">
                        <div class="product-default inner-quickview inner-icon">
                        <figure>
                            <a href="AsapShopProduct.jsp">
                                <img src="${item.imagePath}" width="300" height="300" alt="product"/>
                            </a>
                            <div class="label-group">
                                <span class="product-label label-sale">-50%</span>
                            </div>
                            <a href="ProductQuickView.html" class="btn-quickview" title="快速查看">快速查看</a>
                        </figure>
                        <div class="product-details">
                            <div class="category-wrap">
                                <div class="category-list">
                                    <span>${item.itemName}</span>, <span>${item.itemTypeNo}</span>, <a href="#">狀況尚可</a>
                                </div>
                                <a href="AsapShopWish.jsp" class="btn-icon-wish" title="加入收藏"><i class="icon-heart"></i></a>
                            </div>
                            <h3 class="product-title">
                                <span>${item.itemName}</span><br>
                                瀏覽人數: <span>${item.itemView}</span>
                            </h3>
                            <div class="product-buttons">
                                <a href="AsapCart.jsp" class="btn-icon-cart" title="加入購物車"><i class="icon-shopping-cart"></i> 加入購物車</a>
                            </div>
                            <div class="price-box">
                                <del class="old-price">$${item.preItemPrice}</del>
                                <span class="product-price">$${item.itemPrice}</span>
                            </div>
                        </div>
                    </div>
                </div>`;
                });
                $("div#roworder").html(itemsHtml); // 更新页面内容
            }
        });
    });
});
   

      
    </script>
  </body>
</html>