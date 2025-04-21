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
						<span class="profile-text">시터 사진</span>
					</div>
					
					<!-- 자기소개 영역 -->
					<div class="intro-section">
						<div class="intro-header">자기소개</div>
						<textarea cols="10" rows="10" readonly>안녕하세요. 아이들을 사랑하는 김철수입니다. 
						영유아 교육 경험이 풍부하며, 아이들의 건강한 성장을 돕겠습니다.</textarea>
					</div>
				</div>
				
				<!-- 오른쪽 컬럼 - 상세 정보 -->
				<div class="right-column">
					<div class="info-row">
						<div class="info-header">등록 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="GREG00001" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">시터 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="SBAC00001" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이름</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="김철수" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 시작일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="2025-04-10" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 종료일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="2025-04-20" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 시작 시간</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="08:00" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 종료 시간</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="11:00" readonly>
						</div>
					</div>
					
					<div class="category-row">
						<div class="category-title">활동 가능 지역</div>
						<div class="category-options">
							<button class="category-button">서울 구로동</button>
							<button class="category-button">서울 가산동</button>
						</div>
					</div>
					
					<div class="category-row">
						<div class="category-title">돌봄 선호 연령대</div>
						<div class="category-options">
							<button class="category-button">0~2세</button>
							<button class="category-button">2~5세</button>
						</div>
					</div>
				</div>
			</div>   
			
			<!-- 하단 버튼 영역 -->
			<div class="bottom-btn">
				<button class="submit-btn">홈</button>
			</div>
		</main> 
	</div>
</div>
</body>
</html>