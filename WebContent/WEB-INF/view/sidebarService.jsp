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
<title>sidebarService.jsp</title>
<link rel="stylesheet" type="text/css" href="css/sidebar.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>

<body>
<aside class="sidebar">
	<span class="sidebar-title">서비스 관리</span>
	
	<div class="sidebar-category">
		<div class="sidebar-section">
			<span class="sidebar-header">시터 관리</span>
			<div class="sidebar-menu">  
				<a href="<%=cp %>/admingenreglist.action">근무 등록 내역</a>      
				<a href="<%=cp %>/adminwagelist.action">임금 내역</a>      
			</div>
		</div>
		
		<div class="sidebar-section">
			<span class="sidebar-header">돌봄 내역 관리</span>
			<div class="sidebar-menu">  
				<a href="<%=cp %>/adminreqlist.action">예약 신청 내역</a>      
				<a href="<%=cp %>/adminpayreclist.action">결제 내역</a>      
				<a href="<%=cp %>/adminpointlist.action">포인트 변동 내역</a>      
			</div>
		</div>
		
		<div class="sidebar-section">
			<span class="sidebar-header">등급 및 시급 관리</span>
			<div class="sidebar-menu">
				<a href="<%=cp %>/gradelist.action">등급 목록</a> 
				<a href="<%=cp %>/hourlywagelist.action">시급 목록</a> 
			</div>
		</div>
		
		<div class="sidebar-section">
			<span class="sidebar-header">공지사항 관리</span>
			<div class="sidebar-menu">
				<a href="<%=cp %>/noticelist.action">공지사항 목록</a> 
			</div>
		</div>
	</div>
</aside>
</body>
</html>