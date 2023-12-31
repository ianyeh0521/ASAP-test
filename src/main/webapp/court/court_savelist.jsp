<%@page import="com.asap.member.entity.MemberVO"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.util.*"%>
<%
	MemberVO mbrVO = (MemberVO)session.getAttribute("memberVo");
	String mbrNo = mbrVO.getMbrNo();
	pageContext.setAttribute("mbrNo",mbrNo);
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>ASAP</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">
    <link
          rel="stylesheet"
          href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
          integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
          crossorigin="anonymous"
    />

    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = '${pageContext.request.contextPath}/assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"/>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    
    <!-- datatable用 -->
    <link
    rel="stylesheet"
    type="text/css"
    href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"
    />

    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
    <script>
    $(document).ready(function () {
       
      });
    </script>
    <style>
        #fs_alert1 {
        width: 100vw;
        height: 100vh;
        position: fixed;
        top: 0;
        /* display: block; */
        display: none;
        z-index: 999;
      }
      #fs_alert2 {
        width: 100vw;
        height: 100vh;
        position: fixed;
        top: 0;
        /* display: block; */
        display: none;
        z-index: 999;
      }
      .fs_alert_bg {
        width: 100vw;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.671);
        position: fixed;
        top: 0;
      }
      .fs_alert_show {
        max-width: 450px;
        min-width: 400px;

        background-color: white;
        position: absolute;
        top: 150px;
        left: 0;
        right: 0;
        margin: auto;
        z-index: 2;
        border-radius: 6px;
        text-align: center;
      }

      .fs_alert_title {
        font-size: 24px;
        text-align: center;
        margin: 35px;
        font-weight: bold;
      }
      .fs_alert_title_suc {
        color: rgb(85, 184, 201);
      }
      .fs_alert_txt {
        width: 80%;
        word-wrap: break-word;
        font-size: 16px;
        padding: 0 20px;
        text-align: center;
        margin: 0px auto 15px auto;
      }
      #alert_ok1 {
        margin: 20px auto 45px auto;
      }
      #alert_ok2 {
        margin: 20px auto 45px auto;
      }

      .btn_s {
            width: 100px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            padding: 10px;
            cursor: pointer;
            color: rgb(255, 255, 255);
            background-color: rgb(218, 28, 15);
            margin: 10px;
        }

        .btn_s:hover {
            background-color: rgb(117, 29, 18)
        }

      .btn_s2 {
            width: 100px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            padding: 10px;
            cursor: pointer;
            color: rgb(255, 255, 255);
            background-color: rgb(85, 184, 201);
            margin: 10px;
        }

        .btn_s2:hover {
            background-color: rgb(76, 139, 150)
        }

      th.dt-center, td.dt-center {
         text-align: center; 
      }
      
      #table_id tbody tr:hover {
	    cursor: pointer;
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
        </header><!-- End .header -->

        <main class="main">
            <!-- 小標+按鈕 -->
            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
                <nav aria-label="breadcrumb" class="breadcrumb-nav">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court/court_main.jsp"><i class="icon-home"></i></a></li>
                    <li class="breadcrumb-item">我的收藏</li>
                  </ol>
                </nav>
                <a href="${pageContext.request.contextPath}/court/court_mapSearching.jsp"><button class="btn btn-primary btn-rounded btn-md">地圖搜尋</button></a>
                <a href="${pageContext.request.contextPath}/court/court_orderlist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的預約</button></a>                         
            </div>  
            
              <!-- 彈窗 -->
              <div id="fs_alert1">
                <div class="fs_alert_bg"></div>
                <div class="fs_alert_show"> 
                  <div class="fs_alert_title">確定要移除此收藏？</div>
                  <!-- <div class="fs_alert_txt"></div> -->
                  <div class="btn_s" id="alert_ok1">確認</div>
                </div>
              </div>

              <div id="fs_alert2">
                <div class="fs_alert_bg"></div>
                <div class="fs_alert_show">
                  <!-- <form action="" method="post"> -->
                  <div class="fs_alert_title">移除成功</div>
                  <!-- <div class="fs_alert_txt"></div> -->
                  <div class="btn_s2" id="alert_ok2">返回</div>
                  <!-- <input type="hidden" name="" value=""/> -->
                <!-- </form> -->
                </div>
              </div>

        
      		<!-- Datatable -->	
              <div class="container login-container">
                <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
                  <table id="table_id" class="display" style="width: 100%">
                    <thead>
                      <tr>
                        <!-- 欄位標題 可以調整欄位數量但標題和內容要一起-->
                        <th ></th>
                        <th >場地名稱</th>
                        <th >地址</th>
                        <th >場地類型</th>
                        <th >價格</th>
