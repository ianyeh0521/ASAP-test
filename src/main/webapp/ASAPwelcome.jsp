<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
      <html lang="en">
      <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no" />
      
      <title>ASAP</title>
      
      <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins');
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        a {
          text-decoration: none;
          color: whitesmoke;
        }

        ul{
          list-style: none;
        }

        .active{
          color: #9dd0f5;
          text-decoration: underline;
          font-weight: bold;
        }
        body, html{
          overflow-x: hidden;
        }

        .navbar{
          position: absolute;
          top: 0;
          left: 0;
          display: flex;
          width: 100%;
          justify-content: space-between;
          padding: 20px;
          color: whitesmoke;
        }
        .nav-links{
          display: flex;
          align-items: center;
        }
        .nav-links li{
          margin: 0 30px;

        }

        header {
          width: 100vw;
          height: 100vh;
          background-image: url('newImg/woman-running3.jpg');
          background-position: bottom;
          background-size: cover;
          display: flex;
          align-items: flex-end;
          justify-content: center;
        }

        .header-content {
          margin-bottom: 150px;
          color: whitesmoke;
          text-align: center;
        }

        .header-content h2{
          font-size: 4vmin;
        }

        .line{
          width: 150px;
          height: 4px;
          background: #70a9d2;
          margin: 10px auto;
          border-radius: 5px;
        }

        .header-content h1{
          font-size: 7vmin;
          margin-top: 50px;
          margin-bottom: 30px;
        }

        .ctn{
          padding: 8px 15px;
          background: #70a9d2;
          border-radius: 30px;
          color: whitesmoke;
        }
        .menu-btn{
          position: absolute;
          top: 30px;
          right: 30px;
          width: 40px;
          cursor: pointer;
          display: none;
        }

        section{
          width: 80%;
          margin: 80px auto;
        }
        .title{
          text-align:center;
          font-size: 4vmin;
          color: #49497e;

        }
        .row{
          display: flex;
          align-items: center;
          width: 100%;
          justify-content: space-between;
          /* background: cyan; */
        }
        .row .col {
          display: flex; 
          flex-direction: column;
          align-items: center;
        } 
        .row .col img{
          width: 80%;
        }
        .events .row{
          margin-top: 50px;
        }
        h4{
          font-size: 3vmin;
          color: #484872;
          margin: 20px auto;
        }
        p{
          color: #7c7c7c;
          padding: 0px 40px;
        }
        .events .ctn{
          margin-top: 30px;
        }

        .explore{
          width: 100%;
          height: 100vh;
          background-image: url('newImg/bg2.png');
          background-position: center;
          background-size: cover;
          background-repeat: no-repeat;
          display: flex;
          align-items: center;
        }
        .explore-content{
          width: 60%;
          padding: 50px;
          color: whitesmoke;
          display: flex;
          align-items: center;
          flex-direction: column;
        }
        .explore-content h1{
            font-size: 7vmin;
        }
        .explore-content .line{
          margin-bottom: 50px;
        }
        .explore-content p{
          color: whitesmoke;
        }
        .explore-content .ctn{
          margin-top: 40px;
        }

        .content-col{
          width: 40%;
        }
        .image-col{
          width: 100%;
        }
       
        .tours .image-gallery{
          display: flex;
          flex-wrap: wrap;
          width: 100%;
          align-items: center;
        }
        .image-gallery img{
          max-width: 250px;
          margin: 10px;
        }
        .content-col h1{
          font-size: 7vmin;
          color: #484872;
        }
        .content-col .line{
          margin-left: -1px;
        }
        .content-col p{
          padding: 0;
          margin: 30px auto;
        }
        .content-col .ctn{
          margin-left: -100px;
        }

        .footer{
          width: 100%;
          min-height: 100px;
          padding: 20px 80px;
          margin: 0;
          background-color: #484872;
          text-align: center;
        }
        .footer p {
          color: whitesmoke;
          margin: 20px auto;
        }


        @media only screen and (max-width:850px){
          .menu-btn{
            display: block;
          }
          .navbar{
            padding:0;
          }
          .logo{
            position: absolute;
            top: 30px;
            left: 30px;
          }
          .nav-links{
            flex-direction: column;
            width: 100%;
            height: 100vh;
            justify-content: center;
            background: #484872;
            margin-top: -1000px;
            transition: all 0.5s ease;
          }
          .mobile-menu{
            margin-top: 0px;
            border-bottom-right-radius: 30%;
          }
          .nav-links li{
            margin: 30px auto;
          }

          .row{
            flex-direction: column;
          }
          .row .col{
            margin: 20px auto;
          }
          .col img {
            max-width: 90%;
          }

          .explore-content{
            width: 100%;
          }
          .tours .col{
            width: 100%;
          }
          .image-gallery{
            justify-content: center;
            align-items: center;
          }
          .image-gallery img{
            width: 90%;
          }
          .footer{
            padding: 10px;
          }
        }

        img{
          transition: transform .3s ease;
        }
        img:hover{
          transform: scale(1.1);
        }
        .ctn:hover{
          background: whitesmoke;
          color: #70a9d2;
          box-shadow: 2px 2px 5px black;

        }
        li:hover{
          color: #70a9d2;
          cursor: pointer;
        }
  

      </style>

      </head>
      
      <body>

        <nav class="navbar">
          <h1 class="logo">
           
          </h1>
          <ul class="nav-links">
            <li class="active"><a href="javascript:void(0)"></a>Home</li>
            <li><a href="${pageContext.request.contextPath}/member/MemberLogin.jsp">會員登入</a></li>
            <li><a href="${pageContext.request.contextPath}/coach/CoachLogin.jsp">教練登入</a></li>
          </ul>
          <img src="<%=request.getContextPath()%>/newImg/menu-btn.png" alt="" class="menu-btn">
        </nav>
        
        <header>
          <div class="header-content">
            <h2> <img src="<%=request.getContextPath()%>/newImg/logo3.png" style="max-width: 200px; height: auto; vertical-align: middle; border-style: none;"></h2>
            <div class="line"></div>
            <h1>Find the Boundaries. Push Through!</h1>
            <a href="${pageContext.request.contextPath}/member/MemberLogin.jsp" class="ctn">了解更多</a>
          </div>
        </header>
        
        <section class="events">
          <div class="title">
            <h1>會員制度</h1>
            <div class="line"></div>
          </div>
          <div class="row">
            <div class="col">
              <img src="<%=request.getContextPath()%>/newImg/member.jpg" alt="">
              <h4>一般會員</h4>
              <p>能在平台上使用多種功能，包括二手商城買賣、尋找場地租借、揪團、預約課程以及參與論壇討論。</p>
              <a href="${pageContext.request.contextPath}/member/MemberLogin.jsp" class="ctn">了解更多</a>
            </div>
            <div class="col">
              <img src="<%=request.getContextPath()%>/newImg/coach1.jpg" alt="">
              <h4>教練會員</h4>
              <p>教練會員負責提供專業的運動課程，分享專業知識和技能，可以在平台上開設課程同時管理會員預約。</p>
              <a href="${pageContext.request.contextPath}/coach/CoachLogin.jsp" class="ctn">了解更多</a>
            </div>
          </div>
        </section>

        <section class="explore">
          <div class="explore-content">
            <h1>關於ASAP</h1>
            <div class="line"></div>
            <p>你是否曾經想要開始運動，但卻不知道從何著手？</p>
            <br>
            <p>或者是渴望找到夥伴一同挑戰的運動愛好者？</p>
            <br>
            <p>這裡，是一個充滿活力、毫無壓力、滿載支援的據點！</p>
            <br>
            <p>在這裡，運動不再是孤單的旅程，而是一場熱情洋溢、充滿歡笑的社交饗宴。</p>
            <a href="${pageContext.request.contextPath}/member/MemberLogin.jsp" class="ctn">了解更多</a>
          </div>
        </section>

        <section class="tours">
          <div class="row">
            <div class="col content-col">
              <h1>快加入我們！</h1>
              <div class="line"></div>
              <p style="margin:13px">新手踏入運動領域 ➪ 論壇分享心得</p>
              <p style="margin:13px">需專業引導、建立習慣 ➪ 教練課程</p>
              <p style="margin:13px">社交支持、增添運動樂趣 ➪ 揪團</p>
              <p style="margin:13px">找到合適環境 ➪ 搜尋場地</p>
              <p style="margin:13px">節省開支輕鬆入門 ➪ 二手商品買賣</p>
              <a href="${pageContext.request.contextPath}/member/MemberLogin.jsp" class="ctn">了解更多</a>
            </div>
            <div class="col image-col">
              <div class="image-gallery">
                <img src="<%=request.getContextPath()%>/newImg/coach2.jpg" alt="">
                <img src="<%=request.getContextPath()%>/newImg/forum1.png" alt="">
                <img src="<%=request.getContextPath()%>/newImg/shop4.png" alt="" >
                <img src="<%=request.getContextPath()%>/newImg/gym2.jpg" alt="">
               
              </div>
            </div>
          </div>
        </section>

        <section class="footer">
          <p>5F., No. 219, Sec. 3, Nanjing E. Rd., Zhongshan Dist., Taipei City 104, Taiwan (R.O.C.) | Phone:(02) 2712-0589 | Email:business@tibame.com</p>
          <p>© Tibame. 2023. All Rights Reserved</p>
        </section>

        
       




      
        <!-- Plugins JS File -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>
      	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/jquery.countTo.js"></script>
        <!-- Main JS File -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

        <script>
          const menuBtn = document.querySelector('.menu-btn');
          const navlinks = document.querySelector('.nav-links');

          menuBtn.addEventListener('click',()=>{
            navlinks.classList.toggle('mobile-menu');
          })
        </script>

      </body>
      </html>

      <!-- End .main -->

  </body>
</html>
