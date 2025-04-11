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
<title>adminSitDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/sitDetail.css">
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
					<div class="content-title">시터 회원 상세 정보</div>
				</div>
				

				<div class="content-body">
					<div class="profile">
						<span class="profile-text">시터 사진</span>
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
						<div class="category-row">
		                    <div class="category-title">제출 서류</div>
		                    <div class="category-options">
		                        <button class="category-button">보건증</button>
		                        <button class="category-button">성범죄 조회 내역서</button>
		                    </div>
		                </div>
						<div class="category-row">
		                    <div class="category-title">보유 자격증</div>
		                    <div class="category-options">
		                        <button class="category-button">보육교사 1급</button>
		                        <button class="category-button">유아지도사 1급</button>
		                    </div>
		                </div>
					</div>

				</div>
				<!-- 하단 버튼 영역 -->
				<div class="bottom-btn">
					<button class="btn back-btn">뒤로가기</button>
				</div>
			</main>
		</div>
	</div>
</body>
</html>