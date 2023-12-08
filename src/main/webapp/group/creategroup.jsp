<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>發起揪團 | ASAP</title>

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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo2.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group//mycss.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group/creategroup.css" />
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
        <!-- End .header-bottom -->
		</header>
		<!-- End .header -->
<%-- 		<c:set var="grpVODetail" value="${grpVODetail}" /> --%>
		<main class="main">
			<h2 class="creategrptitle">發起揪團</h2>
			<div class="createform">
				<div class="createform_main">
					<form action="<%=request.getContextPath()%>/Grpinfo.do" method="post">
						<div class="import" style="font-size: 10px; color: red">*必填
						</div>
						<!-- 發起人資訊 -->
						<h3 style="color: #5a5aad">
							<i class="fas fa-user-circle"></i> 發起人資訊
						</h3>
						<br/> <span class="form_textbox"> 
						<label class="create_member">
						<a class="x">*</a>發起人：</label> 
						<input class="MbrName" type="text" id="MbrName" name="MbrName" required
							placeholder="請輸入姓名" disabled />
						</span> 
						<span class="form_textbox"> 
						<label for="create_phonenum">
						<a class="x">*</a>連絡電話：</label> <input class="MbrPhone" type="tel"
							id="MbrPhone" name="MbrPhone" required placeholder="請輸入連絡電話"
							disabled />
						</span> <br /> <span class="form_textbox"> <label
							for="create_email">電子信箱：</label> <input class="MbrEmail"
							type="email" id="MbrEmail" name="MbrEmail" placeholder="請輸入電子信箱"
							disabled />
						</span>

						<hr/>
						<!-- 活動資訊 -->
						<h3 style="color: #5a5aad">
							<i class="fas fa-user-circle"></i> 活動資訊
						</h3>

						<span class="form_GrpNametxt"> 
						<label for="Grp_Name">
						<a class="x">*</a>活動名稱：</label> 
						<input type="text" id="GrpName" name="GrpName" required placeholder="請輸入活動名稱" required />
						</span> <br /> <label for="SportTypeName">
						<a class="x">*</a>運動類別：</label>
						<select name="SportTypeName" id="SportTypeName">
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
						</select> <label for="Grp_Date">
						<a class="x">*</a>活動日期：</label> 
						<input type="date" id="GrpDate" name="GrpDate" required /> 
						<label for="selectstrtime"><a class="x">*</a>開始時間：</label> 
						<input type="time" id="GrpStartTime" name="GrpStartTime" required />
						<br /> 
						<label for="GrpEndTime"><a class="x">*</a>結束時間：</label> 
						<input type="time" id="GrpEndTime" name="GrpEndTime" required /> 
						<label for="GrpPplMin"><a class="x">*</a>最低人數：</label> 
						<input type="number" id="GrpPplMin" name="GrpPplMin" required value="2" />
						<a>人</a> <label for="GrpPplLimit">
					    <a class="x">*</a>最高人數：</label>
						<input type="number" id="GrpPplLimit" name="GrpPplLimit" required
							value="2" /> <a>人</a> <br /> 
							<label for="GrpAddress">
							<a class="x">*</a>活動地點：</label> 
							<input type="text" id="GrpAddress1"
							name="Grpplace" required placeholder="例：台北體育館" required />
						<input type="text" id="GrpAddress2" name="GrpAddress" required
							placeholder="地址" required /> <br /> 
							<label for="GrpSignStrTime"><a class="x">*</a>報名期間：</label> <input
							type="date" id="GrpSignStrTime1" name="GrpSignStrTime" required />
						<input type="time" id="GrpSignStrTime2" name="GrpSignStrTime"
							required /> <a class="an">至</a> <input
							type="date" id="GrpSignEndTime1" name="GrpSignEndTime" required />
						<input type="time" id="GrpSignEndTime2" name="GrpSignEndTime"
							required />
						<div>
							<label for="GrpImg">圖片上傳：</label> <input id="GrpImg"
								name="GrpImg" type="file" multiple="multiple">
						</div>
						<div id="preview">
							<span class="text">預覽圖</span>
						</div>
						<div>
							<label for="GrpNote">注意事項：</label>
						</div>
						<textarea id="GrpNote" name="GrpNote" rows="5" cols="33"></textarea>
						<br />
						<div class="Grp_Btnsrr">
							<input type="submit" value="送出" /> <a href="#"
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
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.bundle.min.js"></script>
	<script src="assets/js/plugins.min.js"></script>
	<script src="assets/js/nouislider.min.js"></script>

	<!-- Main JS File -->
	<script src="assets/js/main.min.js"></script>

