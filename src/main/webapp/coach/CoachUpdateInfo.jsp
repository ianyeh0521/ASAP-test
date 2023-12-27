<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.asap.coach.entity.*"%>
<%@ page import="com.asap.coach.service.*"%>
<%@ page import="java.util.*"%>
<%
CoachVO coachVo = (CoachVO) session.getAttribute("coachVo");
String cNo = coachVo.getCoachNo();
SportCertService sCertService = new SportCertService();
List<SportCertVO> list =  sCertService.findByCoachNo(cNo);
if(list.size()>= 1){
	pageContext.setAttribute("sportType1", list.get(0).getSportType());
	pageContext.setAttribute("sportCertNo1", list.get(0).getSportCertNo());
}else{
	pageContext.setAttribute("sportType1", "請選擇");
	pageContext.setAttribute("sportCertNo1", " ");
}
if(list.size()>= 2){
	pageContext.setAttribute("sportType2", list.get(1).getSportType());
	pageContext.setAttribute("sportCertNo2", list.get(1).getSportCertNo());
}else{
	pageContext.setAttribute("sportType2", "請選擇");
	pageContext.setAttribute("sportCertNo2", " ");
}
if(list.size()>= 3){
	pageContext.setAttribute("sportType3", list.get(2).getSportType());
	pageContext.setAttribute("sportCertNo3", list.get(2).getSportCertNo());
}else{
	pageContext.setAttribute("sportType3", "請選擇");
	pageContext.setAttribute("sportCertNo3", " ");
}
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

    <title>ASAP</title>

   
    <!-- Favicon -->
    <link
      rel="icon"
      type="image/x-icon"
      href="${pageContext.request.contextPath}/assets/images/icons/favicon.png"
    />

    <!-- Plugins CSS File -->
    <link rel="stylesheet"
     type="text/css"
     href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

    <!-- Main CSS File -->
    <link rel="stylesheet" 
     type="text/css"
     href="${pageContext.request.contextPath}/assets/css/style.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"
    />
    <style>
      .preview_img {
        max-width: 100%;
        max-height: 100%s;
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
						<a href="${pageContext.request.contextPath}/coach/CoachHome.jsp" style="width: 222; height: 88;"> <img
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
							<c:if test="${coachVo.coachStat}">
							<li><a href="${pageContext.request.contextPath}/course/listAllCourses_datatable.jsp">課程管理</a></li>
							</c:if>
							<li><a href="${pageContext.request.contextPath}/coach/CoachChat.jsp">客服</a></li>
							<li><a><form action="${pageContext.request.contextPath}/CoachController" method="post" style="margin: 0px;"><button type="submit" style="border:0px; background-color:white;">登出</button><input type="hidden" name="action" value="logout"/></form></a></li>
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
            <h1>教練會員資料修改</h1>
          </div>
        </div>
        <div style="text-align: center; margin: 5px 0;"> 
        	<c:if test="${not empty errorMsgs}">
					<c:forEach var="message" items="${errorMsgs}">
						<p style="color: red; font-size: 12px;">${message}</p>
					</c:forEach>

			</c:if>
        </div>

        <div class="container login-container">
          <form action="${pageContext.request.contextPath}/CoachController" method="post" id="register_form" enctype="multipart/form-data">
            <div class="row">
              <!-- <div  style="padding: 0px 10px;max-width: 83.33%; margin: 0px 25px;width: 100%;"> -->
              <div class="col-md-6">
                <!-- <div class="heading mb-1">
                  <h2 class="title">基本資料</h2>
                </div> -->

                <label for="register-email">
                  教練會員帳號
                  <span class="required">*</span>
                </label>
                <input
                  disabled
                  type="email"
                  class="form-input form-wide"
                  id="register-email"
                 
                  name="CoachEmail"
                  placeholder="Email"
                  value="${coachVo.coachEmail}"
                />


                <label for="register-name">
                  教練會員姓名(只能是中、英文字母, 且長度必需在2到10之間)
                  <span class="required">*</span>
                </label>
                <input
                  type="text"
                  class="form-input form-wide"
                  id="register-name"
                  required
                  placeholder="Name"
                  name="CoachName"
                  value="${coachVo.coachName}"
                />

                <label for="register-phone">
                  會員手機
                  <span class="required">*</span>
                </label>
                <input
                  type="tel"
                  class="form-input form-wide"
                  id="register-phone"
                  required
                  placeholder="Phone"
                  name="CoachPhone"
                  value="${coachVo.coachPhone}"
                />


                <label for="CoachIntro"> 教練自我介紹 </label>
                <textarea id="CoachIntro" name="CoachIntro" class="form-input form-wide" style="height:180px;resize: none;" >
                ${coachVo.coachIntro}
                </textarea>
               
              </div>

              <div class="col-md-6">
                <!-- <div class="heading mb-1">
                  <h2 class="title">專業資料</h2>
                </div> -->

                <label>
                  運動專業(可複選)
                  <span class="required">*</span>
                </label>
                <div
                  style="display: flex; flex-wrap: wrap; margin-bottom: 1.7rem"
                  class="form-wide"
                >
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      value="1"
                      id="1"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="1" style="margin-bottom: 0px">游泳</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      value="2"
                      id="2"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="2" style="margin-bottom: 0px">棒球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="3"
                      value="3"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="3" style="margin-bottom: 0px">網球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="4"
                      value="4"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="4" style="margin-bottom: 0px">手球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="5"
                      name="CoachSportTypeNo"
                      value="5"
                      style="margin-right: 5px"
                    /><label for="5" style="margin-bottom: 0px">籃球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="6"
                      name="CoachSportTypeNo"
                      value="6"
                      style="margin-right: 5px"
                    /><label for="6" style="margin-bottom: 0px">排球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="7"
                      value="7"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="7" style="margin-bottom: 0px">桌球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="8"
                      value="8"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="8" style="margin-bottom: 0px">羽球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="9"
                      value="9"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="9" style="margin-bottom: 0px">跑步</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="10"
                      name="CoachSportTypeNo"
                      value="10"
                      style="margin-right: 5px"
                    /><label for="10" style="margin-bottom: 0px">自行車</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="11"
                      value="11"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="11" style="margin-bottom: 0px">足球</label>
                  </div>
                  <div style="width: 15%; margin: 0 5px">
                    <input
                      type="checkbox"
                      id="12"
                      value="12"
                      name="CoachSportTypeNo"
                      style="margin-right: 5px"
                    /><label for="12" style="margin-bottom: 0px">高爾夫</label>
                  </div>
                </div>

                <label for="CoachExp">
                  教學經驗(年) <span class="required">*</span></label
                >
                <input
                  required
                  type="number"
                  class="form-input form-wide"
                  id="CoachExp"
                  name="CoachExp"
                  value="${coachVo.coachExp}"
                   min="0" max="100"
                />

                <label>
                  個人照
                  <span class="required">*</span>
                </label>
                <div
                  style="
                    display: flex;
                    flex-wrap: wrap;
                    margin-bottom: 1.7rem;
                    align-items: center;
                  "
                >
                  <!-- <input type="file" name="CoachImg" width="40%" /> -->
                  <label
                    class="btn btn-info btn-sm"
                    style="
                      border-radius: 10px;
                      background-color: lightgrey;
                      border: 0px;
                      margin: 0px;
                    "
                  >
                    <input
                      id="upload_img"
                      style="display: none"
                      name="CoachImg"
                      type="file"
                      accept="image/*"
                    />
                    <i class="far fa-image"></i> 上傳圖片
                  </label>
                  <div
                    id="preview_coachImg"
                    style="
                      margin-left: 10%;
                      border: 1px dashed lightgray;
                      display: inline-block;
                      width: 75px;
                      height: 100px;
                      text-align: center;
                    "
                  ></div>
                </div>

                <label style="display: block">
                  專業證照
                   </label>
                <div
                  style="
                    max-height: 300px;
                    overflow-y: scroll;
                    overflow-x: hidden;
                    border: 0.5px solid lightgray;
                  "
                  id="certImgList"
                >
                  <!--證照1-->
                  <div
                    style="
                      display: flex;
                      flex-wrap: wrap;
                      margin-bottom: 1.7rem;
                      align-items: center;
                      justify-content: space-around;
                    "
                  >
                    <!--運動種類下拉選單-->
                    <div>
                      <label for="certSportType1" style="margin: 0">
                        運動種類
                      </label>
                      <select
                        name="certSportType1"
                        id="certSportType1"
                        style="margin-left: 15px"
                      >
                        <option value="請選擇" selected>請選擇</option>
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
                      </select>
                    </div>
                    <!--上傳圖片鈕-->
                    <div style="width: 50%; display: flex; align-items: center">
                      <label
                        class="btn btn-info btn-sm"
                        style="
                          border-radius: 10px;
                          background-color: lightgrey;
                          border: 0px;
                          margin: 0px 0px 0px 15px;
                        "
                      >
                        <input
                          class="upload_cert"
                          style="display: none"
                          name="CoachCertImg1"
                          type="file"
                          accept="image/*"
                        />
                        <i class="far fa-image"></i> 上傳圖片
                      </label>
                      <!--預覽圖-->
                      <div
                        class="preview"
                        id="preview_cert1"
                        style="
                          margin-left: 10%;
                          margin-top: 5px;
                          border: 1px dashed lightgray;
                          display: inline-block;
                          width: 75px;
                          height: 100px;
                          text-align: center;
                        "
                      ></div>
                    </div>
                  </div>

                  <!--證照2-->
                  <div
                    style="
                      display: flex;
                      flex-wrap: wrap;
                      margin-bottom: 1.7rem;
                      align-items: center;
                      justify-content: space-around;
                    "
                  >
                    <!--運動種類下拉選單-->
                    <div>
                      <label for="certSportType2" style="margin: 0">
                        運動種類
                      </label>
                      <select
                        name="certSportType2"
                        id="certSportType2"
                        style="margin-left: 15px"
                      >
                        <option value="請選擇" selected>請選擇</option>
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
                      </select>
                    </div>
                    <!--上傳圖片鈕-->
                    <div style="width: 50%; display: flex; align-items: center">
                      <label
                        class="btn btn-info btn-sm"
                        style="
                          border-radius: 10px;
                          background-color: lightgrey;
                          border: 0px;
                          margin: 0px 0px 0px 15px;
                        "
                      >
                        <input
                          class="upload_cert"
                          style="display: none"
                          name="CoachCertImg2"
                          type="file"
                          accept="image/*"
                        />
                        <i class="far fa-image"></i> 上傳圖片
                      </label>
                      <!--預覽圖-->
                      <div
                        class="preview"
                        id="preview_cert2"
                        style="
                          margin-left: 10%;
                          border: 1px dashed lightgray;
                          display: inline-block;
                          width: 75px;
                          height: 100px;
                          text-align: center;
                        "
                      ></div>
                    </div>
                  </div>

                  <!--證照3-->
                  <div
                    style="
                      display: flex;
                      flex-wrap: wrap;
                      margin-bottom: 1.7rem;
                      align-items: center;
                      justify-content: space-around;
                    "
                  >
                    <!--運動種類下拉選單-->
                    <div>
                      <label for="certSportType3" style="margin: 0">
                        運動種類
                      </label>
                      <select
                        name="certSportType3"
                        id="certSportType3"
                        style="margin-left: 15px"
                      >
                        <option value="請選擇" selected>請選擇</option>
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
                      </select>
                    </div>
                    <!--上傳圖片鈕-->
                    <div style="width: 50%; display: flex; align-items: center">
                      <label
                        class="btn btn-info btn-sm"
                        style="
                          border-radius: 10px;
                          background-color: lightgrey;
                          border: 0px;
                          margin: 0px 0px 0px 15px;
                        "
                      >
                        <input
                          class="upload_cert"
                          style="display: none"
                          name="CoachCertImg3"
                          type="file"
                          accept="image/*"
                        />
                        <i class="far fa-image"></i> 上傳圖片
                      </label>
                      <!--預覽圖-->
                      <div
                        class="preview"
                        id="preview_cert3"
                        style="
                          margin-left: 10%;
                          border: 1px dashed lightgray;
                          display: inline-block;
                          width: 75px;
                          height: 100px;
                          text-align: center;
                        "
                      ></div>
                    </div>
                  </div>
                </div>
                <div class="form-footer mb-2">
                <input type="hidden" name="action" value="updateInfo" />
                  <button
                    type="submit"
                    class="btn btn-dark btn-md w-100 mr-0"
                    style="margin: 20px; background-color:blue;border: 0px;"
                    id="submit_btn"
                  >
                    更新
                  </button>
                  <button
                    type="button"
                    class="btn btn-dark btn-md w-100 mr-0"
                    style="margin: 20px;background-color: lightslategrey;border: 0px;"
                  >
                   <a style="display: block;" href="${pageContext.request.contextPath}/coach/CoachHome.jsp" > 取消</a>
                   
                  </button>
                </div>
              </div>
              <!-- </div> -->
            </div>
          </form>
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
									<li><a>Account</a></li>
									<li><a>Course</a></li>
									<li><a>Forum</a></li>
									<li><a>Group</a></li>
									<li><a>Court</a></li>
									<li><a>Seller</a></li>
									<li><a>Mall</a></li>
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
			<!-- End .container --></footer>
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
                <li><a href="${pageContext.request.contextPath}/coach/CoachHome.jsp">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/coach/CoachChat.jsp">客服</a></li>
                <c:if test="${coachVo.coachStat}">
				<li><a href="${pageContext.request.contextPath}/course/listAllCourses_datatable.jsp">課程管理</a></li>
				</c:if>
              </ul>
            </nav>
            <!-- End .mobile-nav -->
          </div>
          <!-- End .mobile-menu-wrapper -->
    </div>
    <!-- End .mobile-menu-container -->

<!--     <div class="sticky-navbar"></div> -->

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
        //預覽
        function preview_img(file, element) {
          var reader = new FileReader();
          reader.readAsDataURL(file);

          reader.addEventListener("load", function () {
        	let img_html = "<img src=" + reader.result + " class='preview_img'>";
            element.innerHTML = img_html;
          });
        }
        
        $("#preview_coachImg").html(`<img src="${pageContext.request.contextPath}/CoachGifReader?action=getCoachImg&coachNo=${coachVo.coachNo}"  class="preview_img">`);
        $("")
        $("#certSportType1").val("${sportType1}");
        $("#preview_cert1").html(`<img src="${pageContext.request.contextPath}/CoachGifReader?action=getCertImg&sportCertNo=${sportCertNo1}"  class="preview_img">`);
        $("#certSportType2").val("${sportType2}");
        $("#preview_cert2").html(`<img src="${pageContext.request.contextPath}/CoachGifReader?action=getCertImg&sportCertNo=${sportCertNo2}"  class="preview_img">`);
        $("#certSportType3").val("${sportType3}");
        $("#preview_cert3").html(`<img src="${pageContext.request.contextPath}/CoachGifReader?action=getCertImg&sportCertNo=${sportCertNo3}"  class="preview_img">`);
        //個人照片預覽
        $("#upload_img").on("change", function (e) {
          console.log("aaa");
          var preview_div = document.getElementById("preview_coachImg");
          if (this.files.length > 0) {
            preview_img(this.files[0], preview_div);
          } else {
            preview_div.innerHTML = ``;
          }
        });
       

       
        //證照預覽
        $("#certImgList").on("change", "input.upload_cert", function (e) {
          var preview_div = $(this).closest("div").children("div.preview")[0];

          if (this.files.length > 0) {
            preview_img(this.files[0], preview_div);
          } else {
            preview_div.innerHTML = ``;
          }
          
          var select_ele = $(this).closest("div").prev().children("select")[0];

          if($(select_ele).val()=="請選擇"){
            alert("請選擇證照的運動種類")
          }
        });
       
        

      });
    </script>
  </body>
</html>
