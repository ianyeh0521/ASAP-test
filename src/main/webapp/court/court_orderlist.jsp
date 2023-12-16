<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@ page import="com.asap.util.*"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>場地-我的預約</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/images/icons/favicon.png">
    <link
          rel="stylesheet"
          href="https://unpkg.com/purecss@2.0.6/build/pure-min.css"
          integrity="sha384-Uu6IeWbM+gzNVXJcM9XV3SohHtmWE+3VGi496jvgX1jyvDTXfdK+rfZc8C1Aehk5"
          crossorigin="anonymous"
    />

    <script>
        WebFontConfig = {
            google: { families: [ 'Open+Sans:300,400,600,700,800', 'Poppins:300,400,500,600,700', 'Shadows+Into+Light:400' ] }
        };
        ( function ( d ) {
            var wf = d.createElement( 'script' ), s = d.scripts[ 0 ];
            wf.src = '${pageContext.request.contextPath}/assets/js/webfont.js';
            wf.async = true;
            s.parentNode.insertBefore( wf, s );
        } )( document );
    </script>

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>

    <!-- Main CSS File -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/vendor/fontawesome-free/css/all.min.css"/>

    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    
    <!-- Include Moment.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    
    <!-- datatable用 -->
    <link
    rel="stylesheet"
    type="text/css"
    href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"
    />

    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
    <script>
    $(document).ready(function () {
       
      });
    </script>
    <style>
        #fs_alert1 {
        width: 100vw;
        height: 100vh;
        position: fixed;
        top: 0;
        /* display: block; */
        display: none;
        z-index: 999;
      }
      #fs_alert2 {
        width: 100vw;
        height: 100vh;
        position: fixed;
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
        top: 150px;
        left: 0;
        right: 0;
        margin: auto;
        z-index: 2;
        border-radius: 6px;
        text-align: center;
      }

      .fs_alert_title {
        font-size: 24px;
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
      #alert_ok1 {
        margin: 20px auto 45px auto;
      }
      #alert_ok2 {
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
            background-color: rgb(218, 28, 15);
            margin: 10px;
        }

        .btn_s:hover {
            background-color: rgb(117, 29, 18)
        }

      .btn_s2 {
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

        .btn_s2:hover {
            background-color: rgb(76, 139, 150)
        }

      th.dt-center, td.dt-center {
         text-align: center; 
      }
      
      #table_id tbody tr:hover {
	    cursor: pointer;
	  }
    </style>
</head>

<body>
    <div class="page-wrapper">
        <header class="header">
        </header><!-- End .header -->

        <main class="main">
            <!-- 小標+按鈕 -->
            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
                <nav aria-label="breadcrumb" class="breadcrumb-nav">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="court_main.jsp"><i class="icon-home"></i></a></li>
                    <li class="breadcrumb-item"><a href="">我的預約</a></li>
                  </ol>
                </nav>
                <button class="btn btn-primary btn-rounded btn-md"><a href="#"></a>地圖搜尋</button>
                <a href="${pageContext.request.contextPath}/court/court_savelist.jsp"><button class="btn btn-primary btn-rounded btn-md">我的收藏</button></a>                        
            </div>  
            
              <!-- 彈窗 -->
              <div id="fs_alert1">
                <div class="fs_alert_bg"></div>
                <div class="fs_alert_show">
                  <!-- <form action="" method="post"> -->
                  <div class="fs_alert_title">確定要取消此筆訂單？</div>
                  <div class="fs_alert_txt">取消後將在 2~7 個工作天退款至原信用卡帳戶</div>
                  <div class="btn_s" id="alert_ok1">確認</div>
                  <!-- <input type="hidden" name="" value=""/> -->
                <!-- </form> -->
                </div>
              </div>

              <div id="fs_alert2">
                <div class="fs_alert_bg"></div>
                <div class="fs_alert_show">
                  <!-- <form action="" method="post"> -->
                  <div class="fs_alert_title">取消成功</div>
                  <!-- <div class="fs_alert_txt"></div> -->
                  <div class="btn_s2" id="alert_ok2">返回</div>
                  <!-- <input type="hidden" name="" value=""/> -->
                <!-- </form> -->
                </div>
              </div>

        
      		<!-- Datatable -->	
              <div class="container login-container">
                <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
                  <table id="table_id" class="display" style="width: 100%">
                    <thead>
                      <tr>
                        <!-- 欄位標題 可以調整欄位數量但標題和內容要一起-->
                        <th ></th>
                        <th >場地名稱</th>
                        <th >地址</th>
                        <th >預約日期</th>
                        <th >預約時段</th>	<!-- 先暫訂起始時間，再調整 -->
                        <th >總金額</th>
