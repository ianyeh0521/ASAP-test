<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>新增商品</title>

    <!-- Favicon -->
    <link
      rel="icon"
      type="image/x-icon"
      href="${pageContext.request.contextPath}/assets/images/icons/favicon.png"
    />

    <!-- Plugins CSS File -->
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
    />

    <!-- Main CSS File -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"
    />

    <style>
      .item_container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-content: space-around;
        margin: 30px 0;
      }

      .container_left {
        width: 45%;
      }

      .container_right {
        margin-left: 25px;
        width: 35%;
      }

      hr {
        margin: 5px 0;
      }

      .preview {
        border: 1px dashed lightgray;
        width: 60px;
        height: 80px;
      }

      label {
        margin: 0 10px 0 5px;
      }

      .onerow {
        display: flex;
        align-content: space-between;
        align-items: center;
        margin: 15px 5px;
      }

      select {
        margin-left: 10px;
      }

      button {
        border-radius: 10px;
        width: 100px;
        height: 40px;
        margin-left: 30px;
        border: 0px;
      }
    </style>
  </head>

  <body>
    <div class="page-wrapper">
      <header class="header"> 
      <div class="header-middle sticky-header"
				data-sticky-options="{'mobile': true}"
				style="height: 75px; background: rgb(255, 250, 85); background: linear-gradient(90deg, rgba(255, 250, 85, 0.9081757703081232) 0%, rgba(9, 34, 121, 0.8773634453781513) 35%, rgba(0, 212, 255, 1) 100%);">
				<div class="container">
					<div class="header-left col-lg-2 w-auto pl-0">
						<button class="mobile-menu-toggler text-primary mr-2"
							type="button">
							<i class="fas fa-bars"></i>
						</button>
						<a href="#" style="width: 222; height: 88;"> <img
							src="${pageContext.request.contextPath}/newImg/logo2.png"
							alt="Logo" />
						</a>
					</div>
					<!-- End .header-left -->
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-middle -->

			<div class="header-bottom sticky-header d-none d-lg-block"
				data-sticky-options="{'mobile': false}">
				<div class="container">
					<nav class="main-nav w-100">
						<ul class="menu" style="display: flex; justify-content: flex-end">
							<li><a href="#">論壇</a>
								<ul>
									<li><a href="#">論壇首頁</a></li>
									<li><a href="#">發佈貼文</a></li>
									<li><a href="#">我的貼文</a></li>
									<li><a href="#">收藏貼文</a></li>
								</ul></li>
							<li><a href="#">揪團</a>
								<ul>
									<li><a href="#">揪團首頁</a></li>
									<li><a href="#">發起揪團</a></li>
									<li><a href="#">我的揪團</a></li>
								</ul></li>
							<li><a href="#">找課程</a>
								<ul>
									<li><a href="#">查詢課程</a></li>
									<li><a href="#">我的課程</a></li>
								</ul></li>
							<li><a href="#">找場地</a>
								<ul>
									<li><a href="#">詢找場地</a></li>
									<li><a href="#">我的預約</a></li>
									<li><a href="#">我的收藏</a></li>
								</ul></li>
							<li><a href="#">賣家入口</a>
								<ul>
									<li><a href="#">所有訂單</a></li>
									<li><a href="#">所有商品</a></li>
									<li><a href="#">新增商品</a></li>
									<li><a href="#">商品評論</a></li>
								</ul></li>

							<li><a href="">商城</a></li>
							<li><a href="login.jsp" style="color: red">登入</a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom --></header>
      <!-- End .header -->
      <main>
        <div class="page-header">
          <div class="container d-flex flex-column align-items-center">
            <h1>新增商品</h1>
          </div>
        </div>
      </main>

      <form id="myform" action="${pageContext.request.contextPath}/SellerController" method="post" enctype="multipart/form-data">
        <div class="item_container">
          <!-- ========= 左邊區塊 ======== -->
          <div class="container_left">
            <!-- 商品名稱 -->
            <div class="onerow">
              <label for="product-name"> 商品名稱 </label>
              <input
                type="text"
                style="width: 80%"
                id="product-name"
                name="itemName"
                required
              />
            </div>

            <div class="onerow">
              <label for="product-description">商品簡介</label>
              <textarea
                name="itemDescript"
                id="product-description"
                required
                style="resize: none; width: 70%; height: 130px"
              ></textarea>
            </div>

            <div class="onerow">
              <label for="product-condition">商品狀況</label>
              <select name="itemCondition" id="product-condition">
                <option value="請選擇">請選擇</option>
                <option value="1">全新</option>
                <option value="2">幾乎全新</option>
                <option value="3">狀況良好</option>
                <option value="4">狀況尚可</option>
              </select>
            </div>

            <div class="onerow">
              <label for="product-category">
                商品分類
                <select id="product-category" name="itemCategory">
                  <option value="請選擇">請選擇</option>
                  <option value="1">帽子</option>
                  <option value="2">男上衣</option>
                  <option value="3">男下身</option>
                  <option value="4">男鞋</option>
                  <option value="5">女上衣</option>
                  <option value="6">女下身</option>
                  <option value="7">女鞋</option>
                  <option value="8">配件</option>
                  <option value="9">球類</option>
                  <option value="10">健身器材</option>
                  <option value="11">其他</option>
                </select>
              </label>
            </div>

            <div class="onerow">
              <label for="product-size">
                尺寸
                <select id="product-size" name="itemSize" style="width: 150px">
                  <option value="請選擇">請選擇</option>
                  <option value="1">無</option>
                  <option value="2">XS</option>
                  <option value="3">S</option>
                  <option value="4">M</option>
                  <option value="5">L</option>
                  <option value="6">XL</option>
                </select>
              </label>
            </div>

            <div class="onerow">
              <label for="product-price">價格</label>

              <input
                type="number"
                id="product-price"
                name="itemPrice"
                required
              />
            </div>

            <div class="onerow">
              <label for="product-quantity">數量</label>

              <input
                type="number"
                id="product-quantity"
                name="itemQuantity"
                required
              />
            </div>

            <hr />

            <div class="onerow">
              <label for="coverPic">封面圖片</label>
              <input
                type="file"
                id="coverPic"
                accept="image/*"
                name="coverPic"
              />
              <div id="preview_coverPic" class="preview"></div>
            </div>
          </div>

          <!-- ========= 右邊區塊 ======== -->
          <div class="container_right">
            <div class="onerow">
              <label for="productPic1">商品圖片1</label>
              <input
                accept="image/*"
                type="file"
                id="productPic1"
                name="itemPic1"
              />
              <div id="preview_productPic1" class="preview"></div>
            </div>

            <hr />

            <div class="onerow">
              <label for="productPic2">商品圖片2</label>
              <input
                accept="image/*"
                type="file"
                id="productPic2"
                name="itemPic2"
              />
              <div id="preview_productPic1" class="preview"></div>
            </div>

            <hr />

            <div class="onerow">
              <label for="productPic3">商品圖片3</label>
              <input
                accept="image/*"
                type="file"
                id="productPic3"
                name="itemPic3"
              />
              <div id="preview_productPic3" class="preview"></div>
            </div>

            <div class="onerow">
              <button type="button" id="btn_publish">發佈</button>
              <button type="button" id="btn_save">儲存草稿</button>
              <button type="button" id="btn_cancel">
                <a style="display: block" href="">取消</a>
              </button>
            </div>
          </div>
        </div>
      </form>
      <footer class="footer bg-dark">
      	<div class="footer-middle">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="widget">
								<h4 class="widget-title">Contact Info</h4>
								<ul class="contact-info">
									<li><span class="contact-info-label">Address:</span>5F.,
										No. 219, Sec. 3, Nanjing E. Rd., Zhongshan Dist., Taipei City
										104, Taiwan (R.O.C.)</li>
									<li><span class="contact-info-label">Phone:</span><a
										href="tel:">(02) 2712-0589</a></li>
									<li><span class="contact-info-label">Email:</span> <a
										href="mailto:mail@example.com">business@tibame.com</a></li>
									<li><span class="contact-info-label">Working
											Days/Hours:</span> Mon - Sun / 8:00 AM - 9:30 PM</li>
								</ul>
								<div class="social-icons">
									<a href="#" class="social-icon social-facebook icon-facebook"
										target="_blank" title="Facebook"></a> <a href="#"
										class="social-icon social-twitter icon-twitter"
										target="_blank" title="Twitter"></a> <a href="#"
										class="social-icon social-instagram icon-instagram"
										target="_blank" title="Instagram"></a>
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
							<span class="footer-copyright">© Tibame. 2023. All Rights
								Reserved</span>
						</div>
					</div>
				</div>
				<!-- End .footer-bottom -->
			</div>
			<!-- End .container -->
      </footer>
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
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

