<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.asap.group.entity.GrpInfoVO" %>
<%@ page import="com.asap.group.entity.SportTypeVO" %>
<%@ page import="com.asap.group.service.SportTypeService" %>
<%@ page import="com.asap.group.service.SportTypeService_interface" %>
<%@ page import="com.asap.group.entity.GrpJoinInfoVO" %>
<%@ page import="com.asap.group.service.GrpJoinInfoService_interface" %>
<%@ page import="com.asap.group.service.GrpJoinInfoService" %>
<%@ page import="com.asap.member.entity.MemberVO" %>
<%@ page import="com.asap.member.dao.MemberDAO" %>
<%@ page import="com.asap.member.service.MemberService" %>
<%@ page import="com.asap.member.service.MemberService_interface" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	SportTypeService grpSportSvc = new SportTypeService_interface();
	List<SportTypeVO> strSportList = grpSportSvc.getALL();
	pageContext.setAttribute("SportNameList", strSportList);
	
	GrpJoinInfoService grpJoinInfoSvc = new GrpJoinInfoService_interface();
	List<GrpJoinInfoVO>grpJoinList = grpJoinInfoSvc.getALL();
	pageContext.setAttribute("grpJoinList", grpJoinList);
	
	 MemberVO memberVO = (MemberVO)session.getAttribute("memberVo");
     String memberNo= memberVO.getMbrNo();
     pageContext.setAttribute("mbrNo",memberNo);
	
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
<link rel="icon" type="image/x-icon"
	href="../assets/images/icons/favicon.png" />

<script>
	WebFontConfig = {
		google : {
			families : [ "Open+Sans:300,400,600,700,800",
					"Poppins:300,400,500,600,700", "Shadows+Into+Light:400",
					"Segoe+Script:300,400,500,600", ],
		},
	};
	(function(d) {
		var wf = d.createElement("script"), s = d.scripts[0];
		wf.src = "assets/js/webfont.js";
		wf.async = true;
		s.parentNode.insertBefore(wf, s);
	})(document);
</script>

<!-- Plugins CSS File -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/simple-line-icons/css/simple-line-icons.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group/mycss.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/group/creategroup.css" />


<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>

<!-- datatable-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css" />
<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function () {
	    var TypedataToSend = {
	        QueryType: "1",
	    };
	    $.ajax({
	        type: "POST",
	        url: 'Grpinfo.do?' + $.param(TypedataToSend),
	        contentType: 'application/json',
	        success: function(Res) {
	            var m_GrpNo = Res.m_GrpNo;
	            var dataToSend = {
	                GrpNo: Res.m_GrpNo,
	            };
	            $.ajax({
	                type: "POST",
	                url: 'GrpJoinInfoAjax.do?' + $.param(dataToSend),
	                contentType: 'application/json',
	                success: function(result) {
	                    $("#table_id").DataTable({
	                        data: result,
	                        "autoWidth": false,
	                        "responsive": true,
	                        language: {
	                            url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"
	                        },
	                        "columnDefs": [{
	                            "className": "dt-center",
	                            "targets": "_all"
	                        }],
	                        "lengthMenu": [
	                            [5, 10, 25, -1], // 定義每頁顯示筆數選項
	                            ['5', '10', '25', '所有'] // 定義每頁顯示筆數選項文字
	                        ],
	                        "columns": [{
	                                data: null,
	                                render: function(data, type, row, meta) {
	                                    return meta.row + 1;
	                                }
	                            },
	                            {"data":"partiMbrNo", "width": "100px"},
	                            {"data": "m_MbrName", "width": "100px"},
	                            {"data": "m_MbrPhone", "width": "100px"},
	                            {"data": "m_MbrEmail", "width": "100px"}
	                        ]
	                    });
	                },
	                error: function(xhr) {
	                    console.log(xhr);
	                }
	            });
	        },
	        error: function(xhr) {
	            console.log(xhr);
	        }
	    });
	});
 
</script>
<style>
.createform {
	width: 70%;
	overflow-x:hidden;
}

h3 {
	position: relative;
	left: 25px;
}

table.grpjoin_tab1 {
	border-collapse: collapse;
	width: 80%;
	align-items: center;
	margin: 0 auto;
}

th.grpjoin_tab1, td.grpjoin_tab1 {
	border: 0.5px solid #817b7b;
	padding: 8px;
	text-align: center;
}

