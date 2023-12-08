<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/maincss/main.css">
<title>Shopsearch Demo</title>
</head>
<body>
	<h1>商品查詢系統</h1>
	<h2>查詢系統</h2>
	<a href="${pageContext.request.contextPath}/shop/shop.do?action=getAll">查詢所有商品</a>
	<br><br>
	<h3><b>複合查詢 (使用 Criteria Query)：</b></h3>
	<form action="${pageContext.request.contextPath}/shop/shop.do" method="post">
		<p><label>商品名字模糊查詢：</label></p>
		<input type="text" name="ename"><br>
		<p><label>商品狀況：</label></p>
		<select name="job">
			<option value="">選取狀況</option>
			<option value="全新">全新</option>
			<option value="幾乎全新">幾乎全新</option>
			<option value="狀況良好">狀況良好</option>
			<option value="狀況尚可">狀況尚可</option>
			<option value="ANALYST">ANALYST</option>
		</select>
		<p><label>商品上架時間範圍</label></p>
		<input type="date" name="starthiredate"> ～ <input type="date" name="endhiredate"><br>
		<p><label>薪資範圍</label></p>
		<input type="text" name="startsal"> ～ <input type="text" name="endsal"><br>
		<p><input type="submit" value="送出"></p>
		<input type="hidden" name="action" value="compositeQuery">
	</form>
</body>
</html>