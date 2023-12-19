<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.asap.group.entity.GrpInfoVO" %>


<%
    String type = (String) request.getAttribute("type");
    GrpInfoVO grpVO = (GrpInfoVO) request.getAttribute("grpVO");
%>


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
<!-- <link rel="icon" type="image/x-icon" -->
<!-- 	href="assets/images/icons/asapLOGO.png" /> -->

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


<style>
/* 彈窗樣式 */
	#creategrpfsfs_alert {
	    width: 100vw;
	    height: 100vh;
	    position: absolute;
	    top: 0;
	    /* display: block; */
	    display: none;
	    z-index: 999;
	}
	.creategrpfsfs_alert_bg {
	    width: 100vw;
	    height: 100vh;
	    background-color: rgba(0, 0, 0, 0.671);
	    position: fixed;
	    top: 0;
	    right:0px;
	    left:0px;
	    
	}
	.creategrpfsfs_alert_show {
		position: fixed;
	    max-width: 450px;
	    min-width: 400px;
		top: 25%;
		left: 32.64%;
	    background-color: white;
	    margin: auto;
	    z-index: 2;
	    border-radius: 8px;
	    text-align: center;
	    border-top: 20px solid;
        border-image: linear-gradient(to right, #F5F5DC, #D1E9E9, #6db1f1);
        border-image-slice: 1;
	}
	
	.creategrpfsfs_alert_title {
	    font-size: 30px;
	    text-align: center;
	    margin: 35px;
	    font-weight: bold;
	}
	.creategrpfsfs_alert_title_suc {
	    color:rgb(85, 184, 201);
	}
	.creategrpfsfs_alert_txt {
	    width: 80%;
	    word-wrap: break-word;
	    font-size: 16px;
	    padding: 0 20px;
	    text-align: center;
	    margin: 0px auto 15px auto;
	}
	#alert_yes {
	    margin: 20px 2px 45px 2px;
	}
	#alert_no {
	    margin: 20px 2px 45px 2px;
	}
	
	.btn_s {
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
	
	 .btn_s:hover { 
	     background-color:rgb(85, 184, 201);
	}
	
	.Btn_yesorno {
	    text-align: center;
	}
	
	.btn_s {
	    display: inline-block;
	    padding: 8px 16px;
	    margin: 0 5px;
	}
	.Btn_creategrp_sm {
		width:68px;
		height:42.4px;
	
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
        <!-- End .header-bottom -->
		</header>
		<!-- End .header -->
		
		<main class="main">
			<h2 class="creategrptitle">發起揪團</h2>
			<div class="createform">
				<div class="createform_main">
					<form id="creategrpform" action="<%=request.getContextPath()%>/Grpinfo.do?action=insertgrpInfo" method="post" enctype="multipart/form-data">
						<div class="import" style="font-size: 10px; color: red">*必填
						</div>
						<!-- 發起人資訊 -->
						<h3 style="color: #5a5aad">
							<i class="fas fa-user-circle"></i> 發起人資訊
						</h3>
						<br/> <span class="form_textbox"> 
						<label class="create_member">
						<a class="x">*</a>發起人：</label> 
<!--可串資料時再加disabled -->
						<input class="MbrName" type="text" id="MbrName" name="OrgMbrNo" required  />
						</span> 
						<span class="form_textbox"> 
						<label for="create_phonenum">
<!--可串資料時再加disabled -->
						<a class="x">*</a>連絡電話：</label> <input class="MbrPhone" type="tel"
							id="MbrPhone" name="MbrPhone" required  />
						</span> <br /> <span class="form_textbox"> 
<!--可串資料時再加disabled -->
						<label for="create_email">電子信箱：</label> <input class="MbrEmail"
							type="email" id="MbrEmail" name="MbrEmail"  />
						</span>
						<hr/>
						<!-- 活動資訊 -->
						<h3 style="color: #5a5aad">
							<i class="fas fa-user-circle"></i> 活動資訊</h3>
						<span class="form_GrpNametxt"> 
						<label for="Grp_Name">
						<a class="x">*</a>活動名稱：</label> 
						<input type="text" id="GrpName" name="GrpName" placeholder="請輸入活動名稱" required />
						</span> <br /> 
						
						<label for="SportTypeName">
						<a class="x">*</a>運動類別：</label>
						<select name="SportTypeName" id="SportTypeName" required>
							<option value="">請選擇</option>
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
						<label for="GrpAddress"><a class="x">*</a>活動地點：</label> 
						<input type="text" id="GrpAddress2" name="GrpAddress" required placeholder="例：台北體育館，台北市松山區南京東路四段10號" required /> <br /> 
							
							<label for="GrpSignStrTime"><a class="x">*</a>報名期間：</label> 
							<input type="date" id="GrpSignStrTime1" name="GrpSignStrDate" required />
							<input type="time" id="GrpSignStrTime2" name="GrpSignStrTime" required /> 
							<a class="an">至</a> 
							<input type="date" id="GrpSignEndTime1" name="GrpSignEndDate" required />
							<input type="time" id="GrpSignEndTime2" name="GrpSignEndTime" required />

						<div>
							<label for="GrpImg">圖片上傳：</label> 
							<input id="GrpImg" name="GrpImg" type="file"  multiple="multiple">
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
							<input class="Btn_creategrp_sm" id="InsertBtn" value="送出">
<%-- 							<a href="${pageContext.request.contextPath}/group/AllGroup.jsp" class="return-link" id="return_link">返回</a>						 --%>
							<button class="return-link" id="return_link" style="border: none;cursor: pointer; padding: 0;font: inherit;width:68px;height:42.4px;">返回</button>
							
							
							<!--返回彈窗 -->
							<div id="creategrpfsfs_alert">
						    <div class="creategrpfsfs_alert_bg"></div>
						    <div class="creategrpfsfs_alert_show"> 
						        <div class="creategrpfsfs_alert_title">提示:</div>
						        <div class="creategrpfsfs_alert_txt">確定要送出嗎?</div>
						        <div class="Btn_yesorno">
						            <input type="submit" class="btn_s" id="alert_yes" value="確定">
							   	    <input type="hidden" name="action" value="grpInfoinsert">
							   	    <input type="button" class="btn_s" id="alert_no" value="取消">
						        </div> 
						    </div>
						</div>
						<!--End .div彈窗畫面 -->
							
							<button type="reset">清空</button>
						</div>
						<!--彈窗畫面 -->
						<div id="creategrpfsfs_alert">
						    <div class="creategrpfsfs_alert_bg"></div>
						    <div class="creategrpfsfs_alert_show"> 
						        <div class="creategrpfsfs_alert_title">提示:</div>
						        <div class="creategrpfsfs_alert_txt">確定要送出嗎?</div>
						        <div class="Btn_yesorno">
						            <input type="submit" class="btn_s" id="alert_yes" value="確定">
							   	    <input type="hidden" name="action" value="grpInfoinsert">
							   	    <input type="button" class="btn_s" id="alert_no" value="取消">
						        </div> 
						    </div>
						</div>
					<!--End .div彈窗畫面 -->
					</form>			
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
<!-- // 		$("header").load("header.html"); -->
<!-- // 		$("footer").load("footer.html"); -->
<!-- // 		$("div.sticky-navbar").load("sticky-navbar.html"); -->
<!-- // 		$("div.mobile-menu-container").load("mobile-menu-container.html"); -->
<!-- 	</script> -->

	<script>
// 	 var form = document.querySelector("creategrpform");
	 document.addEventListener("DOMContentLoaded", function () {

	      });
// 清空OK
	</script>
	
	<script>
		var type = "${type}";
        if (type === "1"){

            var reserveText = "${grpVO.orgMbrNo}";
            document.getElementById('MbrName').value = reserveText;
            
           	reserveText = "${grpVO.sportTypeNo}";
            document.getElementById('SportTypeName').value = reserveText;
            
            reserveText = "${grpVO.grpName}";
            document.getElementById('GrpName').value = reserveText;
            
            var reserveDate = "${grpVO.grpDate}"; 
          	//2023-12-17 00:00:00.0 取第0個位置開始10個數字
            var datePart = reserveDate.substring(0, 10); 
         	document.getElementById('GrpDate').value = datePart;
            
         	var reserveTime = "${grpVO.grpStartTime}";
         	document.getElementById('GrpStartTime').value = reserveTime;
			
         	reserveTime = "${grpVO.grpEndTime}";
         	document.getElementById('GrpEndTime').value = reserveTime;
			
         	reserveText = "${grpVO.grpAddress}";
         	document.getElementById('GrpAddress2').value = reserveText;
         	
         	var reserveValue = "${grpVO.grpPplLimit}";
         	document.getElementById('GrpPplLimit').value = reserveValue;

         	var previousValue = "${grpVO.grpPplMin}";
         	document.getElementById('GrpPplMin').value = previousValue;
         	
         	//報名開始日期
         	reserveDate = "${grpVO.grpSignStrTime}"; 
            datePart = reserveDate.substring(0, 10); 
         	document.getElementById('GrpSignStrTime1').value = datePart;
         	
         	//報名開始時間
         	reserveDate = "${grpVO.grpSignStrTime}"; 
            datePart = reserveDate.substring(11, 19); 
         	document.getElementById('GrpSignStrTime2').value = datePart;
  
         	//報名結束日期
			reserveDate = "${grpVO.grpSignEndTime}"; 
            datePart = reserveDate.substring(0, 10); 
         	document.getElementById('GrpSignEndTime1').value = datePart;
         	
         	//報名結束時間
         	reserveDate = "${grpVO.grpSignEndTime}"; 
            datePart = reserveDate.substring(11, 19); 
         	document.getElementById('GrpSignEndTime2').value = datePart;
         	
         	//注意事項
         	reserveText = "${grpVO.grpNote}";
            document.getElementById('GrpNote').value = reserveText;
            
         	//圖片
//          	var imagePath = "${grpVO.grpImg}";
// 			document.getElementById('GrpImg').src = imagePath;  

			var previousImage = "${grpVO.grpImg}"; // 儲存先前的預覽圖片路徑
			
			var preview_img = function (file) {
			  var reader = new FileReader();
			  reader.readAsDataURL(file);
			  reader.addEventListener("load", function () {
			    var img_str = '<img src="' + reader.result + '" class="preview_img">';
			    preview_el.innerHTML = img_str;
			    previousImage = reader.result; // 儲存目前預覽的圖片路徑
			  });
			};
			
			GrpImg_el.addEventListener("change", function (e) {
			  if (this.files.length > 0) {
			    preview_img(this.files[0]);
			  } else {
			    preview_el.innerHTML = '<span class="text">預覽圖</span>';
			    previousImage = "${grpVO.grpImg}"; // 清除先前儲存的圖片路徑
			  }
			});

// // 假設使用者進入編輯模式時，先前已有預覽圖片路徑 previousImage
// if (previousImage !== "") {
//   // 在預覽區域顯示先前的預覽圖片
//   var img_str = '<img src="' + previousImage + '" class="preview_img">';
//   preview_el.innerHTML = img_str;
// } else {
//   preview_el.innerHTML = '<span class="text">預覽圖</span>';
// }
        }
	</script>
	
	<script>
		 //抓到彈窗的元素,並把彈窗顯示出來
	    function creategrpfsfs_alert(){
	        let creategrpfsfs_alert_el = document.getElementById('creategrpfsfs_alert');
	        creategrpfsfs_alert_el.style.display = 'block';
	
		    //抓到確認元素,按下確認按鈕即關閉
		    let alert_no_Btn = document.getElementById('alert_no');
		    alert_no_Btn.addEventListener('click',function(){
		    	creategrpfsfs_alert_el.style.display = 'none';
		    	});
	    }
	
	
	    function init() {
	       //為你的按鈕註冊事件
	       document.querySelector('#InsertBtn').addEventListener('click',creategrpfsfs_alert);
	    }
	
	    // 程式準備開始
	    window.addEventListener('load', init);

	</script>
	
</body>
</html>