tr.grpjoin_tab1:nth-child(even) {
	background-color: #E8FFF5;
	text-align: center;
}

th.grpjoin_tab1 {
	background-color: #C4E1E1;
	text-align: center;
}
/* 目前參與人數樣式 */
b.Joinqty {
	position: relative;
	left: 700px;
	color: #FF5151;
}
/* 返回樣式 */
.Grp_Btnsrr {
	position: relative;
	text-align: center;
	margin-top: 20px;
	left:50px;
}

.return-link {
	display: inline-block;
	padding: 10px 20px;
	background-color: #0066CC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	margin-right: 100px;
}

/* 報名,解散,編輯按鈕 */
.Btn_allgrpJoin{
 appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  border: none;
  outline: none;
  background: #0066CC;
  padding: 0;
  margin: 0;
  cursor: pointer;
  font-size: inherit;
  color: inherit;
  width:68px;
  height:42.4px;
  padding-top:8px;
  display: inline-block;
  right:100px;
  
}

@media ( max-width :1280px) {
	.createform {
		width: 896.600px;
	}
}

@media ( min-width :769px)and(max-width:1279px) {
	.createform {
		width: 896.600px;
	}
}

/* 彈窗樣式 */
.All_grpinfoorgmbr {
	display: none;
}

.fs_grpinfoorgmbr_bg {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 999;
}

.grpinfoorgmbr_show {
	position: fixed;
	top: 55%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: rgb(250, 247, 247);
	padding: 20px;
	z-index: 1000;
	width: 850px;
	height: 525px;
	border-radius: 8px;
	overflow-y: auto;
	border-top: 20px solid;
	border-image: linear-gradient(to right, #F5F5DC, #D1E9E9, #6db1f1);
	border-image-slice: 1;
	}
/* icon */
#arrowleft {
	color: rgb(0, 0, 0);
	top: 20px;
}
	/* 彈窗樣式 */
#joingrpalertfs_alert,#Xjoingrpalertfs_alert,#delgrp_alert {
    width: 100vw;
    height: 100vh;
    position: absolute;
    top: 0;
    /* display: block; */
    display: none;
    z-index: 999;
}
.joingrpalertfs_alert_bg,.Xjoingrpalertfs_alert_bg,.delgrp_alert_bg {
    width: 100vw;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.671);
    position: fixed;
    top: 0;
    right:0px;
    left:0px;
    
}
.joingrpalertfs_alert_show,.Xjoingrpalertfs_alert_show,.delgrp_alert_show {
	position: fixed;
    max-width: 450px;
    min-width: 400px;
	top: 25%;
	left: 32.64%;
    background-color: white;
    margin: auto;
    z-index: 2;
    border-radius: 8px;
    text-align: center;
    border-top: 20px solid;
       border-image: linear-gradient(to right, #F5F5DC, #D1E9E9, #6db1f1);
       border-image-slice: 1;
}

.joingrpalertfs_alert_title,.Xjoingrpalertfs_alert_title,.delgrp_alert_title {
    font-size: 30px;
    text-align: center;
    margin: 35px;
    font-weight: bold;
}
.joingrpalertfs_alert_title_suc,.Xjoingrpalertfs_alert_title_suc,.delgrp_alert_title_suc {
    color:rgb(85, 184, 201);
}
.joingrpalertfs_alert_txt,.Xjoingrpalertfs_alert_txt,.delgrp_alert_txt {
    width: 80%;
    word-wrap: break-word;
    font-size: 16px;
    padding: 0 20px;
    text-align: center;
    margin: 0px auto 15px auto;
}
#joinalert_yes,#Xjoinalert_yes,#delalert_yes {
    margin: 20px 2px 45px 2px;
    border:1px;
}

#joinalert_no,#Xjoinalert_no,#delalert_no {
    margin: 20px 2px 45px 2px;
    border:1px;
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
     background-color:rgb(85, 184, 201);
}

.Btn_yesorno {
    text-align: center;
}

