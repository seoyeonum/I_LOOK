<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<c:set var="id" value="${sessionScope.id}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parentSidebar.jsp</title>
<link rel="stylesheet" type="text/css" href="<%= cp %>/css/ParentMypage.css">
</head>
<body>

<div class="sidebar-title">마이페이지</div>

<div class="menu">

	<!-- 아이 정보 -->
	<div class="menu-item">
		<a href="javascript:void(0)" onclick="event.preventDefault();">		<!-- → <a> 태그 동작 방지 -->
			<!-- <i class="fa-solid fa-child"></i> -->						<!-- <i> : 이탤릭체 태그(css) -->
			아이 정보 관리
		</a>
		<div class="submenu">
		    <a href="<%=cp%>/parentmypage.action">아이 목록 보기</a>
		    <a href="<%=cp%>/childinsertform.action">신규 아이 등록</a>
		    <a href="<%=cp%>/parentmypage.action">아이 정보 수정</a>
	  	</div>
	</div>
	
	<!-- 부모 정보 -->
	<div class="menu-item">
		<a href="<%=cp%>/parentmypage.action">
			<!-- <i class="fa-solid fa-user-group"></i> -->
			부모 정보 관리
		</a>
		<div class="submenu">
		    <a href="<%=cp%>/parentinfoview.action">부모 정보 보기</a>
		    <a href="<%=cp%>/parentupdateform.action">부모 정보 수정</a>
	  	</div>
	</div>
	
	<!-- 돌봄 이용 -->
	<div class="menu-item">
		<a href="<%=cp%>/parentmypage.action">
			<!-- <i class="fa-solid fa-house-chimney-user"></i> -->
			돌봄 이용 현황
		</a>
		<div class="submenu">
			<a href="<%=cp%>/sitterusehistory.action">현재 이용 내역</a>
			<a href="<%=cp%>/parentmypage.action">이용 완료 내역</a>		<!-- → ○○○.action 수정 필요 -->
		</div>
	</div>

</div>
</body>
</html>