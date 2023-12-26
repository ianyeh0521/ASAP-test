<%@page import="com.asap.forum.entity.ForumCommentVO"%>
<%@page import="com.asap.forum.service.ForumCommentVOServiceImpl"%>
<%@page import="com.asap.forum.service.ForumCommentVOService"%>
<%@page import="com.asap.forum.entity.ForumLikeVO"%>
<%@page import="com.asap.forum.service.ForumLikeVOServiceImpl"%>
<%@page import="com.asap.forum.service.ForumLikeVOService"%>
<%@page import="com.asap.forum.service.PostVOServiceImpl"%>
<%@page import="com.asap.forum.service.PostVOService"%>
<%@page import="com.asap.forum.entity.PostVO"%>
<%@page import="com.asap.util.*"%>
<%@page import="java.util.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" errorPage="errorpost.jsp" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	Integer postNo = Integer.valueOf(request.getParameter("postNo"));
    PostVOService postSvc = new PostVOServiceImpl();
	PostVO post = postSvc.findbyPK(postNo);
	Integer views = post.getPostViews();
	post.setPostViews(views+1);
	postSvc.updatePost(post);
    pageContext.setAttribute("post", post);
    
    /*
	String memberNo = session.getAttribute("memberVO").getMbrNo();
	pageContext.setAttribute("mbrNo",memberNo);
	*/
	
	String mbrNo = "M001";
	pageContext.setAttribute("mbrNo",mbrNo);
    
    
    ForumCommentVOService commentSvc= new ForumCommentVOServiceImpl();
    List<ForumCommentVO> comments=commentSvc.getComments(postNo);
    pageContext.setAttribute("comments", comments);

    List<String> statuslist = new ArrayList<>();
    ForumLikeVOService likeSvc= new ForumLikeVOServiceImpl();
    for (ForumCommentVO comment : comments) {
       Integer cmtNo=comment.getCmtNo();
       statuslist.add(likeSvc.cmtLikecheck(mbrNo, cmtNo));
    } 	
    pageContext.setAttribute("statuslist", statuslist);
    
    Long postLikes=likeSvc.likeCounts(postNo);
    pageContext.setAttribute("postLikes", postLikes);
    
