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
<title>sidebarMember.jsp</title>
<link rel="stylesheet" type="text/css" href="css/sidebar.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>

<body>
<aside class="sidebar">
	<span class="sidebar-title">회원 관리</span>
	
	<div class="sidebar-category">
		<div class="sidebar-section">
			<span class="sidebar-header">시터 요청 관리</span>
			<div class="sidebar-menu">  
				<a href="adminSitRegList.jsp">시터 등록 요청</a>      
				<a href="adminSitRejectedList.jsp">시터 등록 거절 내역</a>      
			</div>
		</div>
		
		<div class="sidebar-section">
			<span class="sidebar-header">등록된 회원 내역</span>
			<div class="sidebar-menu">  
				<a href="adminSitList.jsp">시터 회원 정보</a>      
				<a href="adminParList.jsp">부모 회원 정보</a> 
				<a href="adminChildList.jsp">아이 정보</a> 
			</div>
		</div>
		
		<div class="sidebar-section">
			<span class="sidebar-header">위반 내역 확인</span>
			<div class="sidebar-menu">
				<a href="adminSitViolList.jsp">시터 위반 내역</a> 
				<a href="adminParViolList.jsp">부모 위반 내역</a> 
			</div>
		</div>
	</div>
</aside>
</body>
</html>