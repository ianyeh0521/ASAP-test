<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.asap.shop.service.*"  %>
<%@page import="com.asap.shop.entity.*"  %>
<%@page import="com.asap.member.entity.*"  %>
<%@page import="java.math.BigDecimal"%>

<% 
   MemberVO vo = (MemberVO)session.getAttribute("memberVo");

   double score = (double)vo.getCmtReScore();
   double num = (double)vo.getCmtReNum();
   if(num != 0){ 
	   double avgScore =Math.round(score/num * 100.0) / 100.0;
	   System.out.println("AAAavgscore is:"+avgScore);
	   pageContext.setAttribute("avgScore", avgScore);
    }else{
    	int avgScore = 0;
    	pageContext.setAttribute("avgScore", avgScore);
    	System.out.println("BBBavgscore is:"+avgScore);
    }
   
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>ASAP</title>

<!-- Favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />
<link rel="stylesheet"
	href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
	integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
	crossorigin="anonymous" />



<!-- Plugins CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<!--這裡把jquery往上提-->
<!-- datatable用 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/backStage/dataTable.css" />

<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>


<script>
	function format(d) {
		// `d` is the original data object for the row
		return '<div style="display: flex">'
				+ '<div style="width: 45%; padding: 5px 10px; height: 150px;overflow-y: scroll;">'
				+ '<label style="display: block; margin: 5px">商品簡介</label>'
				+ '<p style="word-break: break-all; word-wrap: break-word">'
				+ d.ItemText
				+ '</p>'
				+ '<p style="word-break: break-all; word-wrap: break-word">上架時間: '
				+ d.ItemAddTime
				+ '</p>'
				+ '<p style="word-break: break-all; word-wrap: break-word">更新時間: '
				+ d.ItemUpdTime
				+ '</p>'
				+ '</div>'
				+ '<div style="border: 1px gray solid; margin: 10px"></div>'
				+ '<div style="width: 45%; padding: 5px 10px; height: 150px;display:flex;flex-wrap:wrap">'
				+ '<label style="display: block; margin: 5px">商品照</label>'
				+ '<img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo='
				+ d.ItemFrontImg
				+ '" alt="商品照" style="width: 60px; height: 80px; margin-left: 8%; border:1px dashed lightgrey;" />'
				+ '<img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo='
				+ d.ItemImg1
				+ '" alt="商品照" style="width: 60px; height: 80px; margin-left: 8%; border:1px dashed lightgrey;"/>'
				+ '<img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo='
				+ d.ItemImg2
				+ '" alt="商品照" style="width: 60px; height: 80px; margin-left: 8%; border:1px dashed lightgrey;" />'
				+ '<img src="${pageContext.request.contextPath}/ItemGifReader?action=getItemImg&itemImgNo='
				+ d.ItemImg3
				+ '" alt="商品照" style="width: 60px; height: 80px; margin-left: 8%; border:1px dashed lightgrey;"/>'
				+ ' </div></div>';
	}

	$(document).ready(function() {
		$("#table_id").DataTable({
			"language" : {url : "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",},
			"ajax" : {
				url : "${pageContext.request.contextPath}/shop/Seller.do", //要抓哪個地方的資料
				type : "GET", //使用什麼方式抓
				data : {"action" : "getItem","mbrNo" : "${memberVo.mbrNo}",},
			    cache : false,
				dataType : "json", //回傳資料的類型
				error : function() {console.log("資料取得失敗 回去檢討檢討");//失敗事件
				},
			},
			"rowId" : 'ItemNo',
			
			"columns" : [ 
				{"class" : 'details-control',"orderable" : false,
				 "data" : null,"defaultContent" : ''},
                {"data" : "ItemNo","title" : "商品編號",}, 
				{"data" : "ItemName","title" : "名稱",}, 
				{"data" : "ItemType","title" : "類別",},
				{"data" : "ItemStat","title" : "狀態",}, 
				{"data" : "ItemSize","title" : "尺寸",},
				{"data" : "ItemStockQty","title" : "數量",},
				{"data" : "ItemPrice","title" : "價格",},
				{"data" : "ItemAddStat","title" : "上架狀態",},
				{"data" : "ItemView","title" : "瀏覽數",},
				{"data" : null ,"title" : "編輯",
				render:function(data, type, row){
		           return '<form style="margin-bottom: 0px;" action="${pageContext.request.contextPath}/shop/Seller.do" method="post"><input type="hidden" name="ItemNo" value="'+data.ItemNo+'"/><input type="hidden" name="action" value="updateItem"/><button type="button" class="btn btn-primary btn-sm" style="border-radius: 5px;font-size: 1.1rem;">編輯</button></form>';
		            },"targets": -1}, ],
			
			"columnDefs" : [
				{targets : [ 1, 2, 3, 4 ],width : "10%", // 設定寬度
				},
				{targets : [ 5, 6, 7, 8, 9, 10 ],width : "9%", // 設定寬度
				},
				{targets : [ 0 ],width : "6%", // 設定寬度
				},
// 				{data : "edit",defaultContent : '<form style="margin-bottom: 0px;" action="${pageContext.request.contextPath}/shop/Seller.do" method="post"><input type="hidden" name="action" value="updateItem"/><button type="button" class="btn btn-primary btn-sm" style="border-radius: 5px;">編輯</button></form>',targets : -1
// 				} 
				],
		   });
		});

	$("#table_id tbody").on("click", "td.details-control", function() {
		var tr = $(this).closest("tr");
		var row = table.row(tr);
		if (row.child.isShown()) {
			// This row is already open - close it
			row.child.hide();
			tr.removeClass("shown");
		} else {
			// Open this row
			row.child(format(row.data())).show();
			tr.addClass("shown");
		}
	});