<!--                         <th >查看地點</th> -->
                        <th >移除收藏</th>
                      </tr>
                    </thead>
                    <tbody>
                       <!-- 欄位內容 可以調整欄位數量但標題和內容要一起 也可以在欄位中加入需要的標籤img、buttom-->
                      <!-- 這裡轉成jsp時可用c:forEach方法 -->
                      <tr>
              
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              
                

            
        </main><!-- End .main -->

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
    	
    </div><!-- End .mobile-menu-container -->

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



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

    <!-- header and footer template -->
    <script>
        $(window).on("load", function(){
        	 $.ajax({
                 type: "POST",
                 url: 'courtSaveListAjax.do',
                 contentType: 'application/json',
                 dataType: 'json',
                 data: JSON.stringify({
                     action: "getByMember",
                     mbrNo: "${mbrNo}",
                 }),
                 success: function(response){
                 	var courtSaveList = JSON.parse(response.courtSaveList);
                 	var saveImgList = JSON.parse(response.saveImgList);
                 	console.log(courtSaveList);
                 	console.log(saveImgList);
                 	console.log(courtSaveList[2]);
                 	
                 	let img = "img";
                 	for(let i = 0; i < courtSaveList.length; i++){
                 		courtSaveList[i][img] = 'data:image/jpg;base64,'+ saveImgList[i];
                 	}
                 	console.log(courtSaveList);
                
                 	 $("#table_id").DataTable({
                 		 aaData: courtSaveList,
                 		 "scrollX": true,
                 		 "scrollY": true,
                 		 "language": {url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"},
                          "columnDefs": [
                              {"className": "dt-center", "targets": "_all"}
                          ],
                          "lengthMenu": [
                              [5, 10, 25, -1], // 定義每頁顯示筆數選項
                              ['5', '10', '25', '所有'] // 定義每頁顯示筆數選項文字
                          ],
                 		 columns:[
                			 	{
                                 "data": "img",
                                 "render": function (data, type, row) {
                                     return '<img src="' + data + '" alt="圖片" style="width:90px;height:90px; border-radius: 5px">';
                                 }
                             },
                          	
                            {"data": "courtVO.courtName"},
                          	{"data": "courtVO.courtAddress"},
                          	{"data": "courtVO.courtTypeVO.courtType"},
                          	{"data": "courtVO.courtPrice"},
                                   	
//                           	{
//                                  "data": "courtVO.courtNo",
//                                  "render": function(data, type, row) {
//                                      return '<a href="/ASAP/court/court_page.jsp?courtNo=' + data + '" class="btn btn-primary btn-sm" style="border-radius:5px">查看</a>';
//                                  }
//                              },
                 
                             {
                                 "data": "courtVO.courtNo",
                                 "render": function(data, type, row) {
                                      return '<button type="button" class="btn btn-danger btn-sm lookup" style="border-radius:5px" data-id="' + data + '">移除</button>';
                                 }
                             }
                          ],
                          
                          "createdRow": function(row, data, dataIndex) {
                              $(row).attr('id', data.courtVO.courtNo);
                           		
                              
                              $(row).on('click', function() {
                                  
                                  var courtNo = data.courtVO.courtNo;
                                  
                                  
                                  window.location.href = '/ASAP/court/court_page.jsp?courtNo=' + courtNo;
                              });
                              
                              
                              $(row).find('.lookup').on('click', function(event) {
                                  
                                  event.stopPropagation();
                              
	                            	var clickedId = $(this).data('id');
	                            	handleClickedId(clickedId);
	                            	$("#fs_alert1").css("display", "block")
                            	
                              });
                          
                          
                          }
                 	 });
                 	 
                 	
                 	 
                 },
                 error:function(xhr){
                 	console.log(xhr);
                 }
              });
           
             
            
        })
        $(document).mouseup(function(e) {
		    var fsAlert1 = $("#fs_alert1");
		    var fsAlertShow = $(".fs_alert_show");
		
		    if (!fsAlertShow.is(e.target) && fsAlertShow.has(e.target).length === 0) {
		        fsAlert1.css("display", "none");
		    }
		});
        
        function handleClickedId(clickedId){
        	var clickedId = clickedId.toString();
        	console.log(typeof(clickedId));
        	$("#alert_ok1").on("click", function(e){
	             e.stopPropagation();
	             $.ajax({
	    	           url: 'courtSaveListAjax.do', 
	    	           type: 'POST',
	    	           contentType: 'application/json',
	    	           data: JSON.stringify({
	    	               action: "delete",
	    	               mbrNo: "${mbrNo}",	
	    	               courtNo: clickedId
	    	           }),
	    	           success: function(response) {
	    	               console.log('Server response:', response);
	    	           },
	    	           error: function() {
	    	               console.log('Error in AJAX request');
	    	           }
	    	    });
	            
	             
	            $('#' + clickedId).fadeOut(500, function(){
		            $('#' + clickedId).remove();
	            });
	            	
	            $("#fs_alert1").css("display", "none");
	              setTimeout(openDelete, 100);
	        })
	
            $("#alert_ok2").on("click", function(){
              $("#fs_alert2").css("display", "none");
            })

            function openDelete(){
                $("#fs_alert2").css("display", "block");
            }
        	
        	
       	}
        
        
     	// 儲存現在的頁面位置
        var scrollPosition = window.scrollY || document.documentElement.scrollTop;
        history.replaceState({ scrollPosition: scrollPosition }, document.title, window.location.href);


        // court_page.jsp 載入後保存之前的位置
        document.addEventListener('DOMContentLoaded', function() {
            var savedState = history.state;
            if (savedState && typeof savedState.scrollPosition !== 'undefined') {
                window.scrollTo(0, savedState.scrollPosition);
            }
        });

            
    
        
	</script>
</body>

</html>