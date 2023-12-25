<%@page import="com.asap.coach.entity.CoachVO"%>
<%@page import="com.asap.coach.service.CoachService"%>
<%@page import="com.asap.coach.service.CoachService_interface"%>
<%@page import="com.asap.group.entity.SportTypeVO"%>
<%@page import="com.asap.group.service.SportTypeService"%>
<%@page import="com.asap.group.service.SportTypeService_interface"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>


<%

	//datetime picker
	java.sql.Date closedDate = null;
	try {
		 closedDate = java.sql.Date.valueOf(request.getParameter("closedDate").trim());
	} catch (Exception e) {
		 closedDate = new java.sql.Date(System.currentTimeMillis());
	}
	
	

	SportTypeService sportTypeSvc = new SportTypeService_interface();
	List<SportTypeVO> sportTypeList = sportTypeSvc.getALL();
	pageContext.setAttribute("sportTypeList",sportTypeList);
	
	CoachService_interface coachSvc = new CoachService();
	List<CoachVO> coachList = coachSvc.getAll();
	pageContext.setAttribute("coachList", coachList);
	
	// 教練編號
	/*
	String memberNo = session.getAttribute("memberVO").getMbrNo();
	pageContext.setAttribute("memberNo",memberNo);
	*/
	
	String coachNo = "C1206202300001";
	pageContext.setAttribute("coachNo",coachNo);
%>



