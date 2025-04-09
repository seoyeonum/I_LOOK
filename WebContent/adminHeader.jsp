<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHeader.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminHeader.css">
</head>
<body>
<div id="top-nav">
	<header>
		<div id="logo">
			<img src="<%=cp %>/imgs/logo.png" height="120px">
		</div>
		<nav>
			<button type="button" class="menuBtn" onclick="location.href='adminMain.jsp'">홈</button>
			<button type="button" class="menuBtn" onclick="location.href='adminSitRegList.jsp'">회원 관리</button>
			<button type="button" class="menuBtn" onclick="location.href='adminGenRegList.jsp'">서비스 관리</button>				
			<button type="button" class="menuBtn" onclick="location.href='adminInfo.jsp'">마이 페이지</button>
			<button type="button" class="menuBtn">로그아웃</button>
		</nav>
	</header>
</div>
</body>
</html>