<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.util.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
    CourtService courtSvc = new CourtService();
	List<CourtVO> list = courtSvc.getAllCourts();
    pageContext.setAttribute("list",list);
%>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>��O�޲z-�Ҧ����a</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="/ASAP/assets/images/icons/favicon.png">


    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = '/ASAP/assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="<c:url value = "/assets/css/bootstrap.min.css"/>" >
   
    <!-- Main CSS File -->
    <link rel="stylesheet" href="<c:url value = "/assets/css/style.min.css"/>" >
    <link rel="stylesheet" type="text/css" href="<c:url value = "/assets/vendor/fontawesome-free/css/all.min.css"/>" >
</head>

<body>
    <div class="page-wrapper">
        <header class="header"></header><!-- End .header -->

        <main class="main">
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/court_index.jsp">���a�޲z</a></li>
                                <li class="breadcrumb-item active" aria-current="page">�Ҧ����a</li>
                            </ol>
                        </div>
                    </nav>

                    <h1>�Ҧ����a</h1>
                </div>
            </div>
            
            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
				<form action="${pageContext.request.contextPath}/court/court.do" method="post">
					<input type="text" class="form-control" name="nameSearch" value="">
					<p><input type="submit" value="�j�M"></p>
					<input type="hidden" name="action" value="namesearch">
				</form>
				<a href="${pageContext.request.contextPath}/court/addCourt.jsp" style="">
				<button class="btn btn-primary btn-rounded btn-md" >�s�W���a</button>
				</a>
			</div>

            <div class="container" >
                <div class="wishlist-table-container" >
                    <table class="table table-wishlist mb-0" >
                        <thead>
                            <tr style="text-align: center !important">
                                
                                <th>���a�s��</th>
                                <th>���a�W��</th>
                                <th>���a����</th>
                                <th>�Ǥ�/�~</th>
                                <th>�a�I</th> 
                                <th>���a�Ыخɶ�</th>
                                <th>���Ф���</th>
                                <th></th>
                                <th></th>

                                
                                <!-- <th>���A</th>
                                <th>�a�}</th>
                                <th>�g��</th>
                                <th>�n��</th>
                                <th>���]�H�ƭ���</th>
                                <th>����</th> -->
                            </tr>
                        </thead>
                        <tbody>
                         <c:forEach var="courtVO" items="${list}">
                            <tr style="text-align: center !important">
                                
                                <td>${courtVO.courtNo}</td>
                                <td>${courtVO.courtName}</td>
                                <td>${courtVO.courtTypeVO.courtType}</td>
                                <td>${courtVO.indoor ?"�Ǥ�":"�ǥ~"}</td>
                                <td>${courtVO.siteVO.regions}</td>
                                <td>${courtVO.courtCrtTime}</td> 
                                
                                 
                              
                                <td>${courtVO.courtText}</td>
                                <td>
                                    <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/court/court.do" style="margin-bottom: 0px;">
                                       <input type="submit" value="�ק�">
                                       <input type="hidden" name="courtNo"  value="${courtVO.courtNo}">
                                       <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
                                </td>
                                <td>
                                    <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/court/court.do" style="margin-bottom: 0px;">
                                        <input type="submit" value="�R��">
                                        <input type="hidden" name="courtNo"  value="${courtVO.courtNo}">
                                        <input type="hidden" name="action" value="delete"></FORM>
                                </td>
                                
								<!-- <td>${courtVO.courtAddress}</td> -->
                                <!-- <td>${courtVO.courtNo}</td> -->
                                <!-- <td>${courtVO.courtPplLimit}</td> -->
                                <!-- <td>${courtVO.courtPrice}</td> -->
                                 
                                <!-- <td>${courtVO.courtStat}</td>   -->                         
                                <!-- <td>${courtVO.courtLong}</td>
                                <td>${courtVO.courtLat}</td> -->
                            </tr>
                        </c:forEach>
                        </tbody>    
                    </table>
                </div><!-- End .cart-table-container -->
            </div><!-- End .container -->
        </main><!-- End .main -->

        <footer class="footer bg-dark"></footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->

    <div class="loading-overlay">
        <div class="bounce-loader">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <div class="mobile-menu-container"></div><!-- End .mobile-menu-container -->

    <div class="sticky-navbar"></div>



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="/ASAP/assets/js/jquery.min.js"></script>
    <script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
    <script src="/ASAP/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="/ASAP/assets/js/main.min.js"></script>

    <!-- header and footer template -->
	<script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
	</script>
</body>

</html>