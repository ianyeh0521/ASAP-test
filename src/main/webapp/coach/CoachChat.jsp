<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.asap.coach.entity.*"%>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>ASAP</title>


<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/assets/images/icons/favicon.png" />


<!-- Plugins CSS File -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- Main CSS File -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/style.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/vendor/simple-line-icons/css/simple-line-icons.min.css" />
<style>
      .scrollbar {
        &::-webkit-scrollbar {
          width: 10px;
        }
        &::-webkit-scrollbar-track {
          background-color: lightgray;
          border-radius: 25px;
        }
        &::-webkit-scrollbar-thumb {
          border-radius: 25px;
          background-color: gray;
        }
      }

      .dialogue {
        width: 100%;
        padding: 20px;
        box-shadow: 0 0 10px #000;
        background-color: #f4f5f7;
        border-radius: 5px;
        overflow: scroll;
        overflow-y: scroll;
        overflow-x: hidden;
      }
      .user {
        display: flex;
        align-items: flex-start;
        margin-bottom: 20px;
        .avatar {
          width: 60px;
          text-align: center;
          flex-shrink: 0;
        }
        .pic {
          border-radius: 50%;
          overflow: hidden;
          border: 2px solid lightgrey;
          background-color: white;
          img {
            width: 100%;
            vertical-align: middle;
          }
        }
        .name {
          color: #333;
          word-wrap: break-word;
        }
        .text {
          background-color: #aaa;
          padding: 16px;
          border-radius: 10px;
          position: relative;
        }
      }
      .remote {
        .text {
          margin-left: 20px;
          margin-right: 80px;
          color: #eee;
          background-color: #4179f1;
          &::before {
            border-right: 10px solid #4179f1;
            left: -10px;
          }
        }
      }
      .local {
        justify-content: flex-end;
        .text {
          margin-right: 20px;
          margin-left: 80px;
          order: -1;
          background-color: #fff;
          color: #333;
          &::before {
            border-left: 10px solid #fff;
            right: -10px;
          }
        }
      }
      .remote,
      .local {
        & .text::before {
          content: "";
          position: absolute;
          top: 20px;
          border-top: 10px solid transparent;
          border-bottom: 10px solid transparent;
        }
        .text {
          font-weight: 300;
          box-shadow: 0 0 10px #888;
        }
      }

      span{
        display: block;
        margin: 0px;
        color: #000;
        font-size: 12px;
      }
      
      .online {
        width: 100%;
        height: 50px;
        border-radius: 5px;
        background-color: #cdcdcd;
        color: #000;
        margin: 5px 0;
        padding: 15px;
      }
    </style>


</head>

<body onload="connect();" onunload="disconnect();">
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
						<a href="${pageContext.request.contextPath}/coach/CoachHome.jsp" style="width: 222; height: 88;"> <img
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
						<c:if test="${coachVo.coachStat}">
							<li><a href="${pageContext.request.contextPath}/course/listAllCourses_datatable.jsp">課程管理</a></li>
						</c:if>
						<li><a href="${pageContext.request.contextPath}/coach/CoachChat.jsp">客服</a></li>
						<li><a><form action="${pageContext.request.contextPath}/CoachController" method="post" style="margin: 0px;"><button type="submit" style="border:0px; background-color:white;">登出</button><input type="hidden" name="action" value="logout"/></form></a></li>	
						</ul>
					</nav>
				</div>
				<!-- End .container -->
			</div>
			<!-- End .header-bottom -->
		</header>
		<!-- End .header -->

		<main class="main">
        <div
          class="container contact-us-container"
          style="display: flex; justify-content: center"
        >
          <!--列表-->
