<%@page import="com.asap.forum.service.ForumReportVOServiceImpl"%>
<%@page import="com.asap.forum.service.ForumReportVOService"%>
<%@page import="com.asap.forum.entity.ForumReportVO"%>
<%@page import="com.asap.util.*"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
ForumReportVOService forumReportSvc = new ForumReportVOServiceImpl();
List<ForumReportVO> list = forumReportSvc.getAll();
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
      scrollX: true,
    });
  });
</script>
<style>
.fs_alert_bg {
	width: 100vw;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.671);
	position: fixed;
	top: 0;
}

#fs_alert {
	width: 100vw;
	height: 100vh;
	position: absolute;
	top: 0;
	/* display: block; */
	display: none;
	z-index: 999;
}

.fs_alert_show {
	width: 50%;
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
					<h1>論壇檢舉處理</h1>
				</div>
			</div>

			<!--這是彈窗 需要傳資料可以把form、input打開 他的css在上面-->

			<div id="fs_alert">
				<div class="fs_alert_bg"></div>
				<div class="fs_alert_show">
					<form action="" method="post">
						<div class="fs_alert_title"></div>
						<h3 class="article-status"></h3>
						<div class="fs_alert_txt"></div>
						<div class="btn_s" id="alert_ok">確認</div>
					</form>
				</div>
			</div>

			<div class="container login-container">
				<div
					style="margin: 20px 10px; border-radius: 10px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;">
					<table id="table_id" class="display">
						<thead>
							<tr>
								<!-- 欄位標題 可以調整欄位數量但標題和內容要一起-->
								<th width="70px">檢舉編號</th>
								<th width="70px">檢舉時間</th>
								<th width="70px">貼文編號</th>
								<th width="70px">留言編號</th>
								<th width="70px">檢舉類型</th>
								<th width="250px">附加訊息</th>
								<th width="70px">處理人員</th>
								<th width="70px">處理時間</th>
								<th width="70px">檢舉處理</th>

							</tr>
						</thead>
						<tbody>
							<!-- 欄位內容 可以調整欄位數量但標題和內容要一起 也可以在欄位中加入需要的標籤img、buttom-->
							<!-- 這裡轉成jsp時可用c:forEach方法 -->
							<c:forEach var="report" items="${list}">
								<tr>
									<td>${report.fRptNo}</td>
									<td><fmt:formatDate value="${report.fRptTime}"
											pattern="yyyy-MM-dd HH:mm" /></td>
									<td>${report.postNo}</td>
									<td>${report.cmtNo}</td>
									<td>${report.forumReportTypeVO.fRptTypeName}</td>
									<td>${report.fRptMsg}</td>
									<!-- <td><button type="button" class="btn btn-primary btn-sm" style="border-radius:5px" >查看</button></td> -->
									<td>${report.backNo}</td>
									<td><fmt:formatDate value="${report.fRptReplyTime}"
											pattern="yyyy-MM-dd HH:mm" /></td>
									<td><c:choose>
											<c:when test="${report.postNo != null}">
												<button type="button" class="btn btn-success btn-sm getpost"
													id="lookup" style="border-radius: 5px; margin-bottom: 10px"
													data-postno="${report.postNo}">查看</button>
												<c:choose>
											<c:when test="${report.fRptReplyTime != null}">
												
												<button type="button" disabled
													class="btn btn-primary btn-sm post-manage"
													style="border-radius: 5px; margin-bottom: 10px"
													data-toggle="modal"
													data-target="#postModal${report.fRptNo}"
													data-rptno="${report.fRptNo}"
													data-postno="${report.postNo}">處理</button>
											</c:when>
											<c:when test="${report.fRptReplyTime == null}">
													<button type="button"
													class="btn btn-primary btn-sm post-manage"
													style="border-radius: 5px; margin-bottom: 10px"
													data-toggle="modal"
													data-target="#postModal${report.fRptNo}"
													data-rptno="${report.fRptNo}"
													data-postno="${report.postNo}">處理</button>
											</c:when>
											</c:choose>
												<!-- Post Modal -->
												<div class="modal fade" id="postModal${report.fRptNo}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h3 class="modal-title" id="exampleModalLabel">貼文檢舉處理</h3>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div style="font-size: 16px;">
																	<label>是否移除貼文：</label> <input type="radio" id="yes"
																		name="remove" value="2" required> <label
																		for="yes">是</label> <input type="radio" id="no"
																		name="remove" value="1"> <label for="no">否</label>
																</div>
																<div style="color: black;">回覆內容：</div>
																<textarea class="postcustretext" type="text"
																	style="width: 100%; height: 150px"
																	placeholder="請輸入回覆訊息"></textarea>
																<div style="text-align: right">
																	<button type="button" class="btn btn-secondary btn-sm"
																		style="border-radius: 5px;" data-dismiss="modal">取消</button>
																	<button type="button"
																		class="btn btn-primary btn-sm reply-post"
																		style="border-radius: 5px;"
																		data-frptno="${report.fRptNo}"
																		data-postno="${report.postNo}"
																		data-mbrno="${report.mbrNo}">送出</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:when>

											<c:when test="${report.cmtNo != null}">
												<button type="button"
													class="btn btn-success btn-sm getcomment" id="lookup"
													style="border-radius: 5px; margin-bottom: 10px"
													data-cmtno="${report.cmtNo}">查看</button>
												
												<c:choose>
											<c:when test="${report.fRptReplyTime != null}">
												<button type="button" disabled
													class="btn btn-primary btn-sm cmt-manage"
													style="border-radius: 5px; margin-bottom: 10px"
													data-toggle="modal" data-target="#cmtModal${report.fRptNo}"
													data-rptno="${report.fRptNo}" data-cmtno="${report.cmtNo}">處理</button>
												</c:when>
												<c:when test="${report.fRptReplyTime == null}">
												<button type="button"
													class="btn btn-primary btn-sm cmt-manage"
													style="border-radius: 5px; margin-bottom: 10px"
													data-toggle="modal" data-target="#cmtModal${report.fRptNo}"
													data-rptno="${report.fRptNo}" data-cmtno="${report.cmtNo}">處理</button>
												</c:when>
												</c:choose>
												<!-- Comment Modal -->
												<div class="modal fade" id="cmtModal${report.fRptNo}"
													tabindex="-1" aria-labelledby="exampleModalLabel"
													aria-hidden="true">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<h3 class="modal-title" id="exampleModalLabel">留言檢舉處理</h3>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div style="font-size: 16px;">
																	<label>是否移除留言：</label> <input type="radio" id="yes"
																		name="report-type" value="0" required> <label for="yes">是</label>
																	<input type="radio" id="no" name="report-type"
																		value="1"> <label for="no">否</label>
																</div>
																<div style="color: black;">回覆內容：</div>
																<textarea class="cmtcustretext" type="text"
																	style="width: 100%; height: 150px"
																	placeholder="請輸入回覆訊息"></textarea>
																<div style="text-align: right">
																	<button type="button" class="btn btn-secondary btn-sm"
																		style="border-radius: 5px" data-dismiss="modal">取消</button>
																	<button type="button"
																		class="btn btn-primary btn-sm reply-comment"
																		style="border-radius: 5px"
																		data-frptno="${report.fRptNo}"
																		data-cmtno="${report.cmtNo}"
																		data-mbrno="${report.mbrNo}">送出</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:when>
										</c:choose></td>
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

		$("button.getcomment").on("click", function() {
			var cmtNo = $(this).attr('data-cmtno');
			$.ajax({
				url : "${pageContext.request.contextPath}/forum/forumcomment.do",
				type : "POST",
				data : {
					"action" : "getonecomment",
					"cmtno" : cmtNo,
				},
				dataType : "json",
				success : function(data) {
					$(".fs_alert_title").html("");
					$(".fs_alert_txt").html(data.cmtText);
					$("#fs_alert").css("display", "block");
					if(data.cmtStatus==0){
						$("h3.article-status").html("本則留言已下架")
					}

				}
			});
		})

		$("button.getpost").on("click", function() {
			var postNo = $(this).attr('data-postno');
			$.ajax({
				url : "${pageContext.request.contextPath}/forum/post.do",
				type : "POST",
				data : {
					"action" : "getonepost",
					"postno" : postNo,
				},
				dataType : "json",
				success : function(data) {
					$("h3.article-status").html(data.postTitle);
					$(".fs_alert_txt").html(data.postText);
					$("#fs_alert").css("display", "block");
					if(data.postStatus==2){
						$(".fs_alert_title").html("本則貼文已下架")
					}
				}
			});
		})

		$("button.post-manage").on("click", function() {
			var postNo = $(this).attr('data-postno');
			var fRptNo = $(this).attr('data-rptno');
			$.ajax({
				url : "${pageContext.request.contextPath}/forum/post.do",
				type : "POST",
				data : {
					"action" : "getonepost",
					"postno" : postNo,
				},
				dataType : "json",
				success : function(data) {
					if (data.postStatus == 2) {
						var modal = $('#postModal' + fRptNo);
						var radioButtons = modal.find('input[type="radio"]');
						radioButtons.prop('disabled', true);

					}
				}
			});
		})

		$("button.cmt-manage").on("click", function() {
			var cmtNo = $(this).attr('data-cmtno');
			var fRptNo = $(this).attr('data-rptno');
			$.ajax({
				url : "${pageContext.request.contextPath}/forum/forumcomment.do",
				type : "POST",
				data : {
					"action" : "getonecomment",
					"cmtno" : cmtNo,
				},
				dataType : "json",
				success : function(data) {
					if (data.cmtStatus == 0) {
						var modal = $('#cmtModal' + fRptNo);
						var radioButtons = modal.find('input[type="radio"]');
						radioButtons.prop('disabled', true);

					}
				}
			});
		})

		$("button.reply-post").on(
				"click",
				function() {
					var postNo = $(this).attr('data-postno');
					var frptNo = $(this).attr('data-frptno');
					var mbrNo = $(this).attr('data-mbrno');
					var postStatus = $('input[name="remove"]:checked').val();
					var replyText = $(this).closest(".modal-content").find(
							"textarea.postcustretext").val();
					
					console.log(replyText);
					if (postStatus == 2) {
						$.ajax({
							url : "${pageContext.request.contextPath}/forum/post.do",
							type : "POST",
							data : {
								"action" : "postrptmgmt",
								"postno" : postNo,
							},
							success : function(data) {
								$.ajax({
									url : "${pageContext.request.contextPath}/forum/forumreport.do",
									type : "POST",
									data : {
										"action" : "postrptmgmt",
										"frptNo" : frptNo,
										"replyText" : replyText,
										 "mbrNo" : mbrNo
									},
									success : function(data) {
										alert("檢舉處理完成");
										document.location.reload();
									}
								});
							}
						});

					}
		    		  else{
		    			  $.ajax({
			        		  url: "${pageContext.request.contextPath}/forum/forumreport.do",          
			        		  type: "POST",                  
			        		  data: {"action": "postrptmgmt",
			        			  	 "frptNo": frptNo,
			        			  	 "replyText": replyText,
			        			  	"mbrNo" : mbrNo
			    				     }, 
			        		  success: function(data){      
			        			  alert("檢舉處理完成");
								  document.location.reload();
			        		  }
			        	});
		    		  }
				})

		$("button.reply-comment").on(
				"click",
				function() {
					var cmtNo = $(this).attr('data-cmtno');
					var frptNo = $(this).attr('data-frptno');
					var mbrNo = $(this).attr('data-mbrno');
					var cmtStatus = $('input[name="report-type"]:checked').val();
					var replyText = $(this).closest(".modal-content").find(
							"textarea.cmtcustretext").val();
					console.log(cmtStatus)
					;console.log(cmtNo);
					console.log(replyText);
					if (cmtStatus == 0) {
						$.ajax({
							url : "${pageContext.request.contextPath}/forum/forumcomment.do",
							type : "POST",
							data : {
								"action" : "cmtrptmgmt",
								"cmtno" : cmtNo,
							},
							success : function(data) {
								$.ajax({
									url : "${pageContext.request.contextPath}/forum/forumreport.do",
									type : "POST",
									data : {
										"action" : "cmtrptmgmt",
										"frptNo" : frptNo,
										"replyText" : replyText,
										"mbrNo": mbrNo
									},
									success : function(data) {
										alert("檢舉處理完成");
										document.location.reload();
									}
								});
							}
						});

					}
		    		  else{
		    			  $.ajax({
			        		  url: "${pageContext.request.contextPath}/forum/forumreport.do",          
			        		  type: "POST",                  
			        		  data: {"action": "cmtrptmgmt",
			        			  	 "frptNo": frptNo,
			        			  	 "replyText": replyText,
			        			  	"mbrNo" : mbrNo
			    				     }, 
			        		  success: function(data){      
			        			  alert("檢舉處理完成");
								  document.location.reload();
			        		  }
			        	});
		    		  }
				})
				
				
		$(".fs_alert_bg, #alert_ok").on("click", function(e) {
			if (e.target === this) {
				$("#fs_alert").hide();
			}
		});
	</script>
</body>
</html>