.btn_s {
    display: inline-block;
    padding: 8px 16px;
    margin: 0 5px;
}
.Btn_creategrp_sm {
	width:68px;
	height:42.4px;

}
.joingrpalertfs_alert_title, .joingrpalertfs_alert_txt,
.Xjoingrpalertfs_alert_title, .Xjoingrpalertfs_alert_txt,
.delgrp_alert_title, .delgrp_alert_txt {
   color: black;
}
</style>
</head>
<body>
	<!-- 發起人(詳細資訊) -->
	<div class="page-wrapper">
		<header class="header">
	       <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}"
            style="
              padding-top: 0;
              padding-bottom: 0;
              height: 75px;
              background: rgb(255, 250, 85);
              background: linear-gradient(
                90deg,
                rgba(255, 250, 85, 0.9081757703081232) 0%,
                rgba(9, 34, 121, 0.8773634453781513) 35%,
                rgba(0, 212, 255, 1) 100%
              );
              position: relative; /* Set position to relative for the parent */
              display: flex;
              align-items: center;
            "
          >
            <div class="container" style="position: relative;">
              <div class="header-left col-lg-2 w-auto pl-0"
                style="
                  position: absolute;
                  top: 50%; /* Move 50% from the top */
                  transform: translateY(-50%);
                  z-index: 999;
                  left: 20px; /* Adjust distance from the left */
                "
              >
						<button class="mobile-menu-toggler text-primary mr-2"
							type="button">
							<i class="fas fa-bars"></i>
						</button>
						<a href="${pageContext.request.contextPath}/member/MemberHome.jsp" style="width: 222; height: 88;"> <img
							src="${pageContext.request.contextPath}/newImg/logo2.png"
							alt="Logo" />
						</a>
					</div>
					<!-- End .header-left -->
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-middle -->

			<div style = "background-color:#fff;" class="header-bottom sticky-header d-none d-lg-block"
				data-sticky-options="{'mobile': false}">
				<div class="container">
					<nav class="main-nav w-100">
						<ul class="menu" style="display: flex; justify-content: flex-end">
							<li><a href="#">論壇</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
									<li><a href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
								</ul></li>
							<li><a href="#">揪團</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
									<li><a href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
									<li><a href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
								</ul></li>
							<li><a href="#">課程</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
									<li><a href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
								</ul></li>
							<li><a href="#">場地</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
									<li><a href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
									<li><a href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
								</ul></li>
							<li><a href="#">賣家</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
								</ul>
							</li>

							<li><a href="#">商城</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
									<li><a href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
								</ul>
							</li>
							<li><a href="#">個人首頁</a>
								<ul>
									<li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
									<li><a href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
								</ul>
							</li>
							<li><a><form action="${pageContext.request.contextPath}/MemberController" method="post" style="margin: 0px;"><button type="submit" style="border:0px; background-color:white;">登出</button><input type="hidden" name="action" value="logout"/></form></a></li>
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->
		</header>
		<!-- End .header -->
		<c:set var="grpVODetail" value="${grpVODetail}" />
		<c:set var="MemberVoDetail" value="${MemberVoDetail}" />
		<c:set var="partiMbrNoCount" value="${partiMbrNoCount}" />
		
		<main class="main">
			<h2 class="creategrptitle">詳細資訊</h2>
			<div class="createform">
				<div class="createform_main">
					<div>
					<!-- 登入帳號 -->
					<c:set var="LoginActNo" value="${mbrNo}" />
					<!-- 報名參加 -->
					<c:if test="${grpVODetail.orgMbrNo eq LoginActNo}">
						<c:if test="${not empty partiMbrNoCount}">
						<i class="fas fa-chevron-down" id="fas_fa"
							style="position: relative; left: 690px;"></i><b class="Joinqty">目前參加人數 <b>${partiMbrNoCount}</b> 人</b>
						</c:if>
						<c:if test="${empty partiMbrNoCount}">
						<i class="fas fa-chevron-down" id="fas_fa"
							style="position: relative; left: 690px;"></i><b class="Joinqty">目前參加人數 <b>1</b> 人</b>
						</c:if>
					</c:if>
	
					</div>
					
						<!-- 發起人資訊 -->
						<h3 style="color: #5A5AAD;">
							<i class="fas fa-user-circle"></i> 發起人資訊
						</h3>
						<br>
						<table class="grpjoin_tab1">
							<colgroup>
								<col style="width: 33.33%;">
								<col style="width: 33.33%;">
								<col style="width: 33.33%;">
							</colgroup>

							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >發起人</th>
								<th class="grpjoin_tab1" >連絡電話</th>
								<th class="grpjoin_tab1" >電子信箱</th>
							</tr>
						
							<tbody>
								<tr class="grpjoin_tab1">
									<td class="grpjoin_tab1">${MemberVoDetail.mbrName}</td>
									<td class="grpjoin_tab1">${MemberVoDetail.mbrPhone}</td>
									<td class="grpjoin_tab1">${MemberVoDetail.mbrEmail}</td>
								</tr>
							</tbody>
							
						</table>
						<hr>
						<!-- 活動資訊 -->
						<h3 style="color: #5A5AAD;">
							<i class="fas fa-user-circle"></i> 活動資訊
						</h3>
						<br>
						<table class="grpjoin_tab1">
							<colgroup>
								<col style="width: 18%;">
								<col style="width: 32%;">
								<col style="width: 18%;">
								<col style="width: 32%;">
							</colgroup>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >活動名稱</th>
								<td class="grpjoin_tab1">${grpVODetail.grpName}</td>
								<th class="grpjoin_tab1"  rowspan="5">圖片</th>
								<td class="grpjoin_tab1" rowspan="5"><img src="<%=request.getContextPath()%>/GrpImgReader?grpNo=${grpVODetail.grpNo}" style="width: 210px; height: 210px;" alt="無圖片顯示"/></td>
							</tr>
							<tr>
								<th class="grpjoin_tab1" >運動類別</th>
								<c:forEach var="SportNameList" items="${SportNameList}">
								<c:if test="${grpVODetail.sportTypeNo eq SportNameList.sportTypeNo}">
									<td class="grpjoin_tab1">${SportNameList.sportTypeName}</td> 
								</c:if>
								</c:forEach>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >活動日期</th>
								<td class="grpjoin_tab1"><fmt:formatDate value="${grpVODetail.grpDate}" pattern="yyyy-MM-dd" var="formattedGrpDate" />
								<a>${formattedGrpDate}</a></td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >開始時間</th>
								<td class="grpjoin_tab1"><fmt:formatDate value="${grpVODetail.grpStartTime}" pattern="HH:mm" var="formattedGrpTime" />
								<a>${formattedGrpTime}</a></td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >結束時間</th>
								<td class="grpjoin_tab1"><fmt:formatDate value="${grpVODetail.grpEndTime}" pattern="HH:mm" var="formattedGrpTime" />
								<a>${formattedGrpTime}</a></td>
								<!-- <th>#</th> -->
								<!-- <td>#</td> -->
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >最低人數</th>
								<td class="grpjoin_tab1">${grpVODetail.grpPplMin}</td>
								<th class="grpjoin_tab1" >最高人數</th>
								<td class="grpjoin_tab1">${grpVODetail.grpPplLimit}</td>
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" >活動地點</th>
								<td class="grpjoin_tab1">${grpVODetail.grpAddress}</td>
								<th class="grpjoin_tab1" data-name1="GrpSignStrTime"
									data-name2="GrpSignEndTime">報名期間</th>
								<td class="grpjoin_tab1"><fmt:formatDate value="${grpVODetail.grpSignStrTime}" pattern="yyyy-MM-dd" var="formattedGrpTime" />
								<a>${formattedGrpTime}</a><fmt:formatDate value="${grpVODetail.grpSignStrTime}" pattern="HH:mm" var="formattedGrpTime" />
								<a>${formattedGrpTime}</a>
								<br><a>至</a><br>
								<fmt:formatDate value="${grpVODetail.grpSignEndTime}" pattern="yyyy-MM-dd" var="formattedGrpTime" />
								<a>${formattedGrpTime}</a>
								<fmt:formatDate value="${grpVODetail.grpSignEndTime}" pattern="HH:mm" var="formattedGrpTime" />
								<a>${formattedGrpTime}</a>
							</tr>
							<tr class="grpjoin_tab1">
								<th class="grpjoin_tab1" style="height: 150px;" >注意事項</th>
								<td class="grpjoin_tab1" colspan="3" style="text-align: start;">${grpVODetail.grpNote}</td>
								<!-- <th>#</th>
                              <td >#</td> -->
							</tr>
						</table>
						<br>
						<div class="Grp_Btnsrr">
							<a href="${pageContext.request.contextPath}/group/AllGroup.jsp" class="return-link" id="return-link">返回</a>
					
							<!-- 判斷他是不是參與人,宣告一個IsPartiMbr = false -->
							<c:set var="IsPartiMbr" value="false" />
							<c:forEach var="grpJoInfoList" items="${grpJoInfoList}">
								<c:if test="${grpJoInfoList.partiMbrNo eq LoginActNo and grpJoInfoList.grpJoinStat}">
									<c:set var="IsPartiMbr" value="true" />
						    	</c:if>
							</c:forEach>
							
							<c:if test="${grpVODetail.orgMbrNo eq LoginActNo and grpVODetail.grpStat eq '0'}">
								<c:set var="IsPartiMbr" value="true" />
						    </c:if>
