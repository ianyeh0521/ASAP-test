<%@page import="com.asap.court.entity.CourtClosedTimeVO"%>
<%@page import="com.asap.court.service.CourtClosedTimeService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.asap.court.*"%>
<%@page import="com.asap.court.entity.CourtVO"%>
<%@page import="com.asap.court.service.CourtService_interface"%>
<%@page import="com.asap.court.service.CourtService"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	Integer courtNoToSetTime = Integer.valueOf(request.getParameter("courtNo"));
	System.out.print(courtNoToSetTime);
	pageContext.setAttribute("courtNoToSetTime", courtNoToSetTime);
	CourtClosedTimeService closedTimeWithCourtNo = new CourtClosedTimeService();
	
	List<CourtClosedTimeVO> timeList = closedTimeWithCourtNo.findByCourtNo(courtNoToSetTime);
	pageContext.setAttribute("timeList",timeList);
%>

    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
        />
    
        <title>���a��x-���a���}��ɶ�-datatable</title>
    
        <meta name="keywords" content="HTML5 Template" />
        <meta name="description" content="Porto - Bootstrap eCommerce Template" />
        <meta name="author" content="SW-THEMES" />
    
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="/ASAP/assets/images/icons/favicon.png" />
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
            wf.src = "/ASAP/assets/js/webfont.js";
            wf.async = true;
            s.parentNode.insertBefore(wf, s);
          })(document);
        </script>
    
        <!-- Plugins CSS File -->
        <link
          rel="stylesheet"
          type="text/css"
          href="/ASAP/assets/css/bootstrap.min.css"
        />
    
        <!-- Main CSS File -->
        <link rel="stylesheet" type="text/css" href="/ASAP/assets/css/style.min.css" />
        <link
          rel="stylesheet"
          type="text/css"
          href="/ASAP/assets/vendor/fontawesome-free/css/all.min.css"
        />
        <script src="/ASAP/assets/js/jquery.min.js"></script>
        <!--�o�̧�jquery���W��-->
        <!-- datatable�� -->
        <link
          rel="stylesheet"
          type="text/css"
          href="https://cdn.datatables.net/1.13.7/css/jquery.dataTables.css"
        />
    
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.js"></script>
        <script>
          $(document).ready(function () {
            $("#table_id").DataTable({
            	"scrollX": true,
            	"scrollY": true,
            	"columnDefs": [
                    {"className": "dt-center", "targets": "_all"}
                ],
              language: {
                url: "https://cdn.datatables.net/plug-ins/1.11.3/i18n/zh_Hant.json",
              }
            });
          });
        </script>
       
      </head>
    
      <body>
        <div class="page-wrapper">
          <header class="header"></header>
          <!-- End .header -->
    
          <main class="main">
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="listAllCourts_datatable_Ajax.html">�Ҧ����a</a></li>
                                <li class="breadcrumb-item active" aria-current="page">���}��ɶ�</li>
                            </ol>
                        </div>
                    </nav>
                    <h1>���}��ɶ�</h1>
                </div>
            </div>
            
            <div class="container" style="margin-top: 20px; margin-bottom: 20px !important; text-align: right !important;">
			    <!-- ���÷s�W�ɶ��϶� -->
<%-- 			    <form action="<%=request.getContextPath()%>/court/courtClosedTime.do" method="post"> --%>
			    	<input id ="courtNo" type="hidden" name="courtNo" type="text" value="${courtNoToSetTime}"/>
			        <div id="buttonContainer" style="position: relative;">
			            <div id="hiddenBlock" style="display: none; position: absolute; top: 0; margin-left: 800px;">
			                <table>
			                    <tr>
			                        <td>���:</td>
			                        <td><input name="closedDate" id="f_date1" type="text"></td>
			                    </tr>
			                    <tr>
			                        <td>�ɶ�:<font color=red><b>*</b></font></td>
			                        <td>
			                            <select size="1" name="closedTime">
			                                <option value="8" 'selected' >8
											<option value="9">9
											<option value="10">10
											<option value="11">11
											<option value="12">12
											<option value="13">13
											<option value="14">14
											<option value="15">15
											<option value="16">16
											<option value="17">17
											<option value="18">18
											<option value="19">19
											<option value="20">20		
			                            </select>
			                        </td>
			                    </tr>
			                </table>
			            </div>
			            <button id="addTimeButton" type="button" onclick="toggleBlock()" class="btn btn-primary btn-rounded btn-md">�s�W�ɶ�</button>
			            <button id="submitButton" type="submit" class="btn btn-primary btn-rounded btn-md" style="display: none;">�s�W
			            <input type="hidden" name="action" value="insert">
			            </button>
			            <button type="button" onclick="cancelForm()" class="btn btn-danger btn-rounded btn-md" style="display: none;">����</button>
			        </div>
