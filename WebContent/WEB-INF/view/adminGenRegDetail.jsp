<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminGenRegDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminGenRegDetail.css"> 
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<div class="wrap">
	<header>
		<c:import url="adminHeader.jsp"></c:import>
	</header>

	<div class="container">
		<!-- 사이드바 영역 -->
        <c:import url="sidebarService.jsp"></c:import>

		<main class="main-content">
			<div class="content-header">
				<div class="content-title">근무 등록 상세 정보</div>
			</div> 	
				
			<div class="content-body">
				<!-- 왼쪽 컬럼 - 사진과 자기소개 -->
				<div class="left-column">
					<!-- 사진 영역 -->
					<div class="profile">
						<img src="<%=cp%>/images/pictures/${genRegInfo.file_path}" alt="시터 사진">
					</div>
					
					<!-- 자기소개 영역 -->
					<div class="intro-section">
						<div class="intro-header">자기소개</div>
						<textarea cols="10" rows="10" readonly>${genRegInfo.introduction }</textarea>
					</div>
				</div>
				
				<!-- 오른쪽 컬럼 - 상세 정보 -->
				<div class="right-column">
					<div class="info-row">
						<div class="info-header">등록 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genRegInfo.gen_reg_id }" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">시터 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genRegInfo.sit_backup_id }" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이름</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genRegInfo.name }" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 시작일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${fn:substring(genRegInfo.start_date, 0, 10)}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 종료일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${fn:substring(genRegInfo.end_date, 0, 10)}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 시작 시간</div>
						<div class="info-cell">
							<c:set var="startTime" value="${genRegInfo.start_time}" />
							<input type="text" class="info-input" value="${startTime lt 10 ? '0' : ''}${startTime}:00" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 종료 시간</div>
						<div class="info-cell">
							<c:set var="endTime" value="${genRegInfo.end_time}" />
							<input type="text" class="info-input" value="${endTime lt 10 ? '0' : ''}${endTime}:00" readonly>
						</div>
					</div>
					
					<div class="category-row">
						<div class="category-title">활동 가능 지역</div>
						<div class="category-options">
							<button class="category-button">${region.name }</button>
						</div>
					</div>
					
					<div class="category-row">
						<div class="category-title">돌봄 선호 연령대</div>
						<div class="category-options">
						<c:forEach var="ageList" items="${age }">
							<button class="category-button">${ageList.type }</button>
						</c:forEach>
						</div>
					</div>
				</div>
			</div>   
			
			<!-- 하단 버튼 영역 -->
			<div class="bottom-btn">
				<button class="btn cancel-btn" onclick="location.href='<%=cp%>/admingenreglist.action'">뒤로가기</button>
			</div>
		</main> 
	</div>
</div>
</body>
</html>