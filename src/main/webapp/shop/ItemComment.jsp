<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@page import="com.asap.shop.service.*"  %> --%>
<%-- <%@page import="com.asap.shop.entity.*"  %> --%>
<%@page import="java.util.*"  %>
<%-- <%  --%>
<!-- //    ItemSizeService itemSizeSvc = new ItemSizeService(); -->
<!-- //    ItemStatService itemStatSvc = new ItemStatService(); -->
<!-- //    ItemTypeService itemTypeSvc = new ItemTypeService(); -->
   
<!-- //    List<ItemSizeVO> itemSize = itemSizeSvc.getALL(); -->
<!-- //    List<ItemStatVO> itemStat = itemStatSvc.getALL(); -->
<!-- //    List<ItemTypeVO> itemType = itemTypeSvc.getALL(); -->
   
<!-- //    pageContext.setAttribute("itemSize", itemSize); -->
<!-- //    pageContext.setAttribute("itemStat", itemStat); -->
<!-- //    pageContext.setAttribute("itemType", itemType); -->
<%-- %> --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>商品評分</title>

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
        margin: 10px 20px;
        border: 0px;
      }
      
       .oneItem {
        display: flex;
        align-items: center;
        justify-content: space-around;
        /* border: 2px green solid; */
      }
      .left {
        width: 15%;
        padding: 5px;
        /* border: 2px black solid; */
      }

      .middle {
        width: 25%;
        padding: 5px;
        /* border: 2px blue solid; */
      }
      .right {
        width: 40%;
        padding: 5px;
        height: 50px;
        /* border: 2px red solid; */
      }

      hr {
        margin: 10px 0px;
      }
      .produtReviewText {
        width: 100%;
        height: 90%;
      }
      .rate {
        margin-left: 3px;
        margin-right: 7px;
      }
      
      .scrollbar {
        &::-webkit-scrollbar {
          width: 10px;
        }
        &::-webkit-scrollbar-track {
          background-color: lightgray;
          border-radius: 25px;
        }
        &::-webkit-scrollbar-thumb {
          border-radius: 25px;
          background-color: gray;
        }
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
            <h1>商品評論</h1>
          </div>
        </div>
        
        <div class="container login-container">
          <div
            style="
              margin: 20px 10px;
              border-radius: 10px;
              padding: 20px;
              box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
                rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
            "
          >
          
           <form action="${pageContext.request.contextPath}/shop/BuyerOrder.do" method="post" style="margin-bottom: 15px;" id="myform">
            <input type="hidden" name="mbrNo" value="${memberVo.mbrNo}"/>
            <div style="overflow-y: scroll; height: 500px" class="scrollbar">
             
                <h3 style="margin-left: 10px">訂單 ${orderNo}</h3>
                  <hr />
                    <ul>
                  <c:if test="${not empty unCmtItems}">
						<c:forEach var="unCmtItem" items="${unCmtItems}">
						<li>
	                    <div class="oneItem">
	                      <div class="left">
	                        <div>商品編號: ${unCmtItem.itemInfoVO.itemNo}</div>
	                        <div>商品名稱: ${unCmtItem.itemInfoVO.itemName}</div>
	                      </div>
	                      <div class="middle">
	                        <label style="margin-right: 10px">評分:</label>
	                        <input
	                          type="radio"
	                          id="rate1Product${unCmtItem.orderDetailNo}"
	                          name="productRate${unCmtItem.orderDetailNo}"
	                          value="1"
	                        />
	                        <label for="rate1Produc${unCmtItem.orderDetailNo}" class="rate">1</label>
	                        <input
	                          type="radio"
	                          id="rate2Product${unCmtItem.orderDetailNo}"
	                          name="productRate${unCmtItem.orderDetailNo}"
	                          value="2"
	                        />
	                        <label for="rate2Product${unCmtItem.orderDetailNo}" class="rate">2</label>
	                        <input
	                          type="radio"
	                          id="rate3Product${unCmtItem.orderDetailNo}"
	                          name="productRate${unCmtItem.orderDetailNo}"
	                          value="3"
	                        />
	                        <label for="rate3Product${unCmtItem.orderDetailNo}" class="rate">3</label>
	                        <input
	                          type="radio"
	                          id="rate4Product${unCmtItem.orderDetailNo}"
	                          name="productRate${unCmtItem.orderDetailNo}"
	                          value="4"
	                        />
	                        <label for="rate4Product${unCmtItem.orderDetailNo}" class="rate">4</label>
	                        <input
	                          type="radio"
	                          id="rate5Product${unCmtItem.orderDetailNo}"
	                          name="productRate${unCmtItem.orderDetailNo}"
	                          value="5"
	                        />
	                        <label for="rate5Product${unCmtItem.orderDetailNo}" class="rate">5</label>
	                      </div>
	                      <div class="right">
	                        <input
	                          type="text"
	                          class="produtReviewText"
	                          placeholder="留點評論..."
	                          name="productText${unCmtItem.orderDetailNo}"
	                        />
	                      </div>
	                    </div>
                    </li>
                  <hr />
			       </c:forEach>
				</c:if>
                
              
               <c:if test="${not empty CmtItems}">
					<c:forEach var="cmtItem" items="${CmtItems}">
						<li>
	                    <div class="oneItem">
	                      <div class="left">
	                        <div>商品編號: ${cmtItem.itemInfoVO.itemNo}</div>
	                        <div>商品名稱: ${cmtItem.itemInfoVO.itemName}</div>
	                      </div>
	                      <div class="middle">
	                         <label style="margin-right: 10px">評分:</label>
                             <div style="display: inline-block;">${cmtItem.cmtScore} 分</div>
	                         
	                      </div>
	                       <div class="right scrollbar" style="overflow-y: scroll;" >
                            <div>買家評論: ${cmtItem.cmtText}</div>
                            <div>賣家回覆: ${cmtItem.cmtReText}</div>
                      </div>
	                    </div>
                    </li>
                  <hr />
			       </c:forEach>
				</c:if>
				</ul>
            </div>
            <div style="display: flex;justify-content: flex-end;"> 
            <button type="button" class="btn_s" id="cancelCmt">取消/返回</button>
            <button type="button" class="btn_s" id="saveCmt">確認送出</button>
            </div>
           </form>
          </div>
        </div>
      </main>
                       
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

<!--     <script> -->
<!--       $("header").load("header.html"); -->
<!--       $("footer").load("footer.html"); -->
<!--       $("div.sticky-navbar").load("sticky-navbar.html"); -->
<!--       $("div.mobile-menu-container").load("mobile-menu-container.html"); -->
<!--     </script> -->
    <script>
      $(window).on("load", function () {
    

        $("#cancelCmt").on("click", function () {
          $("#myform").append(
            '<input type="hidden" name="action" value="cancelCmt">'
          );
          $("#myform").submit();
        });

        $("#saveCmt").on("click", function () {
        	var yes = confirm("送出評論後無法再更改。\n是否確定送出?");
        	
        	if (yes){
           	$("#myform").append('<input type="hidden" name="action" value="saveCmt">');
            $("#myform").submit();   
        	}
        	
        });
      });
    </script>
  </body>
</html>
