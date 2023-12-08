<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}assets/images/icons/favicon.png" />
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

<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#table_id")
								.DataTable(
										{
											"language" : {
												url : "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
											},
											"ajax" : {
												url : "${pageContext.request.contextPath}/BackStageController", //要抓哪個地方的資料
												type : "GET", //使用什麼方式抓
												data : {
													"action" : "load"
												},
												dataType : "json", //回傳資料的類型
												// 												success : function(data) {
												// 													console.log("你是右邊!!");
												// 													console.log(data);
												// 												}, //成功取得回傳時的事件
												error : function() {
													console
															.log("資料取得失敗 回去檢討檢討");//失敗事件
												},
											},

											//列標題
											"columns" : [ {
												data : "BackNo",
												title : "編號"
											}, {
												data : "BackEmail",
												title : "帳號"
											}, {
												data : "BackName",
												title : "姓名"
											}, {
												data : "BackPhone",
												title : "手機"
											}, {
												data : "BackSetTime",
												title : "建立時間"
											}, {
												data : "BackUpdTime",
												title : "更新時間"
											}, {
												data : "BackStat",
												title : "狀態"
											}, {
												data : "BackAceType1",
												title : "購物平台管理"
											}, {
												data : "BackAceType2",
												title : "教練會員資料管理"
											}, {
												data : "BackAceType3",
												title : "場地管理"
											}, {
												data : "BackAceType4",
												title : "論壇管理"
											}, {
												data : "BackAceType5",
												title : "客服管理"
											}, ],
											columnDefs : [
													{
														targets : [ 0, 1, 2, 3 ],
														width : "11%", // 設定寬度
													},
													{
														targets : [ 4, 5, 6, 7,
																8, 9, 10 ],
														width : "8%", // 設定寬度
													}, ],
										});
					});
</script>
<style>
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
	/* width: 30%; */
	margin: 5px;
	/* text-align: left; */
}