<!--     <script> -->
<!--       $("header").load("header.html"); -->
<!--       $("footer").load("footer.html"); -->
<!--       $("div.sticky-navbar").load("sticky-navbar.html"); -->
<!--       $("div.mobile-menu-container").load("mobile-menu-container.html"); -->
<!--     </script> -->
    <script>
      $(window).on("load", function () {
        //預覽
        function preview_img(file, element) {
          var reader = new FileReader();
          reader.readAsDataURL(file);

          reader.addEventListener("load", function () {
            let img_html =
              "<img src=" + reader.result + " class='preview_img'>";
            element.innerHTML = img_html;
          });
        }
        //照片預覽
        $("input[type='file']").on("change", function (e) {
          var preview_div = $(this).closest("div").find("div.preview")[0];

          if (this.files.length > 0) {
            preview_img(this.files[0], preview_div);
          } else {
            preview_div.innerHTML = ``;
          }
        });

        $("#btn_publish").on("click", function () {
          $("#myform").append(
            '<input type="hidden" name="action" value="publish">'
          );
          $("#myform").submit();
        });

        $("#btn_save").on("click", function () {
          $("#myform").append(
            '<input type="hidden" name="action" value="save">'
          );
          $("#myform").submit();
        });
      });
    </script>
  </body>
</html>
