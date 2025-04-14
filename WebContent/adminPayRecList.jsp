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
<title>adminPayRecList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminPayRecList.css">

</head>
<body>

	<div class="wrap">
		<header>
			<c:import url="adminHeader.jsp"></c:import>
		</header>

		<div class="container">
			<!--사이드바 영역 -->
			<c:import url="serviceSidebar.jsp"></c:import>

			<!-- 메인 콘텐츠 영역 -->
			<main class="main-content">
				<!-- 타이틀 영역 -->
				<div class="content-header">
					<h1 class="content-title">결제 내역</h1>
				</div>

				<!-- 필터 영역 -->
				<div class="content-filter-area">
					<div class="content-filter">
						<!-- 돌봄 유형 필터 -->
						<div class="filter-group care-type-filter">
							<label><input type="radio" name="careType" value="general" checked>일반돌봄</label> 
							<label><input type="radio" name="careType" value="emergency" checked>긴급돌봄</label>
						</div>

						<!-- 날짜 필터 -->
						<div class="filter-group date-filter">
							<select name="dateRange" class="selectField">
								<option value="week">기본 1주일</option>
								<option value="today">1일</option>
								<option value="month">1개월</option>
								<option value="3month">3개월</option>
								<option value="custom">사용자 지정</option>
							</select>
						</div>

						<!-- 검색 폼 -->
						<div class="search-form">
							<form action="" name="searchForm" method="post">
								<select name="searchKey" class="selectFiled">
									<option value="name">이름</option>
									<option value="subject">부모 코드</option>
									<option value="subject">시터 코드</option>
								</select> <input type="text" name="searchValue" class="txt" value="">
								<input type="button" value="검색" class="btn search-btn"
									onclick="sendIt()">
							</form>
						</div>
					</div>
				</div>

				<div class="content-body">
					<div class="info-wrapper">
						<div class="info-header">
							<div class="info-cell">번호</div>
							<div class="info-cell">예약 번호</div>
							<div class="info-cell">돌봄 유형</div>
							<div class="info-cell">상태</div>
							<div class="info-cell">부모 이름</div>
							<div class="info-cell">시터 이름</div>
							<div class="info-cell">결제 금액</div>
							<div class="info-cell">포인트 내역</div>
							<div class="info-cell">예약일</div>
							<div class="info-cell">상세 보기</div>
						</div>

						<!-- 데이터 행 - 실제 사용시 반복문으로 처리 -->
						<div class="info-row">
							<div class="info-cell">3</div>
							<div class="info-cell">GREQ00002</div>
							<div class="info-cell">일반</div>
							<div class="info-cell">예약 신청</div>
							<div class="info-cell">김민준</div>
							<div class="info-cell">이시연</div>
							<div class="info-cell">￦45,000</div>
							<div class="info-cell">-10,000P</div>
							<div class="info-cell">2025-04-05</div>
							<div class="info-cell">
								<div class="action-buttons">
									<button type="button" class="btn detail-btn"
										onclick="location.href='adminPayRecDetail.jsp'">상세보기</button>
								</div>
							</div>
						</div>

						<div class="info-row">
							<div class="info-cell">2</div>
							<div class="info-cell">EREQ00002</div>
							<div class="info-cell">긴급</div>
							<div class="info-cell">예약 신청</div>
							<div class="info-cell">홍길동</div>
							<div class="info-cell">임꺽정</div>
							<div class="info-cell">￦45,000</div>
							<div class="info-cell">-5,000P</div>
							<div class="info-cell">2025-04-03</div>
							<div class="info-cell">
								<div class="action-buttons">
									<button type="button" class="btn detail-btn"
										onclick="location.href='adminPayRecDetail.jsp'">상세보기</button>
								</div>
							</div>
						</div>

						<div class="info-row">
							<div class="info-cell">1</div>
							<div class="info-cell">GREQ00001</div>
							<div class="info-cell">일반</div>
							<div class="info-cell">예약 확정</div>
							<div class="info-cell">고지섭</div>
							<div class="info-cell">풋사과</div>
							<div class="info-cell">￦45,000</div>
							<div class="info-cell">-</div>
							<div class="info-cell">2025-04-03</div>
							<div class="info-cell">
								<div class="action-buttons">
									<button type="button" class="btn detail-btn"
										onclick="location.href='adminPayRecDetail.jsp'">상세보기</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 페이징 영역 -->
					<div class="page">
						<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 42</p>
					</div>
				</div>
			</main>
		</div>
	</div>

</body>
</html>