<!-- 			    </form> -->
			    <!-- ���÷s�W�ɶ��϶����� -->
			</div>
         
    
            <div class="container login-container">
              <div style="margin: 20px 10px ;border-radius: 10px;padding: 20px; box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px, rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;;">
                <table id="table_id" class="display" width="100%" >
                  <thead>
                    <tr>
                      <!-- �����D �i�H�վ����ƶq�����D�M���e�n�@�_-->
                      <th >�s��</th>
                      <th >���a�s��</th>
                      <th >���}����</th>
                      <th >���}��ɶ�</th>
                      <th >�R��</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="timeVO" items="${timeList}">
                    <tr class="lookup" class="${timeVO.courtClosedTimeNo}" style="text-align: center !important">        
	                    <td>${timeVO.courtClosedTimeNo}</td>
	                    <td>${timeVO.courtVO.courtNo}</td>
	                    <td>${timeVO.courtClosedDate}</td>
	                    <td>${timeVO.courtClosedTime}</td> 
                        <td>
	                        <FORM METHOD="post" ACTION="${pageContext.request.contextPath}/court/courtClosedTime.do" style="margin-bottom: 0px;">
								<button type="submit" class="btn btn-danger btn-sm" style="border-radius:5px" >�R��</button>			                   
								<input type="hidden" name="courtNo"  value="${timeVO.courtVO.courtNo}">
								<input type="hidden" name="closedDate"  value="${timeVO.courtClosedDate}">
								<input type="hidden" name="closedTime"  value="${timeVO.courtClosedTime}">
			                    <input type="hidden" name="action" value="delete">
	                        </FORM>
                        </td>
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
    
        <script src="/ASAP/assets/js/bootstrap.bundle.min.js"></script>
        <script src="/ASAP/assets/js/plugins.min.js"></script>
    
        <!-- Main JS File -->
        <script src="/ASAP/assets/js/main.min.js"></script>

       
    
        <script>
          $("header").load("backstage_header.html");
          $("div.sticky-navbar").load("sticky-navbar.html");
          $("div.mobile-menu-container").load("mobile-menu-container.html");
          $("footer").load("footer.html");
          
          function toggleBlock() {
              var buttonContainer = document.getElementById('buttonContainer');
              var hiddenBlock = document.getElementById('hiddenBlock');
              var submitButton = document.getElementById('submitButton');

              if (hiddenBlock.style.display === 'none') {
                  // Show hidden block to the left of the button
                  hiddenBlock.style.display = 'block';
                  hiddenBlock.style.float = 'left';

                  // Change the "�s�W�ɶ�" button to "�s�W"
                  buttonContainer.querySelector('[onclick="toggleBlock()"]').style.display = 'none';
                  submitButton.style.display = 'inline-block';

                  // Show the "����" button
                  buttonContainer.querySelector('[onclick="cancelForm()"]').style.display = 'inline-block';
              } else {
                  // Hide the hidden block
                  hiddenBlock.style.display = 'none';

                  // Change the "�s�W" button back to "�s�W�ɶ�"
                  buttonContainer.querySelector('[onclick="toggleBlock()"]').style.display = 'inline-block';
                  submitButton.style.display = 'none';

                  // Hide the "����" button
                  buttonContainer.querySelector('[onclick="cancelForm()"]').style.display = 'none';
              }
          }

          function cancelForm() {
              // Reset the form state
              toggleBlock();
          }
          
        </script>

      </body>
      
      									<!-- 	datetimepicker -->
	<% 
	  java.sql.Date closedDate = null;
	  try {
		  closedDate = java.sql.Date.valueOf(request.getParameter("closedDate").trim());
	   } catch (Exception e) {
		   closedDate = new java.sql.Date(System.currentTimeMillis());
	   }
	%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/court/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/court/datetimepicker/jquery.js"></script>
	<script src="/ASAP/court/datetimepicker/jquery.datetimepicker.full.js"></script>
	
	<style>
	  .xdsoft_datetimepicker .xdsoft_datepicker {
	           width:  300px;   /* width:  300px; */
	  }
	  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	           height: 151px;   /* height:  151px; */
	  }
	</style>
	
	<script>
	        $.datetimepicker.setLocale('zh');
	        $('#f_date1').datetimepicker({
	 	       theme: '',              //theme: 'dark',
		       timepicker:false,       //timepicker:true,
		       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
		       format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '<%=closedDate%>', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	           //startDate:	            '2017/07/10',  // �_�l��
	           //minDate:               '-1970-01-01', // �h������(���t)���e
	           //maxDate:               '+1970-01-01'  // �h������(���t)����
	        });
	   
	        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------
	
	        //      1.�H�U���Y�@�Ѥ��e������L�k���
	        //      var somedate1 = new Date('2017-06-15');
	        //      $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() <  somedate1.getYear() || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	
	        
	        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
	        //      var somedate2 = new Date('2017-06-15');
	        //      $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() >  somedate2.getYear() || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	
	
	        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
	        //      var somedate1 = new Date('2017-06-15');
	        //      var somedate2 = new Date('2017-06-25');
	        //      $('#f_date1').datetimepicker({
	        //          beforeShowDay: function(date) {
	        //        	  if (  date.getYear() <  somedate1.getYear() || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
	        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
	        //		             ||
	        //		            date.getYear() >  somedate2.getYear() || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
	        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
	        //              ) {
	        //                   return [false, ""]
	        //              }
	        //              return [true, ""];
	        //      }});
	        
	</script>
    </html>



