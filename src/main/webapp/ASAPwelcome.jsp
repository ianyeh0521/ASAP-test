<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
      <html lang="en">
      <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      
      <title>ASAP</title>
      
      <meta name="keywords" content="HTML5 Template" />
      <meta name="description" content="Porto - Bootstrap eCommerce Template" />
      <meta name="author" content="SW-THEMES" />
      
      <!-- Favicon -->
      <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/imgtest/asapLOGO.png" />

      
      <!-- Plugins CSS File -->
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assetstest/bootstrap.min.css"rel="stylesheet" media="all" />
      
      <!-- Main CSS File -->
      <link rel="stylesheet" href="<%=request.getContextPath()%>/assetstest/style.min.css" rel="stylesheet" media="all"/>
      <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assetstest/all.min.css" rel="stylesheet" media="all"/>
      <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <style>
      * {
        box-sizing: border-box;
      }
      
      body {
        margin: 0;
      }
      
      .welcome_box_bg {
        height: 130px;
      }
      
      .welcome_box {
        position: relative;
        left: 210px;
        display: inline-block;
        width: 100px;
        height: 100px;
        margin: 5px;
        margin-left: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        background: url('newImg/your_image.jpg') center/cover no-repeat;
        overflow: hidden;
      }
      
      p.subtitle {
        font-size: 30px;
        font-weight: 900;
        position: relative;
        left: 120px;
        margin-top: 5px;
        margin-bottom: 20px;
      }
      
      p.introduce {
        position: relative;
        left: 120px;
      }
      
      p.subtitle2 {
        font-size: 20px;
        position: relative;
        left: 120px;
      }
      
      @media ( max-width : 768px) {
        .welcome_box {
          position: relative;
          left: 0;
          margin-top: 10px;
        }
        p.subtitle {
          position: relative;
          left: 0;
          margin-top: 10px;
        }
        p.introduce {
          position: relative;
          right: 10px;
          margin-top: 10px;
          margin-bottom: 100px;
          left: 0;
          top: 100px;
        }
        p.subtitle2 {
          position: relative;
          left: 0px;
          margin-top: 10px;
        }
      }
      </style>
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
                <a href="#" width="222" height="88">
                  <img src="newImg/logo2.png" style="max-width: 200px; height: auto; vertical-align: middle; border-style: none;">
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
              <nav class="main-nav w-100" >
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
          <!-- End .header-bottom --></header>
          <!-- End .header -->
      
          <main class="main about">
            <div class="page-header page-header-bg text-left"
              style="background: 50%/cover #d4e1ea url('newImg/runner.jpg')">
              <div class="container">
                <h1>
                  <span>ASAP</span> Find the Boundaries. Push Through!
                </h1>
                <a href="#" class="btn btn-dark"><strong>START!</strong></a>
              </div>
              <!-- End .container -->
            </div>
            <!-- End .page-header -->
      
            <div class="about-section">
              <div class="container">
                <p class="subtitle" style="font-weight: 900;">關於我們</p>
                <p class="subtitle2">
                  針對不知道該從何開始運動的初學者、找不到夥伴一起運動的人，這裡提供了一個無壓力、充滿支援的地方。</p>
                <div class="welcome_box_bg">
                  <div class="welcome_box">
                    <img src="newImg/forum.png" alt="project"
                      style="width: 90px; height: 90px; position: relative; left: 5px; top: 5px;" />
                  </div>
                  <div class="welcome_box">
                    <img src="newImg/coach.png" alt="project"
                      style="width: 90px; height: 90px; position: relative; left: 5px;" />
                  </div>
                  <div class="welcome_box">
                    <img src="newImg/networking.png" alt="project"
                      style="width: 90px; height: 90px; position: relative; left: 5px; top: 5px;" />
                  </div>
                  <div class="welcome_box">
                    <img src="newImg/basketball.png" alt="project"
                      style="width: 90px; height: 90px; position: relative; left: 5px;" />
                  </div>
                  <div class="welcome_box">
                    <img src="newImg/store.png" alt="project"
                      style="width: 90px; height: 90px; position: relative; left: 5px; top: 5px;" />
                  </div>
                  <div class="welcome_box">
                    <img src="newImg/shop.png" alt="project"
                      style="width: 90px; height: 90px; position: relative; left: 5px; top: 5px;" />
                  </div>
                </div>
                <p class="introduce" style="font-size: 16px;">
                  <i class="fas fa-arrow-right"></i>新手要開始運動可能讓人感到迷茫，可以藉由在論壇上輕鬆提出任何運動相關的問題，會員們將樂意分享經驗、提供建議。<br />
                  <i class="fas fa-arrow-right"></i>若需要更專業的引導，我們提供了專業教練的媒合服務，找到最適合的教練，一步步建立運動的習慣。<br />
                  <i class="fas fa-arrow-right"></i>可隨時隨地，發起揪團，尋找同領域的運動夥伴，相互交流，共同進步。<br />
                  <i class="fas fa-arrow-right"></i>透過平台上的即時搜尋功能，協助尋找、租借適合的場地，並提供專屬優惠。<br />
                  <i class="fas fa-arrow-right"></i>可以在市集找到二手的運動商品，節省開支，為初學者打造的運動社群，提供了豐富的功能，輕鬆開啟運動。
                </p>
              </div>
              <!-- End .container -->
            </div>
            <!-- End .about-section -->
      
          </main>
          <!-- End .main -->
      
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
      
        <div class="mobile-menu-container">
          <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="fa fa-times"></i></span>
            <nav class="mobile-nav">
              <ul class="mobile-menu">
                <li><a href="#">首頁</a></li>
                <li>
                  <a href="#">論壇</a>
                  <ul>
                    <li><a href="#">論壇首頁</a></li>
                    <li>
                      <a href="#">發佈貼文</a>
                    </li>
                    <li>
                      <a href="#">我的貼文</a>
                    </li>
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
                <li><a href="#">商城</a></li>
                <li><a href="#">登入</a></li>
              </ul>
            </nav>
            <!-- End .mobile-nav -->
          </div>
          <!-- End .mobile-menu-wrapper -->
          
        </div>
        <!-- End .mobile-menu-container -->
      
        <div class="sticky-navbar">
          <div class="sticky-info">
            <a href="#"> <i class="icon-home"></i>Home </a>
          </div>
          <div class="sticky-info">
            <a href="#" class=""> <i class="icon-edit"></i>Forum </a>
          </div>
          <div class="sticky-info">
            <a href="#" class=""> <i class="icon-cat-sport"></i>Group</a>
          </div>
          <div class="sticky-info">
            <a href="#" class="">
              <i class="icon-shopping-cart position-relative"> </i>Mall
            </a>
          </div>
          <div class="sticky-info">
            <a href="#" class=""> <i class="icon-user-2"></i>Account </a>
          </div>
        </div>
      
        <a id="scroll-top" href="#top" title="Top" role="button"><i
          class="icon-angle-up"></i></a>
      
        <!-- Plugins JS File -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/assetstest/jstest/jquery.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assetstest/jstest/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/assetstest/jstest/jquery.countTo.js"></script>
      
        <!-- Main JS File -->
        <script type="text/javascript" src="<%=request.getContextPath()%>/assetstest/jstest/main.min.js"></script>
        <script>
          // $("header").load("header.html");
          // $("div.sticky-navbar").load("sticky-navbar.html");
          // $("div.mobile-menu-container").load("mobile-menu-container.html");
          // $("footer").load("footer.html");
        </script>
      </body>
      </html>

      <!-- End .main -->

  </body>
</html>