<% 
		// 抓伺服器時間
		Date serverDateTime = new Date();
		//預設時間格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        //轉換對應時間格式
		String formattedDateTime = sdf.format(serverDateTime);
        //設定 formattedDateTime
        pageContext.setAttribute("formattedDateTime", formattedDateTime);
%>		
							<c:set var="SignStrTime" value="${grpVODetail.grpSignStrTime}" />
							<c:set var="SignEndTime" value="${grpVODetail.grpSignEndTime}" />
							
							<!-- 判斷 現在時間(formattedDateTime) 超過 報名截止時間(SignEndTime) -->
							<c:if test="${formattedDateTime lt SignStrTime  and formattedDateTime gt SignEndTime}">
							    <c:set var="IsPartiMbr" value="true" />
							</c:if>		
						
							<c:if test="${IsPartiMbr eq 'false'}">
							    <FORM METHOD="post" class="Btn_allgrpJoin"   ACTION="<%=request.getContextPath()%>/GrpJoinInfo.do?action=insertGrpJoinInfoNo" style="margin-bottom: 0px;">
								<div>						
									<!-- 如果沒有額滿 -->
									<c:set var="Isfull" value="false" />
									<c:if test="${partiMbrNoCount eq grpVODetail.grpPplLimit}">
										<c:set var="Isfull" value="true" />
									</c:if>
									
									<c:if test="${Isfull eq 'false'}">
								    	<input id="Btn_signup"value="報名參加" style="width:68px; height:42.4 px ;border: none; background: none; color: white; cursor: pointer;text-align: center; ">
									</c:if>
									<c:if test="${Isfull eq 'true'}">
								    	<input id="Btn_signup"value="已額滿" style=" width:68px; height:42.4 px ;border: none; background: none; color: white; cursor: pointer;text-align: center; cursor: not-allowed; disabled">
										    <style>
										        .Btn_allgrpJoin, .Btn_allgrpJoin:hover{
										            background-color: #8E8E8E;
										        }
										    </style>
									</c:if>
								</div>    
							    <!--報名參加-彈窗畫面 -->
								 <div id="joingrpalertfs_alert">
						            <div class="joingrpalertfs_alert_bg"></div>
						            <div class="joingrpalertfs_alert_show"> 
						                <div class="joingrpalertfs_alert_title">提示</div>
						                <div class="joingrpalertfs_alert_txt">確定要報名嗎?</div>
						                <div class="Btn_yesorno">
						                    <input type="submit" class="btn_s" id="joinalert_yes" value="確定">
						                    <input type="hidden" name="GrpNo" value="${grpVODetail.grpNo}">
						                    <input type="hidden" name="OrgMbrNo" value="${grpVODetail.orgMbrNo}">
						                    <input type="hidden" name="PartiMbrNo" value="${LoginActNo}">
						                    <input type="hidden" name="action" value="insertGrpJoinInfoNo">
						                    <input type="button" class="btn_s" id="joinalert_no" value="取消">
						                </div> 
						            </div>
						        </div>
								<!--End .div彈窗畫面 -->
							    </FORM>
						    </c:if>
						    
							<c:forEach var="grpJoInfoList" items="${grpJoInfoList}">
								<c:if test="${grpJoInfoList.partiMbrNo eq LoginActNo}">
									<c:if test="${grpJoInfoList.grpJoinStat}">
										<FORM METHOD="post" class="Btn_allgrpJoin" style="background-color:#EA0000;"  ACTION="<%=request.getContextPath()%>/GrpJoinInfo.do?action=updateGrpJoinInfoNo" style="margin-bottom: 0px;">
										<div>
											<input id="Btn_Xsignup"value="退出報名" style="width:68px; border: none; background: none; color: white; cursor: pointer;text-align: center;">					
										</div>
										 <!--退出報名-彈窗畫面 -->
										<div id="Xjoingrpalertfs_alert">
											<div class="Xjoingrpalertfs_alert_bg"></div>
											<div class="Xjoingrpalertfs_alert_show"> 
												<div class="Xjoingrpalertfs_alert_title">提示</div>
												<div class="Xjoingrpalertfs_alert_txt">確定要退出報名嗎?</div>
												<div class="Btn_yesorno">
													<input type="submit" class="btn_s" id="Xjoinalert_yes" value="確定">
													<input type="hidden" name="GrpNo" value="${grpVODetail.grpNo}">
													<input type="hidden" name="PartiMbrNo" value="${LoginActNo}">
													<input type="hidden" name="GrpJoinfoNo" value="${grpJoInfoList.grpJoinInfoNo}">
													<input type="hidden" name="action" value="updateGrpJoinInfoNo">
													<input type="button" class="btn_s" id="Xjoinalert_no" value="取消">
												</div> 
											</div>
										</div>
										</FORM>
										<!--End .div彈窗畫面 -->
									</c:if>
								</c:if>
							</c:forEach>	
							
							<c:if test="${grpVODetail.orgMbrNo eq LoginActNo}">
								<c:if test="${grpVODetail.grpStat eq '0'}">
								<FORM METHOD="post" class="Btn_allgrpJoin"   ACTION="<%=request.getContextPath()%>/Grpinfo.do?action=creategroup" style="margin-bottom: 0px;">
									<input type="submit" value="編輯" style=" width:68px; border: none; background: none; color: white; cursor: pointer;text-align: center;">
									<input type="hidden" name="type" value="1">									
									<input type="hidden" name="action" value="creategroup">
								</FORM>
									<FORM METHOD="post" class="Btn_allgrpJoin" style="background-color:#EA0000;"  ACTION="<%=request.getContextPath()%>/Grpinfo.do?action=updatestatGrp" style="margin-bottom: 0px;">
										<div>
											<input id="delgroup" value="解散揪團" style="width:68px; border: none; background: none; color: white; cursor: pointer;text-align: center;">
										</div>
										<!--解散揪團-彈窗畫面 -->
										<div id="delgrp_alert">
											<div class="delgrp_alert_bg"></div>
											<div class="delgrp_alert_show"> 
												<div class="delgrp_alert_title">提示</div>
												<div class="delgrp_alert_txt">確定要解散嗎?</div>
												<div class="Btn_yesorno">
													<input type="submit" class="btn_s" id="delalert_yes" value="確定">
													<input type="hidden" name="GrpNo" value="${grpVODetail.grpNo}">
													<input type="hidden" name="GrpName" value="${grpVODetail.grpName}">
													<input type="hidden" name="action" value="updatestatGrp">
													<input type="button" class="btn_s" id="delalert_no" value="取消">
												</div> 
											</div>
										</div>
										<!--End .div彈窗畫面 -->
									</FORM>
									
								</c:if>
							</c:if>
								
						</div>
						<!-- 參與人彈窗畫面 datatable -->
						<div id="All_grpinfoorgmbr" class="All_grpinfoorgmbr">
							<div class="fs_grpinfoorgmbr_bg"></div>
							<div class="grpinfoorgmbr_show">
								<i class="fas fa-arrow-left" id="arrowleft"></i>
								<h3 style="text-align: center; left: 10px">參與人資訊</h3>
								<div style="margin: 20px 10px; border-radius: 10px; padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;">
									<table id="table_id" class="display">
										<thead>
											<tr>
												<!-- 欄位標題 可以調整欄位數量但標題和內容要一起-->
												<th width="50px" style="padding-left: 15px; ">序號</th>
												<th width="100px" style="padding-left: 15px; ">參與人編號</th>
												<th width="100px" style="padding-left: 15px; ">參與人</th>
												<th width="100px" style="padding-left: 15px; ">連絡電話</th>
												<th width="100px" style="padding-left: 15px; ">電子信箱</th>
											</tr>
										</thead>
										<tbody>
											<tr>
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
						</div>
					</form>
					<!-- End .createform_main -->
				</div>
			</div>
		</main>
	</div>
	<!-- End .page-wrapper -->

	<footer class="footer bg-dark position-relative">
	<div class="footer-middle">
    <div class="container">
      <div class="row">
        <div class="col-lg-3 col-sm-6">
          <div class="widget">
            <h4 class="widget-title">Contact Info</h4>
            <ul class="contact-info">
              <li>
                <span class="contact-info-label">Address:</span>5F., No. 219, Sec. 3, Nanjing E. Rd., Zhongshan Dist., Taipei City 104, Taiwan (R.O.C.)
              </li>
              <li>
                <span class="contact-info-label">Phone:</span
                ><a href="tel:">(02) 2712-0589</a>
              </li>
              <li>
                <span class="contact-info-label">Email:</span>
                <a href="mailto:mail@example.com">business@tibame.com</a>
              </li>
              <li>
                <span class="contact-info-label"
                  >Working Days/Hours:</span
                >
                Mon - Sun / 8:00 AM - 9:30 PM
              </li>
            </ul>
            <div class="social-icons">
              <a
                href="#"
                class="social-icon social-facebook icon-facebook"
                target="_blank"
                title="Facebook"
              ></a>
              <a
                href="#"
                class="social-icon social-twitter icon-twitter"
                target="_blank"
                title="Twitter"
              ></a>
              <a
                href="#"
                class="social-icon social-instagram icon-instagram"
                target="_blank"
                title="Instagram"
              ></a>
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
              <li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">Account</a></li>
              <li><a href="${pageContext.request.contextPath}/course/course_main.jsp">Course</a></li>
              <li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">Forum</a></li>
              <li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">Group</a></li>
              <li><a href="${pageContext.request.contextPath}/court/court_main.jsp">Court</a></li>
              <li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">Seller</a></li>
              <li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">Mall</a></li>
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
          <span class="footer-copyright"
            >© ASAP. 2023. All Rights Reserved</span
          >
        </div>
      </div>
    </div>
    <!-- End .footer-bottom -->
  </div>
  <!-- End .container -->
	</footer>
	<!-- End .footer -->

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
      <li>
        <a href="#">論壇</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/forum/forum_home.jsp">論壇首頁</a></li>
			<li><a href="${pageContext.request.contextPath}/forum/addpost.jsp">發佈貼文</a></li>
			<li><a href="${pageContext.request.contextPath}/forum/my_post.jsp">我的貼文</a></li>
			<li><a href="${pageContext.request.contextPath}/forum/my_save_post.jsp">收藏貼文</a></li>
		</ul>
      </li>
      <li>
        <a href="#">揪團</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/group/AllGroup.jsp">揪團首頁</a></li>
			<li><a href="${pageContext.request.contextPath}/Grpinfo.do?action=creategroup&type=0">發起揪團</a></li>
			<li><a href="${pageContext.request.contextPath}/group/myJoinGroup.jsp">我的揪團-參加</a></li>
			<li><a href="${pageContext.request.contextPath}/group/mycreateGroup.jsp">我的揪團-發起</a></li>
		</ul>
      </li>
      <li>
        <a href="#">課程</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/course/course_main.jsp">查詢課程</a></li>
			<li><a href="${pageContext.request.contextPath}/course/course_orderlist.jsp">我的課程</a></li>
		</ul>
      </li>

      <li>
        <a href="#">場地</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/court/court_main.jsp">尋找場地</a></li>
			<li><a href="${pageContext.request.contextPath}/court/court_orderlist.jsp">我的預約</a></li>
			<li><a href="${pageContext.request.contextPath}/court/court_savelist.jsp">我的收藏</a></li>
		</ul>
      </li>

      <li>
        <a href="#">賣家</a>
        <ul>
			<li><a href="${pageContext.request.contextPath}/shop/ItemManage.jsp">商品管理</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/SellerOrderManage.jsp">訂單管理</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/SellerCmtManage.jsp">評論管理</a></li>
		</ul>
      </li>
      <li><a href="#">商城</a>
      	<ul>
			<li><a href="${pageContext.request.contextPath}/shop/AsapShop.jsp">商城首頁</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/AsapCart.jsp">購物車</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/MyCollection.jsp">我的收藏</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/PendingOrder.jsp">待付款訂單</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/BuyerOrderManage.jsp">已付款訂單</a></li>
			<li><a href="${pageContext.request.contextPath}/shop/ItemComment.jsp">商品評論</a></li>
		</ul>
      </li>
      <li><a href="#">個人首頁</a>
		<ul>
			<li><a href="${pageContext.request.contextPath}/member/MemberHome.jsp">我的帳戶</a></li>
			<li><a href="${pageContext.request.contextPath}/member/MemberChat.jsp">客服</a></li>
		</ul>
	  </li>
      
    </ul>
  </nav>
  <!-- End .mobile-nav -->
