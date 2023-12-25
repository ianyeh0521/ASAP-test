<%@page import="com.asap.shop.entity.OrderVO"%>
<%@page import="com.asap.shop.service.OrderService"%>
<%@page import="com.asap.shop.service.OrderService_interface"%>
<%@page import="com.asap.util.*"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
OrderService_interface orderSvc=new OrderService();
List <OrderVO> list =orderSvc.findUnPaid("M001");
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>ASAP</title>

<meta name="keywords" content="HTML5 Template" />
<meta name="description" content="Porto - Bootstrap eCommerce Template" />
<meta name="author" content="SW-THEMES" />

<!-- Favicon -->
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />
<link rel="stylesheet"
	href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
	integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
	crossorigin="anonymous" />
<script src="https://kit.fontawesome.com/2bd4419edb.js"
	crossorigin="anonymous"></script>
<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700", "Shadows+Into+Light:400", ],
		},
	};
	(function(d) {
		var wf = d.createElement("script"), s = d.scripts[0];
		wf.src = "${pageContext.request.contextPath}/assets/js/webfont.js";
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />

<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
<script>
$(document).ready(function () {
    $("#table_id").DataTable({
      language: {
        url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
      },
    });
  });
</script>
<style>



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
						<a href="#" width="222" height="88"> <img
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
			<div class="page-header">
				<div class="container d-flex flex-column align-items-center">
					<h1>待付款訂單</h1>
				</div>
			</div>

			<div class="container login-container">
				<div
					style="margin: 20px 10px; border-radius: 10px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;">
					<table id="table_id" class="display">
						<thead>
							<tr>
								<th>訂單編號</th>
								<th>訂單成立時間</th>
								<th>訂單金額</th>
								<th>查看訂單明細</th>
								<th>取消訂單</th>
								<th>訂單付款</th>
							</tr>
						</thead>
						<tbody>
							
							<c:forEach var="list" items="${list}">
								<tr>
									<td>${list.orderNo}</td>
									<td><fmt:formatDate value="${list.orderCrtTime}"
											pattern="yyyy-MM-dd HH:mm" /></td>
									<td>${list.orderPrice}</td>
									<td>
												
												<button type="button"
													class="btn btn-info btn-sm fordetail"
													style="border-radius: 5px; margin-bottom: 10px"
													data-toggle="modal" data-orderno="${list.orderNo}"
													data-target="#postModal${list.orderNo}">查看訂單明細</button>
											
											
												<!-- Post Modal -->
												<div class="modal fade" id="postModal${list.orderNo}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h3 class="modal-title" id="exampleModalLabel">訂單明細</h3>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																 <table style="width: 100%;">
													              <thead>
													                <tr>
													                  <th style="width: 40%;">商品名稱</th>
													                  <th style="width: 30%;">商品單價</th>
													                  <th style="width: 30%;">商品數量</th>
													                </tr>
													              </thead>
													              <tbody>
													                <tr>
													                  <td class="itemname"></td>
													                  <td class="itemprice"></td>
													                  <td class="itemqty"></td>
													                </tr>
													              </tbody>
													            </table>
																<div style="text-align: right">
																	<button type="button" class="btn btn-secondary btn-sm"
																		style="border-radius: 5px;" data-dismiss="modal">關閉視窗</button>
																	
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
											<td><button type="button"
													class="btn btn-danger btn-sm deleteorder"
													style="border-radius: 5px; margin-bottom: 10px" data-orderno="${list.orderNo}"
													>取消訂單</button></td>
											<td>
											<form METHOD="post" ACTION="<%=request.getContextPath()%>/shop/OrderServlet" style="margin-bottom:0">
											<input type="hidden" name="action" value="payorder">
<!-- 											記得改 -->
											<input type="hidden" name="MbrNo" value="M001">
											<input type="hidden" name="orderNo" value="${list.orderNo}">
											<input type="hidden" name="totalPrice" value="${list.orderPrice}">
											<button type="submit"
													class="btn btn-primary btn-sm"
													style="border-radius: 5px;margin-bottom:10px; font-size:1.1rem" data-orderno="${list.orderNo}"
													>訂單付款</button>
											</form>
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

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->

	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

	<script>
		//$("header").load("header.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
		$("footer").load("footer.html");
		
		$("button.fordetail").on("click", function () {
		      var orderNo = $(this).attr('data-orderno');
		      console.log(orderNo)
		      $.ajax({
		        url: "${pageContext.request.contextPath}/shop/OrderDetailServlet",
		        type: "POST",
		        data: {
		          "action": "getOrderDetail",
		          "orderNo": orderNo,
		        },
		        dataType: "json",
		        success: function (data) {
		        	var tableBody = $('#postModal'+orderNo).find('table tbody');
		            tableBody.empty(); 
		            data.forEach(function (item) {
		                var row = '<tr>' +
		                    '<td class="itemname">' + item.itemInfoVO.itemName + '</td>' +
		                    '<td class="itemprice">' + item.itemOrderPrice + '</td>' +
		                    '<td class="itemqty">' + item.itemOrderQty + '</td>' +
		                    '</tr>';
		                tableBody.append(row);
		            });
		          }

		        }
		      )})
		      
		      
			$("button.deleteorder").on("click", function () {
		      var orderNo = $(this).attr('data-orderno');
		      let r = confirm("確認刪除？");
		      if(r){
		      $.ajax({
		        url: "${pageContext.request.contextPath}/shop/OrderServlet",
		        type: "POST",
		        data: {
		          "action": "deleteOrder",
		          "orderNo": orderNo,
		        },
		        success: function (data) {
		        	alert("訂單已刪除！")
		        	document.location.reload()
		        }

		        }
		      )}
		      })

	</script>
</body>
</html>