<!--                         <th >查看地點</th> -->
                        <th >取消預約</th>
                      </tr>
                    </thead>
                    <tbody>
                       <!-- 欄位內容 可以調整欄位數量但標題和內容要一起 也可以在欄位中加入需要的標籤img、buttom-->
                      <!-- 這裡轉成jsp時可用c:forEach方法 -->
                      <tr>
              
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
              
                

            
        </main><!-- End .main -->

        <footer class="footer bg-dark"></footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->

    <div class="loading-overlay">
        <div class="bounce-loader">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div class="mobile-menu-overlay"></div><!-- End .mobil-menu-overlay -->

    <div class="mobile-menu-container"></div><!-- End .mobile-menu-container -->

    <div class="sticky-navbar"></div>



    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.min.js"></script>

    <!-- header and footer template -->
    <script>
		$("header").load("header.html");
		$("footer").load("footer.html");
		$("div.sticky-navbar").load("sticky-navbar.html");
		$("div.mobile-menu-container").load("mobile-menu-container.html");
        $(window).on("load", function(){
        	 $.ajax({
                 type: "POST",
                 url: 'courtOrderListAjax.do',
                 contentType: 'application/json',
                 dataType: 'json',
                 data: JSON.stringify({
                     action: "getByMember",
                     mbrNo: "M1206202300001"	// 記得更動
                 }),
                 success: function(response){
                 	var courtOrderList = JSON.parse(response.courtOrderList);
                 	var orderImgList = JSON.parse(response.orderImgList);
                 	console.log(courtOrderList);
                 	console.log(orderImgList);
                 	console.log(courtOrderList[2]);
                 	
                 	let img = "img";
                 	for(let i = 0; i < courtOrderList.length; i++){
                 		courtOrderList[i][img] = 'data:image/jpg;base64,'+ orderImgList[i];
                 	}
                 	console.log(courtOrderList);
                
                 	 $("#table_id").DataTable({
                 		 aaData: courtOrderList,
                 		 "scrollX": true,
                 		 "scrollY": true,
                 		 "language": {url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json"},
                          "columnDefs": [
                              {"className": "dt-center", "targets": "_all"}
                          ],
                          "lengthMenu": [
                              [5, 10, 25, -1], // 定義每頁顯示筆數選項
                              ['5', '10', '25', '所有'] // 定義每頁顯示筆數選項文字
                          ],
                 		 columns:[
                			 	{
                                 "data": "img",
                                 "render": function (data, type, row) {
                                     return '<img src="' + data + '" alt="圖片" style="width:90px;height:90px; border-radius: 5px">';
                                 }
                             },
                          	
                            {"data": "courtVO.courtName"},
                          	{"data": "courtVO.courtAddress"},
                          	{
                                "data": "courtOrdDate",
                                "render": function (data, type, row) {
                                    // Assuming the date format is "12 月 15 , 2023"
                                    var formattedDate = moment(data, "MM 月 DD , YYYY").format("YYYY 年 MM 月 DD 日");
                                    return formattedDate;
                                }
                            },
                          	{
                                "data": null,
                                "render": function (data, type, row) {
                                    return row.courtOrdTime + ':00 ~ ' + row.courtOrdTimeEnd + ':00';
                                }
                            },
                          	{"data": "totalPrice"},
     
                             {
                                 "data": "courtOrdNo",
                                 "render": function(data, type, row) {
                                      return '<button type="button" class="btn btn-danger btn-sm lookup" style="border-radius:5px" data-id="' + data + '">取消</button>';
                                 }
                             }
                          ],
                          
                          "createdRow": function(row, data, dataIndex) {
                              $(row).attr('id', data.courtOrdNo);
                           		
                              // 點擊整列可以查看該場地資訊
                              $(row).on('click', function() {
                                  var courtNo = data.courtVO.courtNo;

                                  window.location.href = '/ASAP/court/court_page.jsp?courtNo=' + courtNo;
                              });
                              
                              // 點擊取消訂單
                              $(row).find('.lookup').on('click', function(event) {
                                  event.stopPropagation();
                              
	                            	var clickedId = $(this).data('id');
	                            	handleClickedId(clickedId);
	                            	$("#fs_alert1").css("display", "block")
                            	
                              });
                          
                          
                          }
                 	 });
                 	 
                 	
                 	 
                 },
                 error:function(xhr){
                 	console.log(xhr);
                 }
              });
           
             
            
        })
        
        $(document).mouseup(function(e) {
		    var fsAlert1 = $("#fs_alert1");
		    var fsAlertShow = $(".fs_alert_show");
		
		    if (!fsAlertShow.is(e.target) && fsAlertShow.has(e.target).length === 0) {
		        fsAlert1.css("display", "none");
		    }
		});
        
        function handleClickedId(clickedId){
        	var clickedId = clickedId.toString();
        	console.log(typeof(clickedId));
        	$("#alert_ok1").on("click", function(e){
	             e.stopPropagation();
	             $.ajax({
	    	           url: 'courtOrderListAjax.do', 
	    	           type: 'POST',
	    	           contentType: 'application/json',
	    	           data: JSON.stringify({
	    	               action: "cancel",
	    	               mbrNo: "M1206202300001",	
	    	               courtOrdNo: clickedId
	    	           }),
	    	           success: function(response) {
	    	               console.log('Server response:', response);
	    	           },
	    	           error: function() {
	    	               console.log('Error in AJAX request');
	    	           }
	    	    });
	            
	             
	            $('#' + clickedId).fadeOut(500, function(){
		            $('#' + clickedId).remove();
	            });
	            	
	            $("#fs_alert1").css("display", "none");
	              setTimeout(openDelete, 500);
	        })
	
            $("#alert_ok2").on("click", function(){
              $("#fs_alert2").css("display", "none");
            })

            function openDelete(){
                $("#fs_alert2").css("display", "block");
            }
       }
        
        
     	// 記得前一頁的位置
        var scrollPosition = window.scrollY || document.documentElement.scrollTop;
        history.replaceState({ scrollPosition: scrollPosition }, document.title, window.location.href);


        // 儲存前一頁位置
        document.addEventListener('DOMContentLoaded', function() {
            var savedState = history.state;
            if (savedState && typeof savedState.scrollPosition !== 'undefined') {
                window.scrollTo(0, savedState.scrollPosition);
            }
        });

            
    
        
	</script>
</body>

</html>