<!--           <div -->
<!--           class="scrollbar" -->
<!--             style=" -->
<!-- /*               height: 400px; */ -->
<!-- /*               width: 200px; */ -->
<!-- /*               overflow: scroll; */ -->
<!-- /*               border-radius: 5px; */ -->
<!-- /*               border: #000 solid 2px; */ -->
<!-- /*               padding: 5px; */ -->
<!-- /*               margin:70px 5px 0px 10px; */ -->
<!-- /*               overflow-y: scroll; */ -->
<!-- /*               overflow-x: hidden; */ -->
<!-- /*             " */ -->
<!--             id="row" -->
<!--           > -->
<!--             <div class="online">aaaaaa</div> -->
<!--           </div> -->
          <div
            class="col-lg-6"
            style="
              box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px,
                rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
              margin: 40px auto;
            "
          >
            <div style="margin: 10px 5px">
              <div style="text-align: center; margin: 20px auto 10px auto">
                <h2 id="statusOutput" class="statusOutput">客服</h2>
              </div>

              <div
                 id="messagesArea"
                style="display: flex; justify-content: center; height: 400px"
              >
<!--                 <div id="area" class="dialogue scrollbar"> -->
<!--                   <div class="user remote"> -->
<!--                     <div class="avatar"> -->
<!--                       <div class="pic"> -->
<!--                         <img src="https://picsum.photos/100/100?random=12" /> -->
<!--                       </div> -->
<!--                       <div class="name">You</div> -->
                      
<!--                     </div> -->
                   
<!--                     <div class="text">這是妳的對話文字 <span >10:30</span></div> -->
                    
<!--                   </div> -->

<!--                   <div class="user local"> -->
                   
<!--                     <div class="avatar"> -->
<!--                       <div class="pic"> -->
<!--                         <img src="https://picsum.photos/100/100?random=16" /> -->
<!--                       </div> -->
<!--                       <div class="name">Me</div> -->
                      
<!--                     </div> -->
                    
<!--                     <div class="text">這是我的對話文字<span >10:30</span></div> -->
                    
<!--                   </div> -->

<!--                   <div class="user local"> -->
<!--                     <div class="avatar"> -->
<!--                       <div class="pic"> -->
<!--                         <img src="https://picsum.photos/100/100?random=16" /> -->
<!--                       </div> -->
<!--                       <div class="name">Me</div> -->
<!--                     </div> -->
<!--                     <div class="text">這是我的對話文字</div> -->
<!--                   </div> -->

<!--                   <div class="user local"> -->
<!--                     <div class="avatar"> -->
<!--                       <div class="pic"> -->
<!--                         <img src="https://picsum.photos/100/100?random=16" /> -->
<!--                       </div> -->
<!--                       <div class="name">Me</div> -->
<!--                     </div> -->
<!--                     <div class="text">這是我的對話文字</div> -->
<!--                   </div> -->

