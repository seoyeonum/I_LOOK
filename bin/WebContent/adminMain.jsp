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
<title>adminMain.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminMain.css">
</head>
<body>
<div class="wrap">
	<header>
		<c:import url="adminHeader.jsp"></c:import>
	</header>

	<div class="container">
		
		<div class="container-half">
			<div class="container-half-group">
				<div class="container-penel">시터 등록 요청</div>
				<div class="verification"></div>
				<div class="container-content">내용</div>
			</div>

	
			<div class="container-half-group">
				<div class="container-penel">일일 접속자 수 그래프로 일일 수입?</div>
				<div class="verification"></div>
				<div class="container-content">내용</div>
			</div>
		</div>
		
		<div class="container-group">
			<div class="container-penel">운영자의 공지사항</div>
			<div class="verification"></div>
			<div class="container-content">내용</div>
		</div>
		
	</div>
</div>
</body>
</html>