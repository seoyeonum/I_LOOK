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
				<a href="<%=cp %>/adminsitreglist.action">시터 등록 요청</a>      
				<a href="<%=cp %>/adminsitrejectedlist.action">시터 등록 거절 내역</a>      
			</div>
		</div>
		
		<div class="sidebar-section">
			<span class="sidebar-header">등록된 회원 내역</span>
			<div class="sidebar-menu">  
				<a href="<%=cp %>/adminsitlist.action">시터 회원 정보</a>      
				<a href="<%=cp %>/adminparlist.action">부모 회원 정보</a> 
				<a href="<%=cp %>/adminchildlist.action">아이 정보</a> 
			</div>
		</div>
		
		<div class="sidebar-section">
			<span class="sidebar-header">위반 내역 확인</span>
			<div class="sidebar-menu">
				<a href="<%=cp %>/adminsitviollist.action">시터 위반 내역</a> 
				<a href="<%=cp %>/adminparviollist.action">부모 위반 내역</a> 
			</div>
		</div>
	</div>
</aside>
</body>
</html>