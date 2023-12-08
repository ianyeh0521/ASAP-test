<%@page import="com.asap.court.entity.CourtClosedTimeVO"%>
<%@page import="com.asap.court.service.CourtClosedTimeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	Integer courtNoToSetTime = Integer.valueOf(request.getParameter("courtNo"));
	System.out.print(courtNoToSetTime);
	CourtClosedTimeService closedTimeWithCourtNo = new CourtClosedTimeService();
	
	List<CourtClosedTimeVO> timeList = closedTimeWithCourtNo.findByCourtNo(courtNoToSetTime);
	pageContext.setAttribute("timeList",timeList);
%>

    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
    
        <title>場地後台-場地不開放時間-datatable</title>
    
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
        <script>
          $(document).ready(function () {
            $("#table_id").DataTable({
            	"scrollX": true,
            	"scrollY": true,
            	"columnDefs": [
                    {"className": "dt-center", "targets": "_all"}
                ],
              language: {
                url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
              }
            });
          });
        </script>
       
      </head>
    
      <body>
        <div class="page-wrapper">
          <header class="header"></header>
          <!-- End .header -->
    
          <main class="main">
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listAllCourts_datatable_Ajax.html">所有場地</a></li>
                                <li class="breadcrumb-item active" aria-current="page">不開放時間</li>
                            </ol>
                        </div>
                    </nav>
                    <h1>不開放時間</h1>
                </div>
            </div>
         
    
            <div class="container login-container">
              <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
                <table id="table_id" class="display" width="100%" >
                  <thead>
                    <tr>
                      <!-- 欄位標題 可以調整欄位數量但標題和內容要一起-->
                      <th >編號</th>
                      <th >場地編號</th>
                      <th >不開放日期</th>
                      <th >不開放時間</th>
                      <th >刪除</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="timeVO" items="${timeList}">
                    <tr class="lookup" class="${timeVO.courtClosedTimeNo}" style="text-align: center !important">        
	                    <td>${timeVO.courtClosedTimeNo}</td>
	                    <td>${timeVO.courtVO.courtNo}</td>
	                    <td>${timeVO.courtClosedDate}</td>
	                    <td>${timeVO.courtClosedTime}</td> 
                        <td>
	                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/court/courtClosedTime.do" style="margin-bottom: 0px;">
								<button type="submit" class="btn btn-danger btn-sm" style="border-radius:5px" >刪除</button>			                   
								<input type="hidden" name="courtNo"  value="${timeVO.courtVO.courtNo}">
								<input type="hidden" name="closedDate"  value="${timeVO.courtClosedDate}">
								<input type="hidden" name="closedTime"  value="${timeVO.courtClosedTime}">
			                    <input type="hidden" name="action" value="delete">
	                        </FORM>
                        </td>
                   </tr>
                   </c:forEach>   
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
    
        <!-- Plugins JS File -->
    
        <script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
        <script src="/ASAP/assets/js/plugins.min.js"></script>
    
        <!-- Main JS File -->
        <script src="/ASAP/assets/js/main.min.js"></script>

       
    
        <script>
          $("header").load("backstage_header.html");
          $("div.sticky-navbar").load("sticky-navbar.html");
          $("div.mobile-menu-container").load("mobile-menu-container.html");
          $("footer").load("footer.html");
        </script>
      </body>
    </html>