<!--                   <div class="user local"> -->
<!--                     <div class="avatar"> -->
<!--                       <div class="pic"> -->
<!--                         <img src="https://picsum.photos/100/100?random=16" /> -->
<!--                       </div> -->
<!--                       <div class="name">Me</div> -->
<!--                     </div> -->
<!--                     <div class="text">這是我的對話文字</div> -->
<!--                   </div> -->
<!--                 </div> -->
              </div>

              <div
                id="panel"
                style="
                  display: flex;
                  margin-top: 10px;
                  justify-content: space-between;
                "
              >
                <input
                  type="text"
                 onkeydown="if (event.keyCode == 13) sendMessage();"
                  id="message"
                  placeholder="輸入訊息"
                  style="width: 75%; border: #000 solid 1px; border-radius: 5px"
                />
                <button
                  style="width: 20%; border-radius: 5px; border: 0px"
                  id="sendMessage"
                  onclick="sendMessage();"
                >
                  送出
                </button>
              </div>
            </div>
            <!-- </div> -->
          </div>
        </div>

        <div class="mb-8"></div>
      </main>
		<!-- End .main -->

		<footer class="footer bg-dark">
			<div class="footer-middle">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-sm-6">
							<div class="widget">
								<h4 class="widget-title">Contact Info</h4>
								<ul class="contact-info">
									<li><span class="contact-info-label">Address:</span>5F.,
										No. 219, Sec. 3, Nanjing E. Rd., Zhongshan Dist., Taipei City
										104, Taiwan (R.O.C.)</li>
									<li><span class="contact-info-label">Phone:</span><a
										href="tel:">(02) 2712-0589</a></li>
									<li><span class="contact-info-label">Email:</span> <a
										href="mailto:mail@example.com">business@tibame.com</a></li>
									<li><span class="contact-info-label">Working
											Days/Hours:</span> Mon - Sun / 8:00 AM - 9:30 PM</li>
								</ul>
								<div class="social-icons">
									<a href="#" class="social-icon social-facebook icon-facebook"
										target="_blank" title="Facebook"></a> <a href="#"
										class="social-icon social-twitter icon-twitter"
										target="_blank" title="Twitter"></a> <a href="#"
										class="social-icon social-instagram icon-instagram"
										target="_blank" title="Instagram"></a>
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
									<li><a>Account</a></li>
									<li><a>Course</a></li>
									<li><a>Forum</a></li>
									<li><a>Group</a></li>
									<li><a>Court</a></li>
									<li><a>Seller</a></li>
									<li><a>Mall</a></li>
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
							<span class="footer-copyright">© Tibame. 2023. All Rights
								Reserved</span>
						</div>
					</div>
				</div>
				<!-- End .footer-bottom -->
			</div>
			<!-- End .container -->
		</footer>
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
	<div class="mobile-menu-container">
	  <div class="mobile-menu-wrapper">
            <span class="mobile-menu-close"><i class="fa fa-times"></i></span>
            <nav class="mobile-nav">
              <ul class="mobile-menu">
                <li><a href="${pageContext.request.contextPath}/coach/CoachHome.jsp">首頁</a></li>
                <li><a href="${pageContext.request.contextPath}/coach/CoachChat.jsp">客服</a></li>
                <c:if test="${coachVo.coachStat}">
				<li><a href="${pageContext.request.contextPath}/course/listAllCourses_datatable.jsp">課程管理</a></li>
				</c:if>
              </ul>
            </nav>
            <!-- End .mobile-nav -->
          </div>
          <!-- End .mobile-menu-wrapper -->
	</div>
	<!-- End .mobile-menu-container -->

<!-- 	<div class="sticky-navbar"></div> -->

	<a id="scroll-top" href="#top" title="Top" role="button"><i
		class="icon-angle-up"></i></a>

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
		var MyPoint = "/CustomerSvc/${coachVo.coachNo}";
		var host = window.location.host;
		var path = window.location.pathname;
		var webCtx = path.substring(0, path.indexOf('/', 1));
		var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	
