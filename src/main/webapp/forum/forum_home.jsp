<%@page import="com.asap.forum.service.PostVOServiceImpl"%>
<%@page import="com.asap.forum.service.PostVOService"%>
<%@page import="com.asap.forum.entity.PostVO"%>
<%@page import="com.asap.util.*"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer(); %>


<!DOCTYPE html>
<%-- <% --%>
<%-- 
//     PostVOService postSvc = new PostVOServiceImpl();
// 	List<PostVO> list = postSvc.getAllPosts();
//     pageContext.setAttribute("list",list);
//     System.out.println(list);--%>
    
<%-- %> --%>



<html lang="zh-Hant">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <title>Porto - Bootstrap eCommerce Template</title>

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

  <!-- Main CSS File -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css" />
  <script src="https://kit.fontawesome.com/2bd4419edb.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css" />

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
  <style>
    .forum-options {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin: 10px 0;
      margin-left: 1%;
    }

    .forum-buttons,
    .user-buttons {
      display: flex;
      align-items: center;
    }

    .user-buttons {
      margin-right: 1%;
    }

    .forum-button,
    .user-button {
      padding: 10px 20px;
      margin-right: 10px;

      /*border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;*/
    }

    .forum-dropdown {
      padding: 8px;
      background-color: #f0f0f0;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-weight: bold;
    }

    .forum-dropdown option {

      font-weight: normal;
    }

    .forum-post {
      display: flex;
      margin-bottom: 20px;
      background-color: #f7f7f7;
      border: 1px solid #ccc;
      border-radius: 5px;
      overflow: hidden;
      width: 70%;
      /* 文章寬度佔70% */
      margin: 0 auto;
      /* 水平居中對齊 */
      max-height: 220px;
    }

    .post-content {
      flex: 2;
      padding: 10px;
    }

    .post-title {
      font-size: 18px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .post-preview {
      font-size: 14px;
      /* 預覽内容字體大小 */
      line-height: 1.4;
      max-height: 60px;
      /* 約可顯示三行 */
      overflow: hidden;
    }

    .post-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .post-time {
      font-weight: bold;
    }

    .post-views {
      background-color: #007bff;
      color: #fff;
      padding: 5px;
      border-radius: 5px;
      margin-right: 10px;
    }

    .read-more {
      text-decoration: none;
      color: #007bff;
      font-weight: bold;
    }

    .category-tag {
      position: absolute;
      background-color: #007bff;
      color: #fff;
      right: 16%;
      border-radius: 5px;
      padding: 5px 10px;
      z-index: 1;
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
          <!-- <li class="breadcrumb-item"><a href="demo4.html"><i class="icon-home"></i></a></li>
          <li class="breadcrumb-item active" aria-current="page"><a href="demo4.html">論壇</a></li> -->
        </ol>
      </div><!-- End .container -->
    </nav>
    <!-- searchbar start -->
    <div class="header-icon header-search header-search-inline header-search-category w-lg-max text-right mt-0">
      <a href="#" class="search-toggle" role="button"><i class="icon-search-3"></i></a>
      <form action="#" method="get">
        <div class="header-search-wrapper">
          <input type="search" class="form-control" name="q" id="q" placeholder="輸入要搜尋的文章標題" required>

          <button class="btn icon-magnifier p-0 search-btn" title="search" type="button"></button>
        </div><!-- End .header-search-wrapper -->
      </form>
    </div><!--end .searchbar-->

    <div class="forum-options">
      <div class="forum-buttons">
        <!-- <button class="forum-button">最新回覆</button> -->
        <button type="button" class="forum-button btn btn-default btn-rounded btn-md newest">最新發表</button>
        <button type="button" class="forum-button btn btn-default btn-rounded btn-md popularity">熱門文章</button>
        <select class="forum-dropdown btn-default btn-md" name="article-type" style="height: 38px; width:90px;">
<!--           <option value="article-category">文章分類</option> -->
          <option value="1">問題</option>
          <option value="2">情報</option>
          <option value="3">閒聊</option>
          <option value="4">討論</option>
          <option value="5">公告</option>
        </select>
      </div>
      <div class="user-buttons">
        <a href="${pageContext.request.contextPath}/forum/addpost.jsp" style="color:black"><button type="submit"
            class="user-button btn btn-default btn-rounded btn-md">發布貼文</button></a>
        <button type="submit" class="user-button btn btn-default btn-rounded btn-md">我的貼文</button>
        <button type="submit" class="user-button btn btn-default btn-rounded btn-md">已收藏貼文</button>
      </div>
    </div>

    <!-- Post Start -->
    <div class="post-list">
<%--     <c:forEach var="postVO" items="${list}"> --%>
<!--     <div class="forum-post"> -->
<!--       <div class="post-content"> -->
<%--         <span class="category-tag">${postVO.postTypeVO.postTypeName}</span> --%>
<%--         <a href="/ASAP/forum/forum_article.jsp?postNo=${postVO.postNo}"><h2 class="post-title">${postVO.postTitle}</h2></a> --%>
<!--         <div class="post-info" style="font-size: 15px; margin:5px 0; color:#77837c"> -->
<%--           <span class="author-id" style="display:inline-block; width: 20%;"><i class="fa-solid fa-circle-user"></i>${postVO.mbrNo}</span> --%>
          
<%--           <span class="views" style="display:inline-block; width: 8%;"><i class="fa-regular fa-eye"></i>${postVO.postViews}</span> --%>
          
<%--           <span class="post-time" style="font-weight: normal; display:inline-block; width: 17%;"><i class="fa-regular fa-clock"></i>${postVO.postCrtTime}</span> --%>
<!--         </div> -->
<%--  <p class="post-preview">${postVO.postText}</p>  --%>
<!--        <div class="post-meta">  -->
<!--            <div></div>  -->

<!--          </div>  -->
<!--       </div>  -->
<!--      </div>  -->
<!--     <br>  -->
<%--      </c:forEach> --%>
     </div>
    <!-- Post End -->

    

    <br><br><br>
    <footer class="footer bg-dark"></footer>

    <div class="sticky-navbar"></div>
    <div class="mobile-menu-container"></div>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
    <script>
      //$("header").load("header.html");
      $("footer").load("footer.html");
      $("div.sticky-navbar").load("sticky-navbar.html");
      $("div.mobile-menu-container").load("mobile-menu-container.html");
      
//    loadpost when visit start
      $.ajax({
			url : "/ASAP/forum/post.do",
			data:{"action": "loadpost"},
			type : "POST",
			success : function(data) {
				console.log(data);
				var post_html = "";
				for (let item in data) {
					post_html=`
					<div class="forum-post">
					<div class="post-content">
						<span class="category-tag">\${data[item]["postTypeVO"]["postTypeName"]}</span>
						<a href="/ASAP/forum/forum_article.jsp?postNo=\${data[item]["postNo"]}"><h2 class="post-title">\${data[item]["postTitle"]}</h2></a>
						<div class="post-info"
							style="font-size: 15px; margin: 5px 0; color: #77837c">
							<span class="author-id" style="display: inline-block; width: 20%;"><i
								class="fa-solid fa-circle-user"></i\>${data[item]["mbrNo"]}</span> <span
								class="views" style="display: inline-block; width: 8%;"><i
								class="fa-regular fa-eye"></i>\${data[item]["postViews"]}</span> <span class="post-time"
								style="font-weight: normal; display: inline-block;"><i
								class="fa-regular fa-clock"></i>\${data[item]["postCrtTime"]}</span>
						</div>
						<p class="post-preview">\${data[item]["postText"]}</p>
						<div class="post-meta">
							<div></div>
						</div>
					</div>
				</div>
				<br>`
				$("div.post-list").prepend(post_html);
				};					
			},
			
		});
		
//    get by category start
      $("select.forum-dropdown").on("change", function () {
          var value = $("select[name='article-type']").val();
//           console.log(value);
            $.ajax({
              url: "/ASAP/forum/post.do",
              data: {
                "action": "bytype",
                "type": value
              },
              type: "POST",
              success: function (data) {
                console.log(data);
                  $("div.post-list").children("div").animate({
                    "opacity": 0
                  }, 0, "swing", function () {
                    $(this).remove();
                  });
                  var post_html = "";
                  for (let item in data) {
                    post_html = `
                    <div class="forum-post">
                    <div class="post-content">
                      <span class="category-tag">\${data[item]["postTypeVO"]["postTypeName"]}</span>
                      <a href="/ASAP/forum/forum_article.jsp?postNo=\${data[item]["postNo"]}"><h2 class="post-title">\${data[item]["postTitle"]}</h2></a>
                      <div class="post-info"
                        style="font-size: 15px; margin: 5px 0; color: #77837c">
                        <span class="author-id" style="display: inline-block; width: 20%;"><i
                          class="fa-solid fa-circle-user"></i>\${data[item]["mbrNo"]}</span> <span
                          class="views" style="display: inline-block; width: 8%;"><i
                          class="fa-regular fa-eye"></i>\${data[item]["postViews"]}</span> <span class="post-time"
                          style="font-weight: normal; display: inline-block;"><i
                          class="fa-regular fa-clock"></i>\${data[item]["postCrtTime"]}</span>
                      </div>
                      <p class="post-preview">\${data[item]["postText"]}</p>
                      <div class="post-meta">
                        <div></div>
                      </div>
                    </div>
                  </div>
                  <br>`
                    $("div.post-list").prepend(post_html);
                  };
              }
            })
        })
        
//		search post start
		 $("button.search-btn").on("click", function(){
			var keyword= $("input.form-control").val().trim();
			if (keyword==null){
				alert("請輸入內容");
			}else{
			$.ajax({
				url : "/ASAP/forum/post.do",
				data:{"action": "search",
					  "keyword": keyword },
				type : "POST",
				success : function(data) {
					console.log(data);
					if (data.length===0){
						alert("查無資料");
					}else{
						$("div.post-list").children("div").animate({
				            "opacity": 0
				          }, 0, "swing", function(){
				            $(this).remove();
				          });
						var post_html = "";
						for (let item in data) {
							post_html=`
							<div class="forum-post">
							<div class="post-content">
								<span class="category-tag">\${data[item]["postTypeVO"]["postTypeName"]}</span>
								<a href="/ASAP/forum/forum_article.jsp?postNo=\${data[item]["postNo"]}"><h2 class="post-title">\${data[item]["postTitle"]}</h2></a>
								<div class="post-info"
									style="font-size: 15px; margin: 5px 0; color: #77837c">
									<span class="author-id" style="display: inline-block; width: 20%;"><i
										class="fa-solid fa-circle-user"></i>\${data[item]["mbrNo"]}</span> <span
										class="views" style="display: inline-block; width: 8%;"><i
										class="fa-regular fa-eye"></i>\${data[item]["postViews"]}</span> <span class="post-time"
										style="font-weight: normal; display: inline-block;"><i
										class="fa-regular fa-clock"></i>\${data[item]["postCrtTime"]}</span>
								</div>
								<p class="post-preview">\${data[item]["postText"]}</p>
								<div class="post-meta">
									<div></div>
								</div>
							</div>
						</div>
						<br>`
						$("div.post-list").prepend(post_html);
						};					
					}
				}
			})}
		})
// 		get by popularity
		$("button.popularity").on("click", function(){
			var keyword= $("input.form-control").val().trim();
			if (keyword==null){
				alert("請輸入內容");
			}else{
			$.ajax({
				url : "/ASAP/forum/post.do",
				data:{"action": "search",
					  "keyword": keyword },
				type : "POST",
				success : function(data) {
					console.log(data);
					if (data.length===0){
						alert("查無資料");
					}else{
						$("div.post-list").children("div").animate({
				            "opacity": 0
				          }, 0, "swing", function(){
				            $(this).remove();
				          });
						var post_html = "";
						for (let item in data) {
							post_html=`
							<div class="forum-post">
							<div class="post-content">
								<span class="category-tag">\${data[item]["postTypeVO"]["postTypeName"]}</span>
								<a href="/ASAP/forum/forum_article.jsp?postNo=\${data[item]["postNo"]}"><h2 class="post-title">\${data[item]["postTitle"]}</h2></a>
								<div class="post-info"
									style="font-size: 15px; margin: 5px 0; color: #77837c">
									<span class="author-id" style="display: inline-block; width: 20%;"><i
										class="fa-solid fa-circle-user"></i>\${data[item]["mbrNo"]}</span> <span
										class="views" style="display: inline-block; width: 8%;"><i
										class="fa-regular fa-eye"></i>\${data[item]["postViews"]}</span> <span class="post-time"
										style="font-weight: normal; display: inline-block;"><i
										class="fa-regular fa-clock"></i>\${data[item]["postCrtTime"]}</span>
								</div>
								<p class="post-preview">\${data[item]["postText"]}</p>
								<div class="post-meta">
									<div></div>
								</div>
							</div>
						</div>
						<br>`
						$("div.post-list").prepend(post_html);
						};					
					}
				}
			})}
		})
		
// 		get by time
		$("button.search-btn").on("click", function(){
			var keyword= $("input.form-control").val().trim();
			if (keyword==null){
				alert("請輸入內容");
			}else{
			$.ajax({
				url : "/ASAP/forum/post.do",
				data:{"action": "search",
					  "keyword": keyword },
				type : "POST",
				success : function(data) {
					console.log(data);
					if (data.length===0){
						alert("查無資料");
					}else{
						$("div.post-list").children("div").animate({
				            "opacity": 0
				          }, 0, "swing", function(){
				            $(this).remove();
				          });
						var post_html = "";
						for (let item in data) {
							post_html=`
							<div class="forum-post">
							<div class="post-content">
								<span class="category-tag">\${data[item]["postTypeVO"]["postTypeName"]}</span>
								<a href="/ASAP/forum/forum_article.jsp?postNo=\${data[item]["postNo"]}"><h2 class="post-title">\${data[item]["postTitle"]}</h2></a>
								<div class="post-info"
									style="font-size: 15px; margin: 5px 0; color: #77837c">
									<span class="author-id" style="display: inline-block; width: 20%;"><i
										class="fa-solid fa-circle-user"></i>\${data[item]["mbrNo"]}</span> <span
										class="views" style="display: inline-block; width: 8%;"><i
										class="fa-regular fa-eye"></i>\${data[item]["postViews"]}</span> <span class="post-time"
										style="font-weight: normal; display: inline-block;"><i
										class="fa-regular fa-clock"></i>\${data[item]["postCrtTime"]}</span>
								</div>
								<p class="post-preview">\${data[item]["postText"]}</p>
								<div class="post-meta">
									<div></div>
								</div>
							</div>
						</div>
						<br>`
						$("div.post-list").prepend(post_html);
						};					
					}
				}
			})}
		})
		
//      get by popularity
$("button.popularity").on("click", function(){
			$.ajax({
	              url: "/ASAP/forum/post.do",
	              data: {
	                "action": "bypopularity"
	              },
	              type: "POST",
	              success: function (data) {
	                console.log(data);
	                  $("div.post-list").children("div").animate({
	                    "opacity": 0
	                  }, 0, "swing", function () {
	                    $(this).remove();
	                  });
	                  var post_html = "";
	                  for (let item in data) {
	                    post_html = `
	                    <div class="forum-post">
	                    <div class="post-content">
	                      <span class="category-tag">\${data[item]["postTypeVO"]["postTypeName"]}</span>
	                      <a href="/ASAP/forum/forum_article.jsp?postNo=\${data[item]["postNo"]}"><h2 class="post-title">\${data[item]["postTitle"]}</h2></a>
	                      <div class="post-info"
	                        style="font-size: 15px; margin: 5px 0; color: #77837c">
	                        <span class="author-id" style="display: inline-block; width: 20%;"><i
	                          class="fa-solid fa-circle-user"></i>\${data[item]["mbrNo"]}</span> <span
	                          class="views" style="display: inline-block; width: 8%;"><i
	                          class="fa-regular fa-eye"></i>\${data[item]["postViews"]}</span> <span class="post-time"
	                          style="font-weight: normal; display: inline-block;"><i
	                          class="fa-regular fa-clock"></i>\${data[item]["postCrtTime"]}</span>
	                      </div>
	                      <p class="post-preview">\${data[item]["postText"]}</p>
	                      <div class="post-meta">
	                        <div></div>
	                      </div>
	                    </div>
	                  </div>
	                  <br>`
	                    $("div.post-list").prepend(post_html);
	                  };
	              }
	            })
	        })
		
// 		get by time
		 $("button.newest").on("click", function(){
			var keyword= $("input.form-control").val().trim();
			if (keyword==null){
				alert("請輸入內容");
			}else{
				$.ajax({
		              url: "/ASAP/forum/post.do",
		              data: {
		                "action": "bytime"
		              },
		              type: "POST",
		              success: function (data) {
		                console.log(data);
		                  $("div.post-list").children("div").animate({
		                    "opacity": 0
		                  }, 0, "swing", function () {
		                    $(this).remove();
		                  });
		                  var post_html = "";
		                  for (let item in data) {
		                    post_html = `
		                    <div class="forum-post">
		                    <div class="post-content">
		                      <span class="category-tag">\${data[item]["postTypeVO"]["postTypeName"]}</span>
		                      <a href="/ASAP/forum/forum_article.jsp?postNo=\${data[item]["postNo"]}"><h2 class="post-title">\${data[item]["postTitle"]}</h2></a>
		                      <div class="post-info"
		                        style="font-size: 15px; margin: 5px 0; color: #77837c">
		                        <span class="author-id" style="display: inline-block; width: 20%;"><i
		                          class="fa-solid fa-circle-user"></i>\${data[item]["mbrNo"]}</span> <span
		                          class="views" style="display: inline-block; width: 8%;"><i
		                          class="fa-regular fa-eye"></i>\${data[item]["postViews"]}</span> <span class="post-time"
		                          style="font-weight: normal; display: inline-block;"><i
		                          class="fa-regular fa-clock"></i>\${data[item]["postCrtTime"]}</span>
		                      </div>
		                      <p class="post-preview">\${data[item]["postText"]}</p>
		                      <div class="post-meta">
		                        <div></div>
		                      </div>
		                    </div>
		                  </div>
		                  <br>`
		                    $("div.post-list").prepend(post_html);
		                  };
		              }
		            })
		        }})
    </script>
</body>

</html>