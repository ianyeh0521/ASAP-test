<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main/main.css">
<title>List Posts</title>
</head>
<body>
	<h1>文章列表</h1>
	<c:if test="${empPageQty > 0}">
  		<b><font color=red>第${currentPage}/${empPageQty}頁</font></b>
	</c:if>
	<br>
	
	<table style="width:50%; text-align:center;">
		<tr>
			<th>貼文編號</th>
			<th>會員編號</th>
			<th>貼文標題</th>
			<th>貼文內文</th>
			<th>貼文創建時間</th>
			<th>貼文分類編號</th>
			<th>瀏覽人數</th>
			<th>上架狀態</th>
		</tr>
		<c:forEach var="postVO" items="${empList}">
			<tr>
				<td>${postVO.postNo}</td>
				<td>${postVO.mbrNo}</td>
				<td>${postVO.postTitle}</td>
				<td>${postVO.postText}</td>
				<td>${postVO.postCrtTime}</td>
				<td>${postVO.postTypeNo}</td>
				<td>${postVO.postViews}</td>
				<td>${postVO.postStatus}</td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	<c:if test="${currentPage > 1}">
		<a href="${pageContext.request.contextPath}/forum/post.do?action=getAll&page=1">至第一頁</a>&nbsp;
	</c:if>
	<c:if test="${currentPage - 1 != 0}">
		<a href="${pageContext.request.contextPath}/emp/post.do?action=getAll&page=${currentPage - 1}">上一頁</a>&nbsp;
	</c:if>
	<c:if test="${currentPage + 1 <= empPageQty}">
		<a href="${pageContext.request.contextPath}/emp/post.do?action=getAll&page=${currentPage + 1}">下一頁</a>&nbsp;
	</c:if>
	<c:if test="${currentPage != empPageQty}">
		<a href="${pageContext.request.contextPath}/emp/post.do?action=getAll&page=${empPageQty}">至最後一頁</a>&nbsp;
	</c:if>
	
	<br><br>
	
	<a href="${pageContext.request.contextPath}/index.jsp">回首頁</a>	
</body>
</html>