<!-- 	<script> -->
// 		$("header").load("header.html");
// 		$("footer").load("footer.html");
// 		$("div.sticky-navbar").load("sticky-navbar.html");
// 		$("div.mobile-menu-container").load("mobile-menu-container.html");
<!-- 	</script> -->

	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var form = document.querySelector("form");
							var MbrName = document.getElementById("MbrName");
							var MbrPhone = document.getElementById("MbrPhone");
							var GrpPplMin = document
									.getElementById("GrpPplMin");
							var GrpPplLimit = document
									.getElementById("GrpPplLimit");
							var preview_el = document.getElementById("preview");
							var GrpImg_el = document.getElementById("GrpImg");

							MbrName.addEventListener("input", function() {
								var regex = /^[\u4E00-\u9FFFa-zA-Z]+$/;
								if (!regex.test(MbrName.value)) {
									MbrName.setCustomValidity("只能輸入中文和英文");
								} else {
									MbrName.setCustomValidity("");
								}
							});

							MbrPhone
									.addEventListener(
											"input",
											function() {
												var regex = /^09\d{8}$/;
												if (!regex.test(MbrPhone.value)) {
													MbrPhone
															.setCustomValidity("必須以09開頭並為10位數字");
												} else {
													MbrPhone
															.setCustomValidity("");
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
							//開始日期
							var GrpSignStrTime1 = document
									.getElementById("GrpSignStrTime1");
							//結束日期
							var GrpSignEndTime1 = document
									.getElementById("GrpSignEndTime1");
							//開始時間
							var GrpSignStrTime2 = document
									.getElementById("GrpSignStrTime2");
							//結束時間
							var GrpSignEndTime2 = document
									.getElementById("GrpSignEndTime2");
							var GrpDate = document.getElementById("GrpDate");

							GrpSignStrTime1.addEventListener("input",
									function() {
										validateSignUpPeriod();
									});

							GrpSignEndTime1.addEventListener("input",
									function() {
										validateSignUpPeriod();
									});

							GrpDate.addEventListener("input", function() {
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
								alert('活動資訊新增成功！');
							});
							var return_link_el = document
									.getElementById("return_link");

							return_link_el.addEventListener("click",
									function() {
										var result = window
												.confirm("未編輯完成確定要返回？");
										if (result === true) {
											// 用戶按下了確定return我的揪團頁面
										}
									});

							var clearFormFields = function() {
								document.getElementById("MbrName").value = "";
								document.getElementById("MbrPhone").value = "";
								document.getElementById("MbrEmail").value = "";
								document.getElementById("GrpName").value = "";
								document.getElementById("SportTypeName").value = "SportType_select";
								document.getElementById("GrpDate").value = "";
								document.getElementById("GrpStartTime").value = "";
								document.getElementById("GrpEndTime").value = "";
								document.getElementById("GrpPplMin").value = "";
								document.getElementById("GrpPplLimit").value = "";
								document.getElementById("GrpAddress1").value = "";
								document.getElementById("GrpAddress2").value = "";
								document.getElementById("GrpImg").value = "";
								preview_el.innerHTML = '<span class="text">預覽圖</span>';
								document.getElementById("GrpNote").value = "";
								document.getElementById("GrpSignStrTime1").value = "";
								document.getElementById("GrpSignEndTime1").value = "";
							};

							var clearButton = document
									.querySelector('.Grp_Btnsrr button[type="reset"]');
							clearButton.addEventListener("click", function() {
								clearFormFields();
							});
						});
	</script>
</body>
</html>
