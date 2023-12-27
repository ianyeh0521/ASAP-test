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
	
// 	CoachService_interface coachSvc = new CoachService();
// 	List<CoachVO> coachList = coachSvc.getAll();
// 	pageContext.setAttribute("coachList", coachList);
	
	// 教練編號
	/*
	String memberNo = session.getAttribute("memberVO").getMbrNo();
	pageContext.setAttribute("memberNo",memberNo);
	*/
	
	CoachVO cVo = (CoachVO)session.getAttribute("coachVo");
	String coachNo = cVo.getCoachNo();
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
    
        <title>ASAP</title>
 
    
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
        <link rel="stylesheet" type="text/css" href="/ASAP/assets/css/style.min.css" />
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
    
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
        
        <!-- Include Moment.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
        
        
		        
        
		
        <script>
          $(document).ready(function () {
        	  
        	  // 進行中課程
                	let table = $("#table_id").DataTable({
                		 "ajax":{
                			 url: 'course.do?action=getByCoach&purpose=current&coachNo=${coachNo}',
                			 dataSrc: "data",
                		 },
                		 "scrollX": true,
                		 "responsive": true,
                       		language: {
                         		url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"},
                         "columnDefs": [
                             {"className": "dt-center", "targets": "_all"},
              
                         ],
                         "lengthMenu": [
                             [5, 10, 25, -1], // 定義每頁顯示筆數選項
                             ['5', '10', '25', '所有'] // 定義每頁顯示筆數選項文字
                         ],
                		 columns:[
                			 {
               		            className: 'dt-control',
               		            orderable: false,
               		            data: null,
               		            defaultContent: '' 	
               		         },
                			 {"data":"courseNo"},
                			 {
               			        "data": "courseNo",
               			        "render": function(data, type, row) {
               			            var imgUrl = "DBGifReader?courseNo=" + data;
               			            return '<img src="' + imgUrl + '" alt="Course Image" width="300px" height="300px">';
               			        }
               			    },	
                         	{"data":"courseName"},
                         	{
                                "data": null,
                                "render": function (data, type, row) {
                                    return moment(row.courseStartTime).format("YYYY-MM-DD HH:mm") + ' ~ ' + moment(row.courseEndTime).format("HH:mm");
                                }
                            },
                            {"data":"sportTypeName"},
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
                           			if(data == true){
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
                         ],

                   	   
                	 });
                	
                	$("#table_id").on('click', 'td.dt-control', function (e) {
                	    let tr = e.target.closest('tr');
                	    let row = table.row(tr);
                	 
                	    if (row.child.isShown()) {
                	        row.child.hide();
                	    }
                	    else {
                	        row.child(format(row.data())).show();
                	    }
                	});
                	
                	// 創建要展開的內容
                    function format(d) {
	                      return d.head + d.htmlString;
                    }
                	
                	
	                
                	
                	
        	  
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
          
         
		    .login-container form .btn {
			    font-family: "Open Sans",sans-serif;
			    font-size: 1.1rem;
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
            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
              <a href="${pageContext.request.contextPath}/course/addCourse.jsp">
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
                      <th width="30px"></th>
                      <th width="70px">課程編號</th>
                      <th width="70px">課程圖片</th>
                      <th width="80px">課程名稱</th>
                      <th width="100px">課程日期</th>
                      <th width="80px">運動種類</th>
                      <th width="150px">上課地點</th>
                      <th width="600px" class="details-control">課程內文</th>
                      <th width="60px">價格</th> 
                      <th width="70px">報名狀況</th>
                      <th width="70px">課程狀態</th>
                      <th width="80px"></th>
<!--                       <th width="80px"></th> -->
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td></td>
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
<!--                       <td></td> -->
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
    
        <div class="mobile-menu-overlay"></div>
        <!-- End .mobil-menu-overlay -->
    
        <div class="mobile-menu-container">
         <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="fa fa-times"></i></span>
            <nav class="mobile-nav">
              <ul class="mobile-menu">
                <li><a href="${pageContext.request.contextPath}/coach/CoachHome.jsp">首頁</a></li>
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
    
<!--         <div class="sticky-navbar"></div> -->
    
        <a id="scroll-top" href="#top" title="Top" role="button"
          ><i class="icon-angle-up"></i
        ></a>
        

        <!-- CDN import Axios -->
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    
        <!-- Plugins JS File -->
    
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
    
        <!-- Main JS File -->
        <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

      </body>
    </html>
