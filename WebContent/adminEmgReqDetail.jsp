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
<title>adminEmgReqDetail.jsp</title>
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
        <c:import url="serviceSidebar.jsp"></c:import>

		<main class="main-content">
			<div class="content-header">
				<div class="content-title">긴급돌봄 신청 상세 정보</div>
			</div> 	
				
			<div class="content-body">
				<!-- 왼쪽 컬럼 - 사진과 자기소개 -->
				<div class="left-column">
					
					<!-- 자기소개 영역 -->
					<div class="intro-section">
						<div class="intro-header">메시지</div>
						<textarea readonly>애기가 가끔 혼잣말 해도 놀라지말아요.
						밥은 2번 챙겨주세요.</textarea>
					</div>
				</div>
				
				<!-- 오른쪽 컬럼 - 상세 정보 -->
				<div class="right-column">
					<div class="info-row">
						<div class="info-header">예약 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="EREQ00001" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">부모 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="PBAC00001" onclick="location.href='adminParDetail.jsp'" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이름</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="김민준" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 시작일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="2025-04-10" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 종료일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="2025-04-20" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 시작 시간</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="08:00" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 종료 시간</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="11:00" readonly>
						</div>
					</div>
					<div class="info-row">
						<div class="info-header">포인트 사용</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="-1,000P" readonly>
						</div>
					</div>
					<div class="info-row">
						<div class="info-header">결제 금액</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="￦20,000" readonly>
						</div>
					</div>
				</div>
			</div>   
			
			<!-- 하단 버튼 영역 -->
			<div class="bottom-btn">
				<button class="submit-btn">뒤로가기</button>
			</div>
		</main> 
	</div>
</div>
</body>
</html>