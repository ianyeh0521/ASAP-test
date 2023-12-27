<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.asap.member.entity.MemberVO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.asap.forum.service.PostVOServiceImpl"%>
<%@page import="com.asap.forum.service.PostVOService"%>
<%@page import="com.asap.forum.entity.PostVO"%>

<%
Integer postNo = Integer.valueOf(request.getParameter("postNo"));
PostVOService postSvc = new PostVOServiceImpl();
PostVO post = postSvc.findbyPK(postNo);
if(post==null){
	response.sendRedirect("errorpost.jsp");
}else{
	pageContext.setAttribute("post", post);
}


MemberVO memberVO = (MemberVO)session.getAttribute("memberVo");
String memberNo= memberVO.getMbrNo();
pageContext.setAttribute("mbrNo",memberNo);


%>



<!DOCTYPE html>
<html lang="zh-Hant">

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
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

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
      wf.src = "${pageContext.request.contextPath}/assets/js/webfont.js";
      wf.async = true;
      s.parentNode.insertBefore(wf, s);
    })(document);
  </script>

<!-- Plugins CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />

<style>
.report-container {
	width: 60%;
	margin: 0 auto;
	text-align: center;
}

label {
	font-size: 14px;
}

.report-heading {
	text-align: left;
	font-size: 24px;
}

.report-content {
	border: 1px solid #ddd;
	padding: 20px;
	font-size: 14px;
	background-color: #f7f7f7;
}

.report-item {
	margin-bottom: 15px;
	text-align: left;
	font-size: 14px;
}

.report-type input[type="radio"], .message-area textarea {
	margin-left: 10px;
}

.message-area {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.message-area textarea {
	height: 200px;
	flex-grow: 1;
}

.report-buttons {
	text-align: right;
}

.report-buttons button {
	margin-left: 10px;
}
</style>

</head>

<body>
	<div class="page-wrapper">
		<header class="header">
			
		</header>
		<!-- End .header -->

		<nav aria-label="breadcrumb" class="breadcrumb-nav">
			<div class="container">
				<ol class="breadcrumb">
					<!-- <li class="breadcrumb-item"><a href="demo4.html"><i class="icon-home"></i></a></li>
          <li class="breadcrumb-item active" aria-current="page"><a href="demo4.html">論壇</a></li>
          <li class="breadcrumb-item active" aria-current="page">論壇檢舉</li> -->
				</ol>
			</div>
			<!-- End .container -->
		</nav>

		<div class="report-container">
			<h1 class="report-heading">論壇貼文檢舉</h1>
			<div class="report-content">
				<div class="report-item">
					<label for="article-title">文章標題：</label> <span id="article-title">${post.postTitle}</span>
				</div>
				<div class="report-item">
					<label for="article-author">文章作者：</label> <span id="article-author">${post.mbrNo}</span>
				</div>
				<div class="report-item">
					<label for="article-time">發文時間：</label> <span id="article-time"><fmt:formatDate
							value="${post.postCrtTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>
				</div>
				<div class="report-item report-type">
					<label>回報類型*：</label> <input type="radio" id="category-error"
						name="report-type" value="1" required> <label
						for="category-error">分類錯誤</label> <input type="radio"
						id="duplicate-content" name="report-type" value="2"> <label
						for="duplicate-content">內容重複</label> <input type="radio"
						id="rule-violation" name="report-type" value="3"> <label
						for="rule-violation">違反板規</label> <input type="radio" id="other"
						name="report-type" value="4"> <label for="other">其他</label>
				</div>
				<div class="report-item message-area">
					<label for="additional-message">附加訊息：</label>
					<textarea id="additional-message" maxlength="250"></textarea>
				</div>
				<div class="report-buttons">
					<button class="btn btn-default btn-rounded btn-md">
						<a
							href="${pageContext.request.contextPath}/forum/forum_article.jsp?postNo=${post.postNo}"
							style="text-decoration: none; color: black">取消</a>
					</button>
					<button type="submit"
						class=" new-report btn btn-default btn-rounded btn-md">送出</button>

				</div>
			</div>
		</div>
		<br>





		<footer class="footer bg-dark"></footer>

		<div class="sticky-navbar"></div>
		<div class="mobile-menu-container"></div>

		<!-- Plugins JS File -->
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

		<!-- Main JS File -->
		<script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
		<script>
      $("button.new-report").on("click", function(){
        var rpttype=$('input[name="report-type"]:checked').val();
        var rpttext=$("textarea#additional-message").val();
        $.ajax({
  		  url: "${pageContext.request.contextPath}/forum/forumreport.do",          
  		  type: "POST",                  
  		  data: {"action": "reportpost",
  			  	 "postno": ${post.postNo},
				 "rpttype": rpttype,
				 "rpttext": rpttext,
				 "mbrNo": "${mbrNo}"
  		  		},                         
  		  success: function(){      
  		    alert("檢舉成功");
  		  	window.location.replace("${pageContext.request.contextPath}/forum/forum_article.jsp?postNo=${post.postNo}");
  		  }
  	});   
      } )
    </script>
</body>

</html>