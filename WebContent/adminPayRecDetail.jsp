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
<title>adminPayRecDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminPayRecDetail.css">
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
					<div class="content-title">결제 상세 정보</div>
				</div>

				<div class="content-body">
					<div class="info-section">
						<div class="info-row">
							<div class="info-header">예약 코드</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="GREQ00002" readonly>
							</div>
						</div>
						<div class="info-row">
							<div class="info-header">부모 이름</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="아무개" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">시터 이름</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="이도치" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">결제 금액</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="￦45,000" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">변동 포인트</div>
							<div class="info-cell" style="display: flex;">
								<input type="text" class="info-input" value="-10,000P" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">결제일</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="2025-04-05" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">거래번호</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="imp_123456789" readonly>
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