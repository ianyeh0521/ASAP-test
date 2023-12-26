<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant">

<%
	// 會員編號
	/*
	String memberNo = session.getAttribute("memberVO").getMbrNo();
	pageContext.setAttribute("mbrNo",memberNo);
	*/
	
// 	String mbrNo = "M002";
// 	pageContext.setAttribute("mbrNo",mbrNo);

%>



<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <title>ASAP論壇-編輯貼文</title>

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
    <header class="header">
      <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}" style="
          height: 75px;
          background: rgb(255, 250, 85);
          background: linear-gradient(
            90deg,
            rgba(255, 250, 85, 0.9081757703081232) 0%,
            rgba(9, 34, 121, 0.8773634453781513) 35%,
            rgba(0, 212, 255, 1) 100%
          );
        ">
        <div class="container">
          <div class="header-left col-lg-2 w-auto pl-0">
            <button class="mobile-menu-toggler text-primary mr-2" type="button">
              <i class="fas fa-bars"></i>
            </button>
            <a href="#" width="222" height="88">
              <img src="${pageContext.request.contextPath}/newImg/logo2.png" alt="Logo" />
            </a>
          </div>
          <!-- End .header-left -->
        </div>
        <!-- End .container -->
      </div>
      <!-- End .header-middle -->

      <div class="header-bottom sticky-header d-none d-lg-block" data-sticky-options="{'mobile': false}">
        <div class="container">
          <nav class="main-nav w-100">
            <ul class="menu" style="display: flex; justify-content: flex-end">
              <li>
                <a href="#">論壇</a>
                <ul>
                  <li><a href="#">論壇首頁</a></li>
                  <li><a href="#">發佈貼文</a></li>
                  <li><a href="#">我的貼文</a></li>
                  <li><a href="#">收藏貼文</a></li>
                </ul>
              </li>
              <li>
                <a href="#">揪團</a>
                <ul>
                  <li><a href="#">揪團首頁</a></li>
                  <li><a href="#">發起揪團</a></li>
                  <li><a href="#">我的揪團</a></li>
                </ul>
              </li>
              <li>
                <a href="#">找課程</a>
                <ul>
                  <li><a href="#">查詢課程</a></li>
                  <li><a href="#">我的課程</a></li>
                </ul>
              </li>
              <li>
                <a href="#">找場地</a>
                <ul>
                  <li><a href="#">詢找場地</a></li>
                  <li><a href="#">我的預約</a></li>
                  <li><a href="#">我的收藏</a></li>
                </ul>
              </li>
              <li>
                <a href="#">賣家入口</a>
                <ul>
                  <li><a href="#">所有訂單</a></li>
                  <li><a href="#">所有商品</a></li>
                  <li><a href="#">新增商品</a></li>
                  <li><a href="#">商品評論</a></li>
                </ul>
              </li>

              <li><a href="">商城</a></li>
              <li><a href="" style="color: red">登入</a></li>
            </ul>
          </nav>
        </div>
        <!-- End .container -->
      </div>
      <!-- End .header-bottom -->
    </header>

    <nav aria-label="breadcrumb" class="breadcrumb-nav">
      <div class="container">
        <ol class="breadcrumb">
<!--           <li class="breadcrumb-item"><a href="demo4.html"><i class="icon-home"></i></a></li> -->
<!--           <li class="breadcrumb-item active" aria-current="page"><a href="demo4.html">論壇</a></li> -->
<!--           <li class="breadcrumb-item active" aria-current="page">發布貼文</li> -->
        </ol>
      </div><!-- End .container -->
    </nav>
    <form action="${pageContext.request.contextPath}/forum/post.do" method="post">
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
        <input class="posttitle" name="posttitle" type="text" id="subject" placeholder="請輸入主題" required maxlength="30">
      </div>
      
        <textarea name="posttext" id="summernote" required></textarea>
      
      <div id="action-buttons">
        <button type="submit" id="draft-button" class="btn btn-default btn-rounded btn-md" name="action" value="updatedraft">儲存草稿</button>
        <a href="${pageContext.request.contextPath}/forum/my_post.jsp"
            style="color:black"><button type="button" id="cancel-button" class="btn btn-default btn-rounded btn-md">取消</button></a>
        <button type="submit" id="submit-button" class="btn btn-default btn-rounded btn-md" name="action" value="updatepost">送出</button>
      	<input type="hidden" name="postno" value="">
      </div>
    </div>
  </form>




    <footer class="footer bg-dark"><div class="footer-middle">
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
                <li><a href="#">Account</a></li>
                <li><a href="#">Course</a></li>
                <li><a href="#">Forum</a></li>
                <li><a href="#">Group</a></li>
                <li><a href="#">Court</a></li>
                <li><a href="#">Seller</a></li>
                <li><a href="#">Mall</a></li>
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
    <!-- End .container --></footer>
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
      //$("header").load("header.html");
      //$("footer").load("footer.html");
      $("div.sticky-navbar").load("sticky-navbar.html");
      $("div.mobile-menu-container").load("mobile-menu-container.html");
      var postNo = sessionStorage.getItem('postNo');
      console.log(postNo);
      $.ajax({
		  url: "${pageContext.request.contextPath}/forum/post.do",          
		  type: "POST",                  
		  data: {"action": "getmypost",
			  	 "postno": postNo,
			     },  
		  dataType:"json",
		  success: function(data){      
			  console.log(data);
			  $("input.posttitle").val(data.postTitle);
		      $("select#category").val(data.postTypeVO.postTypeNo);
		      $("input[name='postno']").val(data.postNo);
		      if(data.postStatus==1){
		    	  $("#draft-button").prop('disabled', true);
		      }else if(data.postStatus==0){
		    	  $('#submit-button').val("updatetime");
		      }
		      $('#summernote').summernote({
	    	        tabsize: 2,
	    	        height: 300, 
	    	        callbacks: {
	    	            onInit: function() {
	    	                $('#summernote').summernote('code', data.postText);
	    	            }
	    	        }
	    	    });
		  }
	});
      
    </script>
</body>

</html>