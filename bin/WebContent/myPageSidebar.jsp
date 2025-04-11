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
<title>serviceSidebar.jsp</title>
<link rel="stylesheet" type="text/css" href="css/sidebar.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>

<body>
<aside class="sidebar">
	<span class="sidebar-title">마이페이지</span>
	
	<div class="sidebar-category">
		<div class="sidebar-section">
			<span class="sidebar-header">관리자 정보</span>
			<div class="sidebar-menu">  
				<a href="adminInfoUpdateForm.jsp">관리자 정보 수정</a>      
			</div>
		</div>
	</div>
</aside>
</body>
</html>