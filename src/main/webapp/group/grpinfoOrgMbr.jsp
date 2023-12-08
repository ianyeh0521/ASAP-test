<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.asap.member.entity.MemberVO" %>
<%@ page import="com.asap.group.entity.GrpInfoVO" %>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>詳細資訊 | ASAP</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template" />
<meta name="author" content="SW-THEMES" />

<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700", "Shadows+Into+Light:400",
					"Segoe+Script:300,400,500,600", ],
		},
	};
	(function(d) {
		var wf = d.createElement("script"), s = d.scripts[0];
		wf.src = "assets/js/webfont.js";
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->


<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo2.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group/mycss.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group/creategroup.css" />


	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#table_id")
								.DataTable(
										{
											language : {
												url : "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
											},
										});
					});
</script>
<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700", "Shadows+Into+Light:400", ],
		},
	};
	(function(d) {
		var wf = d.createElement("script"), s = d.scripts[0];
		wf.src = "assets/js/webfont.js";
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<style>
.createform {
	width: 70%;
}

h3 {
	position: relative;
	left: 25px;
}

table.grpjoin_tab1 {
	border-collapse: collapse;
	width: 80%;
	align-items: center;
	margin: 0 auto;
}

th.grpjoin_tab1, td.grpjoin_tab1 {
	border: 0.5px solid #817b7b;
	padding: 8px;
	text-align: center;
}

tr.grpjoin_tab1:nth-child(even) {
	background-color: #E8FFF5;
	text-align: center;
}

th.grpjoin_tab1 {
	background-color: #C4E1E1;
	text-align: center;
}

b.Joinqty {
	position: relative;
	left: 700px;
	color: #FF5151;
}

.Grp_Btnsrr {
	position: relative;
	text-align: center;
	margin-top: 20px;
}

.return-link {
	display: inline-block;
	padding: 10px 20px;
	background-color: #0066CC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	margin-right: 180px;
}

.Btn_resort {
	display: inline-block;
	padding: 10px 20px;
	background-color: #0066CC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	left: 380px;
	border: none;
}

button:hover, .return-link:hover {
	background-color: #0056b3;
}

.Btn_Join {
	display: inline-block;
	padding: 10px 20px;
	background-color: #FF6347;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	margin-right: 200px;
	border: none;
	cursor: pointer;
	margin-right: 20px;
	left: 465px;
}

.Btn_resort:hover {
	background-color: #0056a0;
}

.Btn_Join:hover {
	background-color: #FF5733;
}

@media ( max-width :1280px) {
	.createform {
		width: 896.600px;
	}
}

@media ( min-width :769px)and(max-width:1279px) {
	.createform {
		width: 896.600px;
	}
}

/* 彈窗樣式 */
.All_grpinfoorgmbr {
	display: none;
}

.fs_grpinfoorgmbr_bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 999;
}

.grpinfoorgmbr_show {
	position: fixed;
	top: 55%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgb(250, 247, 247);
	padding: 20px;
	z-index: 1000;
	width: 780px;
	height: 525px;
	border-radius: 8px;
	overflow-y: auto;
	border-top: 20px solid;
	border-image: linear-gradient(to right, #F5F5DC, #D1E9E9, #6db1f1);
	border-image-slice: 1;
}

#arrow-left {
	color: rgb(0, 0, 0);
	top: 20px;
}

.grpinfoorgmbr_show table {
	width: 100%;
	margin: 0 auto;
	/* text-align: center;  */
}

.grpinfoorgmbr_show th {
	padding: 0px;
	text-align: center;
}
</style>
</head>
<body>
	<!-- 發起人(詳細資訊) -->
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
        <!-- End .header-bottom -->
		</header>
		<!-- End .header -->
		<c:set var="grpVODetail" value="${grpVODetail}" />
		<main class="main">
			<h2 class="creategrptitle">詳細資訊</h2>
			<div class="createform">
				<div class="createform_main">
					<div>
						<i class="fas fa-chevron-down" id="fas_fa"
							style="position: relative; left: 690px;"></i><b class="Joinqty">目前參加人數<b>#</b>人
						</b>
					</div>
					<form action="/submit" method="post">
						<!-- 發起人資訊 -->
						<h3 style="color: #5A5AAD;">
							<i class="fas fa-user-circle"></i> 發起人資訊
						</h3>
						<br>
						<table class="grpjoin_tab1">
							<colgroup>
								<col style="width: 33.33%;">
								<col style="width: 33.33%;">
								<col style="width: 33.33%;">
							</colgroup>

							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >發起人</th>
								<th class="grpjoin_tab1" >連絡電話</th>
								<th class="grpjoin_tab1" >電子信箱</th>
							</tr>
						
							<tbody>
								<tr class="grpjoin_tab1">
									<td class="grpjoin_tab1">${grpVODetail.orgMbrNo}</td>
									<td class="grpjoin_tab1">${grpVODetail.orgMbrNo}</td>
									<td class="grpjoin_tab1">${grpVODetail.orgMbrNo}</td>
								</tr>
							</tbody>
							
						</table>
						<hr>
						<!-- 活動資訊 -->
						<h3 style="color: #5A5AAD;">
							<i class="fas fa-user-circle"></i> 活動資訊
						</h3>
						<br>
						<table class="grpjoin_tab1">
							<colgroup>
								<col style="width: 18%;">
								<col style="width: 32%;">
								<col style="width: 18%;">
								<col style="width: 32%;">
							</colgroup>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >活動名稱</th>
								<td class="grpjoin_tab1">${grpVODetail.grpName}</td>
								<th class="grpjoin_tab1"  rowspan="5">圖片上傳</th>
								<td class="grpjoin_tab1" rowspan="5"></td>
							</tr>
							<tr>
								<th class="grpjoin_tab1" >運動類別</th>
								<td class="grpjoin_tab1">${grpVODetail.sportTypeNo}</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >活動日期</th>
								<td class="grpjoin_tab1">${grpVODetail.grpDate}</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >開始時間</th>
								<td class="grpjoin_tab1">${grpVODetail.grpStartTime}</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >結束時間</th>
								<td class="grpjoin_tab1">${grpVODetail.grpEndTime}</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >最低人數</th>
								<td class="grpjoin_tab1">${grpVODetail.grpPplMin}</td>
								<th class="grpjoin_tab1" >最高人數</th>
								<td class="grpjoin_tab1">${grpVODetail.grpPplLimit}</td>
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >活動地點</th>
								<td class="grpjoin_tab1">${grpVODetail.grpAddress}</td>
								<th class="grpjoin_tab1" data-name1="GrpSignStrTime"
									data-name2="GrpSignEndTime">報名期間</th>
								<td class="grpjoin_tab1">${grpVODetail.grpSignStrTime}至${grpVODetail.grpSignEndTime}</td>
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" style="height: 150px;" >注意事項</th>
								<td class="grpjoin_tab1" colspan="3">${grpVODetail.grpNote}</td>
								<!-- <th>#</th>
                              <td >#</td> -->
							</tr>
						</table>
						<br>
						<div class="Grp_Btnsrr">
							<button class="Btn_resort">編輯</button>
							<a href="#" class="return-link">返回</a>
							<button class="Btn_Join" id="Btn_Join">解散揪團</button>
						</div>

						<!-- 彈窗畫面 -->
						<div id="All_grpinfoorgmbr" class="All_grpinfoorgmbr">
							<div class="fs_grpinfoorgmbr_bg"></div>
							<div class="grpinfoorgmbr_show">
								<i class="fas fa-arrow-left" id="arrow-left"></i>
								<h3 style="text-align: center; left: 10px">參與人資訊</h3>
								<div
									style="margin: 20px 10px; border-radius: 10px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;">
									<table id="table_id" class="display">
										<thead>
											<tr>
												<!-- 欄位標題 可以調整欄位數量但標題和內容要一起-->
												<th width="20%">序號</th>
												<th width="20%">參與人編號</th>
												<th width="20%">參與人</th>
												<th width="20%">連絡電話</th>
												<th width="20%">電子信箱</th>
											</tr>
										</thead>
										<tbody>
										
											<tr>
												<td>00000000000</td>
												<td>AKA0001</td>
												<td>林XX</td>
												<td>0912345678</td>
												<td>xxLin@yahoo.com.tw</td>
											</tr>
											<tr>
												<td>2</td>
												<td>AKA0087</td>
												<td>陳OO</td>
												<td>0912978678</td>
												<td>OOLin@gmail.com</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</form>
					<!-- End .createform_main -->
				</div>
			</div>
		</main>
	</div>
	<!-- End .page-wrapper -->

	<footer class="footer bg-dark position-relative">
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

	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

<!-- 	<script> -->
<!--  		$("header").load("header.html"); -->
<!--  		$("footer").load("footer.html"); -->
<!--  		$("div.sticky-navbar").load("sticky-navbar.html"); -->
<!--  		$("div.mobile-menu-container").load("mobile-menu-container.html"); -->
<!-- 	</script> -->

	<script>
		var chevronDown = document.getElementById('fas_fa');
		var popup = document.getElementById('All_grpinfoorgmbr');
		var fs_grpinfoorgmbr_bg = document
				.querySelector('.fs_grpinfoorgmbr_bg');
		var arrow_left = document.getElementById('arrow-left');

		chevronDown.addEventListener('click', function() {
			popup.style.display = 'block';
		});

		fs_grpinfoorgmbr_bg.addEventListener('click', function() {
			popup.style.display = 'none';
		});

		arrow_left.addEventListener('click', function() {
			popup.style.display = 'none';
		});

		form.addEventListener('submit', function(event) {
			event.preventDefault();
			alert('活動資訊新增成功！');
		});
		var return_link_el = document.getElementById("return_link");

		return_link_el.addEventListener("click", function() {
			var result = window.confirm("未編輯完成確定要返回？");
			if (result === true) {
				// 用戶按下了確定return我的揪團頁面
			}
		});

		// 編輯按鈕從後端轉頁面
		// 返回按鈕從後端轉頁面

		var Btn_Join_el = document.getElementById('Btn_Join');
		Btn_Join_el.addEventListener('click', function() {
			var result = window.confirm("確定要解散揪團?");
			if (result === true) {
				// 揪團狀態改為不成立,並不顯示在我的揪團和揪團首頁頁面,跳轉到我的揪團頁面
			}
		});
	</script>

</body>
</html>