</div>
<!-- End .mobile-menu-wrapper -->

	</div>
	<!-- End .mobile-menu-container -->

	<div class="sticky-navbar">
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/course/course_main.jsp"> <i class="icon-home"></i>Course </a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/forum/forum_home.jsp" class=""> <i class="icon-edit"></i>Forum </a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/group/AllGroup.jsp" class=""> <i class="icon-cat-sport"></i>Group</a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/shop/AsapShop.jsp" class="">
		    <i class="icon-shopping-cart position-relative"> </i>Mall
		  </a>
		</div>
		<div class="sticky-info">
		  <a href="${pageContext.request.contextPath}/member/MemberHome.jsp" class=""> <i class="icon-user-2"></i>Account </a>
		</div>
	</div>

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

	<!-- Plugins JS File -->

	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/nouislider.min.js"></script>

	<!-- Main JS File -->
	<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>


	<script>
// 	//返回按鈕
// 	document.querySelector('#return-link').addEventListener('click', function() {
// 	    window.history.back();
// 	});
	</script>
	<script>
	//報名參加彈窗
    function joingrpalertfs_alert(){
    	if (typeof joingrpalertfs_alert !== 'undefined') {
	        let joingrpalertfs_alert_el = document.getElementById('joingrpalertfs_alert');
	        
	        if (typeof joingrpalertfs_alert !== 'undefined') {
		        let Btn_signup_el = document.getElementById('Btn_signup');
		        
		        if (Btn_signup_el.value === '報名參加'){
			        joingrpalertfs_alert_el.style.display = 'block';
				    //抓到確認元素,按下確認按鈕即關閉
				    let alert_no_Btn = document.getElementById('joinalert_no');
			        alert_no_Btn.addEventListener('click',function(){
			        	joingrpalertfs_alert_el.style.display = 'none';
			     	});
		        }
	        }
        }
    }
	//退出報名彈窗
    function Xjoingrpalertfs_alert(){
    	if (typeof Xjoingrpalertfs_alert !== 'undefined') {
	        let Xjoingrpalertfs_alert_el = document.getElementById('Xjoingrpalertfs_alert');
	        Xjoingrpalertfs_alert_el.style.display = 'block';
		    //抓到確認元素,按下確認按鈕即關閉
		    let Xjoinalert_no_Btn = document.getElementById('Xjoinalert_no');
	   	 	Xjoinalert_no_Btn.addEventListener('click',function(){
	        	Xjoingrpalertfs_alert_el.style.display = 'none';
	        });
    	}
    }
    function delgrp_alert(){
    	if (typeof delgrp_alert !== 'undefined') {
	        let delgrp_alert_el = document.getElementById('delgrp_alert');
	        delgrp_alert_el.style.display = 'block';
		    //抓到確認元素,按下確認按鈕即關閉
		    let delgrp_alert_no_Btn = document.getElementById('delalert_no');
		   	delgrp_alert_no_Btn.addEventListener('click',function(){
	        	delgrp_alert_el.style.display = 'none';
	        });
    	}
    }