</script>
<style>
td.details-control {
	background:
		url('https://www.datatables.net/examples/resources/details_open.png')
		no-repeat center center;
	cursor: pointer;
}

tr.shown td.details-control {
	background:
		url('https://www.datatables.net/examples/resources/details_close.png')
		no-repeat center center;
}

#fs_alert1 {
	width: 100vw;
	height: 100vh;
	position: absolute;
	top: 0;
	/* display: block; */
	display: none;
	z-index: 999;
}

#fs_alert2 {
	width: 100vw;
	height: 100vh;
	position: absolute;
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
	max-width: 500px;
	min-width: 450px;
	background-color: white;
	position: fixed;
	top: 100px;
	left: 0;
	right: 0;
	margin: auto;
	z-index: 2;
	border-radius: 8px;
	text-align: center;
}

.fs_alert_title {
	font-size: 24px;
	text-align: center;
	margin: 20px;
	font-weight: bold;
	max-height: 10%;
}
/* .fs_alert_title_suc {
        color: rgb(85, 184, 201);
      } */
.fs_alert_txts {
	width: 80%;
	/* word-wrap: break-word; */
	/* padding: 0 0px; */
	text-align: center;
	margin: 10px auto;
	max-height: 65%;
}
/* .alert_ok {
        margin: 20px auto;
      } */
.btn_s {
	width: 100px;
	border-radius: 8px;
	font-size: 16px;
	text-align: center;
	padding: 10px;
	cursor: pointer;
	color: rgb(255, 255, 255);
	background-color: rgb(85, 184, 201);
	/* margin: 10px auto 15px auto; */
	max-height: 10%;
	display: inline-block;
}

.btn_s:hover {
	background-color: rgb(76, 139, 150);
}

.btn_c {
	width: 100px;
	border-radius: 8px;
	font-size: 16px;
	text-align: center;
	padding: 10px;
	cursor: pointer;
	color: rgb(255, 255, 255);
	background-color: rgb(57, 120, 49);
	/* margin: 10px auto 15px auto; */
	max-height: 10%;
	display: inline-block;
}

.btn_c:hover {
	background-color: rgb(123, 211, 132);
}

.btn_d {
	width: 100px;
	border-radius: 8px;
	font-size: 16px;
	text-align: center;
	padding: 10px;
	cursor: pointer;
	color: rgb(255, 255, 255);
	background-color: rgb(201, 85, 85);
	/* margin: 10px auto 15px auto; */
	max-height: 10%;
	display: inline-block;
}

.btn_d:hover {
	background-color: rgb(211, 123, 123);
}

