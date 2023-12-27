<%@page import="com.asap.member.entity.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	
	MemberVO memberVO = (MemberVO)session.getAttribute("memberVo");
	String memberNo= memberVO.getMbrNo();
	pageContext.setAttribute("mbrNo",memberNo);

%>


<html lang="zh-Hant">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <title>ASAP</title>

  <meta name="keywords" content="HTML5 Template" />
  <meta name="description" content="Porto - Bootstrap eCommerce Template" />
  <meta name="author" content="SW-THEMES" />

  <!-- Favicon -->
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />

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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

   <!-- Main CSS File (style.min.css 10166 style.css 8837)   --> 
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/forum/style1.css" /> --%>

<%--   <link rel="stylesheet" href="${pageContext.request.contextPath}/forum/style1.min.css" />  --%>

 <!-- Main CSS File (style.min.css 10166 style.css 8837)   -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style_summernote.css" />

  <link rel="stylesheet" href="/${pageContext.request.contextPath}/assets/css/style_summernote.min.css" /> 



  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />


  <!-- 自定CSS樣式 -->
  <style>
    .post-container {
      width:70%;
      margin: 0 auto;
    }

    .form-group {
      text-align: center;
      display: flex;
      justify-content: space-between;
      margin: 20px 0;
      align-items: center;
    }

    .form-group label {
      width: 150px;
      text-align: left;
      margin-right: 10px;
    }

    #category {
      width: 200px;
      padding: 8px;
      
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
    }

    #subject {
      width: 100%;
      max-width: 400px;
      border: none;
      border-radius: 5px;
    }

    #summernote {
      text-align: center;
      margin: 20px auto;
      width: 100%;
      max-width: 800px;
      height: 300px;
    }

    #action-buttons {
      text-align: center;
      margin: 20px auto;
      display: flex;
      justify-content: flex-end;
    }

    #action-buttons button {
      margin-left: 10px;
    }
  </style>


  
  

</head>

<body>
  <div class="page-wrapper">
    <header class="header"></header>

    <nav aria-label="breadcrumb" class="breadcrumb-nav">
      <div class="container">
        <ol class="breadcrumb">
<!--           <li class="breadcrumb-item"><a href="demo4.html"><i class="icon-home"></i></a></li> -->
<!--           <li class="breadcrumb-item active" aria-current="page"><a href="demo4.html">論壇</a></li> -->
<!--           <li class="breadcrumb-item active" aria-current="page">發布貼文</li> -->
        </ol>
      </div><!-- End .container -->
    </nav>
    <form action="post.do" method="post">
    <div class="post-container">
      <div>
        <label for="category" style="font-size: 14px;">選擇文章分類：</label>
        <select id="category" name="posttypeno">
          <option value="1">問題</option>
          <option value="2">情報</option>
          <option value="3">閒聊</option>
          <option value="4">討論</option>
        </select>
      </div>

      <div>
        <label for="subject" style="font-size: 14px;" >主題：</label>
        <input name="posttitle" type="text" id="subject" placeholder="請輸入主題" required maxlength="30">
      </div>
      
        <textarea name="posttext" id="summernote" required></textarea>
      
      <div id="action-buttons">
        <button type="submit" id="draft-button" class="btn btn-default btn-rounded btn-md" name="action" value="savedraft">儲存草稿</button>
        <button type="button" id="cancel-button" class="btn btn-default btn-rounded btn-md"><a href="${pageContext.request.contextPath}/forum/forum_home.jsp"
            style="color:black">取消</a></button>
        <button type="submit" id="submit-button" class="btn btn-default btn-rounded btn-md" name="action" value="addnewpost">送出</button>
      	<input type="hidden" name="mbrNo" value="${mbrNo}">
      </div>
    </div>
  </form>




    <footer class="footer bg-dark"></footer>
    <div class="sticky-navbar"></div>
    <div class="mobile-menu-container"></div>


    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
    <!-- 加載Summernote -->  
    
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <script>
      $(document).ready(function () {
        $('#summernote').summernote({
          tabsize: 2,
          height: 300,
        });
      });
    </script>
</body>

</html>