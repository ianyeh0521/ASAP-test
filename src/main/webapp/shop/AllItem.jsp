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

    <title>所有商品</title>


    <!-- Favicon -->
    <link rel="icon" type="image/png" href="assets/images/icons/favicon.png">

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/fontawesome-free/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
        }

        img {
            max-width: 100%;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h2 {
            color: #333;
            margin: 60px 0 20px 0;
        }

        /* ============= 賣家簡介區域樣式 =============== */
        #seller-intro {
            border: 1px solid #ddd;
            height: 190px;
            padding: 20px;
            margin: 20px 0;
            position: relative;
            display: flex;
            justify-content: start;
        }

        .left,
        .right {
            /* border: 1px solid rgb(185, 16, 16); */
            margin: 0 20px;
        }

        h3 {
            margin: 0;
        }

        p {
            margin: 0;
            margin-top: 10px;
        }

        span.rating {
            font-size: 24px;
            color: #ecd243;
        }

        .text {
            margin-top: 10px;
            width: 700px;
            letter-spacing: 1px;
        }

        #edit-btn {
            background-color: #5F5F5F;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            position: absolute;
            bottom: 15px;
            right: 100px;
        }

        #edit-btn:hover {
            background-color: #989898;
        }

        #preview-btn {
            background-color: #5F5F5F;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            position: absolute;
            bottom: 15px;
            right: 15px;
        }

        #preview-btn:hover {
            background-color: #989898;
        }

        h2 {
            margin: 40px 0 20px 0;
        }

        /* ========= 搜尋列樣式 =============== */
        #search-bar {
            display: inline-block;
            left: 0;
            margin: 10px auto;
            padding: 10px 0;
        }

        #search-input {
            width: 400px;
            padding: 10px;
            border: 1px solid rgb(22, 22, 152);
            border-radius: 5px;
            background-color: rgba(240, 240, 240, 0.5);
        }

        #search-category {
            border: 1px solid rgb(140, 140, 177);
            height: 42px;
            margin: 0 10px;
            padding: 10px;
            border-radius: 5px;
            background-color: rgba(240, 240, 240, 0.5);
        }

        .btn {
            background-color: rgba(52, 152, 219, 0.8);
            height: 42px;
            text-align: center;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: rgba(41, 128, 185, 0.8);
        }


        /* ============ 新增、刪除、修改按鈕 ========= */

        div.btns {
            display: flex;
            justify-content: space-between;
        }

        .add-product-btn,
        .edit-btn {
            background-color: rgb(44, 96, 151);
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 8px;
        }

        .add-product-btn:hover,
        .edit-btn:hover {
            background-color: #456ba0;
        }

        .delete-btn {
            background-color: maroon;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 20px;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }

        /* =============== 商品列表樣式 ================== */
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
            margin-bottom: 200px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        img {
            max-width: 70px;
            height: auto;

            /* 解決圖片底部空白的問題 */
            display: block;
            /* 在水平方向上置中 */
            margin: 0 auto;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        input[type="checkbox"] {
            transform: scale(1.5);
        }
    </style>
</head>

<body>
    <div class="page-wrapper">
        <header class="header"><div
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

        <main>
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="demo4.html">首頁</a></li>
                                <li class="breadcrumb-item"><a href="category.html">賣家入口</a></li>
                            </ol>
                        </div>
                    </nav>
                    <h1>所有商品</h1>
                </div>
            </div>
        </main>
        <!-- End .main -->

        <!-- 賣家簡介區域 -->
        <div id="seller-intro">
            <div class="left">
                <h3 class="id_name">tibame2023</h3>
                <div class="seller-info">
                    <p>評分 : <span class="rating">4.5</span> (100)</p>
                    <p>加入日期 : 2023年11月1日</p>
                </div>
            </div>
            <div class="right">
                <h3>賣場簡介</h3>
                <div class="text">
                    這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。
                </div>
                <button id="edit-btn">編輯</button>
                <button id="preview-btn">預覽</button>
            </div>
        </div>

    </div>

    <h2>商品列表</h2>
	<h2>查詢系統</h2>
	<form action="${pageContext.request.contextPath}/shop/shop.do"  method="post">
	<input type="hidden"  name="action" value="getAll" />
	<button type="submit" >查詢所有商品</button>
	
	</form>
	
	<br><br>
    <!-- 新增刪除和修改按鈕 -->
    <div class="btns">
        <div class="btn_left">
            <a href="./additems.html"><button class="add-product-btn">新增商品</button></a>
            <button class="edit-btn">修改商品</button>
        </div>
        <div class="btn_right">
            <button class="delete-btn">刪除商品</button>
        </div>
    </div>

    <!-- 搜尋列 -->
    <div id="search-bar">
        <input type="text" id="search-input" placeholder="輸入搜尋關鍵字">
        <select id="search-category">
            <option value="category1">分類1</option>
            <option value="category2">分類2</option>
            <option value="category3">分類3</option>
        </select>
        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
    </div>

    <!-- 商品列表 -->
    <table>
        <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>商品名稱</th>
                <th>封面圖片</th>
                <th>商品編號</th>
                <th>價格</th>
                <th>前一次價格</th>
                <th>尺寸</th>
                <th>庫存</th>
                <th>類別</th>
                <th>上架狀態</th>
            </tr>
        </thead>
        <tbody>
        <c:if test="${not empty itemlist }">
        
        <c:forEach var="item"  items="${itemlist}">
        <tr>
                <td><input type="checkbox"></td>
                <td>${item.getItemName() }</td>
                <td>${item.itemName }</td>
                <td>${item.itemName }</td>
                <td>${item.itemName }</td>
                <td>$450</td>
                <td>大</td>
                <td>100</td>
                <td>類別A</td>
                <td>已上架</td>
            </tr>
            </c:forEach>
        </c:if>
            
            <tr>
                <td><input type="checkbox"></td>
                <td>壺鈴</td>
                <td><img src="./newImg/800x.webp" alt=""></td>
                <td>789012</td>
                <td>$750</td>
                <td>$1000</td>
                <td>無</td>
                <td>3</td>
                <td>類別B</td>
                <td>未上架</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>商品2</td>
                <td><img src="./newImg/6-2.jpg" alt="商品2圖片"></td>
                <td>789012</td>
                <td>$75.00</td>
                <td>$70.00</td>
                <td>中</td>
                <td>50</td>
                <td>類別B</td>
                <td>未上架</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>商品2</td>
                <td><img src="./newImg/7-1.jpg" alt="商品2圖片"></td>
                <td>789012</td>
                <td>$75.00</td>
                <td>$70.00</td>
                <td>中</td>
                <td>50</td>
                <td>類別B</td>
                <td>未上架</td>
            </tr>
            <!-- 添加更多商品行 -->
        </tbody>
        <br>
    </table>


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
              <li><a href="#">Account</a></li>
              <li><a href="#">Course</a></li>
              <li><a href="#">Forum</a></li>
              <li><a href="#">Group</a></li>
              <li><a href="#">Court</a></li>
              <li><a href="#">Seller</a></li>
              <li><a href="#">Mall</a></li>
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
            >© Porto eCommerce. 2021. All Rights Reserved</span
          >
        </div>
      </div>
    </div>
    <!-- End .footer-bottom -->
  </div>
  <!-- End .container -->
    
    </footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->

    <div class="sticky-navbar">
        <div class="sticky-info">
            <a href="demo4.html">
                <i class="icon-home"></i>Home
            </a>
        </div>
        <div class="sticky-info">
            <a href="category.html" class="">
                <i class="icon-bars"></i>Categories
            </a>
        </div>
        <div class="sticky-info">
            <a href="wishlist.html" class="">
                <i class="icon-wishlist-2"></i>Wishlist
            </a>
        </div>
        <div class="sticky-info">
            <a href="login.html" class="">
                <i class="icon-user-2"></i>Account
            </a>
        </div>
        <div class="sticky-info">
            <a href="cart.html" class="">
                <i class="icon-shopping-cart position-relative">
                    <span class="cart-count badge-circle">3</span>
                </i>Cart
            </a>
        </div>
    </div>

    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="assets/js/main.min.js"></script>
</body>

</html>