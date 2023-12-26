<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.asap.forum.service.PostVOServiceImpl"%>
<%@page import="com.asap.forum.service.PostVOService"%>
<%@page import="com.asap.forum.entity.PostVO"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%

	// 會員編號
	/*
	String memberNo = session.getAttribute("memberVO").getMbrNo();
	pageContext.setAttribute("mbrNo",memberNo);
	*/
	
	String mbrNo = "M002";
	pageContext.setAttribute("mbrNo",mbrNo);

    PostVOService postSvc = new PostVOServiceImpl();
	List<PostVO> post = postSvc.getMyPosts(mbrNo);
    pageContext.setAttribute("post", post);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>ASAP</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template" />
    <meta name="author" content="SW-THEMES" />

    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />
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
        wf.src = "assets/js/webfont.js";
        wf.async = true;
        s.parentNode.insertBefore(wf, s);
      })(document);
    </script>

    <!-- Plugins CSS File -->
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
    />

    <!-- Main CSS File -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"
    />
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
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
          language: {
            url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
          },
        });
      });
    </script>
    <style>
        #fs_alert {
        width: 100vw;
        height: 100vh;
        position: absolute;
        top: 0;
        /* display: block; */
        display: none;
        z-index: 999;
      }
      .fs_alert_bg {
        width: 100vw;
        height: 100vh;
        background-color: rgba(0, 0, 0, 0.671);
        position: fixed;
        top: 0;
      }
      .fs_alert_show {
        max-width: 450px;
        min-width: 400px;

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
      <header class="header"> <div class="header-middle sticky-header" data-sticky-options="{'mobile': true}" style="
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
    <!-- End .header-bottom --></header>
      <!-- End .header -->


      <main class="main">
        <div class="page-header">
          <div class="container d-flex flex-column align-items-center">
            <h1>我的貼文</h1>
          </div>
        </div>

        <!--這是彈窗 需要傳資料可以把form、input打開 他的css在上面-->

        <div class="container login-container">
          <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
            <table id="table_id" class="display">
              <thead>
                <tr>
                  <!-- 欄位標題 可以調整欄位數量但標題和內容要一起-->
                  <th width="10%">貼文編號</th>
                  <th width="10%">貼文狀態</th>
                  <th width="15%">創建時間</th>
                  <th width="45%">貼文標題</th>
                  <th width="10%">編輯貼文</th>
                  <th width="10%">刪除貼文</th>
                </tr>
              </thead>
              <tbody>
                 <!-- 欄位內容 可以調整欄位數量但標題和內容要一起 也可以在欄位中加入需要的標籤img、buttom-->
                <!-- 這裡轉成jsp時可用c:forEach方法 -->
                <c:forEach var="post" items="${post}">
                <tr>
                  <td>${post.postNo}</td>
                  <td> <c:choose>
       				   <c:when test="${post.postStatus == 0}">
           				草稿
       				   </c:when>
        			   <c:when test="${post.postStatus == 1}">
            		    上架
        			   </c:when>
    				  </c:choose>
    			  </td>
                  <td><fmt:formatDate value="${post.postCrtTime}" pattern="yyyy-MM-dd HH:mm" /></td>
                  <td>
                  <c:choose>
       				   <c:when test="${post.postStatus == 0}">
           				${post.postTitle}
       				   </c:when>
        			   <c:when test="${post.postStatus == 1}">
            		    <a href="${pageContext.request.contextPath}/forum/forum_article.jsp?postNo=${post.postNo}" style="color:black">${post.postTitle}</a>
        			   </c:when>
    				  </c:choose>
                  </td>
                  <!--按鈕樣式可以去https://getbootstrap.com/docs/4.0/components/buttons/ 找 -->
                  
                  <td>
                	<button type="button" class="btn btn-primary btn-sm edit" data-postNo="${post.postNo}" style="border-radius:5px; font-size:1.1rem;">編輯貼文</button>
            	  </td>
                  <td><button type="button" class="btn btn-danger btn-sm delete" data-postNo="${post.postNo}" style="border-radius:5px">刪除貼文</button></td>
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

    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

    <script>
      //$("header").load("header.html");
      $("div.sticky-navbar").load("sticky-navbar.html");
      $("div.mobile-menu-container").load("mobile-menu-container.html");
      $("footer").load("footer.html");
      $("button.edit").on("click", function(){
    	  var postNo = $(this).attr('data-postno');
    	  sessionStorage.setItem("postNo", postNo);
    	  window.location.href = "edit_my_post.jsp";
//     	  
      })
      $("button.delete").on("click", function(){
    	  var postNo = $(this).attr("data-postno");
    	  console.log(postNo)
    	  let r = confirm("確認刪除？");
    	  if (r){
    	  $.ajax({
    		  url: "${pageContext.request.contextPath}/forum/post.do",          
    		  type: "POST",                  
    		  data: {"action": "deletepost",
    			  	 "postno": postNo,
				     },  
    		  success: function(data){      
    			  alert("刪除成功")
    			  document.location.reload()
    		  }
    	})}
      })
      
    </script>
  </body>
</html>
