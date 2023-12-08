<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>編輯揪團 | ASAP</title>

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

</head>
<body>
	<div class="page-wrapper">
		<header class="header"></header>
		<!-- End .header -->
		<main class="main">
			<h2 class="creategrptitle">編輯揪團</h2>
			<div class="createform">
				<div class="createform_main">
					<form action="/submit" method="post">
						<div class="import" style="font-size: 10px; color: red;">*必填</div>
						<!-- 發起人資訊 -->
						<h3 style="color: #5A5AAD;">
							<i class="fas fa-user-circle"></i> 發起人資訊
						</h3>
						<br> <span class="form_textbox"> <label
							class="create_member"><a class="x">*</a>發起人：</label> <input
							class="MbrName" type="text" id="MbrName" name="MbrName" required
							placeholder="請輸入姓名" disabled>
						</span> <span class="form_textbox"> <label for="create_phonenum"><a
								class="x">*</a>連絡電話：</label> <input class="MbrPhone" type="tel"
							id="MbrPhone" name="MbrPhone" required placeholder="請輸入連絡電話"
							disabled>
						</span> <br> <span class="form_textbox"> <label
							for="create_email">電子信箱：</label> <input class="MbrEmail"
							type="email" id="MbrEmail" name="MbrEmail" placeholder="請輸入電子信箱"
							disabled>
						</span>

						<hr>
						<!-- 活動資訊 -->
						<h3 style="color: #5A5AAD;">
							<i class="fas fa-user-circle"></i> 活動資訊
						</h3>

						<span class="form_GrpNametxt"> <label for="Grp_Name"><a
								class="x">*</a>活動名稱：</label> <input type="text" id="GrpName"
							name="GrpName" required placeholder="請輸入活動名稱" disabled>
						</span> <br> <label for="SportType_Name"><a class="x">*</a>運動類別：</label>
						<select name="SportTypeName" id="SportTypeName" disabled>
							<option value="SportType_select">請選擇</option>
							<option value="1">游泳</option>
							<option value="2">棒球</option>
							<option value="3">網球</option>
							<option value="4">手球</option>
							<option value="5">籃球</option>
							<option value="6">排球</option>
							<option value="7">桌球</option>
							<option value="8">羽球</option>
							<option value="9">跑步</option>
							<option value="10">自行車</option>
							<option value="11">足球</option>
							<option value="12">高爾夫</option>
						</select> <label for="Grp_Date"><a class="x">*</a>活動日期：</label> <input
							type="date" id="GrpDate" name="GrpDate" required> <label
							for="selectstrtime"><a class="x">*</a>開始時間：</label> <input
							type="time" id="GrpStartTime" name="GrpStartTime" required>
						<br> <label for="selectendtime"><a class="x">*</a>結束時間：</label>
						<input type="time" id="GrpEndTime" name="GrpEndTime" required>
						<label for="Grp_PplMin"><a class="x">*</a>最低人數：</label> <input
							type="number" id="GrpPplMin" name="GrpPplMin" required> <a>人</a>
						<label for="GrpPplLimit"><a class="x">*</a>最高人數：</label> <input
							type="number" id="GrpPplLimit" name="GrpPplLimit" disabled>
						<a>人</a> <br> <label for="Grp_Address"><a class="x">*</a>活動地點：</label>
						<input type="text" id="GrpAddress1" name="Grpplace" required
							placeholder="例：台北體育館" disabled> <input type="text"
							id="GrpAddress2" name="GrpAddress" required placeholder="地址"
							disabled> <br> <label for="Grp_SignStrTime"><a
							class="x">*</a>報名期間：</label> <input type="date" id="GrpSignStrTime1"
							name="GrpSignStrTime" required> <input type="time"
							id="GrpSignStrTime2" name="GrpSignStrTime" required> <a
							class="an">至</a> <input type="date" id="GrpSignEndTime1"
							name="GrpSignEndTime" required> <input type="time"
							id="GrpSignEndTime2" name="GrpSignEndTime" required>
						<div>
							<label for="GrpImg">圖片上傳：</label> <input id="GrpImg"
								name="GrpImg" type="file" multiple="multiple">
						</div>
						<div id="preview">
							<span class="text">預覽圖</span>
						</div>
						<div>
							<label for="Grp_Note">注意事項：</label>
						</div>
						<textarea id="GrpNote" name="GrpNote" rows="5" cols="33"></textarea>
						<br>
						<div class="Grp_Btnsrr">
							<input type="submit" value="送出"> <a href="#"
								class="return-link" id="return_link">返回</a>
							<button type="reset">清空</button>
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
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {

							var form = document.querySelector('form');
							var MbrName = document.getElementById('MbrName');
							var MbrPhone = document.getElementById('MbrPhone');
							var GrpPplMin = document
									.getElementById('GrpPplMin');
							var GrpPplLimit = document
									.getElementById('GrpPplLimit');
							var preview_el = document.getElementById("preview");
							var GrpImg_el = document.getElementById("GrpImg");

							MbrName.addEventListener('input', function() {
								var regex = /^[\u4E00-\u9FFFa-zA-Z]+$/;
								if (!regex.test(MbrName.value)) {
									MbrName.setCustomValidity('只能輸入中文和英文');
								} else {
									MbrName.setCustomValidity('');
								}
							});

							MbrPhone
									.addEventListener(
											'input',
											function() {
												var regex = /^09\d{8}$/;
												if (!regex.test(MbrPhone.value)) {
													MbrPhone
															.setCustomValidity('必須以09開頭並為10位數字');
												} else {
													MbrPhone
															.setCustomValidity('');
												}
											});

							GrpPplMin
									.addEventListener(
											"input",
											function() {
												if (GrpPplMin.value <= 1) {
													GrpPplMin
															.setCustomValidity("人數請包含自己(預設為2),也不得設定為負數");
												} else {
													GrpPplMin
															.setCustomValidity("");
												}
											});

							GrpPplLimit
									.addEventListener(
											"input",
											function() {
												if (GrpPplLimit.value <= 1) {
													GrpPplLimit
															.setCustomValidity("人數請包含自己(預設為2),也不得設定為負數");
												} else if (GrpPplLimit.value < GrpPplMin.value) {
													GrpPplLimit
															.setCustomValidity("人數不得小於最低人數");
												} else {
													GrpPplLimit
															.setCustomValidity("");
												}
											});

							var GrpSignStrTime1 = document
									.getElementById('GrpSignStrTime1');
							var GrpSignEndTime1 = document
									.getElementById('GrpSignEndTime1');
							var GrpSignStrTime2 = document
									.getElementById('GrpSignStrTime2');
							var GrpSignEndTime2 = document
									.getElementById('GrpSignEndTime2');
							var GrpDate = document.getElementById('GrpDate');

							GrpSignStrTime1.addEventListener('input',
									function() {
										validateSignUpPeriod();
									});

							GrpSignEndTime1.addEventListener('input',
									function() {
										validateSignUpPeriod();
									});

							GrpDate.addEventListener('input', function() {
								validateSignUpPeriod();
							});

							function validateSignUpPeriod() {
								var startDate = new Date(
										`${GrpSignStrTime1.value}T${GrpSignStrTime2.value}`);
								var endDate = new Date(
										`${GrpSignEndTime1.value}T${GrpSignEndTime2.value}`);
								var eventDate = new Date(GrpDate.value);

								//報名結束日期小於報名開始日期 ->報名結束日期需晚於或等於起始日期
								if (endDate <= startDate) {
									GrpSignEndTime1
											.setCustomValidity("報名結束日期需晚於或等於起始日期");

								} else if (endDate.getTime() === startDate
										.getTime()
										&& GrpSignEndTime2.value < GrpSignStrTime2.value) {
									GrpSignStrTime2
											.setCustomValidity("日期若相同，結束時間需晚於起始時間");
									GrpSignEndTime2
											.setCustomValidity("日期若相同，結束時間需晚於起始時間");

								} else if (endDate > eventDate
										|| startDate > eventDate) {
									GrpSignEndTime1
											.setCustomValidity("報名日期不可大於活動日期");
									GrpSignEndTime2
											.setCustomValidity("報名日期不可大於活動日期");
								} else {
									GrpSignEndTime1.setCustomValidity("");
									GrpSignEndTime2.setCustomValidity("");
								}
							}

							// 透過 File 取得預覽圖
							var preview_img = function(file) {

								var reader = new FileReader(); // 用來讀取檔案
								reader.readAsDataURL(file); // 讀取檔案
								reader
										.addEventListener(
												"load",
												function() {

													var img_str = '<img src="' + reader.result + '" class="preview_img">';
													preview_el.innerHTML = img_str;
												});
							};

							GrpImg_el
									.addEventListener(
											"change",
											function(e) {
												if (this.files.length > 0) {
													preview_img(this.files[0]);
												} else {
													preview_el.innerHTML = '<span class="text">預覽圖</span>';
												}
											});

							form.addEventListener('submit', function(event) {
								event.preventDefault();
								alert('活動資訊修改成功！點選確定至【我的揪團】頁面');
							});
							var return_link_el = document
									.getElementById("return_link");

							return_link_el.addEventListener("click",
									function() {
										var result = window
												.confirm("未編輯完成確定要返回？");
										if (result === true) {
											// 用戶按下了確定return前一頁
										}
									});

							var clearFormFields = function() {
								document.getElementById('MbrName').value = '';
								document.getElementById('MbrPhone').value = '';
								document.getElementById('MbrEmail').value = '';
								document.getElementById('GrpName').value = '';
								document.getElementById('SportTypeName').value = 'SportType_select';
								document.getElementById('GrpDate').value = '';
								document.getElementById('GrpStartTime').value = '';
								document.getElementById('GrpEndTime').value = '';
								document.getElementById('GrpPplMin').value = '';
								document.getElementById('GrpPplLimit').value = '';
								document.getElementById('GrpAddress1').value = '';
								document.getElementById('GrpAddress2').value = '';
								document.getElementById('GrpImg').value = '';
								preview_el.innerHTML = '<span class="text">預覽圖</span>';
								document.getElementById('GrpNote').value = '';
								document.getElementById('GrpSignStrTime1').value = '';
								document.getElementById('GrpSignEndTime1').value = '';
							};

							var clearButton = document
									.querySelector('.Grp_Btnsrr button[type="reset"]');
							clearButton.addEventListener('click', function() {
								clearFormFields();
							});
						});
		function handleFormSubmission(event) {
			event.preventDefault();
			document.getElementById('address').disabled = true;
		}
	</script>

</body>
</html>