// 		var statusOutput = document.getElementById("statusOutput");
		var messagesArea = document.getElementById("messagesArea");
		var self = "${coachVo.coachName}";
		var webSocket;
	
		function connect(){
			// create a websocket
			webSocket = new WebSocket(endPointURL);
	
			webSocket.onopen = function(event) {
				console.log("Connect Success!");
				document.getElementById('sendMessage').disabled = false;
				var jsonObj = {
						"type" : "history",
						"sender" : self,
						"receiver" : "customerService",
						"message" : ""
					};
				webSocket.send(JSON.stringify(jsonObj));
			};
	
			webSocket.onmessage = function(event) {
				
				var jsonObj = JSON.parse(event.data);
				
				if ("history" === jsonObj.type) {
					messagesArea.innerHTML = '';
					var div = document.createElement('div');
					div.id = "area";
					div.className += 'dialogue'; 
					div.className += ' scrollbar'; 
					messagesArea.appendChild(div);
					// 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
					var messages = JSON.parse(jsonObj.message);
					for (var i = 0; i < messages.length; i++) {
						var historyData = JSON.parse(messages[i]);
						var showMsg = historyData.message;
						var div_el = document.createElement('div');
						div_el.className = 'user ';
						// 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
						var img;
						var showname;
					    var name = historyData.sender;
					    if(name === self){
							div_el.className += 'local';
							showname = "教練" + "${coachVo.coachName}";
							img = "user";
						}else{
							div_el.className += 'remote';
							showname = "客服人員"
							img = "chatlogo";
						};

						div_el.innerHTML = '<div class="avatar"><div class="pic"><img src="${pageContext.request.contextPath}/newImg/'+img+'.png"/></div><div class="name">'+showname+'</div></div><div class="text">'+showMsg.slice(0,-16)+'<span>'+showMsg.slice(-16)+'</span></div>';
	                    
						div.appendChild(div_el);
					}
					messagesArea.scrollTop = messagesArea.scrollHeight;
				} else if ("chat" === jsonObj.type) {
					var div_el = document.createElement('div');
					div_el.className = 'user ';
					
					var img;
					var showname;
//	 				var time = jsonObj.msgDateStr;
					var name = jsonObj.sender;
					if(name === self){
						div_el.className += 'local';
						showname = "教練" + "${coachVo.coachName}";
						img = "user";
					}else{
						div_el.className += 'remote';
						showname = "客服人員"
						img = "chatlogo";
					};
					
		
					div_el.innerHTML = '<div class="avatar"><div class="pic"><img src="${pageContext.request.contextPath}/newImg/'+img+'.png"/></div><div class="name">'+showname+'</div></div><div class="text">'+jsonObj.message.slice(0,-16)+'<span>'+jsonObj.message.slice(-16)+'</span></div>';
	                    
					console.log(div_el);
					
					document.getElementById("area").appendChild(div_el);
					
					messagesArea.scrollTop = messagesArea.scrollHeight;
				} 
				
			};
	
			webSocket.onclose = function(event) {
				console.log("Disconnected!");
			};
		}
		
		function sendMessage() {
			var inputMessage = document.getElementById("message");
			var friend = "customerService";
			var message = inputMessage.value.trim();
	
			if (message === "") {
				alert("請輸入內容。");
				inputMessage.focus();
			}  else {
				var msgAddTime = message + formatDate(new Date());
				var jsonObj = {
					"type" : "chat",
					"sender" : self,
					"receiver" : friend,
					"message" : msgAddTime
				};
				webSocket.send(JSON.stringify(jsonObj));
				inputMessage.value = "";
				inputMessage.focus();
			}
		}
		
		// 有好友上線或離線就更新列表
// 		function refreshFriendList(jsonObj) {
// 			var friends = jsonObj.users;
// 			var row = document.getElementById("row");
// 			row.innerHTML = '';
// 			for (var i = 0; i < friends.length; i++) {
// 				if (friends[i] === self) { continue; }
// 				row.innerHTML +='<div id=' + i + ' class="online" name="friendName" value=' + friends[i] + ' >' + friends[i] + '</div>';
// 			}
// 			addListener();
// 		}
		// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
// 		function addListener() {
// 			var container = document.getElementById("row");
// 			container.addEventListener("click", function(e) {
// 				var friend = e.srcElement.textContent;
// 				updateFriendName(friend);
// 				var jsonObj = {
// 						"type" : "history",
// 						"sender" : self,
// 						"receiver" : friend,
// 						"message" : ""
// 					};
// 				webSocket.send(JSON.stringify(jsonObj));
// 			});
// 		}
		
		function disconnect() {
			webSocket.close();
			document.getElementById('sendMessage').disabled = true;
		
		}
		
		function updateFriendName(name) {
			statusOutput.innerHTML = name;
		}
		
		 function padTo2Digits(num) {
		        return num.toString().padStart(2, "0");
		      }

		      function formatDate(date) {
		        return (
		          [
		            date.getFullYear(),
		            padTo2Digits(date.getMonth() + 1),
		            padTo2Digits(date.getDate()),
		          ].join("-") +
		          " " +
		          [
		            padTo2Digits(date.getHours()),
		            padTo2Digits(date.getMinutes()),
		          ].join(":")
		        );
		      }
		
// 		function updateFriendName(name) {
// 			statusOutput.innerHTML = name;
// 		}
	</script>
</body>
</html>
