<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List"  %>
<%@ page import="com.asap.shop.entity.ItemInfoVO" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>AsapOrderCheck</title>

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
            "Open+Sans:300,400,600,700,800",
            "Poppins:300,400,500,600,700",
            "Shadows+Into+Light:400",
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
    <link rel="stylesheet" href="../assets/css/style.min.css" />
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

      <main class="main main-test">
        <div class="container checkout-container">
          <ul
            class="checkout-progress-bar d-flex justify-content-center flex-wrap"
          >
            <li>
              <a href="AsapCart.jsp">購物車</a>
            </li>
            <li class="active">
              <a href="AsapOrderCheck.jsp">確認訂單</a>
            </li>
            <li class="disabled">
              <a href="#">訂單完成</a>
            </li>
          </ul>

          <div class="login-form-container">
            <h4>
              已經有會員?
              <button
                data-toggle="collapse"
                data-target="#collapseOne"
                aria-expanded="true"
                aria-controls="collapseOne"
                class="btn btn-link btn-toggle"
              >
                登入
              </button>
            </h4>

            <div id="collapseOne" class="collapse">
              <div class="login-section feature-box">
                <div class="feature-box-content">
                  <form action="#" id="login-form">
                    <p>
                      親愛的顧客，
                      別忘了我們有會員制度，登入即享專屬優惠。還不是會員？立即註冊獲得專屬福利
                      謝謝您的支持！ ASAP 客服
                    </p>

                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="mb-0 pb-1"
                            >會員信箱 <span class="required">*</span></label
                          >
                          <input type="email" class="form-control" required />
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                          <label class="mb-0 pb-1"
                            >密碼 <span class="required">*</span></label
                          >
                          <input
                            type="password"
                            class="form-control"
                            required
                          />
                        </div>
                      </div>
                    </div>

                    <button type="submit" class="btn">登入</button>

                    <div class="form-footer mb-1">
                      <div class="custom-control custom-checkbox mb-0 mt-0">
                        <input
                          type="checkbox"
                          class="custom-control-input"
                          id="lost-password"
                        />
                        <label
                          class="custom-control-label mb-0"
                          for="lost-password"
                          >記住我</label
                        >
                      </div>

                      <a href="forgot-password.html" class="forget-password"
                        >忘記密碼?</a
                      >
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-lg-7">
              <ul class="checkout-steps">
                <li>
                  <h2 class="step-title">帳單詳細資料</h2>

                  <form action="#" id="checkout-form">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group">
                          <label
                            >會員名稱
                            <abbr class="required" title="required">*</abbr>
                          </label>
                          <input type="text" class="form-control" required />
                        </div>
                      </div>

                      <div class="col-md-6">
                        <div class="form-group">
                          <label
                            >會員信箱
                            <abbr class="required" title="required"
                              >*</abbr
                            ></label
                          >
                          <input type="text" class="form-control" required />
                        </div>
                      </div>
                    </div>

                   

                    <div class="select-custom">
                        <label
                          >國家 / 地區
                          <abbr class="required" title="required">*</abbr></label
                        >
                        <select name="orderby" class="form-control">
                          <option value="" selected="selected">台灣</option>
                          <option value="1">日本</option>
                          <option value="2">中國</option>
                          <option value="3">美國</option>
                          <option value="4">韓國</option>

                        </select>
                      </div>

                    <div class="select-custom">
                      <label
                        >選擇縣/市
                        <abbr class="required" title="required">*</abbr></label
                      >
                      <select name="orderby" class="form-control">
                        <option value="" selected="selected">台北市</option>
                        <option value="1">新北市</option>
                        <option value="2">桃園市</option>
                        <option value="3">臺中市</option>
                        <option value="4">臺南市</option>
                        <option value="5">高雄市</option>
                        <option value="6">基隆市</option>
                        <option value="7">新竹市</option>
                        <option value="8">嘉義市</option>
                        <option value="9">新竹縣</option>
                        <option value="10">苗栗縣</option>
                        <option value="11">彰化縣</option>
                        <option value="12">南投縣</option>
                        <option value="13">雲林縣</option>
                        <option value="14">嘉義縣</option>
                        <option value="15">屏東縣</option>
                        <option value="16">宜蘭縣</option>
                        <option value="17">花蓮縣</option>
                        <option value="18">台東縣</option>
                        <option value="19">澎湖縣</option>
                        <option value="20">金門縣</option>
                        <option value="21">連江縣</option>
                      </select>
                    </div>

                    <div class="form-group mb-1 pb-2">
                        <label
                          >詳細地址
                          <abbr class="required" title="required">*</abbr></label
                        >
                        <input
                          type="text"
                          class="form-control"
                          placeholder="鄉(鎮市區)、村(里)、鄰："
                          required
                        />
                      </div>
  
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          placeholder="大樓, 公寓, 號碼, 等等. (可選)"
                          required
                        />
                      </div>

                    <div class="form-group">
                      <label
                        >郵遞區號
                        <abbr class="required" title="required">*</abbr></label
                      >
                      <input type="text" class="form-control" required />
                    </div>

                    <div class="form-group">
                      <label
                        >電話
                        <abbr class="required" title="required">*</abbr></label
                      >
                      <input type="tel" class="form-control" required />
                    </div>

                    <div class="form-group">
                      <label>公司名稱 (可選)</label>
                      <input type="text" class="form-control" />
                    </div>

                    <div class="select-custom">
                        <label
                          >公司所在 國家 / 地區
                          <abbr class="required" title="required">*</abbr></label
                        >
                        <select name="orderby" class="form-control">
                          <option value="" selected="selected">台灣</option>
                          <option value="1">日本</option>
                          <option value="2">中國</option>
                          <option value="3">美國</option>
                          <option value="4">韓國</option>

                        </select>
                      </div>

                      <div class="select-custom">
                        <label
                          >公司 選擇縣/市
                          <abbr class="required" title="required">*</abbr></label
                        >
                        <select name="orderby" class="form-control">
                          <option value="" selected="selected">台北市</option>
                          <option value="1">新北市</option>
                          <option value="2">桃園市</option>
                          <option value="3">臺中市</option>
                          <option value="4">臺南市</option>
                          <option value="5">高雄市</option>
                          <option value="6">基隆市</option>
                          <option value="7">新竹市</option>
                          <option value="8">嘉義市</option>
                          <option value="9">新竹縣</option>
                          <option value="10">苗栗縣</option>
                          <option value="11">彰化縣</option>
                          <option value="12">南投縣</option>
                          <option value="13">雲林縣</option>
                          <option value="14">嘉義縣</option>
                          <option value="15">屏東縣</option>
                          <option value="16">宜蘭縣</option>
                          <option value="17">花蓮縣</option>
                          <option value="18">台東縣</option>
                          <option value="19">澎湖縣</option>
                          <option value="20">金門縣</option>
                          <option value="21">連江縣</option>
                        </select>
                      </div>

                    <div class="form-group mb-1 pb-2">
                      <label
                        >詳細地址
                        <abbr class="required" title="required">*</abbr></label
                      >
                      <input
                        type="text"
                        class="form-control"
                        placeholder="鄉(鎮市區)、村(里)、鄰："
                        required
                      />
                    </div>

                    <div class="form-group">
                      <input
                        type="text"
                        class="form-control"
                        placeholder="大樓, 公寓, 號碼, 等等. (可選)"
                        required
                      />
                    </div>


                    <div class="form-group mb-1">
                      <div class="custom-control custom-checkbox">
                        <input
                          type="checkbox"
                          class="custom-control-input"
                          id="create-account"
                        />
                        <label
                          class="custom-control-label"
                          data-toggle="collapse"
                          data-target="#collapseThree"
                          aria-controls="collapseThree"
                          for="create-account"
                          >同步更新會員資料</label
                        >
                      </div>
                    </div>

                    <div id="collapseThree" class="collapse">
                      <div class="form-group">
                        <label
                          >會員密碼
                          <abbr class="required" title="required"
                            >*</abbr
                          ></label
                        >
                        <input
                          type="password"
                          placeholder="Password"
                          class="form-control"
                          required
                        />
                      </div>
                    </div>


                    <div class="form-group">
                      <label class="order-comments"
                        >訂單備註 (可選)</label
                      >
                      <textarea
                        class="form-control"
                        placeholder="請填入有關訂單 / 商品的備註"
                        required
                      ></textarea>
                    </div>
                  </form>
                </li>
              </ul>
            </div>
            <!-- End .col-lg-8 -->

            <div class="col-lg-5">
              <div class="order-summary">
                <h3>訂單詳情</h3>

                <table class="table table-mini-cart">
                  <thead>
                    <tr>
                      <th colspan="2">訂單編號#1234</th>
                    </tr>
                    <tr>
                      <th>商品</th>
                      <th>商品編號</th>
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
                        <span class="product-id">1001</span>
                      </td>
                
                      <td class="price-col">
                        <span class="unit-price">$400.00</span>
                      </td>
                
                      <td class="price-col">
                        <span class="quantity">2</span>
                      </td>
                
                      <td class="price-col">
                        <span class="subtotal"></span>
                      </td>
                    </tr>
                

                    <tr>
                      <td class="product-col">
                        <h3 class="product-title">
                          足球
                        </h3>
                      </td>
                
                      <td class="price-col">
                        <span class="product-id">1002</span>
                      </td>
                
                      <td class="price-col">
                        <span class="unit-price">$200.00</span>
                      </td>
                
                      <td class="price-col">
                        <span class="quantity">2</span>
                      </td>
                
                      <td class="price-col">
                        <span class="subtotal"></span>
                      </td>
                    </tr>
                  </tbody>
                  <tfoot>
                    <tr class="cart-subtotal">
                      <td>
                        <h4>商品小計</h4>
                      </td>
              
                      <td class="price-col">
                        <span class="total-subtotal"></span>
                      </td>
                    </tr>
                    <tr class="order-shipping">
                      <td class="text-left" colspan="2">
                        <h4 class="m-b-sm">付款方式</h4>

                        <div class="form-group form-group-custom-control">
                          <div class="custom-control custom-radio d-flex">
                            <input
                              type="radio"
                              class="custom-control-input"
                              name="radio"
                              checked
                            />
                            <label class="custom-control-label">貨到付款</label>
                          </div>
                          <!-- End .custom-checkbox -->
                        </div>
                        <!-- End .form-group -->

                        <div class="form-group form-group-custom-control mb-0">
                          <div class="custom-control custom-radio d-flex mb-0">
                            <input
                              type="radio"
                              name="radio"
                              class="custom-control-input"
                            />
                            <label class="custom-control-label">線上付款</label>
                          </div>
                          <!-- End .custom-checkbox -->
                        </div>
                        <!-- End .form-group -->
                      </td>
                    </tr>

                    <tr class="order-total">
                      <td>
                        <h4>總計</h4>
                      </td>
                      <td>
                        <b class="total-price"><span></span></b>
                      </td>
                  </tfoot>
                </table>

                <div class="payment-methods">
                  <h4 class="">注意事項</h4>
                  <div class="info-box with-icon p-0">
                    <p>
                      親愛的顧客，
                      <br /><br />
                      請確保下單前您的個人資料正確無誤：
                      <br /><br />
                      聯絡資訊： 手機和電郵準確。
                      <br />
                      寄送地址： 最新且正確。
                      <br />
                      支付信息： 避免支付問題。
                      <br />
                      個人信息： 如姓名正確。
                      <br /><br />
                      謝謝您的合作！
                      <br /><br />
                      ASAP 客服
                    </p>
                  </div>
                </div>

                <button
                  type="submit"
                  class="btn btn-dark btn-place-order"
                  form="checkout-form"
                >
                  前往付款
                </button>
              </div>
              <!-- End .cart-summary -->
            </div>
            <!-- End .col-lg-4 -->
          </div>
          <!-- End .row -->
        </div>
        <!-- End .container -->
      </main>
      <!-- End .main -->

      <footer class="footer bg-dark"></footer>
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

    <script>
      // 获取表格中的所有行
      var rows = document.querySelectorAll('tbody tr');
  
      // 初始化总计和商品小计
      var total = 0;
      var subtotal = 0;
  
      // 遍历每一行
      rows.forEach(function(row) {
        // 获取当前行中的单价、数量和小计元素
        var unitPriceElement = row.querySelector('.unit-price');
        var quantityElement = row.querySelector('.quantity');
        var subtotalElement = row.querySelector('.subtotal');
  
        // 从元素中提取数字值
        var unitPrice = parseFloat(unitPriceElement.textContent.replace('$', ''));
        var quantity = parseInt(quantityElement.textContent);
  
        // 计算小计
        subtotal = unitPrice * quantity;
  
        // 更新小计元素
        subtotalElement.textContent = '$' + subtotal.toFixed(2);
  
        // 累加到总计
        total += subtotal;
      });
  
      // 更新商品小计
      document.querySelector('.total-subtotal').textContent = '$' + total.toFixed(2);
  
      // 更新總計
      document.querySelector('.total-price span').textContent = '$' + total.toFixed(2);
    </script>

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