//     function init() {
    　　 //報名參加彈窗
		let btnSignup = document.querySelector('#Btn_signup');
		if (btnSignup) {
			btnSignup.addEventListener('click',joingrpalertfs_alert);
        }
		
		btnSignup = document.querySelector('#Btn_Xsignup');
		if (btnSignup) {
			btnSignup.addEventListener('click',Xjoingrpalertfs_alert);
        }
		
		btnSignup = document.querySelector('#delgroup');
		if (btnSignup) {
			btnSignup.addEventListener('click',delgrp_alert);
        }

//     }

    // 程式準備開始
//     window.addEventListener('load', init);
    
	</script>
	<script type="text/javascript">
		// 	詳細資訊彈窗
		if (typeof All_grpinfoorgmbr !== 'undefined') {
			var popup = document.getElementById('All_grpinfoorgmbr');
			 
			if (typeof fas_fa !== 'undefined') {
				var chevronDown = document.getElementById('fas_fa');
			    chevronDown.addEventListener('click', function() {
			        popup.style.display = 'block';
			    });
			}
				 
			let btnSignup = document.querySelector('.fs_grpinfoorgmbr_bg');
			if (btnSignup) {
				var fs_grpinfoorgmbr_bg = document.querySelector('.fs_grpinfoorgmbr_bg');
				fs_grpinfoorgmbr_bg.addEventListener('click',function(){
					popup.style.display = 'none';
				});
			}
			 
			if (typeof arrowleft !== 'undefined') {
			   var arrow_left = document.getElementById('arrowleft');
			   arrow_left.addEventListener('click',function(){
					popup.style.display = 'none';
			   });
			}
			 
		}
	</script>

</body>
