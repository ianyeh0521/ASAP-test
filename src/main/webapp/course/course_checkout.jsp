<%@page import="com.asap.course.entity.CourseVO"%>
<%@page import="com.asap.course.service.CourseService"%>
<%@page import="com.asap.course.service.CourseService_interface"%>
<%@page import="com.asap.member.service.MemberService"%>
<%@page import="com.asap.member.entity.MemberVO"%>
<%@page import="com.asap.member.service.MemberService_interface"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.util.*"%>

<%
	Integer courseNo = Integer.valueOf(request.getParameter("courseNo"));
	CourseService_interface courseSvc = new CourseService();
	CourseVO courseVO = courseSvc.findByPK(courseNo);
	
	String courseTime = request.getParameter("courseTime");
	
	pageContext.setAttribute("courseVO", courseVO);
	pageContext.setAttribute("courseTime", courseTime);
	
	
	
    MemberVO mbrVO = (MemberVO)session.getAttribute("memberVo");
	pageContext.setAttribute("mbrVO", mbrVO);
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>ASAP</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">


    <script>
        WebFontConfig = {
            google: {
                families: ['Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400']
            }
        };
        (function(d) {
            var wf = d.createElement('script'),
                s = d.scripts[0];
            wf.src = '/ASAP/assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore(wf, s);
        })(document);
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css">
    
 
</head>

<body>
    <div class="page-wrapper">
        <header class="header"></header>
      <!-- End .header -->

        <main class="main main-test">
            <div class="container checkout-container text-center">
                <ul class="checkout-progress-bar d-flex justify-content-center flex-wrap">
                    <li class="active">
                        <a href="#">付款確認</a>
                    </li>
                    <li class="disabled">
                        <a href="#">完成預約</a>
                    </li>
                </ul>
				
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/course/mbrCourseServlet" class="mb-2">
                        <div class="order-summary">
                            <ul class="checkout-steps">
	                            <li>
	                                <h2 class="step-title">您的訂單</h2>
	                                    <div class="row">
	                                        <div class="col-md-6">
	                                            <div class="form-group">
	                                                <label>姓名</label>
	                                                <input type="text" class="form-control text-center" value="${mbrVO.mbrName}" required readonly/>
	                                                <input type="hidden" name="mbrNo" value="${mbrVO.mbrNo}">
	                                                <input type="hidden" name="courseNo" value="${courseVO.courseNo}">
	                                            </div>
	                                        </div>
	
	                                        <div class="col-md-6">
	                                             <div class="form-group">
			                                        <label>連絡電話</label>
			                                        <input type="tel" class="form-control text-center" value="${mbrVO.mbrPhone}" required readonly/>
		                                    	</div>
	                                        </div>
	                                    </div>
	  
	  										
	                                    <div class="form-group">
	                                        <label>email 信箱</label>
	                                        <input type="email" class="form-control text-center" value="${mbrVO.mbrEmail}" required readonly/>
	                                    </div>
	                            </li>
	                        </ul>

                            <table class="table table-mini-cart">
                                <thead>
                                	<tr></tr>
                                	<tr></tr>
                                	<tr></tr>
                                	<tr></tr>
                                </thead>
                                
                                <tbody>
								    <tr>
								        <td class="product-col">
								            <div class="row align-items-center" style="margin-bottom: 20px">
								                <div class="col-md-4">
								                    <h3 class="product-title">
								                        <img src="${pageContext.request.contextPath}/course/DBGifReader?courseNo=${courseVO.courseNo}" width="250" height="250" alt="場地圖片">
								                    </h3>
								                </div>
								                <div class="col-md-8">
								                    <div class="product-details text-center">
								                        <h3 class="product-title mb-3" style="margin-top:30px">
								                           	課程名稱： ${courseVO.courseName}
								                        </h3>
								                        <h3 class="product-title mb-3">
								                           	運動種類： ${courseVO.sportTypeVO.sportTypeName}
								                        </h3>
								                        <h3 class="product-title mb-3">
								                           	教練姓名： ${courseVO.coachVO.coachName}
								                        </h3>
								                        <h3 class="product-title mb-3">
								                            時間：${courseTime}
								                        </h3>
								                        
								                        <div class="row mt-3 justify-content-center">
								                            <div class="col-md-6">
								                                <h4 style="font-weight: bold;">總金額 $ ${courseVO.coursePrice}</h4>
								                            </div>
								                        </div>
								                    </div>
								                </div>
								            </div>
								        </td>
								    </tr>
								</tbody>
                            </table>

							<div class="d-flex justify-content-end">
								<div class="col-md-6">
									<input type="hidden" name="action" value="order">
		                            <button type="submit" class="btn btn-dark btn-place-order">
		                                確認預約
		                            </button>
		                            
		                        </div>
		                        
		                        <div class="col-md-6">
		                        	<a href="course_page.jsp?courseNo=${courseVO.courseNo}">
		                            <button type="button" class="btn btn-gray btn-place-order">
					                    取消
					                </button>
					                </a>
					            </div>
			                </div>
                        </div>
                        </FORM>
                        <!-- End .cart-summary -->
                    </div>
                </div>
                <!-- End .row -->
            </div>
            <!-- End .container -->
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

    <div class="sticky-navbar"> </div>



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

   
</body>

</html>