<html lang="en">
<head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
    
        <title>所有課程</title>
    
        <meta name="keywords" content="HTML5 Template" />
        <meta name="description" content="Porto - Bootstrap eCommerce Template" />
        <meta name="author" content="SW-THEMES" />
    
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="/ASAP/assets/images/icons/favicon.png" />
        <link
          rel="stylesheet"
          href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
          integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
          crossorigin="anonymous"
        />
    
        <script>
          WebFontConfig = {
            google: {
              families: [
                "Open+Sans:300,400,600,700,800",
                "Poppins:300,400,500,600,700",
                "Shadows+Into+Light:400",
              ],
            },
          };
          (function (d) {
            var wf = d.createElement("script"),
              s = d.scripts[0];
            wf.src = "/ASAP/assets/js/webfont.js";
            wf.async = true;
            s.parentNode.insertBefore(wf, s);
          })(document);
        </script>
    
        <!-- Plugins CSS File -->
        <link
          rel="stylesheet"
          type="text/css"
          href="/ASAP/assets/css/bootstrap.min.css"
        />
    
        <!-- Main CSS File -->
        <link rel="stylesheet" type="text/css" href="/ASAP/assets/css/style.min.css" />
        <link
          rel="stylesheet"
          type="text/css"
          href="/ASAP/assets/vendor/fontawesome-free/css/all.min.css"
        />
        <script src="/ASAP/assets/js/jquery.min.js"></script>
        
	    
        <!--這裡把jquery往上提-->
        <!-- datatable用 -->
        <link
          rel="stylesheet"
          type="text/css"
          href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"
        />
    
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
        
        <!-- Include Moment.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        
        
		        
        
		
        <script>
          $(document).ready(function () {
        	  // 進行中課程
        	  $.ajax({
                type: "get",
                url: 'course.do?action=getByCoach&purpose=current&coachNo=${coachNo}',
                contentType: 'application/json',
                success: function(result){
                	console.log(result);
                	 $("#table_id").DataTable({
                		 data: result,
                		 "scrollX": true,
                		 "responsive": true,
                       		language: {
                         		url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"},
                         "columnDefs": [
                             {"className": "dt-center", "targets": "_all"}
                         ],
                         "lengthMenu": [
                             [5, 10, 25, -1], // 定義每頁顯示筆數選項
                             ['5', '10', '25', '所有'] // 定義每頁顯示筆數選項文字
                         ],
                		 columns:[
                			 {
               			        "data": "courseNo",
               			        "render": function(data, type, row) {
               			            var imgUrl = "DBGifReader?courseNo=" + data;
               			            return '<img src="' + imgUrl + '" alt="Course Image" width="300px" height="300px">';
               			        }
               			    },
                         	{"data":"courseNo"},
                         	{"data":"courseName"},
                         	{
                                "data": null,
                                "render": function (data, type, row) {
                                    return moment(row.courseStartTime).format("YYYY-MM-DD HH:mm") + ' ~ ' + moment(row.courseEndTime).format("HH:mm");
                                }
                            },
                            {"data":"sportTypeVO.sportTypeName"},
                            {"data":"courseAddress"},
                            {"data": "courseText"},
                            {"data": "coursePrice"},
                            {
                                "data": null,
                                "render": function (data, type, row) {
                                    return data.courseNo; 

                                },
                                "createdCell": function (td, cellData, rowData, row, col) {
                                    $.ajax({
                                        url: 'mbrCourseServlet?action=checkInMain&courseNo=' + rowData.courseNo,
                                        type: 'GET',
                                        dataType: 'json',
                                        success: function (orderCounts) {
                                            $(td).html(orderCounts + "/" + rowData.coursePplLimit);
                                        },
                                        error: function (xhr) {
                                            console.log(xhr);
                                        }
                                    });
                                }
                            },
                            {
                         		"data": "courseStat",
                       			"render": function(data, type, row, meta){
                           			if(row.courseStat == true){
                           				return "上架中";
                           			}else{
                           				return "已下架";
                           			}
                           		}
                         	},

                         	
                         	{
                         	    "data": null,
                         	    "render": function(data, type, row) {
                         	        return '<a href="/ASAP/course/updateCourse.jsp?courseNo=' + row.courseNo + '">' +
                         	               '<button type="button" class="btn btn-primary btn-sm" style="border-radius:5px" id="lookup">修改</button></a>';
                         	               
                         	    }
                         	},
                            {
                            	"data": null,
                         	    "render": function(data, type, row) {
                         	        return '<form method="post" action="/ASAP/course/course.do" style="margin-bottom: 0px;">' +
                         	               '<button type="submit" class="btn btn-danger btn-sm" style="border-radius:5px" id="lookup">刪除</button>' +
                         	               '<input type="hidden" name="courseNo" value="' + row.courseNo + '">' +
                         	               '<input type="hidden" name="action" value="delete">' +
                         	               '</form>';
                         	    }
                            }
                         ]
                	 });
                	 
                	
                	 
                },
                error:function(xhr){
                	console.log(xhr);
                }
             });
        	  
        	  // 過往的課程
        	  $.ajax({
                type: "get",
                url: 'course.do?action=getByCoach&purpose=finished&coachNo=${coachNo}',
                contentType: 'application/json',
                success: function(result){
                	console.log(result);
                	 $("#table_id2").DataTable({
                		 data: result,
                		 "scrollX": true,
                		 "responsive": true,
                       		language: {
                         		url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"},
                         "columnDefs": [
                             {"className": "dt-center", "targets": "_all"}
                         ],
                         "lengthMenu": [
                             [5, 10, 25, -1], // 定義每頁顯示筆數選項
                             ['5', '10', '25', '所有'] // 定義每頁顯示筆數選項文字
                         ],
                		 columns:[
                			 {
               			        "data": "courseNo",
               			        "render": function(data, type, row) {
               			            var imgUrl = "DBGifReader?courseNo=" + data;
               			            return '<img src="' + imgUrl + '" alt="Course Image" width="300px" height="300px">';
               			        }
               			    },
                         	{"data":"courseNo"},
                         	{"data":"courseName"},
                         	{
                                "data": null,
                                "render": function (data, type, row) {
                                    return moment(row.courseStartTime).format("YYYY-MM-DD HH:mm") + ' ~ ' + moment(row.courseEndTime).format("HH:mm");
                                }
                            },
                            {"data":"sportTypeVO.sportTypeName"},
                            {"data":"courseAddress"},
                            {"data": "courseText"},
                            {"data": "coursePrice"},
                         ]
                	 });
                	 
                	
                	 
                },
                error:function(xhr){
                	console.log(xhr);
                }
             });
          });
        </script>
        <style>
            #fs_alert {
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
            max-width: 450px;
            min-width: 400px;
    
            background-color: white;
            position: absolute;
            top: 120px;
            left: 0;
            right: 0;
            margin: auto;
            z-index: 2;
            border-radius: 8px;
            text-align: center;
          }
    
          .fs_alert_title {
            font-size: 36px;
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
          #alert_ok {
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
            background-color: rgb(85, 184, 201);
            margin: 10px;
          }
    
          .btn_s:hover {
            background-color: rgb(76, 139, 150);
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
							<li><a href="login.jsp" style="color: blue">登出</a></li>
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
                  <nav aria-label="breadcrumb" class="breadcrumb-nav">
                      <div class="container">
                          <ol class="breadcrumb">
                              <li class="breadcrumb-item"><a href="demo4.html">場地管理</a></li>
                              <li class="breadcrumb-item active" aria-current="page">所有場地</li>
                          </ol>
                      </div>
                  </nav>

                  <h1>所有場地</h1>
              </div>
            </div>

            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
              <a href="/ASAP/course/addCourse.jsp">
              <button class="btn btn-primary btn-rounded btn-md" >上架課程</button>
              </a>
            </div>
    

    
            <div class="container login-container">
            	<!-- 進行中的課程 -->
              <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
                <h3>進行中的課程</h3>
                <table id="table_id" class="display" >
                  <thead>
                    <tr>
                      <th width="70px">課程圖片</th>
                      <th width="70px">課程編號</th>
                      <th width="80px">課程名稱</th>
                      <th width="100px">課程日期</th>
                      <th width="80px">運動種類</th>
                      <th width="150px">上課地點</th>
                      <th width="600px" class="details-control">課程內文</th>
                      <th width="60px">價格</th> 
                      <th width="70px">報名狀況</th>
                      <th width="70px">課程狀態</th>
                      <th width="80px"></th>
                      <th width="80px"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td class="details-control"></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
              </div>
              
              <div class="container login-container">
               <!-- 過往的課程 -->
              <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
                <h3>過往的課程</h3>
                <table id="table_id2" class="display" >
                  <thead>
                    <tr>
                      <th width="70px">課程圖片</th>
                      <th width="70px">課程編號</th>
                      <th width="80px">課程名稱</th>
                      <th width="100px">課程日期</th>
                      <th width="80px">運動種類</th>
                      <th width="150px">上課地點</th>
                      <th width="600px" class="details-control">課程內文</th>
                      <th width="60px">價格</th> 
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td class="details-control"></td>
                      <td></td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </main>
          <!-- End .main -->
    
          <footer class="footer bg-dark"></footer>
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
    
        <a id="scroll-top" href="#top" title="Top" role="button"
          ><i class="icon-angle-up"></i
        ></a>
        

        <!-- CDN import Axios -->
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
        <!-- Plugins JS File -->
    
        <script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
        <script src="/ASAP/assets/js/plugins.min.js"></script>
    
        <!-- Main JS File -->
        <script src="/ASAP/assets/js/main.min.js"></script>


        <script>
//           $("header").load("header.html");
          $("div.sticky-navbar").load("sticky-navbar.html");
          $("div.mobile-menu-container").load("mobile-menu-container.html");
          $("footer").load("footer.html");

        </script>
      </body>
    </html>
