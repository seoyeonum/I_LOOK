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
<title>header.jsp</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
</head>
<body>
	<header>
		<div id="logo">
			<img src="<%=cp %>/images/logo.png" height="120px">
		</div>
		<nav>
			<button type="button" class="menuBtn presentPage">홈</button>
			<button type="button" class="menuBtn">로그아웃</button>
			<button type="button" class="menuBtn">스케줄러</button>
			<a href="memberinsertform.action">
				<button type="button" class="menuBtn">일반돌봄서비스</button>
			</a>
			<button type="button" class="menuBtn">마이페이지</button>
			<button type="button" class="menuBtn">알림함</button>

		</nav>
	</header>

</body>
</html>