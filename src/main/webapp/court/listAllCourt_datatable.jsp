<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    CourtService courtSvc = new CourtService();
	List<CourtVO> list = courtSvc.getAllCourts();
    pageContext.setAttribute("list",list);
%>

    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
    
        <title>���a��x-�Ҧ����a-datatable</title>
    
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
        <!--�o�̧�jquery���W��-->
        <!-- datatable�� -->
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
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court/court_index.jsp">���a�޲z</a></li>
                                <li class="breadcrumb-item active" aria-current="page">�Ҧ����a</li>
                            </ol>
                        </div>
                    </nav>
                    <h1>�Ҧ����a</h1>
                </div>
            </div>
            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
				<a href="${pageContext.request.contextPath}/court/addCourt.jsp" style="">
				<button class="btn btn-primary btn-rounded btn-md" >�s�W���a</button>
				</a>
			</div>
         
    
            <div class="container login-container">
              <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
                <table id="table_id" class="display" >
                  <thead>
                    <tr>
                      <!-- �����D �i�H�վ����ƶq�����D�M���e�n�@�_-->
                      <th width="80px">���a�W��</th>
                      <th width="80px">���a����</th>
                      <th width="70px">�Ǥ�/�~</th>
                      <th width="150px">�a�}</th>
                      <th width="70px">�a�I</th>
                      <th width="80px">�g��</th>
                      <th width="80px">�n��</th>
                      <th width="500px">���Ф���</th>
                      <th width="100px">���]�H�ƭ���</th>
                      <th width="60px">����</th> 
                      <th width="100px">���a�Ыخɶ�</th>
                      <th width="80px">���A</th>
                      <th width="80px">�ק���a</th>
                      <th width="80px">�s��}��ɶ�</th>
                      <th width="80px">�R�����a</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="courtVO" items="${list}">
                    <tr class="lookup" class="${courtVO.courtNo}" style="text-align: center !important">        
<%-- 	                    <td>${courtVO.courtNo}</td> --%>
	                    <td>${courtVO.courtName}</td>
	                    <td>${courtVO.courtTypeVO.courtType}</td>
	                    <td>${courtVO.indoor ?"�Ǥ�":"�ǥ~"}</td>
	                    <td>${courtVO.courtAddress}</td> 
	                    <td>${courtVO.siteVO.regions}</td>
	                    <td>${courtVO.courtLong}</td>
                        <td>${courtVO.courtLat}</td>
                        <td>${courtVO.courtText}</td>
                        <td>${courtVO.courtPplLimit}</td> 
                        <td>${courtVO.courtPrice}</td>  
	                    <td>${courtVO.courtCrtTime}</td>
	                    <td>${courtVO.courtStat? "��B��":"�Ȱ���B"}</td>
	                    <td>
                           <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/court/court.do" style="margin-bottom: 0px;">
                              <button type="submit" class="btn btn-primary btn-sm" style="border-radius:5px" id="lookup">�ק�</button>
                              <input type="hidden" name="courtNo"  value="${courtVO.courtNo}">
                              <input type="hidden" name="action"	value="getOne_For_Update">
                           </FORM>
                        </td>
	                    <td>
                             <a href="${pageContext.request.contextPath}/court/listClosedTime.jsp?courtNo=${courtVO.courtNo}"><button type="submit" class="btn btn-primary btn-sm" style="border-radius:5px" id="lookup">�s��}��ɶ�</button></a> 
                        </td>
                        <td>
	                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/court/court.do" style="margin-bottom: 0px;">
								<button type="button" class="btn btn-danger btn-sm" style="border-radius:5px" >�R��</button>			                   
								<input type="hidden" name="courtNo"  value="${courtVO.courtNo}">
			                    <input type="hidden" name="action" value="delete">
	                        </FORM>
                        </td>
                        <!--���s�˦��i�H�hhttps://getbootstrap.com/docs/4.0/components/buttons/ �� -->
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