.input_div {
	margin: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.input_label {
	font-size: 18px;
	width: 30%;
	margin: 0px;
	text-align: left;
}

.input_place {
	border-radius: 5px;
	width: 60%;
	border: 1px gray solid;
	text-align: left;
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

.left, .right {
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
	background-color: #5f5f5f;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	position: absolute;
	bottom: 60px;
	right: 100px;
}

#edit-btn:hover {
	background-color: #989898;
}

#preview-btn {
	background-color: #5f5f5f;
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

		<main class="main">
			<div class="page-header">
				<div class="container d-flex flex-column align-items-center">
					<h1>商品管理</h1>
				</div>
			</div>

			<!--這是彈窗 需要傳資料可以把form、input打開 他的css在上面-->
			<!--這是彈窗1-->
			<div id="fs_alert1">
				<div class="fs_alert_bg"></div>
				<div class="fs_alert_show">
					<div class="fs_alert_title">賣家介紹</div>

					<div class="fs_alert_txts">
						<form action="${pageContext.request.contextPath}/shop/Seller.do" method="post" style="margin-bottom: 15px"
							id="fs_alert1_form">
							<textarea name="introText" id="sellerIntroText" style="resize:none;height:150px;width:350px"></textarea>	
							<input type="hidden" name="mbrNo" value="${memberVo.mbrNo}"/>			
							<input type="hidden" name="action" value="updateSellerIntro"/>			
						</form>
					</div>
					<div
						style="display: flex; justify-content: space-around; margin: 10px auto 20px auto;">
						<div class="btn_s" id="fs_alert1_on">更新</div>
						<div class="btn_c" id="fs_alert1_cancel">取消</div>
					</div>
				</div>
			</div>
			<!--這是彈窗1結束-->

			<div class="container login-container">

				<!-- 賣家簡介區域 -->
				<div id="seller-intro">
					<div class="left">
						<h3 class="id_name">${memberVo.mbrName}</h3>
						<div class="seller-info">
							<p>
								評分 : <span class="rating">${avgScore}</span> (${memberVo.cmtReNum})
							</p>
							
						</div>
					</div>
					<div class="right">
						<h3>賣場簡介</h3>
						<div class="text" id="sellIntro_div" style="height:100px; overflow-y:scroll;">
							${memberVo.sellerIntro}
						</div>
					</div>
					<button id="edit_sellerIntro_btn" style="height: 40px; width:60px; border-radius:5px;border:0px;">編輯</button>
				</div>
               <!-- 賣家簡介區域結束 -->
               <!-- datatable區域 -->
				<div style="margin: 20px 10px; border-radius: 10px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;">
                       <!-- 按鈕區 -->
                       <div style="display: flex; justify-content: end; margin: 10px 0 15px 0">
						<button type="button" class="btn btn-primary btn-sm"
							style="border-radius: 5px" id="add_item">新增商品</button>
					   </div>
					   <!-- 按鈕區結束 -->
					<!-- datatable -->
					<table id="table_id" class="display compact hover stripe"></table>
				</div>
				<!-- datatable區域結束 -->
			</div>
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

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->

	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<script>
		//       $("header").load("header.html");
		// $("div.sticky-navbar").load("sticky-navbar.html");
		// $("div.mobile-menu-container").load("mobile-menu-container.html");
		//       $("footer").load("footer.html");
		
		$(window).on("load",function() {
				var dataTable = $("#table_id").DataTable();
				// Add event listener for opening and closing details
				$('#table_id tbody').on('click','td.details-control',function() {
						var tr = $(this).closest('tr');
						var row = dataTable.row(tr);
						if (row.child.isShown()) {
								// This row is already open - close it
								row.child.hide();
								tr.removeClass('shown');
						} else {
								// Open this row
								row.child(format(row.data())).show();
								tr.addClass('shown');
							  }
					});
				   
				    //編輯賣家簡介
				    $("#edit_sellerIntro_btn").on("click",function(){
				    	var introText = $("#sellIntro_div").text().trim();
				    	$("#sellerIntroText").val(introText);
				    	$("#fs_alert1").css("display", "block");
				    });
				    
				    //賣家簡介彈窗取消
				    $("#fs_alert1_cancel").on("click",function(){
				    	$("#fs_alert1").css("display", "none");
				    });
				    
				    //賣家簡介彈窗更新
				    $("#fs_alert1_on").on("click",function(){
				    	$("#fs_alert1_form").submit();
	
				    });
				    
				    //新增商品
				    $("#add_item").on("click",function(){
				    	window.location.href = "${pageContext.request.contextPath}/shop/AddItem.jsp";
	
				    });
				    
				    
				    //編輯按鈕
					dataTable.on('click','button',function(e) {
							var data = dataTable.row(e.target.closest('tr')).data();
							var rowId = dataTable.row(e.target.closest('tr')).id();
                            
							if (data.ItemAddStat == "已上架") {

				            	 var yes = confirm("商品編號" + data.ItemNo + "目前是上架狀態，若要編輯請先將商品調整為草稿狀態。\n是否要將商品調整為草稿狀態?");

				                 if (yes) {
				                 	 $.ajax({
				     			            url: "${pageContext.request.contextPath}/shop/Seller.do", // 資料請求的網址
				     			            type: "POST",
				     			            data: {
				     			              action: "changeItemAddStat",
				     			              ItemNo: data.ItemNo,
				     			            },
				     			            dataType: "json", // 預期會接收到回傳資料的格式： json | xml | html
				     			            success: function (newdata) { // request 成功取得回應後執行
				     			            	 console.log(newdata);
				     			            	if(newdata.result == "fail"){
				     			            		alert("系統錯誤，請稍後再試。");
				     			            	}else{
				     			            	  data.ItemAddStat = "草稿";
				     			            	  dataTable.row("#" + rowId).data(data).draw();
				     			            	  alert("修改成功!")
				     			            	 
				     			            	}
				     			            },
				     			          });
				                 } 
							} else if(data.ItemAddStat == "已售出") {
								alert("該商品已售出，無法編輯。");
							} else{
								e.target.closest('form').submit();
								
							}
							

											});

						});
	</script>
</body>
</html>
