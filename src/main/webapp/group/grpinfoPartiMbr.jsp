<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- Favicon 網站圖示 -->
<link rel="icon" type="image/x-icon"
	href="assets/images/icons/asapLOGO.png" />

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
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" href="assets/css/demo2.min.css" />
<link rel="stylesheet" type="text/css"
	href="assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="assets/css/mycss.css" />
<link rel="stylesheet" type="text/css" href="assets/css/creategroup.css" />

<style>
.createform {
	width: 70%;
}

h3 {
	position: relative;
	left: 25px;
}

table {
	border-collapse: collapse;
	width: 80%;
	align-items: center;
	margin: 0 auto;
}

th, td {
	border: 0.5px solid #817b7b;
	padding: 8px;
	text-align: center;
}

tr:nth-child(even) {
	background-color: #E8FFF5;
	text-align: center;
}

th {
	background-color: #C4E1E1;
	text-align: center;
}

b.Joinqty {
	position: relative;
	left: 700px;
	text-decoration: underline;
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
</style>
</head>
<body>
	<div class="page-wrapper">
		<header class="header"></header>
		<!-- End .header -->
		<main class="main">
			<h2 class="creategrptitle">詳細資訊</h2>
			<div class="createform">
				<div class="createform_main">
					<div>
						<b class="Joinqty">目前參加人數<b>#</b>人
						</b>
					</div>
					<form action="#" method="post">
						<!-- 發起人資訊 -->
						<h3 style="color: #5A5AAD;">
							<i class="fas fa-user-circle"></i> 發起人資訊
						</h3>
						<br>
						<table class="grpjoin_tab1">
							<thead>
							<colgroup>
								<col style="width: 33.33%;">
								<col style="width: 33.33%;">
								<col style="width: 33.33%;">
							</colgroup>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" name="MbrName">發起人</th>
								<th class="grpjoin_tab1" name="MbrPhone">連絡電話</th>
								<th class="grpjoin_tab1" name="MbrEmail">電子信箱</th>
							</tr>
							</thead>
							<tbody>
								<tr class="grpjoin_tab1">
									<td class="grpjoin_tab1">John Doe</td>
									<td class="grpjoin_tab1">0912123456</td>
									<td class="grpjoin_tab1">123@yyy.com</td>
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
								<th class="grpjoin_tab1" name="GrpName">活動名稱</th>
								<td class="grpjoin_tab1">#</td>
								<th class="grpjoin_tab1" name="GrpImg" rowspan="5">圖片上傳</th>
								<td class="grpjoin_tab1" rowspan="5"></td>
							</tr>
							<tr>
								<th class="grpjoin_tab1" name="SportTypeName">運動類別</th>
								<td class="grpjoin_tab1">#</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" name="GrpDate">活動日期</th>
								<td class="grpjoin_tab1">#</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" name="GrpStartTime">開始時間</th>
								<td class="grpjoin_tab1">#</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" name="GrpEndTime">結束時間</th>
								<td class="grpjoin_tab1">#</td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" name="GrpPplMin">最低人數</th>
								<td class="grpjoin_tab1">#</td>
								<th class="grpjoin_tab1" name="GrpPplLimit">最高人數</th>
								<td class="grpjoin_tab1">#</td>
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" name="GrpAddress">活動地點</th>
								<td class="grpjoin_tab1">#</td>
								<th class="grpjoin_tab1" data-name1="GrpSignStrTime"
									data-name2="GrpSignEndTime">報名期間</th>
								<td class="grpjoin_tab1">#</td>
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" style="height: 150px;" name="GrpNote">注意事項</th>
								<td class="grpjoin_tab1" colspan="3">#</td>
								<!-- <th>#</th>
                              <td >#</td> -->
							</tr>
						</table>
						<br>
						<div class="Grp_Btnsrr">
							<button class="Btn_resort">編輯</button>
							<a href="#" class="return-link" id="return_link">返回</a>
							<button class="Btn_Join" id="Btn_Join">退出揪團</button>
						</div>
					</form>
					<!-- End .createform_main -->
				</div>
			</div>
		</main>
	</div>
	<!-- End .page-wrapper -->

	<footer class="footer bg-dark position-relative"></footer>
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

	<div class="mobile-menu-container"></div>
	<!-- End .mobile-menu-container -->

	<div class="sticky-navbar"></div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/plugins.min.js"></script>
	<script src="assets/js/nouislider.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.min.js"></script>

	<script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>

	<script>
		document.addEventListener('DOMContentLoaded', function() {

			// 編輯按鈕從後端轉頁面
			// 返回按鈕從後端轉頁面

			var Btn_Join_el = document.getElementById('Btn_Join');
			Btn_Join_el.addEventListener('click', function() {
				var result = window.confirm("確定要退出揪團?");
				if (result === true) {
					// 會員個人資料從參與資訊上刪除,跳轉到我的揪團頁面
				}
			});

		});
	</script>

</body>
</html>