%>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

  <title>ASAP論壇-貼文</title>

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
      wf.src = "${pageContext.request.contextPath}assets/js/webfont.js";
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
    .-up,
    .-saved {
      color: #0766AD !important;
      font-weight: bold;
    }

    div.post-info {
      font-size: 0;
    }

    span.save,
    span.thumbs-up,
    span.like-comment,
    span.delete-comment,
    span.report-comment {
      cursor: pointer;
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
    }

    .post-content {
      flex: 2;
      padding: 10px;
    }

    .post-title {
      font-size: 20px;
      font-weight: bold;
      margin: 3px 0;
    }

    .new-comment,
    .comment-text,
    .forum-post {
      display: flex;
      margin-bottom: 20px;
      background-color: #f7f7f7;
      border: 1px solid #ccc;
      border-radius: 5px;
      overflow: hidden;
      width: 70%;
      margin: 0 auto;
      position: relative;
    }

    span.category-tag {
      background-color: #007bff;
      color: #fff;
      border-radius: 5px;
      padding: 5px 10px;
    }

    .comment-text,
    .post-content {
      flex: 2;
      padding: 10px;
      position: relative;
    }

    a.-abutton {
      color: #6c757d;
      display: inline-block;
      width: 50px;
      height: 60px;
    }

    .comment-actions span {
      margin-left: 10px;
      /* 按鈕間距 */
    }

    button {
      cursor: pointer;
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

    .report-type input[type="radio"],
    .message-area textarea {
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
              <img src="/ASAP/newImg/logo2.png" alt="Logo" />
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
<!--           <input type="search" class="form-control" name="q" id="q" placeholder="輸入要搜尋的文章" required> -->

<!--           <button class="btn icon-magnifier p-0" title="search" type="submit"></button> -->
        </div><!-- End .header-search-wrapper -->
      </form>
    </div><!--end .searchbar-->

    <div class="forum-post" style="margin-top: 10px;">
      <!-- Text start -->
      <div class="post-content">
        <span class="category-tag">${post.postTypeVO.postTypeName}</span>
        <h2 class="post-title" data-postno="${post.postNo}">${post.postTitle}</h2>

        <div class="post-info" style="font-size: 15px; margin:5px 0; color:#77837c">
          <i class="fa-solid fa-circle-user"></i><span class="author-id"
            style="display: inline-block; margin: 0 0.5%">${post.mbrNo}</span>

          <i class="fa-regular fa-eye"></i><span class="views" style="display: inline-block; margin:0 0.5%">${post.postViews}</span>

          <i class="fa-regular fa-clock"></i><span class="post-time"
            style="display: inline-block; margin:0 0.5%">
           <fmt:formatDate value="${post.postCrtTime}" pattern="yyyy-MM-dd HH:mm" />
            </span>

          <div class="user-feature" style="float:right;">
            <span class="thumbs-up"><i class="fa-regular fa-thumbs-up fa-lg"></i><span class="likecounts">${postLikes}</span></span>
            <span class="save"><i class="fa-regular fa-floppy-disk fa-lg"></i>收藏貼文</span>
            <span class="report"><a href="${pageContext.request.contextPath}/forum/forum_report.jsp?postNo=${post.postNo}" style="color:#77837c"><i
                  class="fa-solid fa-flag fa-lg"></i>檢舉</a></span>
          </div>
        </div>
        <hr style="margin: 2px auto 2% auto;">
        <p class="post-text" style="font-size: 16px;">
          ${post.postText}
        </p>

      </div>
    </div>
    <!-- text end -->

    <hr style="margin: 2px auto;width:70%;">

    <div class="comment-list" style="padding-bottom:0px">
      <div class="new-comment" style="height:auto; position: relative;">
        <div style="width: 100%; display: flex; align-items: flex-end;">
          <div style="width: 100%; display: flex; align-items: center;">
            <div style="display: flex; align-items: center;">
              <i class="fas fa-circle-user fa-lg"></i>
              <span style="margin: 0 5%">留言</span>
            </div>
            <textarea class="new-text"
              style="width: 100%; resize: none; line-height: 1.5em; height: 7.5em; background-color:#f7f7f7; border-radius:2px" maxlength="500"></textarea>
          </div>
          <button class="submit-comment btn btn-default btn-rounded btn-md"
            style="height: auto; align-self: flex-end; margin-left: 5px;">送出</button>
        </div>
      </div>



	<c:forEach var="comment" items="${comments}" varStatus="status">
      <div class="comment-text" style="height: auto;">
       
        <div class="single-comment">
         
          <div class="comment-info">
            <i class="fas fa-circle-user fa-lg"></i>
            <span class="comment-author">${comment.mbrNo}</span>
            <span class="comment-time"><i class="fa-regular fa-clock"></i><fmt:formatDate value="${comment.cmtCrtTime}" pattern="yyyy-MM-dd HH:mm" /></span>
          </div>
          <p class="comment-content" data-cmtno="${comment.cmtNo}">
            ${comment.cmtText}
          </p>
          <div class="comment-actions" style="position:absolute; right:1%; bottom:0px">

<!--             <button class="delete-comment" type="submit" style="border: none; color:#777; background-color:#f7f7f7"> -->
<!--               <i class="fa-solid fa-trash"></i> 刪除 -->
<!--             </button> -->
            <button class="like-comment ${statuslist[status.index]}" type="button" style="border: none; color:#777; background-color:#f7f7f7">
              <i class="fa-regular fa-thumbs-up fa-lg"></i> 讚好</button>

            <button type="submit" data-toggle="modal" data-target="#exampleModal${comment.cmtNo}"
              style="border: none; color:#777; background-color:#f7f7f7"><i class="fa-solid fa-flag fa-lg"></i> 檢舉
            </button>

          </div>
        </div>
        
      </div>


    </div>


    <!-- Modal starts -->
    <div class="modal fade" id="exampleModal${comment.cmtNo}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="exampleModalLabel">檢舉留言</h3>
            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="">
            <div class="modal-body">
              <div class="report-item">
                <label for="article-author">留言作者：</label>
                <span id="article-author">${comment.mbrNo}</span>
              </div>
              <div class="report-item">
                <label for="article-time">留言時間：</label>
                <span id="article-time"><fmt:formatDate value="${comment.cmtCrtTime}" pattern="yyyy-MM-dd HH:mm" /></span>
              	<input type="hidden" class="commentNo" value="${comment.cmtNo}">
              </div>
              <div class="report-item report-type">
                <label>回報類型：*</label>
                <input type="radio" id="duplicate-content" name="report-type" value="2" required>
                <label for="duplicate-content">內容重複</label>
                <input type="radio" id="rule-violation" name="report-type" value="3">
                <label for="rule-violation">違反板規</label>
                <input type="radio" id="other" name="report-type" value="4">
                <label for="other">其他</label>
              </div>
              <div class="report-item message-area">
                <label for="additional-message">附加訊息：</label>
                <textarea id="additional-message" name="message" maxlength="200" type="text" ></textarea>
              </div>
              
            </div>
            
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary btn-sm" style="border-radius: 5px;" data-dismiss="modal">取消</button>
              <button type="button" class="btn btn-primary btn-sm filereport" style="border-radius: 5px;">送出</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    </c:forEach>
    <!-- Modal Ends -->

<br><br><br>

    <footer class="footer bg-dark"></footer>


    <div class="sticky-navbar"></div>
    <div class="mobile-menu-container"></div>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.1/dist/umd/popper.min.js"
      integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN"
      crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>
    <script>
      //$("header").load("header.html");
      $("footer").load("footer.html");
      $("div.sticky-navbar").load("sticky-navbar.html");
      $("div.mobile-menu-container").load("mobile-menu-container.html");
      let postno=$("h2.post-title").attr("data-postno");
      $.ajax({
          url: "${pageContext.request.contextPath}/forum/forumlike.do",
          type: "POST",
          data: { "action": "loadlike", "postno": postno, "mbrNo":"${mbrNo}" },
          dataType: "json",
          success: function (data) {
        	  console.log(data)
            if (data.status == 1) {
              $("this").addClass("-up");
              $("span.thumbs-up").addClass("-up");
            } else if (data.status == 0) {
              $("this").removeClass("-up");
              $("span.thumbs-up").removeClass("-up");
            }
          },
        });
      
	  $.ajax({
		  url: "${pageContext.request.contextPath}/forum/savepost.do",          
		  type: "POST",                  
		  data: {"action": "checksave",
			  	 "postno": postno,
			  	 "mbrNo":"${mbrNo}"
			  	},
		  dataType:"json",
		  success: function(data){      
		    if(data.status==1){
				$("span.save").addClass("-saved");
		    }else if(data.status==0){
		        $("span.save").removeClass("-saved");
		    }
		  }
	});
      
      
//    按讚文章
      $("span.thumbs-up").on("click", function () {
    	  let postno=$("h2.post-title").attr("data-postno");
    	  $.ajax({
    		  url: "${pageContext.request.contextPath}/forum/forumlike.do",          
    		  type: "POST",                  
    		  data: {"action": "likepost",
    			  	 "postno": postno,
    			  	"mbrNo":"${mbrNo}"},
    		  dataType:"json",
    		  success: function(data){      
    		    if(data.status==1){
//     		    	$("this").addClass("-up");
    		        $("span.thumbs-up").addClass("-up");
    		        var likes = parseInt($("span.likecounts").text());
    		        console.log(likes);
    		        $("span.likecounts").text(likes+1);
    		    }else if(data.status==0){
//     		    	$("this").removeClass("-up");
    		        $("span.thumbs-up").removeClass("-up");
    		        var likes = parseInt($("span.likecounts").text());
    		        console.log(likes);
    		        $("span.likecounts").text(likes-1);
    		    }
    		   
    		  }
    	});
    	  
    	
      });
      
//收藏
      $("span.save").on("click", function () {
    	  let postno=$("h2.post-title").attr("data-postno");
    	  $.ajax({
    		  url: "${pageContext.request.contextPath}/forum/savepost.do",          
    		  type: "POST",                  
    		  data: {"action": "savepost",
    			  	 "postno": postno,
    			  	"mbrNo":"${mbrNo}"},
    		  dataType:"json",
    		  success: function(data){      
    		    if(data.status==1){
//     		    	
    		        $("span.save").addClass("-saved");
    		       
    		    }else if(data.status==0){
//     		    	$("this").removeClass("-up");
    		        $("span.save").removeClass("-saved");
    		       
    		    }
    		   
    		  }
    	});
    	  
        
      });

//新增留言
      $("button.submit-comment").on("click", function () {
        let new_comment = $("textarea.new-text").val().trim();
        let postno=$("h2.post-title").attr("data-postno");
//         console.log(postno)
//         console.log(new_comment)
        if (new_comment == "") {
          alert("請輸入留言");
        } else {
        	$.ajax({
        		  url: "${pageContext.request.contextPath}/forum/forumcomment.do",          
        		  type: "POST",                  
        		  data: {"action": "addcomment",
        			  	 "postno": postno,
					     "comment": new_comment,
					     "mbrNo":"${mbrNo}"
					     },                         
        		  success: function(){      
        		    alert("新增成功");
        		    document.location.reload()
        		  }
        	});
        }
      });

      $("textarea.new-text").on("keyup", function (e) {
        if (e.which == 13) {
          $("button.submit-comment").trigger("click");
        }
      });
      
      $("button.filereport").on("click",function(e){
    	  let cmtno = $(this).closest('.modal').find("input.commentNo").val();
    	  let rpttype=$("input[name='report-type']:checked").val();
    	  var rpttext = $(this).closest('.modal-content').find('textarea#additional-message').val();
    	  console.log(rpttext)
    	  $.ajax({
    		  url: "${pageContext.request.contextPath}/forum/forumreport.do",          
    		  type: "POST",                  
    		  data: {"action": "reportcomment",
    			  	 "cmtno": cmtno,
				     "rpttype": rpttype,
				     "rpttext": rpttext,
				     "mbrNo":"${mbrNo}"},                         
    		  success: function(){      
    		    alert("檢舉成功");
    		    $(e.target).closest(".modal").find("input[name='report-type']").prop('checked', false);
    		    $(e.target).closest(".modal").find("textarea").val("");
    		    $(e.target).closest(".modal").modal("hide");
    		  }
    	});
    	  
      })
      
//     按讚留言
      $(document).on("click", "button.like-comment", function () {
    	  let clickedButton = $(this); 
    	  let commentBlock = clickedButton.closest('.single-comment');
    	  let cmtno = commentBlock.find("p.comment-content").data("cmtno");
//     	  console.log(cmtno);
    	  $.ajax({
    		  url: "${pageContext.request.contextPath}/forum/forumlike.do",          
    		  type: "POST",                  
    		  data: {"action": "likecmt",
    			  	 "cmtno": cmtno,
    			  	"mbrNo":"${mbrNo}"},
    		  dataType:"json",
    		  success: function(data){  
    			  if(data.status==1){
    				  clickedButton.addClass("-up");
      		        
      		    }else if(data.status==0){
      		    	clickedButton.removeClass("-up");
      		        
      		    }
    		  }
    	});

      });

//       $(document).on("click", "button.delete-comment", function () {
//         let del = confirm("確認刪除？");
//         if (del) {
//           //this是span.delete-comment
//           $(this)
//             .closest("div.comment-text")
//             .fadeOut(1000, function () {
//               $(this).remove();
//             });
//         }
//       });



    </script>
</body>

</html>