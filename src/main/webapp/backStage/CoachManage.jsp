<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template" />
    <meta name="author" content="SW-THEMES" />

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />
    <link
      rel="stylesheet"
      href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
      integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
      crossorigin="anonymous"
    />



    <!-- Plugins CSS File -->
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
    />

    <!-- Main CSS File -->
    <link rel="stylesheet" 
     type="text/css" 
     href="${pageContext.request.contextPath}/assets/css/style.min.css" />
     
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"
    />
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!--這裡把jquery往上提-->
    <!-- datatable用 -->
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"
    />
    
    <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/backStage/dataTable.css" />	
    
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
    

    <script>
    function format ( d ) {
        // `d` is the original data object for the row
        return '<div style="display: flex">'+
        '<div style="width: 45%; padding: 5px 10px">'+
        '<label style="display: block; margin: 5px">擅長運動種類</label>'+
        '<p style="word-break: break-all; word-wrap: break-word">'+ d.SportType + '</p>'+
        '</div>'+ 
        '<div style="border: 1px gray solid; margin: 10px"></div>'+
        '<div style="width: 45%; padding: 5px 10px">'+
        '<label style="display: block; margin: 5px">個人照</label>'+
        '<img src="${pageContext.request.contextPath}/GifReader?action=getCoachImg&coachNo='+
         d.CoachNo +
        '" alt="個人照" style="width: 60px; height: 80px; margin-left: 8%" />'+ 
        '<img src="${pageContext.request.contextPath}/GifReader?action=getCoachCertImg&certImgNo='+
         d.coachCertImg1 +
        '" alt="個人照" style="width: 60px; height: 80px; margin-left: 8%" />'+ 
        '<img src="${pageContext.request.contextPath}/GifReader?action=getCoachCertImg&certImgNo='+
         d.coachCertImg2 +
        '" alt="個人照" style="width: 60px; height: 80px; margin-left: 8%" />'+ 
        '<img src="${pageContext.request.contextPath}/GifReader?action=getCoachCertImg&certImgNo='+
         d.coachCertImg3 +
        '" alt="個人照" style="width: 60px; height: 80px; margin-left: 8%" />'+ 
        ' </div></div>';
    }
 
      $(document).ready(function () {
        $("#table_id").DataTable({
          language: {
            url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
          },
            "ajax" : {
				url : "${pageContext.request.contextPath}/BackStageController", //要抓哪個地方的資料
				type : "GET", //使用什麼方式抓
				data : {
					"action" : "loadCoach"
				},
				cache : false,
				dataType : "json", //回傳資料的類型
				error : function() {
					console.log("資料取得失敗 回去檢討檢討");//失敗事件
				},
			},
			 "rowId": 'CoachNo',
            "columns": [
            	{
                    "class":          'details-control',
                    "orderable":      false,
                    "data":           null,
                    "defaultContent": ''
                },
             
              {
                data: "CoachNo",
                title: "教練編號",
              },
              {
                data: "CoachEmail",
                title: "教練Email",
              },
              {
                data: "CoachName",
                title: "教練姓名",
              },
              {
                data: "CoachPhone",
                title: "教練手機",
              },
              {
                data: "CoachExp",
                title: "教學經驗",
              },
              {
                data: "CoachStat",
                title: "帳號狀態",
              },
              {
            	  data: "EmailStat",
                  title: "信箱驗證",
              },
              {
            	  data: null,
                  title: "編輯",
                },
            ],
       
          "columnDefs": [
            {
              targets: [ 1, 2, 3, 4],
              width: "17%", // 設定寬度
            },
            {
              targets: [5, 6, 7,8],
              width: "7%", // 設定寬度
            },
            {
                targets: [0],
                width: "4%", // 設定寬度
              },
            {
                data: null,
                defaultContent: '<button class="btn btn-primary btn-sm" style="border-radius: 5px;">啟用</button>',
                targets: -1
            }
          ],
        });
      });

      $("#table_id tbody").on("click", "td.details-control", function () {
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
    background: url('https://www.datatables.net/examples/resources/details_open.png') no-repeat center center;
    cursor: pointer;
    }
   tr.shown td.details-control {
    background: url('https://www.datatables.net/examples/resources/details_close.png') no-repeat center center;
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
						
						<a href="${pageContext.request.contextPath}/backStage/BackageHome.jsp" style="width: 222; height: 88;"> <img
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
							 <li><a><form action="${pageContext.request.contextPath}/BackStageController" method="post" style="margin: 0px;"><button type="submit" style="border:0px; background-color:white;">登出</button><input type="hidden" name="action" value="logout"/></form></a></li>
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
            <h1>教練會員管理</h1>
          </div>
        </div>

        <!--這是彈窗 需要傳資料可以把form、input打開 他的css在上面-->
        <!--這是彈窗1-->
        <div id="fs_alert1">
          <div class="fs_alert_bg"></div>
          <div class="fs_alert_show">
            <div class="fs_alert_title">編輯權限</div>

            <div class="fs_alert_txts">
              <form
                action=""
                method="post"
                style="margin-bottom: 15px"
                id="fs_alert1_form"
              >
                <div class="input_div">
                  <label for="CoachNo" class="input_label">教練編號</label
                  ><input
                    type="text"
                    id="CoachNo"
                    name="CoachNo"
                    class="input_place"
                    disabled
                  />
                </div>

                <div class="input_div">
                  <label for="CoachEmail" class="input_label">教練Email</label
                  ><input
                    type="text"
                    id="CoachEmail"
                    name="CoachEmail"
                    class="input_place"
                    disabled
                  />
                </div>

                <div class="input_div">
                  <label for="CoachName" class="input_label">教練姓名</label
                  ><input
                    type="text"
                    id="CoachName"
                    name="CoachName"
                    class="input_place"
                    disabled
                  />
                </div>

                <div class="input_div">
                  <label for="CoachPhone" class="input_label">教練手機</label
                  ><input
                    type="text"
                    id="CoachPhone"
                    name="CoachPhone"
                    class="input_place"
                    disabled
                  />
                </div>
                <div class="input_div">
                  <label for="CoachExp" class="input_label">教學經驗</label
                  ><input
                    type="text"
                    id="CoachExp"
                    name="CoachExp"
                    class="input_place"
                    disabled
                  />
                </div>

                <div class="input_div">
                  <label for="SportType" class="input_label">運動種類</label
                  ><input
                    type="text"
                    id="SportType"
                    name="SportType"
                    class="input_place"
                    disabled
                  />
                </div>

                <div class="input_div">
                  <label for="CoachStat" class="input_label">狀態</label
                  ><input
                    type="text"
                    id="CoachStat"
                    name="CoachStat"
                    class="input_place"
                    disabled
                  />
                </div>

                <div class="input_div">
                  <label for="CoachImg" class="input_label">個人照</label>
                  <input type="file" id="CoachImg" accept="image/*">
                  <div
                    style="
                      width: 60px;
                      height: 80px;
                      border: 1px lightgrey dashed;
                      margin-right: 30%;
                    "
                  >
                    <img src="" alt="個人照" />
                  </div>
                </div>

                <input type="hidden" name="action" value="CoachOn"  />
              </form>
            </div>
            <div
              style="
                display: flex;
                justify-content: space-around;
                margin: 10px auto 20px auto;
              "
            >
              <div class="btn_s" id="fs_alert1_on">啟用</div>
              <div class="btn_c" id="fs_alert1_cancel">取消</div>
            </div>
          </div>
        </div>
        <!--這是彈窗1結束-->
      
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
            <table id="table_id" class="display compact hover stripe">

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

<!--     <div class="mobile-menu-overlay"></div> -->
    <!-- End .mobil-menu-overlay -->

<!--     <div class="mobile-menu-container"></div> -->
    <!-- End .mobile-menu-container -->

<!--     <div class="sticky-navbar"></div> -->

    <a id="scroll-top" href="#top" title="Top" role="button"
      ><i class="icon-angle-up"></i
    ></a>

    <!-- Plugins JS File -->

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

    <script>

      $(window).on("load", function () {
        var dataTable = $("#table_id").DataTable();
        // Add event listener for opening and closing details
        $('#table_id tbody').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = dataTable.row( tr );
            if ( row.child.isShown() ) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            }
            else {
                // Open this row
                row.child( format(row.data()) ).show();
                tr.addClass('shown');
            }
        } );

        dataTable.on('click', 'button', function (e) {
            var data = dataTable.row(e.target.closest('tr')).data();
            var rowId = dataTable.row(e.target.closest('tr')).id();
         
            if(data.CoachStat == "未啟用"){
            	
            	 var yes = confirm("是否要開通 編號:" + data.CoachNo + "  教練會員的帳號?");

                 if (yes) {
                 	 $.ajax({
     			            url: "${pageContext.request.contextPath}/BackStageController", // 資料請求的網址
     			            type: "POST",
     			            data: {
     			              action: "startCoachAcct",
     			              CoachNo: data.CoachNo,
     			            },
     			            dataType: "json", // 預期會接收到回傳資料的格式： json | xml | html
     			            success: function (newdata) { // request 成功取得回應後執行
     			            	 console.log(newdata);
     			            	if(newdata.result == "fail"){
     			            		alert("系統錯誤，請稍後再試。");
     			            	}else{
     			            	  data.CoachStat = "已啟用";
     			            	  dataTable.row("#" + rowId).data(data).draw();
     			            	  alert("啟用成功!")
     			            	 
     			            	}
     			            },
     			          });
                 } 
            	
            }else{
            	alert("該帳號已啟用。");
            }
           
        });

      });
    </script>
  </body>
</html>
	