.input_place {
	border-radius: 5px;
	/* width: 60%; */
	border: 1px gray solid;
	text-align: left;
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
			<!-- End .header-bottom -->
		</header>
		<!-- End .header -->

		<main class="main">
			<div class="page-header">
				<div class="container d-flex flex-column align-items-center">
					<h1>後台人員權限管理</h1>
				</div>
			</div>

			<!--這是彈窗 需要傳資料可以把form、input打開 他的css在上面-->
			<!--這是彈窗1-->
			<div id="fs_alert1">
				<div class="fs_alert_bg"></div>
				<div class="fs_alert_show">
					<div class="fs_alert_title">新增人員</div>

					<div class="fs_alert_txts">
					<form action="" method="post" style="margin-bottom: 15px" id="fs_alert1_form">
						<div class="input_div">
							<label for="BackEmail" class="input_label">後台人員帳戶</label><input
								type="text" id="BackEmail" name="BackEmail" class="input_place"
								placeholder="Email" required />
						</div>

						<div class="input_div">
							<label for="BackName" class="input_label">後台人員姓名</label><input
								type="text" id="BackName" name="BackName" class="input_place"
								required placeholder="Name" />
						</div>

						<div class="input_div">
							<label for="BackPhone" class="input_label">後台人員電話</label><input
								type="tel" id="BackPhone" name="BackPhone" class="input_place"
								required placeholder="Phone" />
						</div>

						<div
							style="display: flex; flex-wrap: wrap; justify-content: space-between;">
							<div>
								<input type="checkbox" id="BackAceType1" name="BackAceType"
									style="margin-right: 5px" value="1" /> <label
									for="BackAceType1" class="input_label">購物平台管理</label>
							</div>
							<div>
								<input type="checkbox" id="BackAceType2" name="BackAceType"
									style="margin-right: 5px" value="2" /> <label
									for="BackAceType2" class="input_label">教練會員資料管理</label>
							</div>
							<div>
								<input type="checkbox" id="BackAceType3" name="BackAceType"
									style="margin-right: 5px" value="3" /> <label
									for="BackAceType3" class="input_label">場地管理</label>
							</div>
							<div>
								<input type="checkbox" id="BackAceType4" name="BackAceType"
									class="input_place" value="4" /> <label for="BackAceType4"
									class="input_label">論壇管理</label>
							</div>
							<div>
								<input type="checkbox" id="BackAceType5" name="BackAceType"
									class="input_place" value="5" /> <label for="BackAceType5"
									class="input_label">客服管理</label>
							</div>
						</div>

<!-- 						<input type="hidden" name="action" value="AddBack" /> -->
						</form>
					</div>
					<div
						style="display: flex; justify-content: space-around; margin: 10px auto 20px auto;">
						<div class="btn_s" id="fs_alert1_add">新增</div>
						<div class="btn_c" id="fs_alert1_cancel">取消</div>
						
					</div>
				</div>
			</div>
			<!--彈窗1結束-->
			<!--這是彈窗2-->
			<div id="fs_alert2">
				<div class="fs_alert_bg"></div>
				<div class="fs_alert_show">
					<div class="fs_alert_title">編輯人員</div>

					<div class="fs_alert_txts">
						<form action="" method="post" style="margin-bottom: 15px"
							id="fs_alert2_form">
							<div class="input_div">
								<label for="BackNo2" class="input_label">後台人員編號</label><input
									type="text" id="BackNo2" name="BackNo" class="input_place"
									disabled />
							</div>
							<div class="input_div">
								<label for="BackEmail2" class="input_label">後台人員帳戶</label><input
									type="text" id="BackEmail2" name="BackEmail"
									class="input_place" placeholder="Email" required disabled />
							</div>

							<div class="input_div">
								<label for="BackName2" class="input_label">後台人員姓名</label><input
									type="text" id="BackName2" name="BackName" class="input_place"
									required placeholder="Name" />
							</div>

							<div class="input_div">
								<label for="BackPhone2" class="input_label">後台人員電話</label><input
									type="tel" id="BackPhone2" name="BackPhone" class="input_place"
									required placeholder="Phone" />
							</div>

							<div
								style="display: flex; flex-wrap: wrap; justify-content: space-between;">
								<div>
									<input type="checkbox" id="BackAceType2_1" name="BackAceType"
										style="margin-right: 5px" value="1" /> <label
										for="BackAceType2_1" class="input_label">購物平台管理</label>
								</div>
								<div>
									<input type="checkbox" id="BackAceType2_2" name="BackAceType"
										style="margin-right: 5px" value="2" /> <label
										for="BackAceType2_2" class="input_label">教練會員資料管理</label>
								</div>
								<div>
									<input type="checkbox" id="BackAceType2_3" name="BackAceType"
										style="margin-right: 5px" value="3" /> <label
										for="BackAceType2_3" class="input_label">場地管理</label>
								</div>
								<div>
									<input type="checkbox" id="BackAceType2_4" name="BackAceType"
										class="input_place" value="4" /> <label for="BackAceType2_4"
										class="input_label">論壇管理</label>
								</div>
								<div>
									<input type="checkbox" id="BackAceType2_5" name="BackAceType"
										class="input_place" value="5" /> <label for="BackAceType2_5"
										class="input_label">客服管理</label>
								</div>
							</div>

<!-- 							<input type="hidden" name="action" value="UpdateCourse" /> -->
						</form>
					</div>
					<div
						style="display: flex; justify-content: space-around; margin: 10px auto 20px auto;">
						<div class="btn_s" id="fs_alert2_update">更新</div>
						<div class="btn_c" id="fs_alert2_cancel">取消</div>
						<div class="btn_d" id="fs_alert2_delete">停權</div>
					</div>
				</div>
			</div>
			<!--彈窗2結束-->
			<div class="container login-container">
				<div
					style="margin: 20px 10px; border-radius: 10px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;">
					<div
						style="display: flex; justify-content: end; margin: 10px 0 15px 0">
						<button type="button" class="btn btn-primary btn-sm"
							style="border-radius: 5px" id="add_Backage">新增人員</button>
						<button type="button" id="update_Backage"
							class="btn btn-danger btn-sm"
							style="border-radius: 5px; margin-left: 10px;">編輯人員</button>
						<button type="button" id="unfocus" class="btn btn-success btn-sm"
                            style="border-radius: 5px; margin-left: 10px">取消選取 </button>
					</div>
					<table id="table_id" class="display compact hover stripe">
						<!-- <thead>
                <tr>
                 
                  <th width="10%">編號</th>
                  <th width="10%">帳號</th>
                  <th width="10%">姓名</th>
                  <th width="10%">手機</th>
                  <th width="5%">狀態</th>
                  <th width="7.5%">建立時間</th>
                  <th width="7.5%">更新時間</th>
                  <th width="7%">購物平台管理</th>
                  <th width="7%">教練會員資料管理</th>
                  <th width="7%">場地管理</th>
                  <th width="7%">論壇管理</th>
                  <th width="7%">客服管理</th>
                  <th width="5%">編輯</th>
                </tr>
              </thead> -->
						<!-- <tbody id="table_body"> -->
						<!-- 欄位內容 可以調整欄位數量但標題和內容要一起 也可以在欄位中加入需要的標籤img、buttom-->
						<!-- 這裡轉成jsp時可用c:forEach方法 -->
						<!-- <tr> -->
						<!-- <td class="BackNo">B1110001</td>
                  <td class="BackEmail">dan@gmail.com</td>
                  <td class="BackName">AAA</td>
                  <td class="BackPhone">0900000000</td> -->

						<!-- <td class="BackSetTime">2023/22/29 20:08</td>
                  <td class="BackUpdTime">2023/22/29 20:08</td>
                  <td class="BackStat">正常</td>
                  <td class="BackAceType1">V</td>
                  <td class="BackAceType2">V</td>
                  <td class="BackAceType3">V</td>
                  <td class="BackAceType4">X</td>
                  <td class="BackAceType5">X</td>
                  <td>
                    <button
                      type="button"
                      class="btn btn-danger btn-sm update"
                      style="border-radius: 5px"
                    >
                      編輯
                    </button>
                  </td> -->
						<!-- </tr> -->
						<!-- </tbody> -->
					</table>
				</div>
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

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->

	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<!--datepicker-->
	<!-- <script
      src="https://cdnjs.cloudflare.com/ajax/libs/datepicker/1.0.10/datepicker.min.js"
      integrity="sha512-RCgrAvvoLpP7KVgTkTctrUdv7C6t7Un3p1iaoPr1++3pybCyCsCZZN7QEHMZTcJTmcJ7jzexTO+eFpHk4OCFAg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script> -->

	<script>
		//       $("header").load("header.html");
		//       $("div.sticky-navbar").load("sticky-navbar.html");
		//       $("div.mobile-menu-container").load("mobile-menu-container.html");
		//       $("footer").load("footer.html");

		//datatable

		$(window)
				.on(
						"load",
						function() {
							var dataTable = $("#table_id").DataTable(); //抓到table

							function getDate() {
								var d = new Date();
								var day = d.getDate();
								var month = d.getMonth() + 1;
								var year = d.getFullYear();
								year = year.toString().slice(2, 4);
								if (day < 10) {
									day = "0" + day;
								}
								if (month < 10) {
									month = "0" + month;
								}

								var date = day.toString() + month.toString()
										+ year;

								return date;
							}

							function getNow() {
								var datetime = new Date();
								var now = datetime.toLocaleString("en-US", {
									hour12 : false
								});
								return now;
							}

							function getRowCount() {
								var num = dataTable.rows().count() + 1;
								if (num < 10) {
									num = "0000" + num;
									return num;
								}
								if (10 <= num < 100) {
									num = "000" + num;
									return num;
								}

								if (100 <= num < 1000) {
									num = "00" + num;
									return num;
								}

								if (1000 <= num < 10000) {
									num = "0" + num;
									return num;
								}

								if (10000 <= num) {
									num = num.toString();
									return num;
								}
							}
							//新增
							$("#add_Backage").on("click", function() {
								$("#fs_alert1").css("display", "block");
							});

							//新增取消
							$("#fs_alert1_cancel")
									.on(
											"click",
											function() {
												if (($("#BackEmail").val() != "")
														| ($("#BackName").val() != "")
														| ($("#BackPhone")
																.val() != "")) {
													var yes = confirm("確定要取消嗎?");
													if (yes) {
														$("#fs_alert1_form")[0]
																.reset();
														$("#fs_alert1").css(
																"display",
																"none");
													}
												} else {
													$("#fs_alert1_form")[0]
															.reset();
													$("#fs_alert1").css(
															"display", "none");
												}
											});

							//新增確定
							$("#fs_alert1_add")
									.on("click",function() {
												var boxcheck = $("#BackAceType1").prop("checked")
														| $("#BackAceType2").prop("checked")
														| $("#BackAceType3").prop("checked")
														| $("#BackAceType4").prop("checked")
														| $("#BackAceType5 ").prop("checked");

												if (($("#BackEmail").val() != "")
														& ($("#BackName").val() != "")
														& ($("#BackPhone").val() != "")
														& boxcheck) {

													//準備傳送到後端的資料
													var backEmail = $("#BackEmail").val().trim();
													var backName = $("#BackName").val().trim();
													var backPhone = $("#BackPhone").val().trim();
													var backAceType1 = $("#BackAceType1").prop("checked");
													var backAceType2 = $("#BackAceType2").prop("checked");
													var backAceType3 = $("#BackAceType3").prop("checked");
													var backAceType4 = $("#BackAceType4").prop("checked");
													var backAceType5 = $("#BackAceType5").prop("checked");

													//傳送到後端
													$.ajax({
																url : "${pageContext.request.contextPath}/BackStageController", // 資料請求的網址
																type : "POST",
																data : {
																	"action" : "add",
																	"backEmail" : backEmail,
																	"backName" : backName,
																	"backPhone" : backPhone,
																	"backAceType1" : backAceType1,
																	"backAceType2" : backAceType2,
																	"backAceType3" : backAceType3,
																	"backAceType4" : backAceType4,
																	"backAceType5" : backAceType5
																},
																dataType : "json", // 預期會接收到回傳資料的格式： json | xml | html
																success : function(
																		data) { // request 成功取得回應後執行
																	console.log(data);
																	dataTable.row.add(data).draw();
																	}
															});
													       $("#fs_alert1_form")[0].reset();
													       $("#fs_alert1").css("display","none");

													// 									var data = {
													// 										BackNo : backNo,
													// 										BackEmail : backEmail,
													// 										BackName : backName,
													// 										BackPhone : backPhone,
													// 										BackStat : backStat,
													// 										BackSetTime : backSetTime,
													// 										BackUpdTime : backUpdTime,
													// 										BackAceType1 : backAceType1,
													// 										BackAceType2 : backAceType2,
													// 										BackAceType3 : backAceType3,
													// 										BackAceType4 : backAceType4,
													// 										BackAceType5 : backAceType5,
													// 									};

													// 									dataTable.row.add(data).draw();
													// 									$("#fs_alert1_form")[0].reset();
													// 									$("#fs_alert1").css("display", "none");
													// $("#fs_alert1_form").submit();
												} else {
													alert("請確認所有欄位皆以填寫。");
												}
												
												
											});
							//選取
					        $("#table_id tbody").on("click", "tr", function () {
					          if ($(this).hasClass("selected")) {
					            $(this).removeClass("selected");
					          } else {
					            dataTable.$("tr.selected").removeClass("selected");
					            $(this).addClass("selected");
					          }
					        });

					        //取消選取
					        $("#unfocus").on("click", function () {
					          dataTable.$("tr.selected").removeClass("selected");
					        });
					        
					        //更新事件
					        $("#update_Backage").on("click", function () {
					          //確認有選取
					          var num = -1;
					          $("tbody tr").each(function (i, ele) {
					            if ($(ele).hasClass("selected")) {
					              num = i;
					            }
					          });
                              //跳彈窗
					          if (num != -1) {
					            $("#fs_alert2").css("display", "block");
					            var rowData = dataTable.row(".selected").data();
					            console.log(rowData);

					            $("#BackNo2").val(rowData.BackNo);
					            $("#BackEmail2").val(rowData.BackEmail);
					            $("#BackName2").val(rowData.BackName);
					            $("#BackPhone2").val(rowData.BackPhone);
					            if (rowData.BackAceType1 == "V") {
					              $("#BackAceType2_1").prop("checked", true);
					            }
					            if (rowData.BackAceType2 == "V") {
					              $("#BackAceType2_2").prop("checked", true);
					            }
					            if (rowData.BackAceType3 == "V") {
					              $("#BackAceType2_3").prop("checked", true);
					            }
					            if (rowData.BackAceType4 == "V") {
					              $("#BackAceType2_4").prop("checked", true);
					            }
					            if (rowData.BackAceType5 == "V") {
					              $("#BackAceType2_5").prop("checked", true);
					            }

					            //更新

					            $("#fs_alert2_update").on("click", function (e) {
					              e.stopPropagation();
					              var boxcheck =
					                $("#BackAceType2_1").prop("checked")|
					                $("#BackAceType2_2").prop("checked") |
					                $("#BackAceType2_3").prop("checked") |
					                $("#BackAceType2_4").prop("checked") |
					                $("#BackAceType2_5").prop("checked");
					              if (
					                ($("#BackName2").val() != "") &
					                ($("#BackPhone2").val() != "") &
					                boxcheck
					              ) {
					                var backName2 = $("#BackName2").val().trim();
					                var backPhone2 = $("#BackPhone2").val().trim();
					                var backAceType2_1 = $("#BackAceType2_1").prop("checked")
					                  ? "V"
					                  : "X";
					                var backAceType2_2 = $("#BackAceType2_2").prop("checked")
					                  ? "V"
					                  : "X";
					                var backAceType2_3 = $("#BackAceType2_3").prop("checked")
					                  ? "V"
					                  : "X";
					                var backAceType2_4 = $("#BackAceType2_4").prop("checked")
					                  ? "V"
					                  : "X";
					                var backAceType2_5 = $("#BackAceType2_5").prop("checked")
					                  ? "V"
					                  : "X";
					                console.log(backAceType2_1)
					                if (
					                  (backName2 != rowData.BackName) |
					                  (backPhone2 != rowData.BackPhone) |
					                  (backAceType2_1 != rowData.BackAceType1) |
					                  (backAceType2_2 != rowData.BackAceType2) |
					                  (backAceType2_3 != rowData.BackAceType3) |
					                  (backAceType2_4 != rowData.BackAceType4) |
					                  (backAceType2_5 != rowData.BackAceType5)
					                ) {
					                  
					                //傳送到後端
									$.ajax({
											url : "${pageContext.request.contextPath}/BackStageController", // 資料請求的網址
											type : "POST",
											data : {
												"action" : "update",
												"backNo" : rowData.BackNo,
												"backName" : backName2,
												"backPhone" : backPhone2,
												"backAceType1" : backAceType2_1,
												"backAceType2" : backAceType2_2,
												"backAceType3" : backAceType2_3,
												"backAceType4" : backAceType2_4,
												"backAceType5" : backAceType2_5
											},
											dataType : "json", // 預期會接收到回傳資料的格式： json | xml | html
											success : function(newdata) { // request 成功取得回應後執行
												console.log(newdata);
												dataTable.row("tr.selected").data(newdata).draw();
												
												}
										});
					                  
					                  alert("資料已修改");
					                  $("#fs_alert2_form")[0].reset();
					                  dataTable.$("tr.selected").removeClass("selected");
					                  $("#fs_alert2").css("display", "none");
					                } else {
					                  alert("資料無修改");
					                  $("#fs_alert2_form")[0].reset();
					                  dataTable.$("tr.selected").removeClass("selected");
					                  $("#fs_alert2").css("display", "none");
					                }

					                // var data = {
					                //   BackNo: backNo,
					                //   BackEmail: backEmail,
					                //   BackName: backName,
					                //   BackPhone: backPhone,
					                //   BackStat: backStat,
					                //   BackSetTime: backSetTime,
					                //   BackUpdTime: backUpdTime,
					                //   BackAceType1: backAceType1,
					                //   BackAceType2: backAceType2,
					                //   BackAceType3: backAceType3,
					                //   BackAceType4: backAceType4,
					                //   BackAceType5: backAceType5,
					                // };

					                // dataTable.row(data).draw();
					                // $("#fs_alert1_form")[0].reset();
					                // $("#fs_alert1").css("display", "none");
					                // $("#fs_alert2_form").submit();
					              } else {
					                alert("請確認所有欄位皆以填寫。");
					              }
					            });
					          } else {
					            alert("請先選擇資料。");
					          }
					        });

					        //取消更新
					        $("#fs_alert2_cancel").on("click", function () {
					          $("#fs_alert2_form")[0].reset();
					          dataTable.$("tr.selected").removeClass("selected");
					          $("#fs_alert2").css("display", "none");
					        });

						
						});
	</script>
</body>
</html>
