<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>Insert title here</title>
</head>
<body>

	<form action="<%=request.getContextPath()%>/court/courtImgUp.do" method="post" enctype="multipart/form-data">
		<div>
			<label for="courtNo">場地編號:</label>
			<input id ="courtNo" name="courtNo" type="text" value=""/>
			</div>
		<div>
			<label for="upFiles">照片:</label>
			<input id ="upFiles" name="upFiles" type="file" onclick="previewImage()" multiple="multiple" onchange="hideContent('upFiles.errors');" />
			<span  id ="upFiles.errors" class="error">${errorMsgs.upFiles}</span>
			<div id="blob_holder"></div>
		</div>
		<div>
			<div></div>
			<input  type="hidden" name="action" value="insert">
			<button type="submit" id="submit"> 送出新增 </button>
			<div></div>
		</div>
	</form>
	<hr>
	
	<!-- 新增不開放日期時間 -->
	<form action="<%=request.getContextPath()%>/court/courtClosedTime.do" method="post">
		<div>
				<label for="courtNo">場地編號:</label>
				<input id ="courtNo" name="courtNo" type="text" value=""/>
		</div>
		
		<table>
			<tr>
				<td>日期:</td>
				<td><input name="closedDate" id="f_date1" type="text" ></td>
			</tr>
			<tr>
				<td>時間:<font color=red><b>*</b></font></td>
				<td><select size="1" name="closedTime">
						<option value="8" 'selected' >8
						<option value="9"  >9
						<option value="10"  >10
						<option value="11"  >11
						<option value="12"  >12
						<option value="13"  >13
						<option value="14"  >14
						<option value="15"  >15
						<option value="16" >16
						<option value="17"  >17
						<option value="18"  >18
						<option value="19" >19
						<option value="20"  >20				
				</select></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="送出新增">
	</form>
	
	<hr>
	
	<!-- 刪除不開放日期時間 -->
	<form action="<%=request.getContextPath()%>/court/courtClosedTime.do" method="post">
		<div>
				<label for="courtNo">場地編號:</label>
				<input id ="courtNo" name="courtNo" type="text" value=""/>
		</div>
		
		<table>
			<tr>
				<td>日期:</td>
				<td><input name="closedDate" id="f_date2" type="text" ></td>
			</tr>
			<tr>
				<td>時間:<font color=red><b>*</b></font></td>
				<td><select size="1" name="closedTime">
						<option value="8" 'selected' >8
						<option value="9"  >9
						<option value="10"  >10
						<option value="11"  >11
						<option value="12"  >12
						<option value="13"  >13
						<option value="14"  >14
						<option value="15"  >15
						<option value="16" >16
						<option value="17"  >17
						<option value="18"  >18
						<option value="19" >19
						<option value="20"  >20				
				</select></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="delete">
		<input type="submit" value="送出刪除">
	</form>
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
		       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		       format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '<%=closedDate%>', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	           //startDate:	            '2017/07/10',  // 起始日
	           //minDate:               '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	        });
	        
	        $.datetimepicker.setLocale('zh');
	        $('#f_date2').datetimepicker({
	 	       theme: '',              //theme: 'dark',
		       timepicker:false,       //timepicker:true,
		       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
		       format:'Y-m-d',         //format:'Y-m-d H:i:s',
			   value: '<%=closedDate%>', // value:   new Date(),
	           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
	           //startDate:	            '2017/07/10',  // 起始日
	           //minDate:               '-1970-01-01', // 去除今日(不含)之前
	           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	        });
	   
	        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------
	
	        //      1.以下為某一天之前的日期無法選擇
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
	
	        
	        //      2.以下為某一天之後的日期無法選擇
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
	
	
	        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
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