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
<title>adminSitRegDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminSitRegDetail.css">
</head>
<body>
	<div class="wrap">
		<header>
			<c:import url="adminHeader.jsp"></c:import>
		</header>

		<div class="container">
			<!-- 사이드바 영역 -->
			<c:import url="memberSidebar.jsp"></c:import>

			<main class="main-content">
				<div class="content-header">
					<div class="content-title">시터 등록 요청 상세정보</div>
				</div>

				<div class="content-body">
					<div class="left-section">
						<div class="profile">
							<span class="profile-text">시터 사진</span>
						</div>
						<!-- 자격증 정보를 프로필 아래에 배치 -->
						<div class="category-row">
						    <div class="category-title">보유 자격증</div>
						    <div class="category-options">
						        <button class="category-button">보육교사 1급</button>
						        <button class="category-button">유아지도사 1급</button>
						        <button class="category-button">웃음지도사 1급</button>
						    </div>
						</div>
					</div>

					<div class="info-section">
						<div class="info-row">
							<div class="info-header">시터 코드</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="STRG00002" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">이름</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="이도치" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">연락처</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="010-2222-2222"
									readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">우편번호</div>
							<div class="info-cell" style="display: flex;">
								<input type="text" class="address-input" value="940202" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="(주소)" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">상세주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="(상세 주소)" readonly>
							</div>
						</div>
						<div class="info-row">
							<div class="info-header">서류 1</div>
							<div class="info-cell">
								<button class="category-button">보건증</button>
							</div>
						</div>
						<div class="info-row">
							<div class="info-header">서류 2</div>
							<div class="info-cell">
								<button class="category-button">성범죄 이력 조회서</button>
							</div>
						</div>
					</div>
				</div>
				
				<c:set var="source" value="${param.source}" />
				
				<!-- 하단 버튼 영역 -->
				<c:if test="${param.source eq 'req' }">
					<div class="bottom-btn">
						<button type="button" class="btn approve-btn">승인</button>
						<button type="button" class="btn reject-btn">거절</button>
						<button class="btn back-btn">뒤로가기</button>
					</div>
				</c:if>
				
				<c:if test="${param.source eq 'reject' }">
				   <button class="btn back-btn" style="margin-left: 350px; margin-top: 30px;">뒤로가기</button>
				</c:if>
			</main>
		</div>
	</div>
</body>
</html>