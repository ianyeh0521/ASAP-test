<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.asap.shop.service.*"  %>
<%@page import="com.asap.shop.entity.*"  %>
<%@page import="java.util.*"  %>
<% 
   ItemSizeService itemSizeSvc = new ItemSizeService();
   ItemStatService itemStatSvc = new ItemStatService();
   ItemTypeService itemTypeSvc = new ItemTypeService();
//    ItemImgService itemImgSvc = new ItemImgService();
//    ItemInfoService itemInfoSvc = new ItemInfoService(); 
   
   List<ItemSizeVO> itemSize = itemSizeSvc.getALL();
   List<ItemStatVO> itemStat = itemStatSvc.getALL();
   List<ItemTypeVO> itemType = itemTypeSvc.getALL();
   
   pageContext.setAttribute("itemSize", itemSize);
   pageContext.setAttribute("itemStat", itemStat);
   pageContext.setAttribute("itemType", itemType);

//    String itemNo = request.getParameter("itemNo");

//    ItemInfoVO itemVo = i
   
%>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.min.css" />
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
						<a href="${pageContext.request.contextPath}/member/MemberHome.jsp" style="width: 222; height: 88;"> <img
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
									<li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
								</ul></li>
							<li><a href="#">揪團</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
									<li><a href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
									<li><a href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
								</ul></li>
							<li><a href="#">課程</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
									<li><a href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
								</ul></li>
							<li><a href="#">場地</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
									<li><a href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
									<li><a href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
								</ul></li>
							<li><a href="#">賣家</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
								</ul>
							</li>

							<li><a href="#">商城</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
								</ul>
							</li>
							<li><a href="#">個人首頁</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
									<li><a href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
								</ul>
							</li>
							<li><a><form action="${pageContext.request.contextPath}/MemberController" method="post" style="margin: 0px;"><button type="submit" style="border:0px; background-color:white;">登出</button><input type="hidden" name="action" value="logout"/></form></a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->      
      </header>
      <!-- End .header -->
      <main>
        <div class="page-header">
          <div class="container d-flex flex-column align-items-center">
            <h1>新增商品</h1>
          </div>
        </div>
      </main>
                     <c:if test="${not empty errorMsgs}">
						<c:forEach var="message" items="${errorMsgs}">
							<p style="color: red; font-size: 12px;">${message}</p>
						</c:forEach>
					</c:if>
      <form id="myform" action="${pageContext.request.contextPath}/shop/Seller.do" method="post" enctype="multipart/form-data">
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
                value="${itemInfoVo.itemName}"
              />
            </div>

            <div class="onerow">
              <label for="product-description">商品簡介</label>
              <textarea name="itemDescript" id="product-description" style="resize: none; width: 70%; height: 130px" required
              > ${itemInfoVo.itemText} </textarea>
            </div>

            <div class="onerow">
              <label for="product-condition">商品狀況</label>
              <select name="itemStat" id="product-condition">
                <option value="請選擇">請選擇</option>
                <c:forEach var="stat" items="${itemStat}">
                     <option value="${stat.itemStatNo}">${stat.itemStatText}</option>
                </c:forEach>
              </select>
            </div>

            <div class="onerow">
              <label for="product-category">商品分類</label>
                <select id="product-category" name="itemType">
                  <option value="請選擇">請選擇</option>
                    <c:forEach var="type" items="${itemType}">
                     <option value="${type.itemTypeNo}">${type.itemTypeName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="onerow">
              <label for="product-size">商品尺寸</label>
                <select id="product-size" name="itemSize" style="width: 150px">
                  <option value="請選擇">請選擇</option>
                  <c:forEach var="size" items="${itemSize}">
                     <option value="${size.itemSizeNo}">${size.itemSizeText}</option>
                    </c:forEach>
                </select>  
            </div>

            <div class="onerow">
              <label for="product-price">商品價格</label>

              <input
                type="number"
                id="product-price"
                name="itemPrice"
                required
                value="${itemInfoVo.itemPrice}"
              />
            </div>

            <div class="onerow">
              <label for="product-quantity">數量</label>

              <input
                type="number"
                id="product-quantity"
                name="itemQuantity"
                required
                value="${itemInfoVo.itemStockQty}"
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
              <div id="preview_coverPic" class="preview"><img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo=${ItemFrontImg}" class="preview_img"></div>
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
              <div id="preview_productPic1" class="preview"><img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo=${ItemImg1}" class="preview_img"></div>
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
              <div id="preview_productPic1" class="preview"><img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo=${ItemImg2}" class="preview_img"></div>
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
              <div id="preview_productPic3" class="preview"><img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo=${ItemImg3}" class="preview_img"></div>
            </div>
            
            <!-- ${memberVo.mbrNo} -->
            <div class="onerow">
              <button type="button" id="btn_publish">發佈</button>
              <button type="button" id="btn_save">儲存變更</button>
              <button type="button" id="btn_cancel">取消</button>
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
              <li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">Account</a></li>
              <li><a href="${pageContext.request.contextPath}/course/course_main.jsp">Course</a></li>
              <li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">Forum</a></li>
              <li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">Group</a></li>
              <li><a href="${pageContext.request.contextPath}/court/court_main.jsp">Court</a></li>
              <li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">Seller</a></li>
              <li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">Mall</a></li>
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
            >© ASAP. 2023. All Rights Reserved</span
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
      <li>
        <a href="#">論壇</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
			<li><a href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
			<li><a href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
			<li><a href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
		</ul>
      </li>
      <li>
        <a href="#">揪團</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
			<li><a href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
			<li><a href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
			<li><a href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
		</ul>
      </li>
      <li>
        <a href="#">課程</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
			<li><a href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
		</ul>
      </li>

      <li>
        <a href="#">場地</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
			<li><a href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
			<li><a href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
		</ul>
      </li>

      <li>
        <a href="#">賣家</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
		</ul>
      </li>
      <li><a href="#">商城</a>
      	<ul>
			<li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
		</ul>
      </li>
      <li><a href="#">個人首頁</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
			<li><a href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
		</ul>
	  </li>
      
    </ul>
  </nav>
  <!-- End .mobile-nav -->
</div>
<!-- End .mobile-menu-wrapper -->
      
    </div>
    <!-- End .mobile-menu-container -->

    <div class="sticky-navbar">
      <div class="sticky-info">
  <a href="${pageContext.request.contextPath}/course/course_main.jsp"> <i class="icon-home"></i>Course </a>
</div>
<div class="sticky-info">
  <a href="${pageContext.request.contextPath}/forum/forum_home.jsp" class=""> <i class="icon-edit"></i>Forum </a>
</div>
<div class="sticky-info">
  <a href="${pageContext.request.contextPath}/group/AllGroup.jsp" class=""> <i class="icon-cat-sport"></i>Group</a>
</div>
<div class="sticky-info">
  <a href="${pageContext.request.contextPath}/shop/AsapShop.jsp" class="">
    <i class="icon-shopping-cart position-relative"> </i>Mall
  </a>
</div>
<div class="sticky-info">
  <a href="${pageContext.request.contextPath}/member/MemberHome.jsp" class=""> <i class="icon-user-2"></i>Account </a>
</div>
      
    </div>

    <a id="scroll-top" href="#top" title="Top" role="button"
      ><i class="icon-angle-up"></i
    ></a>
    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

    <script>
      $(window).on("load", function () {
    	 //預設選項
    	 $("#product-condition").val("${itemInfoVo.itemStatVO.itemStatNo}");
    	 $("#product-category").val("${itemInfoVo.itemTypeVO.itemTypeNo}");
    	 $("#product-size").val("${itemInfoVo.itemSizeVO.itemSizeNo}");
    	  
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
        //按鈕事件
        $("#btn_publish").on("click", function () {
          $("#myform").append(
            '<input type="hidden" name="action" value="updatePublish">'
          );
          $("#myform").submit();
        });

        $("#btn_save").on("click", function () {
          $("#myform").append(
            '<input type="hidden" name="action" value="updateSave">'
          );
          $("#myform").submit();
        });
        
        $("#btn_cancel").on("click", function () {
          $("#myform").append(
            '<input type="hidden" name="action" value="updateCancel">'
          );
          $("#myform").submit();
        });
        
        
      });
    </script>
  </body>
</html>
